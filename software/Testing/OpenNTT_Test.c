/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#include "xparameters.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include "xil_cache.h"
#include "../communication.h"
#include "../instruction.h"
#include <xtime_l.h>
#include "tv.h"

// Comment these line to skip corresponding tests
#define TEST_TRANSFORM
#define TEST_PWM
#define TEST_DMA // testing the DMA functionality for data streaming

extern volatile uint32_t * axi_address_base;


const uint64_t CPU_FREQ_MHZ = 650;    // clock frequency of host CPU
const uint64_t COPROC_FREQ_MHZ = 100; // clock frequency of co-processor

const double FFT_EPSILON = 0.001; // accuracy for FFT

#ifdef FFT
#define poly_size (N*2)
#else
#define poly_size N
#endif
#define ALIGN __attribute__((aligned(N*2)))



uint64_t rand64() { return ((uint64_t)rand() << 62) | ((uint64_t)rand() << 31) | rand(); }

int checkPoly(uint64_t* res, uint64_t* ref, int size, const char* poly_name, int modulus_nr, int64_t delta_max)
{
	int error = 0;
	for(int i = 0; i < size; ++i)
	{
		int64_t delta = res[i] - ref[i];
		if(delta > delta_max || delta < -delta_max){
			if(error<10)
				printf("Error: modulus %d: %s[%d]: result: %llx, expected: %llx\n",modulus_nr,poly_name,i,res[i], ref[i]);
			error++;
		}
	}
	return error != 0;
}

int checkPoly_FFT(uint64_t* res, uint64_t* ref, int size, const char* poly_name, int modulus_nr)
{
	int error = 0;
	for(int i = 0; i < size; ++i)
	{
		double res_d = *(double*)&(res[i]);
		double ref_d = *(double*)&(ref[i]);
		if((abs(res_d) < FFT_EPSILON && abs(ref_d) > FFT_EPSILON) || abs((ref_d - res_d) / ref_d) > FFT_EPSILON){
			if(error<10)
				printf("Error: modulus %d: %s[%d]: result: %llx, expected: %llx\n",modulus_nr,poly_name,i,res[i], ref[i]);
			error++;
		}
	}
	return error != 0;
}

uint64_t input[poly_size*NUM_POLY] ALIGN;
uint64_t output[poly_size*NUM_POLY] ALIGN;
uint64_t result[poly_size*NUM_POLY] ALIGN;
uint64_t expected[poly_size*NUM_POLY] ALIGN;
uint64_t tmp[poly_size*NUM_POLY] ALIGN;

void linear2NRinput(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int i = 0; i < n; ++i)
	{
		int l = i % (n/2/pe);
		int b = (i / (n/2/pe)) & (pe-1);
		int e = (i / (n/2/pe)) / pe;
		e = (b<<1) | e;
		dst[((b<<1) | e)*(n/2/pe) + l] = src[i];
	}
}

void NRoutput2linear(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int i = 0; i < n; i++)
	{
		int l = i >> 1;
		int h = ((l / (n/2/pe))<<1) + (i & 1);
		l = l % (n/2/pe);
		int indx = h*(n/2/pe)+l;
		dst[i] = src[indx];
	}
}

void linear2RNinput(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int j = 0; j < 2*pe; ++j)
	{
		for(int i = 0; i < n/2/pe; i++)
		{
			dst[j*(n/2/pe) + i] = src[2*i+(j&1)+((j>>1)*2*(n/2/pe))];
		}
	}
}

void RNoutput2linear(uint64_t* dst, uint64_t* src, int n, int pe)
{
	int l = 0;
	for(int k =0; k < 2; k++)
	{
		for(int j = 0; j < pe; ++j)
		{
			for(int i = 0; i < n/2/pe; i++)
			{
				dst[l++] = src[(2*j+k)*(n/2/pe) + i];
			}
		}
	}
}

void linear2NRinput_FFT(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int i = 0; i < n; ++i)
	{
		int l = i % (n/2/pe);
		int b = (i / (n/2/pe)) & (pe-1);
		int e = (i / (n/2/pe)) / pe;
		e = (b<<1) | e;
		dst[2*(((b<<1) | e)*(n/2/pe) + l)] = src[2*i];
		dst[2*(((b<<1) | e)*(n/2/pe) + l)+1] = src[2*i+1];
	}
}

void NRoutput2linear_FFT(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int i = 0; i < n; i++)
	{
		int l = i >> 1;
		int h = ((l / (n/2/pe))<<1) + (i & 1);
		l = l % (n/2/pe);
		int indx = h*(n/2/pe)+l;
		dst[2*i] = src[2*indx];
		dst[2*i+1] = src[2*indx+1];
	}
}

void linear2RNinput_FFT(uint64_t* dst, uint64_t* src, int n, int pe)
{
	for(int j = 0; j < 2*pe; ++j)
	{
		for(int i = 0; i < n/2/pe; i++)
		{
			dst[2*(j*(n/2/pe) + i)] = src[2*(2*i+(j&1)+((j>>1)*2*(n/2/pe)))];
			dst[2*(j*(n/2/pe) + i)+1] = src[2*(2*i+(j&1)+((j>>1)*2*(n/2/pe))) + 1];
		}
	}
}

void RNoutput2linear_FFT(uint64_t* dst, uint64_t* src, int n, int pe)
{
	int l = 0;
	for(int k =0; k < 2; k++)
	{
		for(int j = 0; j < pe; ++j)
		{
			for(int i = 0; i < n/2/pe; i++)
			{
				dst[2*l] = src[2*((2*j+k)*(n/2/pe) + i)];
				dst[2*l + 1] = src[2*((2*j+k)*(n/2/pe) + i)+1];
				l++;
			}
		}
	}
}

void memcpy1(uint64_t* out, uint64_t* in, int num_words)
{
	for(int i = 0; i < num_words; ++i)
		out[i] = in[i];
}

void preparePoly(uint64_t* out, uint64_t** in)
{
	for(int i = 0; i < N; i += N/2/PE)
	{
		for(int p = 0; p < NUM_POLY; p++)
		{
			uint64_t* src = &(in[p][i]);
			uint64_t* dst = &out[p*N/2/PE + i*NUM_POLY];
			memcpy1(dst, src, N/2/PE);
		}
	}
}

void unPreparePoly(uint64_t** out, uint64_t* in)
{
	for(int i = 0; i < N; i += N/2/PE)
	{
		for(int p = 0; p < NUM_POLY; p++)
		{
			uint64_t* src = &in[p*N/2/PE + i*NUM_POLY];
			uint64_t* dst = &(out[p][i]);
			memcpy1(dst, src, N/2/PE);
		}
	}
}

void preparePoly_FFT(uint64_t* out, uint64_t** in)
{
	for(int i = 0; i < N; i += N/2/PE)
	{
		for(int p = 0; p < NUM_POLY; p++)
		{
			uint64_t* src = &(in[p][2*i]);
			uint64_t* dst = &out[2*(p*N/2/PE + i*NUM_POLY)];
			memcpy1(dst, src, 2*N/2/PE);
		}
	}
}

void unPreparePoly_FFT(uint64_t** out, uint64_t* in)
{
	for(int i = 0; i < N; i += N/2/PE)
	{
		for(int p = 0; p < NUM_POLY; p++)
		{
			uint64_t* src = &in[2*(p*N/2/PE + i*NUM_POLY)];
			uint64_t* dst = &(out[p][2*i]);
			memcpy1(dst, src, 2*N/2/PE);
		}
	}
}

void test_hardwareFFT(){

	XTime tStart = 0, tEnd = 0;
	char error = 0;

#ifdef TEST_DMA
	uint32_t num_bytes = poly_size*8, error_partial = 0;

	uint64_t time;
	XTime_GetTime(&time);
	int seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);


	printf("================ Testing DMA: DDR <-> BRAM: ========================\n");
	XTime_GetTime(&time);
	seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);
	for(int i = 0; i < poly_size*NUM_POLY; ++i)
	{
		input[i] = rand64();
		expected[i] = input[i];
		output[i] = -1ull;
	}

	printf("%llx\n",input[0]);
	Xil_DCacheFlushRange((size_t)input, num_bytes*NUM_POLY);
	cdmaDDRtoBRAM(0, (size_t)input, num_bytes*NUM_POLY);
	cdmaWaitForIdle();

	cdmaBRAMtoDDR((size_t)output, (size_t)0, num_bytes*NUM_POLY);
	cdmaWaitForIdle();
	error |= error_partial |= checkPoly(output, expected, poly_size*NUM_POLY, "bram <-> ddr", 0, 0);




	if(!error_partial)
		printf("BRAM to DDR works!\n\n");
#endif

#ifdef TEST_TRANSFORM
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	linear2RNinput_FFT(output, input, N, PE);
	NRoutput2linear_FFT(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering1", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	NRoutput2linear_FFT(output, input, N, PE);
	linear2RNinput_FFT(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering2", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	linear2NRinput_FFT(output, input, N, PE);
	RNoutput2linear_FFT(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering3", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	RNoutput2linear_FFT(output, input, N, PE);
	linear2NRinput_FFT(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering4", 0, 0);
  if (error) printf("Error in ordering tests!\n");

	uint64_t ins_buffer[INS_BUFFER_SIZE];
	uint64_t opcode = 0;

	for(int poly_it = 0; poly_it < NUM_POLY; poly_it++)
	{
		if(do_forward)
		{
			printf("Test forward\n");
			for(int q_it = 0; q_it < num_q; ++q_it)
			{
				uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
				for(int i = 0; i < poly_size; i++) result[i] = -1ull;
				linear2NRinput_FFT(input, in[q_it], N, PE);
				arr[poly_it] = input;
				preparePoly_FFT(tmp, arr);
				Xil_DCacheFlushRange((size_t)tmp, poly_size*8*NUM_POLY);
				cdmaDDRtoBRAM(0, (size_t)tmp, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();

				int forward = 1;
				uint64_t fft_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &fft_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_forward*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)tmp, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = output;
				unPreparePoly_FFT(arr, tmp);
				NRoutput2linear_FFT(tmp, output, N, PE);
				error |= checkPoly_FFT(tmp, out[q_it], poly_size, "FFT_f", q_it);
			}
		}

		////////////////////////////////////////////////////////////////////////////////

		if(do_inverse)
		{
			printf("Test inverse\n");
			for(int q_it = 0; q_it < num_q; ++q_it)
			{
				uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
				for(int i = 0; i < poly_size; i++) result[i] = -1ull;
				linear2RNinput_FFT(input, in_ifft[q_it], N, PE);
				arr[poly_it] = input;
				preparePoly_FFT(tmp, arr);
				Xil_DCacheFlushRange((size_t)tmp, poly_size*8*NUM_POLY);
				cdmaDDRtoBRAM(0, (size_t)tmp, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();

				int forward = 0;
				uint64_t fft_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &fft_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_inverse*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = tmp;
				unPreparePoly_FFT(arr, result);
				RNoutput2linear_FFT(result, tmp, N, PE);
				error |= checkPoly_FFT(result, out_ifft[q_it], poly_size, "FFT_i", q_it);
			}
		}
	}

#endif

#if defined(TEST_PWM) && defined(PWM_INSTANTIATED)
	printf("Test polynomial multiplication\n");
	opcode = 1;
  uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
  for(int i = 0; i < poly_size; i++){
    result[i] = -1ull;
  }
  arr[0] = polyArith_in_a[0];
  arr[1] = polyArith_in_b[0];
  preparePoly_FFT(input, arr);

  Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
  cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();

  uint64_t ins_word = (1<<7) | (1ull<<(8)) | 1;
  initInsBuffer(ins_buffer, &ins_word, 1,8);
  send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
  *(uint64_t*)&(axi_address_base[2]) = q_arr[0];
  axi_address_base[7] = opcode | ((base_forward != 0 ? base_forward : base_inverse)*0 << 3) | (0 << 28) | (1 << 30);
  exeIns();

  cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();
  arr[0] = output;
  arr[1] = tmp;
  unPreparePoly_FFT(arr, result);
  error |= checkPoly(output, polyMul_out[0], poly_size, "PolyMul", 0, 0);
	

	printf("Test polynomial addition\n");
	opcode = 2;
  for(int i = 0; i < poly_size; i++){
    result[i] = -1ull;
  }
  arr[0] = polyArith_in_a[0];
  arr[1] = polyArith_in_b[0];
  preparePoly_FFT(input, arr);

  Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
  cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();

  ins_word = (1<<7) | (1ull<<(8)) | 1;
  initInsBuffer(ins_buffer, &ins_word, 1,8);
  send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
  *(uint64_t*)&(axi_address_base[2]) = q_arr[0];
  axi_address_base[7] = opcode | ((base_forward != 0 ? base_forward : base_inverse)*0 << 3) | (0 << 28) | (1 << 30);
  exeIns();

  cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();
  arr[0] = output;
  arr[1] = tmp;
  unPreparePoly_FFT(arr, result);
  error |= checkPoly(output, polyAdd_out[0], poly_size, "PolyAdd", 0, 0);


	printf("Test polynomial subtraction\n");
	opcode = 3;
  for(int i = 0; i < poly_size; i++){
    result[i] = -1ull;
  }
  arr[0] = polyArith_in_a[0];
  arr[1] = polyArith_in_b[0];
  preparePoly_FFT(input, arr);

  Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
  cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();

  int forward = 1;
  ins_word = (1<<7) | (1ull<<(8)) | 1;
  initInsBuffer(ins_buffer, &ins_word, 1,8);
  send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
  *(uint64_t*)&(axi_address_base[2]) = q_arr[0];
  axi_address_base[7] = opcode | (forward << 2) | ((base_forward != 0 ? base_forward : base_inverse)*0 << 3) | (0 << 28) | (1 << 30);
  exeIns();

  cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
  cdmaWaitForIdle();
  arr[0] = output;
  arr[1] = tmp;
  unPreparePoly_FFT(arr, result);
  error |= checkPoly(output, polySub_out[0], poly_size, "PolySub", 0, 0);

#endif

	printf("test in HW took %llu CPU cc -> %.0lf us\n",2*(tEnd-tStart), 2.0*(tEnd-tStart)/CPU_FREQ_MHZ);
	if(error){
		printf("#################################\n");
		printf("# ERRORS OCCURED DURING TESTING #\n");
		printf("#################################\n");
	}
	else{
		printf("#################################\n");
		printf("#        EVERYTHONG OK!         #\n");
		printf("#################################\n");
	}
}


void test_hardware(){
#ifdef FFT
	test_hardwareFFT();
	return;
#endif

	char error = 0;

#ifdef TEST_DMA
	uint32_t num_bytes = poly_size*8, error_partial = 0;

	uint64_t time;
	XTime_GetTime(&time);
	int seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);

	printf("================ Conventional: ========================\n");
	for(int i = 0; i < poly_size*NUM_POLY;i++)
	{
		input[i] = rand64() & ((1ull<<logq)-1);
		result[i] = -1ull;
	}
	send64(input, poly_size*NUM_POLY, 0, 0);
	receive64(result, poly_size*NUM_POLY,0);
	error |= checkPoly(result, input, poly_size*NUM_POLY, "send/receive", 0, 0);

	printf("================ Testing DMA: DDR to DDR: ========================\n");
	error_partial = 0;

	for(int i = 0; i < poly_size*NUM_POLY; ++i)
	{
		input[i] = rand64() & ((1ull << logq) - 1);
		expected[i] = input[i];
		output[i] = -1ull;
	}
	printf("%p, %llx\n",input, input[0]);

	Xil_DCacheFlushRange((size_t)input, num_bytes*NUM_POLY);

    extern void cdma_transaction(size_t dest_addr, size_t src_addr, size_t num_bytes, uint8_t block);
	cdma_transaction((size_t)output, (size_t) input, num_bytes*NUM_POLY, 1);
	Xil_DCacheInvalidateRange((size_t)output, num_bytes*NUM_POLY);
	error |= error_partial |= checkPoly(output, expected, poly_size*NUM_POLY, "ddr to ddr", 0, 0);

	if(!error) printf("DDR to DDR is OK\n");

	printf("================ Testing DMA: DDR <-> BRAM: ========================\n");
	XTime_GetTime(&time);
	seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);
	for(int i = 0; i < poly_size*NUM_POLY; ++i)
	{
		input[i] = rand64() & ((1ull << logq) - 1);
		expected[i] = input[i];
		output[i] = -1ull;
	}

	printf("%llx\n",input[0]);
	Xil_DCacheFlushRange((size_t)input, num_bytes*NUM_POLY);
	cdmaDDRtoBRAM(0, (size_t)input, num_bytes*NUM_POLY);
	cdmaWaitForIdle();

	cdmaBRAMtoDDR((size_t)output, (size_t)0, num_bytes*NUM_POLY);
	cdmaWaitForIdle();
	error |= error_partial |= checkPoly(output, expected, poly_size*NUM_POLY, "bram <-> ddr", 0, 0);


	printf("================ Testing DMA: DDR to BRAM 2: ========================\n");
	XTime_GetTime(&time);
	seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);
	for(int i = 0; i < poly_size*NUM_POLY; ++i)
	{
		input[i] = rand64() & ((1ull << logq) - 1);
		expected[i] = input[i];
		output[i] = -1ull;
	}

	printf("%llx\n",input[0]);
	Xil_DCacheFlushRange((size_t)input, num_bytes*NUM_POLY);
	cdmaDDRtoBRAM(0, (size_t)input, num_bytes*NUM_POLY);
	cdmaWaitForIdle();

	receive64(output, poly_size*NUM_POLY, 0);
	error |= error_partial |= checkPoly(output, expected, poly_size*NUM_POLY, "ddr to bram 2", 0, 0);

	printf("================ Testing DMA: BRAM to DDR 2: ========================\n");
	XTime_GetTime(&time);
	seed = time;
	srand(seed);
	printf("Seed: %x\n",seed);
	for(int i = 0; i < poly_size*NUM_POLY; ++i)
	{
		input[i] = rand64() & ((1ull << logq) - 1);
		expected[i] = input[i];
		output[i] = -1ull;
	}

	printf("%llx\n",input[0]);
	send64(input, poly_size*NUM_POLY, 0, 0);

	cdmaBRAMtoDDR((size_t)output, (size_t)0, num_bytes*NUM_POLY);
	cdmaWaitForIdle();
	error |= error_partial |= checkPoly(output, expected, poly_size*NUM_POLY, "bram to ddr 2", 0, 0);



	if(!error_partial)
		printf("BRAM to DDR works!\n\n");
#endif

uint64_t ins_buffer[INS_BUFFER_SIZE];
#ifdef TEST_TRANSFORM
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	linear2RNinput(output, input, N, PE);
	NRoutput2linear(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering1", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	NRoutput2linear(output, input, N, PE);
	linear2RNinput(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering2", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	linear2NRinput(output, input, N, PE);
	RNoutput2linear(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering3", 0, 0);
	for(int i = 0; i < poly_size;i++)
	{
		input[i] = rand64();
	}
	RNoutput2linear(output, input, N, PE);
	linear2NRinput(expected, output, N, PE);
	error |= checkPoly(expected, input, poly_size, "ordering4", 0, 0);



	uint64_t opcode = 0;

	for(int poly_it = 0; poly_it < NUM_POLY; poly_it++)
	{
		if(do_forward)
		{
			printf("Test forward NTT\n");
			for(int q_it = 0; q_it < num_q; ++q_it)
			{
				uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
				for(int i = 0; i < poly_size; i++) result[i] = -1ull;
				linear2NRinput(input, in[q_it], poly_size, PE);
				arr[poly_it] = input;
				preparePoly(tmp, arr);
				Xil_DCacheFlushRange((size_t)tmp, poly_size*8*NUM_POLY);
				cdmaDDRtoBRAM(0, (size_t)tmp, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();

				int forward = 1;
				uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_forward*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)tmp, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = output;
				unPreparePoly(arr, tmp);
				NRoutput2linear(tmp, output, poly_size, PE);
				error |= checkPoly(tmp, out[q_it], poly_size, "NTT_f", q_it, 0);
			}
		}

		////////////////////////////////////////////////////////////////////////////////

		if(do_inverse)
		{
			printf("Test inverse NTT\n");
			for(int q_it = 0; q_it < num_q; ++q_it)
			{
				uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
				for(int i = 0; i < poly_size; i++) result[i] = -1ull;
				linear2RNinput(input, out[q_it], poly_size, PE);
				arr[poly_it] = input;
				preparePoly(tmp, arr);
				Xil_DCacheFlushRange((size_t)tmp, poly_size*8*NUM_POLY);
				cdmaDDRtoBRAM(0, (size_t)tmp, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();

				int forward = 0;
				uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_inverse*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = tmp;
				unPreparePoly(arr, result);
				RNoutput2linear(result, tmp, poly_size, PE);
				error |= checkPoly(result, in[q_it], poly_size, "NTT_i", q_it, 0);
			}
		}

		////////////////////////////////////////////////////////////////////////////////////

		if(do_forward && do_inverse)
		{
			printf("Test forward & inverse NTT\n");
			for(int q_it = 0; q_it < num_q; ++q_it)
			{
				uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
				for(int i = 0; i < poly_size; i++) result[i] = -1ull;
				linear2NRinput(input, in[q_it], poly_size, PE);
				arr[poly_it] = input;
				preparePoly(tmp, arr);
				Xil_DCacheFlushRange((size_t)tmp, poly_size*8*NUM_POLY);
				cdmaDDRtoBRAM(0, (size_t)tmp, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();

				int forward = 1;
				uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_forward*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = output;
				unPreparePoly(arr, result);
				NRoutput2linear(tmp, output, poly_size, PE);
				error |= checkPoly(tmp, out[q_it], poly_size, "NTT_f2", q_it, 0);

				forward = 0;
				ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
				initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
				send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
				*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
				axi_address_base[7] = opcode | (forward << 2) | (base_inverse*q_it << 3) | (poly_it << 28);
				exeIns();

				cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
				cdmaWaitForIdle();
				arr[poly_it] = output;
				unPreparePoly(arr, result);
				RNoutput2linear(tmp, output, poly_size, PE);
				error |= checkPoly(tmp, in[q_it], poly_size, "NTT_i2", q_it, 0);
			}
		}
	}

#endif


#if defined(TEST_PWM) && defined(PWM_INSTANTIATED)
	printf("Test polynomial multiplication\n");
	opcode = 1;
	for(int q_it = 0; q_it < num_q; ++q_it)
	{
		uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
		for(int i = 0; i < poly_size; i++) result[i] = -1ull;
		arr[0] = polyArith_in_a[q_it];
		arr[1] = polyArith_in_b[q_it];
		preparePoly(input, arr);
		Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
		cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();

		int forward = 1;
		uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
		initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
		send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
		*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
		axi_address_base[7] = opcode | (forward << 2) | ((base_forward != 0 ? base_forward : base_inverse)*q_it << 3) | (0 << 28) | (1 << 30);
		exeIns();

		cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();
		arr[0] = output;
		unPreparePoly(arr, result);
		error |= checkPoly(output, polyMul_out[q_it], poly_size, "PolyMul", q_it, 0);
	}

	printf("Test polynomial addition\n");
	opcode = 2;
	for(int q_it = 0; q_it < num_q; ++q_it)
	{
		uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
		for(int i = 0; i < poly_size; i++) result[i] = -1ull;
		arr[0] = polyArith_in_a[q_it];
		arr[1] = polyArith_in_b[q_it];
		preparePoly(input, arr);
		Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
		cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();

		int forward = 1;
		uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
		initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
		send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
		*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
		*(uint64_t*)&(axi_address_base[8]) = R_arr[q_it];
		axi_address_base[7] = opcode | (forward << 2) | ((base_forward != 0 ? base_forward : base_inverse)*q_it << 3) | (0 << 28) | (1 << 30);
		exeIns();

		cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();
		arr[0] = output;
		unPreparePoly(arr, result);
		error |= checkPoly(output, polyAdd_out[q_it], poly_size, "PolyAdd", q_it, 0);
	}

	printf("Test polynomial subtraction\n");
	opcode = 3;
	for(int q_it = 0; q_it < num_q; ++q_it)
	{
		uint64_t* arr[NUM_POLY] = {[0 ... NUM_POLY-1] = result};
		for(int i = 0; i < poly_size; i++) result[i] = -1ull;
		arr[0] = polyArith_in_a[q_it];
		arr[1] = polyArith_in_b[q_it];
		preparePoly(input, arr);
		Xil_DCacheFlushRange((size_t)input, poly_size*8*NUM_POLY);
		cdmaDDRtoBRAM(0, (size_t)input, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();

		int forward = 1;
		uint64_t ntt_ins_word = (1<<7) | (1ull<<(8)) | 1;
		initInsBuffer(ins_buffer, &ntt_ins_word, 1,8);
		send64(ins_buffer, INS_BUFFER_SIZE, 1, 0);
		*(uint64_t*)&(axi_address_base[2]) = q_arr[q_it];
		*(uint64_t*)&(axi_address_base[8]) = R_arr[q_it];
		axi_address_base[7] = opcode | (forward << 2) | ((base_forward != 0 ? base_forward : base_inverse)*q_it << 3) | (0 << 28) | (1 << 30);
		exeIns();

		cdmaBRAMtoDDR((size_t)result, (size_t)0, poly_size*8*NUM_POLY);
		cdmaWaitForIdle();
		arr[0] = output;
		unPreparePoly(arr, result);
		error |= checkPoly(output, polySub_out[q_it], poly_size, "PolySub", q_it, 0);
	}
#endif


	if(error){
		printf("#################################\n");
		printf("# ERRORS OCCURED DURING TESTING #\n");
		printf("#################################\n");
	}
	else{
		printf("#################################\n");
		printf("#        EVERYTHING OK!         #\n");
		printf("#################################\n");
	}
}

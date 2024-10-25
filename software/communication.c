/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#ifndef SRC_COMMUNICATION_C_
#define SRC_COMMUNICATION_C_
#include "xparameters.h"
#include <stdio.h>
#include <stdint.h>
#include "communication.h"
#include "xil_io.h"
#include "xil_cache.h"

extern volatile uint32_t * axi_address_base;

// DMA control port:
#define CDMACR   0x0	//CDMA control register
#define CDMASR   0x4	//CDMA status register
#define CDMA_SA  0x18  	//CDMA source address register
#define CDMA_DA  0x20  	//CDMA destination address register
#define CDMA_BTT 0x28  	//CDMA bytes to transfer. Writing to this initiates the transaction

// DMA data port memory layout:
#define BRAM_CTRL_AXI_BASE 0xC0000000

// set this to 1 for verbose debug and status output
#define DEBUG 0
// undefine this to obtain cycle counts of each instruction execution
#define PERFORMANCE


// This function blocks until the DMA is idle
void cdmaWaitForIdle()
{
	while(1)
	{
		uint32_t read_val = Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMASR);
		if(read_val & (1<<1))
		{
			if(DEBUG) printf("CDMA: IDLE bit is set\n");
			break;
		}
		else
		{
			if(DEBUG) printf("CDMA: IDLE bit is NOT set!!!!\n");
		}
	}
}

// This function initiates a DMA transaction. DMA copies num_bytes many bytes from src_addr to
// dest_addr. Both addresses are AXI addresses. 
// The function blocks until completion if block != 0. Otherwise it returns immediately.
void cdma_transaction(size_t dest_addr, size_t src_addr, size_t num_bytes, uint8_t block)
{
	uint32_t read_val;

	// check idle bit (not needed actually. Last transfer did that already)
	//cdmaWaitForIdle();

	//set interrupt bits if needed. Requires adaption of block design
	//read_val = Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMACR);
	// read_val |= (1<<12); // interrupt on transfer completion
	// read_val |= (1<<14); // interrupt on error
	//Xil_Out32(XPAR_AXI_CDMA_0_BASEADDR + CDMACR, read_val);
//	if(DEBUG) printf("CDMA: setting cr to %lx\n",read_val);

	//set source address:
	if(DEBUG) printf("CDMA: setting source address to %zx (%zu bytes)\n",src_addr,sizeof(size_t));
	Xil_Out32(XPAR_AXI_CDMA_0_BASEADDR + CDMA_SA, (size_t)src_addr);
	if(DEBUG) printf("                             is 0x%lx\n",Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMA_SA));

	//set dest address:
	if(DEBUG) printf("CDMA: setting dest address to   %zx\n",dest_addr);
	Xil_Out32(XPAR_AXI_CDMA_0_BASEADDR + CDMA_DA, dest_addr);
	if(DEBUG) printf("                           is   0x%lx\n",Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMA_DA));

	//set number of transferred bytes. This also starts the transfer:
	Xil_Out32(XPAR_AXI_CDMA_0_BASEADDR + CDMA_BTT, num_bytes);
	if(DEBUG) printf("CDMA: done sending num_bytes %u\n",num_bytes);

	if(!block)
		return;
	//wait for completion:
	if(DEBUG) printf("CDMA: waiting for completion of the transfer...\n");
	do
	{
		read_val = Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMASR);
	} while(!(read_val & (1<<1)));

	if(DEBUG) printf("CDMA: done waiting\n");
}

// This function copies num_bytes many bytes from source_address (which is a physical address in RAM) to
// the BRAM with the id dest_bram_id. 
// This function does not block until transaction is completed.
void cdmaDDRtoBRAM(size_t dest_bram_id, size_t source_addr, uint32_t num_bytes)
{
	size_t dest_addr = (BRAM_CTRL_AXI_BASE);
	cdma_transaction(dest_addr, source_addr, num_bytes, 0);
}

// This function copies num_bytes many bytes from the source BRAM with ID source_bram_id to
// dest_addr (which is a physical address in RAM). 
// This function does not block until transaction is completed.
void cdmaBRAMtoDDR(size_t dest_addr, size_t source_bram_id, uint32_t num_bytes)
{
	size_t src_addr = BRAM_CTRL_AXI_BASE;
	Xil_DCacheInvalidateRange(dest_addr, num_bytes);
	cdma_transaction(dest_addr, src_addr, num_bytes, 0);
}

// computes and returns the bit-reverse of x.
uint32_t int_bitreverse(uint32_t x, uint32_t bits)
{
	uint32_t result = 0;
	for (uint32_t b = 0; b < bits; ++b)
	{
		result <<= 1;
		result |= x & 1;
		x >>= 1;
	}
	return result;
}

// This function sends num_words many 64-bit words from the RAM address p to the co-processor.
// It is used for sending instructions (INS_flag = 1) to the instruction memory and
// for sending data to BRAMs (INS_flag = 0) with bram_sel defining the destination BRAM.
// Sending data via this function is for testing purpose only. The hardware must
// have the PROVIDE_DEBUG_IO set to 1 (ComputeCore.v).
void send64(uint64_t *p, uint32_t num_words, uint32_t INS_flag, uint32_t bram_sel)
{
	uint32_t i;

	uint32_t control_low;
	const uint32_t control_low_const_part = ((INS_flag ? 0 : 1)<<22) | (INS_flag<<21);


	for(i=0; i<num_words; i++)
	{
		//address_ext = i;
		control_low = control_low_const_part | (1<<20) | i;

		*(uint64_t*)&(axi_address_base[2]) = p[i];
		axi_address_base[0] = control_low;

		control_low &= ~(1<<20);
		axi_address_base[0] = control_low;
	}
	axi_address_base[0] = 0;
}

// This function receives num_words many 64-bit words from the co-processor.
// It is used for receiving data from BRAMs with bram_sel defining the desitination BRAM. 
// Receiving data via this function is for testing purpose only. The hardware must
// have the PROVIDE_DEBUG_IO set to 1 (ComputeCore.v).
void receive64(uint64_t *p, uint32_t num_words, uint32_t bram_sel)
{
	uint32_t i;

	uint32_t address_ext;
	uint32_t wea_ext = 0;
	uint32_t control_low = 0;
	uint32_t dina_low=0, dina_high=0;

	for(i=0; i<num_words; i++)
	{
		address_ext = i;

		control_low = (1<<22) + address_ext;

		axi_address_base[0] = control_low;
		dina_low = axi_address_base[4];
		dina_high = axi_address_base[5];


		p[i] = dina_high & 0xFFFFFFFF;
		p[i] = p[i] << 32;
		p[i] = p[i] + dina_low;
	}

  axi_address_base[0] = 0;
}




// This function starts the execution of the instruction memory's content.
// It blocks until all instructions are finished and resets the co-processor
// after it has finished. The function returns the number of clock cycles
// the execution took if PERFORMANCE is not defined.
uint32_t exeIns()
{
	// Layout of AXI ports:
	// control_low_word   (axi_address_base[0])
	// control_high_word  (axi_address_base[1])
	// dina_ext_low_word  (axi_address_base[2])
	// dina_ext_high_word (axi_address_base[3])
	// dout_ext_low_word  (axi_address_base[4])
	// dout_ext_high_word (axi_address_base[5])
	// status             (axi_address_base[6])

	uint32_t cycle_count = 0;

	// Reset Processor
	// control_low = 0; control_high=1;
	axi_address_base[0] = 0;
	axi_address_base[1] = 1;


	// control_high=2;
	axi_address_base[1] = 2;


	while((axi_address_base[6] & 0x1) == 0){
	}


#ifndef PERFORMANCE
	cycle_count = (uint32_t) axi_address_base[6];
	cycle_count = (cycle_count>>2);
#endif
	//printf("FPGA cycle count: %u is equivalent to %u CPU cycle count\n", cycle_count, cycle_count*5);

	// Reset Processor
	// control_high=1;
	axi_address_base[1] = 1;


	// release reset again
	// control_high=0;
    axi_address_base[1] = 0;


	return cycle_count;
}

// This function is mainly equivalent to exeIns(). It additionally sets the
// dina_ext_low_word and dina_ext_high_word AXI ports to param.
uint32_t exeInsWithParameter(uint64_t param)
{
	*(uint64_t*)&axi_address_base[2] = param;
	return exeIns();
}

uint32_t delay(uint32_t d){
	uint32_t i, j;

	for(i=0; i<d; i++)
		j += i;

	return j;
}

#endif /* SRC_COMMUNICATION_C_ */

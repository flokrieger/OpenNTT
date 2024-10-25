/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#include<stdio.h>
#include "instruction.h"


// Opcode definition. Must comply with hardware (see ComputeCore.v)
// The opcode 0 is reserved.
#define OPC_TRANSFORMATION (1)
#define OPC_RNS            (2)
#define OPC_I2F            (3)
#define OPC_PWM            (4)
#define OPC_PROJECT		   (5)

// Switch this for debug functionality:
//#define assert(x) while(!(x)) { printf("ERROR: Assertion violation!\n"); }
#define assert(x) ;


// This function gets ins_words, an array of num_instructions many instruction words
// and prepares the array ins_buffer with INS_BUFFER_SIZE elements to be sent to the
// co-processor. It essentially adds instructions to reset the co-processor.
void initInsBuffer(uint64_t* ins_buffer, uint64_t* ins_words, uint8_t num_instructions, uint8_t command_width)
{
	assert(INS_BUFFER_SIZE >= num_instructions+4);
	uint8_t i=0;

	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = (1ull<<7) | (1ull<<8);
	ins_buffer[i++] = (1ull<<7) | (1ull<<8);
	ins_buffer[i++] = (1ull<<8);
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x0ull;

	ins_buffer[i++] = *ins_words;

	ins_buffer[i++] = (1ull<<(command_width+1));
	ins_buffer[i++] = 0x0ull;
	ins_buffer[i++] = 0x1full;
	for(; i < INS_BUFFER_SIZE; ++i)
	{
		ins_buffer[i] = 0;
	}
}




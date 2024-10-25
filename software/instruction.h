/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#ifndef SRC_INSTRUCTION_H_
#define SRC_INSTRUCTION_H_

// Number of max number of instructions in the buffer.
#define INS_BUFFER_SIZE 32

void initInsBuffer(uint64_t* ins_buffer, uint64_t* ins_words, uint8_t num_instructions, uint8_t command_width);

#endif /* SRC_INSTRUCTION_H_ */

/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#ifndef SRC_COMMUNICATION_H_
#define SRC_COMMUNICATION_H_

#include <stdint.h>
#include <stdlib.h>

void send64(uint64_t *p, uint32_t num_words, uint32_t INS_flag, uint32_t bram_sel);
void receive64(uint64_t *p, uint32_t num_words, uint32_t bram_sel);

void cdmaWaitForIdle();
void cdmaDDRtoBRAM(size_t dest_bram_id, size_t source_addr, uint32_t num_bytes);
void cdmaBRAMtoDDR(size_t dest_addr, size_t source_bram_id, uint32_t num_bytes);

uint32_t exeIns();
uint32_t exeInsWithParameter(uint64_t param);

uint32_t delay(uint32_t d);


#endif /* SRC_COMMUNICATION_H_ */

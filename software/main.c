/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_cache.h"

#include "communication.h"
#include "Testing/OpenNTT_Test.h"
#include "xtime_l.h"

volatile uint32_t* axi_address_base;

int main()
{
    init_platform();

	axi_address_base = (uint32_t*)XPAR_AXISLAVE8PORTS_0_BASEADDR;

	// reset core:
	axi_address_base[1] = 1;

	cdmaWaitForIdle(); // waits for the DMA to be configured and ready.

	int test_type = 0;

	printf("\n\n");
	printf("******************************************************************\n");
	printf("*                            OpenNTT                             *\n");
	printf("******************************************************************\n");


	while(test_type != 3){
		printf("\n");
		if(test_type == 0)
			test_hardware();
		else
			break;

		printf("Type of test [0: Rerun test, 3:End] : ");
		scanf("%d", &test_type);
	}


	Xil_DCacheFlush();
	Xil_DCacheDisable();

	printf("Finish\n");

    cleanup_platform();
    return 0;
}

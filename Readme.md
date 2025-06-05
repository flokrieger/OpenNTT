# OpenNTT
This repository provides the source code for OpenNTT - An automated toolchain for compiling high-performance NTT hardware accelerators. 
You can find the accompanying paper [here](https://eprint.iacr.org/2024/1740).

This repo contains:
- The OpenNTT tool to compile NTT hardware designs
- Simulation-based testing functionality using Xilinx Vivado
- Ready-to-use Xilinx Vitis project to run OpenNTT on a PYNQ-Z2 FPGA 

All content of this repo is for academic research use only. It does not come with any support, warranty, or responsibility.

## Using OpenNTT to compile NTT hardware
1) Clone this repo and navigate to the `/tool` folder
2) You find the file `openntt.py`, which is the top file for the tool. Run `python3 openntt.py` with the desired configuration. This table gives an overview of configuration parameters:

    |  Parameter  |  Values  |  Description  |
    | --- | --- | --- |
    | `--c`   | 0/1   | Clear output products   |
    | `--ntt_type`   | fntt_dit_nr   | forward NTT, decimation in time, normal to reverse    |
    | | fntt_dif_nr | forward NTT, decimation in frequency, normal to reverse | 
    | | intt_dit_rn | inverse NTT, decimation in time, reverse to normal  | 
    | | intt_dif_rn | inverse NTT, decimation in frequency, reverse to normal | 
    | | mfntt_dit_nr | forward NTT with merged preprocessing, decimation in time, normal to reverse | 
    | | mintt_dif_rn | inverse NTT with merged preprocessing, decimation in frequency, reverse to normal | 
    | | fntt_dit_nr-intt_dit_rn | unified NTT as above | 
    | | mfntt_dit_nr-mintt_dif_rn |unified NTT as above | 
    | `--n`   | power of two   | Polynomial degree   |
    | `--q_fixed`   | 0/1   | Use fixed prime   |
    | `--q_count`   | >0   | Number of primes   |
    | `--q_list`   | >0, prime   | comma-separated list of primes or prime sizes. Values <= 64 are considered prime sizes, others as primes  |
    | `--tw_list`   | optional   | comma-separated list of roots of unity (one for each prime)   |
    | `--tw_inv_list`   | optional   | comma-separated list of inverse roots of unity (one for each prime)   |
    | `--io_band`   | power of two   | number of memory ports (= 2 x Nr of processing elements)   |
    | `--mem_depth`   | >0   | number of polynomial slots in memory   |
    | `--coeff_arith`   | 0/1   | Instantiate coefficient-wise Mult/Add/Sub functionality   |

**Example:**

`python3 openntt.py --ntt_type=mfntt_dit_nr-mintt_dif_rn  --q_count=1 --q_list=32 --n=4096 --io_band=8 --c=1 --mem_depth=2 --coeff_arith=1`

This generates hardware support with merged forward NTT, decimation in time, normal to reverse and merged inverse NTT decimation in frequency, reversed to normal. The tool automatically generates one prime with 32 bits. The polynomial degree is 4096 and 4 processing elements are instantiated. Output products are cleared, two polynomial slots are instantiated and coefficient arithmetic is supported.

## Simulation-based testing in Vivado
After generating the NTT hardware as above, you can use the prepared Vivado 2022.2 project to simulate the design. For that, follow these steps:

1) Open Vivado 2022.2 and open the provided Vivado project in the `vivado/` folder
2) The opened Vivado project is ready to use. For starting the simulation, klick *Run Simulation* in the Flow Navigator. Select *Run Behavioral Simulation*.
3) After the simulation environment is ready, klick on *Run All*. This executes the NTT testcases and the coefficient arithmetic testcases and compares the results agains the prepared reference outputs.
4) The tool will show potential errors in the TCL Console. 

## Running OpenNTT on PYNQ-Z2 FPGA
This repo also contains the functionality for running the NTT design on a ZYNQ-Z2 FPGA. To do so, follow these steps and have a look at the prerequisites further below.

**Vivado:**
1) Execute the OpenNTT tool with the desired parameters and open the Vivado project as above.
2) In case Vivado shows the message "Module references are out-of-date", klick on *Refresh Changed Modules*. Ignore potential warnings.
3) Klick on *Generate Bitstream* to run synthesis, implementation, and bitstream creation.
4) Export the bitstream using *File -> Export... -> Export Hardware*. Click next and select *Include Bitstream*. Click next, keep the default location, overwrite the existing bitstream and click *Finish*.

**Vitis:**

5) Launch the Xilinx Vitis 2022.2 tool. You can select the `vitis/` folder as workspace
6) Create Vitis platform project:
  - Go to *File -> New -> Platform Project* and give a name (e.g. "OpenNTT_Platform")
  - Choose the XSA file in `vivado/OpenNTT_BD_wrapper.xsa`
  - Click Finish
  - Right-click on the platform project and click *Build Project*
7) Create Vitis application project:
  - Go to *File -> New -> Application Project*
  - Select the created OpenNTT_Platform project
  - Give a name, e.g. "OpenNTT_App"; click on next
  - Click next until you are asked for templates
  - Select *Empty Application (C)* and click Finish
8) Link source files:
  - Right-click on the OpenNTT_App application project and select *Properties*
  - Go to *C/C++ General -> Paths and Symbols -> Source Location*
  - Click *Link Folder*
  - Give some folder name, e.g. "software"
  - Check *Link to folder in file system*
  - Browse for the `software/` folder in the repo. Then, click *OK* and *Apply and Close*
9) In Vitis, within the OpenNTT_App, copy the file `software/lscript.ld` to `src/` and replace the existing file
10) Build the application project
11) Start a terminal monitoring the UART output of the PYNQ-Z2 board
  - e.g.: `sudo screen /dev/serial/by-id/usb-Xilinx_TUL_1234-tul-if01-port0 115200,cs8,-parenb,-cstopb,-hupclsudo screen /dev/serial/by-id/usb-Xilinx_TUL_1234-tul-if01-port0 115200,cs8,-parenb,-cstopb,-hupcl`
11) In Vitis, right-click on OpenNTT_App and select *Run As -> Launch on Hardware*. This will run testcases on the FPGA and verify the correct output of the design. If everything worked well, the UART port will show:
```
#################################
#        EVERYTHING OK!         #
#################################
```

## Our used setup

- Python 3.10 or newer
- Vivado and Vitis 2022.2
- Ubuntu 22.04.5 LTS

If you want to run OpenNTT using our provided PYNQ-Z2 setup, you additionally need:
- Cable drivers installed for Vivado and Vitis
- PYNQ-Z2 FPGA Development Board with Xilinx part number xc7z020clg400-1

## Contributors
Florian Krieger  -  `florian.krieger (at) tugraz.at`

Florian Hirner  -  `florian.hirner (at) tugraz.at`

Ahmet Can Mert  -  `ahmet.mert (at) tugraz.at`

Sujoy Sinha Roy  -  `sujoy.sinharoy (at) tugraz.at`

-----

[Institute of Information Security](https://www.isec.tugraz.at/), Graz University of Technology, Austria

-----

If you use OpenNTT in your research/study, please consider citing our work:

```
@misc{OpenNTT
      author = {Florian Krieger and Florian Hirner and Ahmet Can Mert and Sujoy Sinha Roy},
      title = {{OpenNTT}: An Automated Toolchain for Compiling High-Performance {NTT} Accelerators in {FHE}},
      howpublished = {Cryptology {ePrint} Archive, Paper 2024/1740},
      year = {2024},
      url = {https://eprint.iacr.org/2024/1740}
}
```
# OpenNTT
This repository provides the source code for OpenNTT - an automated toolchain for compiling high-performance NTT hardware accelerators. 
You can find the accompanying paper [here](https://eprint.iacr.org/2024/1740).

A detailed manual for the tool will follow soon.

## Our used setup

- Python 3.10 or newer
- Vivado and Vitis 2022.2
- Ubuntu 22.04.5 LTS

If you want to run OpenNTT using our provided PYNQ-Z2 setup, you additionally need:
- Cable drivers installed for Vivado and Vitis
- PYNQ-Z2 FPGA Development Board with Xilinx part number xc7z020clg400-1

## Contributors
Florian Krieger  -  `florian.krieger (at) iaik.tugraz.at`

Florian Hirner  -  `florian.hirner (at) iaik.tugraz.at`

Ahmet Can Mert  -  `ahmet.mert (at) iaik.tugraz.at`

Sujoy Sinha Roy  -  `sujoy.sinharoy (at) iaik.tugraz.at`

-----

[Institute of Applied Information Processing and Communications](https://www.iaik.tugraz.at/), Graz University of Technology, Austria

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
# Tutorial: Network Stack on FPGAs
This tutorial is prepared for Cornell ECE 6980, Spring 2023.

## Instructions
1. Clone this repo:
`git clone `

2. Setup Vitis Environment:
`source setupVitis.sh`

3. Build the hardware bitstream (xclbin): `make build -j5`

4. Build the host program: `make exe`

5. Test the application: `make check`

## Limitations
1. This design only work on real hardware. 
Software emulation is not supported because the Ethernet IPs are wirtten in RTL.
Hardware emulation will require in-depth hacking of the compilcation flow hence not supported in this tutorial.

2. The environment setup is based on the `zhang-capra-xcel` server. Additional tweaks might be required if tested on other machines.

## Acknowledgements
This tutorial is built using the [EasyNet IP fron ETH Zurich](https://github.com/fpgasystems/Vitis_with_100Gbps_TCP-IP). If you use this work, please acknowledge the original authors and cite their paper.
```bibtex
@INPROCEEDINGS {easynet,
    author = {Z. He and D. Korolija and G. Alonso},
    booktitle = {2021 31st International Conference on Field-Programmable Logic and Applications (FPL)},
    title = {EasyNet: 100 Gbps Network for HLS},
    year = {2021},
    pages = {197-203},
    doi = {10.1109/FPL53798.2021.00040},
    url = {https://doi.ieeecomputersociety.org/10.1109/FPL53798.2021.00040},
    publisher = {IEEE Computer Society},
    address = {Los Alamitos, CA, USA},
    month = {sep}
}
```
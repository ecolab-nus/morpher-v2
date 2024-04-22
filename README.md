# Morpher-v2: An Open-Source Tool for CGRA Accelerators

![Morpher Cover](https://user-images.githubusercontent.com/12274945/198943201-17e9ff67-62b3-445f-bd04-feac08da1601.png)

[![Actions Status](https://github.com/ecolab-nus/morpher-v2/workflows/Build%20and%20Test/badge.svg)](https://github.com/ecolab-nus/morpher-v2/actions)

**Note**: Compared to [Morpher](https://github.com/ecolab-nus/morpher), Morpher-v2 can automatically generate RTL and synthesis. If you do not need this function, we suggest using [Morpher](https://github.com/ecolab-nus/morpher)

Welcome to **Morpher**, an open-source framework that provides comprehensive support for modeling diverse Coarse-Grained Reconfigurable Array (CGRA) architectures. The framework offers the following key features:

- **Architecture Description**: Morpher enables users to design architecture characteristics through its Architecture Description Language (ADL).
  
- **Complex Kernels**: It efficiently handles the mapping of complex compute kernels, going beyond simple test cases.
  
- **RTL Generation**: Morpher automatically generates Verilog RTL code for custom CGRAs.

- **Functionality Verification**: The framework validates the functionality of the architecture through Verilator/C++-based simulations.

**Morpher Framework:**
![Morpher Framework](https://github.com/ecolab-nus/morpher-v2/assets/12274945/80329bad-dc35-42b2-93a4-843d7c1f4550)


**Video Demonstration**: Dive into the capabilities of Morpher as it highlights the CGRA compilation, architecture generation, and simulation flow.

https://github.com/ecolab-nus/morpher-v2/assets/12274945/c5e6f136-0051-4059-8f59-c6a788efc7d0




# Build and Run Guide for Morpher-v2

## Prerequisites

- An environment running **Ubuntu 22.04**.

## Setup and Build Steps

1. **Clone and Setup the Repository**:
```bash
git clone [YOUR_REPOSITORY_LINK] 
cd [YOUR_REPOSITORY_NAME]       
```

2. **Setup LLVM**:

```bash
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout 99020b3c73c1e22fa388be8fd0c44391d40b3a38
mkdir llvm-build && cd llvm-build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=TRUE -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
make -j$(nproc)
```
3. **Add LLVM to PATH**:

```bash
export PATH=$PATH:[YOUR_PATH_TO_LLVM]/llvm-project/llvm-build/bin
```
4. **Install sbt**:

```bash
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
```
5. **Install Verilator**:

```bash
sudo apt-get install -y autoconf g++ libfl2 libfl-dev zlib1g-dev
git clone http://git.veripool.org/git/verilator
cd verilator
git pull
git checkout v4.110  
autoconf
./configure
make -j$(nproc)
sudo make install
```
6. **Setup Python**:

```bash
sudo apt install python3.8
python3 -m venv venv
source venv/bin/activate
```
7. **Install Dependencies**:

```bash
echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu focal main universe" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt -y install g++-7 
pip install -r python_requirements.txt
sudo apt-get install gcc-multilib g++-multilib
sudo apt install build-essential 
```
8. **Build**:

```bash
bash build_all.sh
```
9. **Run**:

```bash
python -u run_morpher_llvm16.py morpher_benchmarks/array_add/array_add.c array_add
```


# Publications

[CODAI] [Accelerating Edge AI with Morpher: An Integrated Design, Compilation and Simulation Framework for CGRAs](https://arxiv.org/abs/2309.06127)\
(to appear in Workshop on Compilers, Deployment, and Tooling for Edge AI with Embedded Systems Week (ESWEEK))

        @article{morpher-codai2023,
            title   = "{Accelerating Edge AI with Morpher: An Integrated Design, Compilation and Simulation Framework for CGRAs}",
            author  = {Dhananjaya Wijerathne, Zhaoying Li, Tulika Mitra},
            journal = {Workshop on Compilers, Deployment, and Tooling for Edge AI (CODAI)},
            month   = {September},
            year    = {2023},
        } 

[WOSET] [Morpher: An Open-Source Integrated Compilation and Simulation Framework for CGRA](https://www.comp.nus.edu.sg/~tulika/WOSET_MORPHER_2022.pdf)\
(Appeared in Workshop on Open-Source EDA Technology co-sponsored by ICCAD 2022)

        @article{morpher-woset2022,
            title   = "{Morpher: An Open-Source Integrated Compilation and Simulation Framework for CGRA}",
            author  = {Dhananjaya Wijerathne, Zhaoying Li, Manupa Karunaratne, Li-Shiuan Peh, Tulika Mitra},
            journal = {Fifth Workshop on Open-Source EDA Technology (WOSET)},
            month   = {November},
            year    = {2022},
        } 
        
[DAC] [PANORAMA: Divide-and-Conquer Approach for Mapping Complex Loop Kernels on CGRA](https://www.comp.nus.edu.sg/~tulika/DAC22.pdf)\
Dhananjaya Wijerathne, Zhaoying Li, Thilini Kaushalya Bandara, Tulika Mitra\
59th ACM/IEEE Design Automation Conference, 2022 __Publicity Paper__\
[Artifact Link](https://github.com/ecolab-nus/panorama)

[HPCA] [LISA: Graph Neural Network based Portable Mapping on Spatial Accelerators](https://www.comp.nus.edu.sg/~tulika/HPCA_LISA_2022.pdf)\
Zhaoying Li, Dan Wu, Dhananjaya Wijerathne, Tulika Mitra\
28th IEEE International Symposium on High-Performance Computer Architecture, 2022\
[Artifact Link](https://github.com/ecolab-nus/lisa) __Distinguished Artifact Award__

[ASPLOS] [REVAMP: A Systematic Framework for Heterogeneous CGRA Realization](https://www.comp.nus.edu.sg/~tulika/asplos22.pdf)\
Thilini Kaushalya Bandara, Dhananjaya Wijerathne, Tulika Mitra, Li-Shiuan Peh\
27th ACM International Conference on Architectural Support for Programming Languages and Operating Systems, 2022\
[Artifact Link](https://zenodo.org/record/5848404#.YgyrPTFByUk)

[TCAD] [HiMap: Fast and Scalable High-Quality Mapping on CGRA via Hierarchical Abstraction](https://www.comp.nus.edu.sg/~tulika/HiMap-TCAD.pdf)\
Dhananjaya Wijerathne, Zhaoying Li, Anuj Pathania, Tulika Mitra, Lothar Thiele\
IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems, 41(10) 2022

[TCAD] [ChordMap: Automated Mapping of Streaming Applications onto CGRA](https://ieeexplore.ieee.org/document/9351547)\
Zhaoying Li, Dhananjaya Wijerathne, Xianzhang Chen, Anuj Pathania, Tulika Mitra\
IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems, 41(2) 2022

[Book Chapter] [Coarse-Grained Reconfigurable Array (CGRA)](https://www.comp.nus.edu.sg/~tulika/CGRA-Survey.pdf)\
Zhaoying Li, Dhananjaya Wĳerathne, Tulika Mitra\
Book chapter in “Handbook of Computer Architecture”, Springer (Invited)

[DATE] [HiMap: Fast and Scalable High-Quality Mapping on CGRA via Hierarchical Abstraction](https://www.comp.nus.edu.sg/~tulika/HiMap_DATE_2021.pdf)\
Dhananjaya Wijerathne, Zhaoying Li, Anuj Pathania, Tulika Mitra, Lothar Thiele\
Design Automation and Test in Europe 2021

[TECS] [CASCADE: High Throughput Data Streaming via Decoupled Access/Execute CGRA](https://www.comp.nus.edu.sg/~tulika/TECS-CASCADE19.pdf)\
Dhananjaya Wijerathne, Zhaoying Li, Manupa Karunaratne, Anuj Pathania, Tulika Mitra\
ACM Transactions on Embedded Computing Systems\
Special Issue on ACM/IEEE International Conference on Compilers, Architecture, and Synthesis for Embedded Systems 2019

[ICCAD] [4D-CGRA : Introducing the branch dimension to spatio-temporal application mapping of CGRAs](https://www.comp.nus.edu.sg/~tulika/4D-CGRA-ICCAD19.pdf)\
Manupa Karunaratne, Dhananjaya Wijerathne, Tulika Mitra, Li-Shiuan Peh\
38th ACM/IEEE International Conference on Computer Aided Design, November 2019

[A-SSCC] [HyCUBE: a 0.9V 26.4 MOPS/mW, 290 pJ/cycle, Power Efficient Accelerator for IoT Applications](https://www.comp.nus.edu.sg/~tulika/Hycube_for_ASSCC_2019.pdf)\
Bo Wang, Manupa Karunarathne, Aditi Kulkarni, Tulika Mitra, Li-Shiuan Peh\
IEEE Asian Solid-State Circuits Conference, November 2019

[DAC] [DNestMap : Mapping Deeply-Nested Loops on Ultra-Low Power CGRAs](https://www.comp.nus.edu.sg/~tulika/DAC18-CGRA.pdf)\
Manupa Karunaratne, Cheng Tan, Aditi Kulkarni, Tulika Mitra, Li-Shiuan Peh\
55th ACM/IEEE Design Automation Conference, June 2018

[DAC] [HyCUBE : A CGRA with Reconfigurable Single-cycle Multi-hop Interconnect](https://www.comp.nus.edu.sg/~tulika/DAC17.pdf)\
Manupa Karunaratne, Aditi Kulkarni, Tulika Mitra, Li-Shiuan Peh\
54th ACM/IEEE Design Automation Conference, June 2017

[ACM-TRETS] [Graph Minor Approach for Application Mapping on CGRAs](https://www.comp.nus.edu.sg/~tulika/TRETS14.pdf)\
Liang Chen, Tulika Mitra\
ACM Transactions on Reconfigurable Technology and Systems 2014

[FPT] Graph Minor Approach for Application Mapping on CGRAs [Much expanded journal version](https://www.comp.nus.edu.sg/~tulika/TRETS14.pdf)\
Liang Chen, Tulika Mitra\
International Conference on Field Programmable Technology, December 2012\
__Best Paper Award__



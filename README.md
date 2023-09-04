
# Morpher-v2: An Open-Source Tool for CGRA Accelerators

![Morpher Cover](https://user-images.githubusercontent.com/12274945/198943201-17e9ff67-62b3-445f-bd04-feac08da1601.png)

[![Actions Status](https://github.com/ecolab-nus/morpher-v2/workflows/Build%20and%20Test/badge.svg)](https://github.com/ecolab-nus/morpher-v2/actions)


Welcome to **Morpher**, an open-source framework that provides comprehensive support for modeling diverse Coarse-Grained Reconfigurable Array (CGRA) architectures. The framework offers the following key features:

- **Architecture Description**: Morpher enables users to design architecture characteristics through its Architecture Description Language (ADL).
  
- **Complex Kernels**: It efficiently handles the mapping of complex compute kernels, going beyond simple test cases.
  
- **RTL Generation**: Morpher automatically generates Verilog RTL code for custom CGRAs.

- **Functionality Verification**: The framework validates the functionality of the architecture through Verilator/C++-based simulations.

**Morpher Framework:**
![Morpher Framework](https://github.com/ecolab-nus/morpher-v2/assets/12274945/30f14a99-d884-406b-b13d-fa1c34113336)



**Video Demonstration**: Dive into the capabilities of Morpher as it highlights the CGRA compilation, architecture generation, and simulation flow.

[Video Demonstration](https://github.com/ecolab-nus/morpher-v2/assets/12274945/6765cdd9-71ff-42b1-b830-32fad69e7d76)


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

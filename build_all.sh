# Set desired GCC version
export CC=gcc-7
export CXX=g++-7

cd dfg_generator
mkdir build
cd build
cmake ..
make VERBOSE=1 -j 4
cd ../../mapper
mkdir build
cd build
cmake ..
make all -j
cd ../../cppsimulator
cd src
mkdir build
cd build
cmake ..
make all -j
echo "build success!!!"

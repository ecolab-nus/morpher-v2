cd dfg_generator
mkdir build
cd build
cmake ..
make  -j 2
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
echo "buld success!!!"

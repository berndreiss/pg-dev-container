export LLVM_SRC=`pwd`/../../../llvm-project
export LLVM_HOME=$LLVM_SRC/release
export LLVM_BUILD=$LLVM_SRC/build

mkdir -p build
cd build
cmake -G Ninja ..
ninja 


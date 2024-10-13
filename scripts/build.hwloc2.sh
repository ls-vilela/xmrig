#!/bin/sh -e

HWLOC_VERSION="2.11.2"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

wget https://download.open-mpi.org/release/hwloc/v2.11/hwloc-2.11.2.tar.gz -O hwloc-2.11.2.tar.gz
tar -xzf hwloc-2.11.2.tar.gz

cd hwloc-2.11.2
./configure --disable-shared --enable-static --disable-io --disable-libudev --disable-libxml2
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp src/.libs/libhwloc.a ../../deps/lib
cd ..

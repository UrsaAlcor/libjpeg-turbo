#!/bin/bash

set -xe

package=libjpeg-turbo
origin=$(pwd)
version=$(cd $package && git describe --tags --abbrev=0)

install=$origin/lmod/dist/$(arch)/$package/$version
module=$origin/lmod/modules/$(arch)/$package/

mkdir -p $install
mkdir -p $module

NJ=${NJ:-$(nproc)}
# ===============

# Compile & install lz4
rm -rf $install/*
cd $package

mkdir -p build
cd build
export CFLAGS="-mtune=haswell"
export LDFLAGS="-Wl,-z,now"

cmake -G"Unix Makefiles"                  \
    -DCMAKE_BUILD_TYPE=Release            \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON  \
    -DCMAKE_INSTALL_PREFIX="$install"     \
    -DCMAKE_INSTALL_LIBDIR="$install/lib" \
    ..

make -j$NJ
make install

cd ..
cd ..

# Setup the module file
cp libjpeg.lua $module/$version.lua

sed -i -e "s@\${package}@libjpeg@g" $module/$version.lua
sed -i -e "s@\${version}@$version@g" $module/$version.lua

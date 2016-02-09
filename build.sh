export SYSROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../android-arm-toolchain
ARCH=arm-linux-androideabi
#/Users/webb/Library/Android/android-ndk-r10e/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=$SYSROOT
ln -s $SYSROOT/sysroot/usr/include/linux/soundcard.h $SYSROOT/sysroot/usr/include/sys/soundcard.h

export PATH=$SYSROOT/$ARCH/bin:$PATH
export LDFLAGS=-llog
#export CC=arm-linux-androideabi-gcc
#export CXX=arm-linux-androideabi-g++
#export LD_LIBRARY_PATH=$SYSROOT/lib
#export AR=arm-linux-androideabi-ar
#export RANLIB=arm-linux-androideabi-ranlib

make distclean
./autogen.sh --build=x86_64 --host=arm-linux-androideabi --without-python --without-lapack --disable-threads --enable-static=yes --enable-shared=no --with-sysroot=$SYSROOT --prefix=$SYSROOT && make && sudo make install

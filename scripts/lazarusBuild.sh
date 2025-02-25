#/bin/sh
sed -i 's,\/share/man,\/documentation/man,g' install/man/Makefile
sed -i 's,\/share/man,\/documentation/man,g' Makefile.fpc
sed -i 's,\=share/lazarus,\=lib/lazarus,g' Makefile.fpc
sed -i 's,\/share/lazarus,\/lib/lazarus,g' Makefile.fpc
#sed -i 's,\/share,\/data,g' Makefile.fpc
export INSTALL_PREFIX=/boot/home/destdir

export FPCDIR=/boot/system/lib/fpc/3.2.2/src/
fpcmake -r
cd components/
fpcmake -r
cd ../lcl/
fpcmake -r
cd interfaces/
fpcmake -r
cd nogui/
fpcmake -r
cd ../../../tools/
fpcmake -r
cd ../lcl/interfaces/qt6/
fpcmake -r
cd ../../../
make LCL_PLATFORM=qt6 bigide

mkdir -p $INSTALL_PREFIX/lib
make install 

rm -rf /boot/home/destdir/share

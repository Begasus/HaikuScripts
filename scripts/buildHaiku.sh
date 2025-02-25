#/bin/sh

# https://www.haiku-os.org/guides/building/
# this is a short version from the above for 64bit

# prerequirements
pkgman install cmd:python3 cmd:xorriso devel:libzstd -y

# getting the sources
sourceDir="/Opslag/Haiku"
mkdir -p $sourceDir
cd $sourceDir

git clone https://review.haiku-os.org/buildtools
git clone https://review.haiku-os.org/haiku

# fetch latest changes
cd $sourceDir/buildtools
git pull

# fetch latest changes
cd $sourceDir/haiku
git switch master
git pull

# prepare buildtools
mkdir generated.x86_64; cd generated.x86_64
../configure --cross-tools-source ../../buildtools --build-cross-tools x86_64

# build the Haiku source ("-jn" reflect your cpu's/threads)
jam -q -j16 @nightly-anyboot

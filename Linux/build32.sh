# 32bit build script

getfile() {
    if [ ! -f ./src/$1 ]; then
        wget -O ./src/$1 $2
    fi
}

sudo apt-get install libsdl-net1.2-dev:i386 libsdl1.2-dev:i386 flex bison autotools-dev
./bootstrap
../configure --enable-oldsound --enable-network --enable-hwdebug --build=i386-linux-gnu "CFLAGS=-g -m32" "CXXFLAGS=-g -m32" "LDFLAGS=-g -m32"
make
getfile Homeworld.big https://www.dropbox.com/s/97menylhg49911i/Homeworld.big?dl=0
getfile HW_Comp.vce https://www.dropbox.com/s/fak5sia5kps5dnf/HW_Comp.vce?dl=0
getfile HW_Music.wxd https://www.dropbox.com/s/utsv99txeppcyjf/HW_Music.wxd?dl=0
getfile Update.big https://www.dropbox.com/s/gsqdr2n5xpknw5j/Update.big?dl=0 
cd ../tools/biggie/ && ./biggie-Linux-compile.sh
cd ../.. && ./HomeworldSDL_big/convert_directory_to_big_file
cp HomeworldSDL.big Linux/src/
echo "Run ./src/homeworld"

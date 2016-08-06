#!/bin/bash

set -e

# Fetch extra data

if [ ! -d thirdparty ]
then
  mkdir -p thirdparty/cpm22
  curl http://www.cpm.z80.de/download/cpm22-b.zip -o thirdparty/cpm22-b.zip
  unzip thirdparty/cpm22-b.zip -d thirdparty/cpm22

  mkdir -p thirdparty/infocom
  curl http://www.z80.eu/downloads/hitchhiker.zip -o thirdparty/hitchhiker.zip
  unzip thirdparty/hitchhiker.zip -d thirdparty/infocom
fi

mkdir -p out

# Compile source
cd src

zasm bouncer.asm -o ../out/bouncer.s
zasm test.asm    -o ../out/test.s
zasm monitor.asm -o ../out/monitor.s
zasm example.asm -o ../out/example.s
zasm loader.asm  -o ../out/loader.s
zasm cpm22.asm   -o ../out/cpm22.s
zasm writer.asm   -o ../out/writer.com

# Build ROM images

cd ../out

lua ../tools/build_test_data.lua -s 0x7000 -m 17 -o testdata.s

lua ../tools/build_rom.lua -o bouncer.bin bouncer.s:0x0000
lua ../tools/build_rom.lua -o test.bin    test.s:0x0000 testdata.s:0x1000
lua ../tools/build_rom.lua -o monitor.bin monitor.s:0x0000
lua ../tools/build_hex.lua -o example.txt example.s
lua ../tools/build_hex.lua -o loader.txt  loader.s -t 1000

# Test proof-of-concept - building of disk images, unpacking, etc.
mkdir -p unpack_cpm
mkdir -p unpack_games
lua ../tools/disk_builder.lua

# Then, you can place the image on an SD card using something like the
# following:
#
# sudo dd if=XXXX.dsk of=$DEV bs=512 && diskutil eject $DEV
#
# NB: IF YOU USE THE WRONG DEVICE, YOU COULD DESTORY A FILESYSTEM AND
# YOUR DATA ON IT. Be careful.

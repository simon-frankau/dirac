#!/bin/bash

set -e

mkdir -p out

# Compile source
cd src

zasm bouncer.asm -o ../out/bouncer.s
zasm test.asm    -o ../out/test.s
zasm monitor.asm -o ../out/monitor.s
zasm example.asm -o ../out/example.s
zasm loader.asm  -o ../out/loader.s
zasm cpm22.asm   -o ../out/cpm22.s

# Build ROM images

cd ../out

lua ../tools/build_test_data.lua -s 0x7000 -m 17 -o testdata.s

lua ../tools/build_rom.lua -o bouncer.bin bouncer.s:0x0000
lua ../tools/build_rom.lua -o test.bin    test.s:0x0000 testdata.s:0x1000
lua ../tools/build_rom.lua -o monitor.bin monitor.s:0x0000
lua ../tools/build_hex.lua -o example.txt example.s
lua ../tools/build_hex.lua -o loader.txt  loader.s -t 1000

# Build disk image

lua ../tools/uninterleave.lua -o appleiicpm_raw.dsk ../images/appleiicpm.dsk
# Extract the image contents if you really want...
#mkdir -p out
#lua ../tools/extract.lua
lua ../tools/build_disk.lua -b loader.s -c cpm22.s appleiicpm_raw.dsk \
  -o sdcard.dsk

# Then, you can place the image on an SD card using something like the
# following:
#
# sudo dd if=sdcard.dsk of=$DEV bs=512 && diskutil eject $DEV
#
# NB: IF YOU USE THE WRONG DEVICE, YOU COULD DESTORY A FILESYSTEM AND
# YOUR DATA ON IT. Be careful.

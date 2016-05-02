#!/bin/bash

set -e

mkdir -p out

# Compile source
cd src

zasm bouncer.asm -o ../out/bouncer.s
zasm test.asm    -o ../out/test.s
zasm monitor.asm -o ../out/monitor.s
zasm example.asm -o ../out/example.s

# Build ROM images

cd ../out

lua ../tools/build_test_data.lua -s 0x7000 -m 17 -o testdata.s

lua ../tools/build_rom.lua -o bouncer.bin bouncer.s:0x0000
lua ../tools/build_rom.lua -o test.bin    test.s:0x0000 testdata.s:0x1000
lua ../tools/build_rom.lua -o monitor.bin monitor.s:0x0000
lua ../tools/build_hex.lua -o example.txt example.s

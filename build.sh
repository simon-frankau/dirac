#!/bin/bash

set -e

mkdir -p out

# Compile source
cd src

zasm bouncer.ass -o ../out/bouncer.s
zasm test.ass    -o ../out/test.s
zasm monitor.ass -o ../out/monitor.s

# Build ROM images

cd ../out

lua ../tools/build_test_data.lua -s 0x7000 -m 17 -o testdata.s

lua ../tools/build_rom.lua -o bouncer.bin bouncer.s:0x0000
lua ../tools/build_rom.lua -o test.bin    test.s:0x0000 testdata.s:0x1000
lua ../tools/build_rom.lua -o monitor.bin monitor.s:0x0000

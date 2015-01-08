#!/bin/bash

mkdir -p out

cd src

zasm bouncer.ass -o ../out/bouncer.bin
zasm test.ass    -o ../out/test.rom
zasm monitor.ass -o ../out/monitor.bin

cd ../out

lua ../tools/build_test_data.lua -s 0x7000 -m 17 -o testdata.rom
lua ../tools/build_rom.lua -o z80.bin test.rom:0x0000 testdata.rom:0x1000

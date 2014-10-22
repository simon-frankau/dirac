#!/bin/bash

mkdir -p out

cd src

zasm bouncer.ass -o ../out/bouncer.bin
zasm test.ass    -o ../out/test.rom
zasm monitor.ass -o ../out/monitor.bin

cd ../out

lua ../tools/build_test_data.lua
lua ../tools/build_rom.lua

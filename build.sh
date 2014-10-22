#!/bin/bash

# FIXME: This is clearly very machine-specific, and should be made
# general! Also, I've just moved the source and tools into
# subdirectories, so this won't even work on the original machine any
# more. Needs a huge re-jig.

~/zasm/zasm test.ass

~/Moomin-backup/sgf/lua-5.1.4/src/lua build_test_data.lua

~/Moomin-backup/sgf/lua-5.1.4/src/lua build_rom.lua


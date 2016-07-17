-- Rearrange an uninterleaved disk image so that sector s of track t
-- is at position 0000 0000 000t tttt 00ss sss0 0000 0000 (base 2).
--
-- This makes one 128 byte sector per SD card 512 byte block, and
-- simplifies the CP/M BIOS disk read code.
--
-- We also add in the boot sector and bootable CP/M image.
--
-- Command line arguments are:
-- -o file_name           Output filename
-- file_name              Input filename
-- -b dest                (Optional) boot sector file
-- -c dest                (Optional) CP/M image

------------------------------------------------------------------------
-- Config
--

local in_image  = nil
local out_image = nil
local boot_sector = nil
local cpm = nil

do
    local i = 1
    while i <= #arg do
        if arg[i] == "-o" then
            i = i + 1
            out_image = arg[i]
        elseif arg[i] == "-b" then
            i = i + 1
            boot_sector = arg[i]
        elseif arg[i] == "-c" then
            i = i + 1
            cpm = arg[i]
        else
            in_image = arg[i]
        end
        i = i + 1
    end
end

if in_image == nil then
    print(arg[0] .. ": Input filename required")
    os.exit(1)
end

if out_image == nil then
    print(arg[0] .. ": Output filename required")
    os.exit(1)
end

------------------------------------------------------------------------
-- Do the work
--

local fin = assert(io.open(in_image, "rb"))
local fout = assert(io.open(out_image, "wb"))

local track_len = 32 * 128

for track = 0,34 do
  local data = fin:read(track_len)
  fout:seek("set", track * 65536)
  fout:write(data)
end

if boot_sector ~= nil then
  local fboot = assert(io.open(boot_sector))
  fout:seek("set", 0)
  fout:write(fboot:read("*all"))
end

if cpm ~= nil then
  local fcpm = assert(io.open(cpm))
  fout:seek("set", 512)
  fout:write(fcpm:read("*all"))
end

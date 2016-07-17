-- This script used to rearrange disk images for use by Dirac's CP/M,
-- but the sectors are now arranged contiguously. The main point of
-- this tool is now to add in the boot sector and bootable CP/M image.
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

local disk_len = 32 * 128 * 35

fout:write(fin:read(disk_len))

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

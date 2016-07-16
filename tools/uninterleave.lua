-- Uninterleave the sectors of an Apple II CP/M disk image, assuming the
-- sector interleaving order embedded in this script...
--
-- Command line arguments are:
-- -o file_name           Output filename
-- file_name              Input filename

------------------------------------------------------------------------
-- Config
--

local in_file  = nil
local out_file = nil

do
    local i = 1
    while i <= #arg do
        if arg[i] == "-o" then
            i = i + 1
            out_file = arg[i]
        else
            in_file = arg[i]
        end
        i = i + 1
    end
end

if in_file == nil then
    print(arg[0] .. ": Input filename required")
    os.exit(1)
end

if out_file == nil then
    print(arg[0] .. ": Output filename required")
    os.exit(1)
end

------------------------------------------------------------------------
-- Do the work
--

local fin = assert(io.open(in_file, "rb"))
local fout = assert(io.open(out_file, "wb"))

disk = {}

for track = 1,35 do
  disk[track] = {}
  for sector = 0,15 do
    disk[track][sector] = fin:read(256)
  end
end

lut = { 0, 6, 12, 3, 9, 15, 14, 5, 11, 2,8, 7, 13, 4, 10, 1 }

for track = 1,35 do
  for sector = 1,16 do
    local dest_sector = lut[sector]
    fout:write(disk[track][dest_sector])
  end
end

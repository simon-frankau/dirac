-- Assemble the given bin files at the given locations, to generate a ROM.
--
-- This code is specific to the toy Z80's memory structure, in that A12-
-- are inverted, as required. We also assume a 32K ROM.
--
-- Command line arguments are:
-- -o file_name           Output filename
-- file_name:base_address Binary chunks to assemble into the image

------------------------------------------------------------------------
-- Config
--

-- Hardwired
local rom_size   = 0x8000
local chunk_size = 0x1000

local rom_name = nil
local contents = {}

do
    local i = 1
    while i <= #arg do
        if arg[i] == "-o" then
            i = i + 1
            rom_name = arg[i]
        elseif arg[i]:sub(1,1) == "-" then
            print(arg[0] .. ": Unrecognised option: " .. arg[i])
        else
            local in_file, loc_str = arg[i]:match("(.*):(.*)")
            if in_file == nil then
                print(arg[0] .. ": Expected 'file_name:base_address': " ..
                    arg[i])
                os.exit(1)
            end
            local loc_num = tonumber(loc_str)
            if loc_num == nil then
                print(arg[0] .. ": Expected numeric base address: " ..
                    arg[i])
                os.exit(1)
            end
            contents[in_file] = loc_num
        end
        i = i + 1
    end
end

if rom_name == nil then
    print(arg[0] .. ": Output filename required")
    os.exit(1)
end

------------------------------------------------------------------------
-- Do the work
--

local rom_data = string.rep("\0", rom_size)

local function insert_data(offset, data)
    rom_data = rom_data:sub(1, offset) ..
               data ..
               rom_data:sub(1 + offset + data:len(), -1)
end

local function read_chunk(offset, size)
    return rom_data:sub(1 + offset, offset + size)
end

local function load_file(offset, name)
    local f = assert(io.open(name, "rb"))
    local content = f:read("*a")
    f:close()
    insert_data(offset, content)
end

for k, v in pairs(contents) do
    load_file(v, k)
end

local f = assert(io.open(rom_name, "wb"))

for i = rom_size - chunk_size, 0, -chunk_size do
   f:write(read_chunk(i, chunk_size))
end

f:close()
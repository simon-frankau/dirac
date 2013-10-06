-- Assemble the given bin files at the given locations, to generate a ROM.
--
-- This code is specific to the toy Z80's memory structure, in that A12-
-- are inverted, as required. We also assume a 32K ROM.

------------------------------------------------------------------------
-- Config
--

local rom_size   = 0x8000
local chunk_size = 0x1000
local rom_name   = "z80.bin"

local contents = {
    ["test.rom"]     = 0x0000,
    ["testdata.rom"] = 0x1000
}

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
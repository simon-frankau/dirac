-- Write out data that can be stuck in the ROM image and read to test
-- that all the ROM mapping works ok.

------------------------------------------------------------------------
-- Config
--

local modulus   = 17
local data_size = 0x7000
local file_name = "testdata.rom"

------------------------------------------------------------------------
-- Do the work
--

-- Nasty complexity but modulus is a small number
local msg = ""
for i = modulus, 1, -1 do
    msg = msg .. string.char(i)
end

-- Now make the message
msg = msg:rep(math.ceil(data_size / modulus))

-- And cut down to size
msg = msg:sub(1, data_size)

local f = assert(io.open(file_name, "wb"))
f:write(msg)
f:close()

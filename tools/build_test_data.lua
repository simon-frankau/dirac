-- Write out data that can be stuck in the ROM image and read to test
-- that all the ROM mapping works ok.
--
-- The data consists of a repeated pattern of n, n-1, ..., 1.
--
-- Arguments:
--  -s n        Size of the output data
--  -m n        The modulus - 'n' above
--  -o filename Output file name

------------------------------------------------------------------------
-- Config
--

local modulus   = 17
local data_size = 0x7000
local file_name = "testdata.rom"

do
    local i = 1
    while i <= #arg do
        if arg[i] == "-o" then
            i = i + 1
            file_name = arg[i]
        elseif arg[i] == "-s" then
            i = i + 1
            data_size = tonumber(arg[i])
        elseif arg[i] == "-m" then
            i = i + 1
            modulus = tonumber(arg[i])
        else
            print(arg[0] .. ": Unrecognised argument: " .. arg[i])
            os.exit(1)
        end
        i = i + 1
    end
end

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

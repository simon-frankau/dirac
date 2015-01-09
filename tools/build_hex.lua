-- Create a hex file which can be transmitted to the monitor over serial.
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

local f_in = assert(io.open(in_file, "rb"))
local content = f_in:read("*a")
f_in:close()

local f_out = assert(io.open(out_file, "wb"))

for i = 1, #content do
   local c = content:byte(i)
   f_out:write(string.format("%02x%s", c, i % 16 ~= 0 and " " or "\n"))
end

f_out:close()

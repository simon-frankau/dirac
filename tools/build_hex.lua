-- Create a hex file which can be transmitted to the monitor over serial.
--
-- The monitor maps one bank of RAM to 0xFxxx, so we assume by default
-- that's where you want your data placing.

-- Command line arguments are:
-- -o file_name           Output filename
-- file_name              Input filename
-- -t dest                (Optional) target address in hex

------------------------------------------------------------------------
-- Config
--

local in_file  = nil
local out_file = nil
local target = 0xF000

do
    local i = 1
    while i <= #arg do
        if arg[i] == "-o" then
            i = i + 1
            out_file = arg[i]
        elseif arg[i] == "-t" then
            i = i + 1
            target = tonumber(arg[i], 16)
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

f_out:write(string.format("W %04x %04x\n", target, content:len()))

for i = 1, #content do
   local c = content:byte(i)
   f_out:write(string.format("%02x%s", c, i % 16 ~= 0 and " " or "\n"))
end

if content:len() % 16 ~= 0 then
    f_out:write("\n")
end

f_out:close()

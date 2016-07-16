-- Extract the contents of the deinterleaved disk.
--
-- You should not be surprised to find this is quite hacky.
--
-- Expects the directory 'out' to exist.

local fin = assert(io.open("appleiicpm_raw.dsk", "rb"))

local sector_size = 128
local sectors_per_block = 8
local sectors_per_track = 32
local tracks = 35
local reserved_tracks = 3
local dir_entry_size = 32
local dir_entries = 48

local dir_start = reserved_tracks * sectors_per_track * sector_size

fin:seek("set", dir_start)

function block_to_offset(block)
  return dir_start + sector_size * sectors_per_block * block
end

function write_file(filename, extent, rc, map)
  local saved = fin:seek()
  -- We deal with multi-extent files by just opening append and seeking.
  local fout = assert(io.open("out/" .. filename, "ab"))
  fout:seek("set", extent * sectors_per_block * sector_size * 16)
  for sec in map:gmatch(".") do
    -- Read sectors, write sectors
    local toread = rc > sectors_per_block and sectors_per_block or rc
    toread = toread * sector_size
    fin:seek("set", block_to_offset(sec:byte()))
    fout:write(fin:read(toread))
    -- Update remaining sector count
    if rc <= sectors_per_block then
      break
    end
    rc = rc - sectors_per_block
  end
  fout:close()
  fin:seek("set", saved)
  return
end

function read_entry(i)
  local entry = fin:read(dir_entry_size)
  -- If second byte is 0xE5, it sounds properly empty, give up.
  if entry:byte(2) == 0xE5 then
    return
  end
  -- Extract type field.
  local type = entry:byte(1)
  local type_str = type == 0xe5 and "Deleted" or string.format("User %02d",type)
  -- Extract name fields
  local name = entry:sub(2,9)
  local ext = entry:sub(10,12)
  -- Extract flags from high bits of extension
  local read_only = ext:byte(1) > 127 and "R" or " "
  local hidden = ext:byte(2) > 127 and "H" or " "
  local archive = ext:byte(3) > 127 and "A" or " "
  ext = string.char(ext:byte(1) % 128, ext:byte(2) % 128, ext:byte(3) % 128)
  -- Now that's done, remove trailing spaces and build filename
  local filename = name:gsub(" *", "") .. "." .. ext:gsub(" *", "")
  local ex = entry:byte(13)
  local s2 = entry:byte(15)
  local rc = entry:byte(16)
  local map = entry:sub(17,32)
  print(string.format("%s %11s %s%s%s", type_str, filename, read_only, hidden, archive))
  if ex ~= 0 or s2 ~= 0 then
    -- FIXME!
    print "Hmmm. Long. Dunno."
  end
  if type == 0xe5 then
    -- Deleted files may use existing names. Make unique.
    filename = "del_" .. i .. "_" .. filename
  end
  write_file(filename, ex, rc, map)
end

for i = 1, dir_entries do
  read_entry(i)
end

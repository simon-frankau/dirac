-- Library for building disk images
--
-- The idea is that you define a disk image through a data structure
-- in a Lua source file (generated with helpers from this file), and
-- then run the generation tool to create the disk image.

example = {
  name = "cpm.dsk",
  files = {
    { file = "loader.s", raw_offset = 0 },
    { file = "cpm22.s",  raw_offset = 512 },
    { file = "../thirdparty/cpm22/ASM.COM" },
    { file = "../thirdparty/cpm22/BIOS.ASM" },
    { file = "../thirdparty/cpm22/CPM.SYS" },
    { file = "../thirdparty/cpm22/DDT.COM" },
    { file = "../thirdparty/cpm22/DEBLOCK.ASM" },
    { file = "../thirdparty/cpm22/DISKDEF.LIB" },
    { file = "../thirdparty/cpm22/DSKMAINT.COM" },
    { file = "../thirdparty/cpm22/DUMP.ASM" },
    { file = "../thirdparty/cpm22/DUMP.COM" },
    { file = "../thirdparty/cpm22/ED.COM" },
    { file = "../thirdparty/cpm22/LOAD.COM" },
    { file = "../thirdparty/cpm22/PIP.COM" },
    { file = "../thirdparty/cpm22/READ.ME" },
    { file = "../thirdparty/cpm22/STAT.COM" },
    { file = "../thirdparty/cpm22/SUBMIT.COM" },
    { file = "../thirdparty/cpm22/XSUB.COM" },
    { file = "writer.com" },
  }
}

-- TODO: Only supports < 256 blocks on disk

local sector_size = 128
local dir_entry_size = 32

function nameify(s, n)
  return (s:upper() .. string.rep(" ", n)):sub(1, n)
end

-- Generate the disk structure
function write_disk(d)
  -- Our strategy for building a disk is very dumb:
  -- 1. Create a blank disk
  -- 2. For each file, write it out contiguously and store its location
  -- 3. Build directory structure and write it out
  -- We can also add in boot sectors, etc.
  -- If we run out of space to write into, we are sad.

  configure_disk(d)

  local fout = empty_disk(d)

  local offset = d.dir_blocks

  for _, f in ipairs(d.files) do
    print(f.file)
    if f.raw_offset ~= nil then
      fout:seek("set", f.raw_offset)
      local fin = assert(io.open(f.file, "rb"))
      fout:write(fin:read("*all"))
      fin:close()
    else
      fout:seek("set", (d.reserved_blocks + offset) * d.block_size)
      local fin = assert(io.open(f.file, "rb"))
      local data = fin:read(f.length or "*all")
      fout:write(data)
      fin:close()
      f.location = offset
      f.length = math.ceil(data:len() / sector_size)
      offset = offset + math.ceil(data:len() / d.block_size)
    end
  end

  assert(d.reserved_blocks + offset < d.total_blocks,
         "Not enough space for data")

  fout:seek("set", d.reserved_blocks * d.block_size)
  assert(d.extent_mask == 0, "Only support extent_mask == 0 now")
  for _, f in ipairs(d.files) do
    if f.raw_offset == nil then
      -- TODO: Users, flags, long files.
      -- TODO: Custom file names
      local lhs, rhs = f.file:match("([^/]*)[.]([^/]*)$")
      lhs = nameify(lhs, 8)
      rhs = nameify(rhs, 3)
      if f.length == 0 then
        -- Special case
        write_dir_entry(d, fout, lhs .. rhs, 0, 0)
      else
        local len = f.length
        local loc = f.location
        local ext = 0
        while len > 0 do
          write_dir_entry(d, fout, lhs .. rhs, len, loc, ext)
          len = len - 16 * d.sectors_per_block
          loc = loc + 16
          ext = ext + 1
        end
      end
    end
  end
  -- TODO: Check table isn't full

  fout:close()
end

-- Set variables we will need
function configure_disk(d)
  local function set_if_nil(k, v)
    if d[k] == nil then
      d[k] = v
    end
  end

  -- Set some defaults.
  set_if_nil("block_size", 1024)
  set_if_nil("sectors", 32)
  set_if_nil("tracks", 35)
  set_if_nil("reserved_tracks", 3)
  set_if_nil("dir_entries", 48)
  set_if_nil("extent_mask", 0)

  -- Derive useful values
  set_if_nil("sectors_per_block", d.block_size / sector_size)
  set_if_nil("blocks_per_track", d.sectors / d.sectors_per_block)
  set_if_nil("reserved_blocks", d.reserved_tracks * d.blocks_per_track)
  set_if_nil("dir_blocks", math.ceil(d.dir_entries * dir_entry_size /
                                     d.block_size))
  set_if_nil("total_blocks", d.tracks * d.blocks_per_track)
end

-- Actually write out the populated disk image.
function empty_disk(d)
  local fout = assert(io.open(d.name, "wb"))
  local empty_block = string.char(0xE5):rep(d.block_size * d.total_blocks)
  fout:write(empty_block)
  return fout
end

local nul = string.char(0)

-- Write a single line directory entry.
function write_dir_entry(d, f, name, length, loc, ext)
  local len = string.char(math.min(length, 0x80))
  local ex = string.char(ext % 32)
  local s1 = nul
  local s2 = string.char(math.floor(ext / 32))
  local entry = nul .. name .. ex .. s1 .. s2 .. len
  local blocks = ""
  for i = 0,15 do
    -- Blocks were written contiguously, so put entries in for blocks
    -- that contain stuff.
    local block = i * d.sectors_per_block < length
                  and string.char(loc + i)
                  or string.char(0)
    blocks = blocks .. block
  end
  f:write(entry .. blocks)
end

write_disk(example)

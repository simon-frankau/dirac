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
  }
}

-- And a variant of 'example' with more blocks and larger block size.
-- Textually copied to avoid deep-copy issues.
example2 = {
  name = "cpmL.dsk",
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
  },
  tracks = 400,
  block_size = 4096
}

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
          len = len - (d.extent_size / 128)
          loc = loc + d.blocks_per_extent
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

  -- Derive useful values
  set_if_nil("sectors_per_block", d.block_size / sector_size)
  set_if_nil("blocks_per_track", d.sectors / d.sectors_per_block)
  set_if_nil("reserved_blocks", d.reserved_tracks * d.blocks_per_track)
  set_if_nil("dir_blocks", math.ceil(d.dir_entries * dir_entry_size /
                                     d.block_size))
  set_if_nil("total_blocks", d.tracks * d.blocks_per_track)
  set_if_nil("large_disk", d.total_blocks - d.reserved_tracks > 256)
  set_if_nil("blocks_per_extent", d.large_disk and 8 or 16)
  set_if_nil("extent_size", d.block_size * d.blocks_per_extent)
  set_if_nil("extent_mask",  d.extent_size / 16384)

  assert(d.extent_size >= 16384,
         "Block size must be > 1024 if total blocks > 256")
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
  local full = length >= d.extent_mask * 0x80
  -- Glue together length and extent id...
  local len_low = full and 0x80 or (length % 0x80)
  local len_high = full and (d.extent_mask - 1) or math.floor(length / 0x80)
  local high_part = len_high + d.extent_mask * ext
  -- And then split this across the fields...
  local ex = string.char(high_part % 32)
  local s1 = nul
  local s2 = string.char(math.floor(high_part / 32))
  local rc = string.char(len_low)
  local entry = nul .. name .. ex .. s1 .. s2 .. rc
  local blocks = ""
  if d.large_disk then
    -- Double byte blocks, 8 per extent.
    for i = 0,7 do
      -- Blocks were written contiguously, so put entries in for blocks
      -- that contain stuff.
      local block_l = i * d.sectors_per_block < length
                      and string.char((loc + i) % 256)
                      or string.char(0)
      local block_h = i * d.sectors_per_block < length
                      and string.char(math.floor((loc + i) / 256))
                      or string.char(0)
      blocks = blocks .. block_l .. block_h
    end
  else
    -- Single byte blocks, 16 per extent.
    for i = 0,15 do
      -- Blocks were written contiguously, so put entries in for blocks
      -- that contain stuff.
      local block = i * d.sectors_per_block < length
                    and string.char(loc + i)
                    or string.char(0)
      blocks = blocks .. block
    end
  end
  f:write(entry .. blocks)
end

function read_disk(d)
  configure_disk(d)
  local fin = assert(io.open(d.name, "rb"))
  fin:seek("set", d.reserved_blocks * d.block_size)
  d.seen = {}
  for i = 1, d.dir_entries do
    read_entry(d, fin, i)
  end
  fin:close()
end

function read_entry(d, fin, i)
  local entry = fin:read(dir_entry_size)

  -- Extract type field.
  local type = entry:byte(1)
  if type == 0xe5 then
    return
  end

  local type_str = string.format("User %02d",type)

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
  write_file(d, fin, filename, ex, s2, rc, map)
end

function block_to_offset(d, block)
  return d.block_size * (d.reserved_blocks + block)
end

function write_file(d, fin, filename, ex, s2, rc, map)
  local saved = fin:seek()
  local full_len = 32 * s2 + ex
  local extent = math.floor(full_len / d.extent_mask)
  rc = rc + 0x80 * (full_len % d.extent_mask)

  -- We deal with multi-extent files by just opening append and seeking.
  local mode = "ab"
  -- Create file when we see the first extent.
  if not d.seen[filename] then
    mode = "wb"
    d.seen[filename] = true
  end
  local fout = assert(io.open(d.prefix .. "/" .. filename, mode))
  fout:seek("set", extent * d.extent_size)
  if not d.large_disk then
    for sec in map:gmatch(".") do
      -- Read sectors, write sectors
      local toread = math.min(rc, d.sectors_per_block)
      toread = toread * sector_size
      fin:seek("set", block_to_offset(d, sec:byte()))
      fout:write(fin:read(toread))
      -- Update remaining sector count
      if rc <= d.sectors_per_block then
        break
      end
      rc = rc - d.sectors_per_block
    end
  else
    for sec in map:gmatch("..") do
      -- Read sectors, write sectors
      local toread = math.min(rc, d.sectors_per_block)
      toread = toread * sector_size
      fin:seek("set", block_to_offset(d, sec:byte(1) + 256 * sec:byte(2)))
      fout:write(fin:read(toread))
      -- Update remaining sector count
      if rc <= d.sectors_per_block then
        break
      end
      rc = rc - d.sectors_per_block
    end
  end
  fout:close()
  fin:seek("set", saved)
  return
end

write_disk(example)
write_disk(example2)

read_disk {
  name = 'cpmL.dsk',
  prefix = 'unpack_large',
  block_size = 4096,
  large_disk = true,
}

read_disk {
  name = 'cpm.dsk',
  prefix = 'unpack',
  block_size = 1024,
  large_disk = false,
}

read_disk {
  name = 'sdcard.dsk',
  prefix = 'unpack_old',
  block_size = 1024,
  large_disk = false,
}

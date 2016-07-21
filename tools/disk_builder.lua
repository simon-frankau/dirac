-- Library for building disk images
--
-- The idea is that you define a disk image through a data structure
-- in a Lua source file (generated with helpers from this file), and
-- then run the generation tool to create the disk image.

example = {
  name = "out/test.dsk",
  files = {
    { file = "out/loader.s", raw_offset = 0 },
    { file = "out/cpm22.s",  raw_offset = 512 }
  }
}

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

  for _, f in ipairs(d.files) do
    print(f.file)
    if f.raw_offset ~= nil then
      fout:seek("set", f.raw_offset)
      local fin = assert(io.open(f.file, "rb"))
      fout:write(fin:read("*all"))
      fin:close()
    else
      assert(false, "NYI: Non-raw disks")
    end
  end

  fout:close()
end

-- Set variables we will need
function configure_disk(d)
  local function set_if_nil(k, v)
    if d[k] == nil then
      d[k] = v
    end
  end

  local sector_size = 128
  local dir_entry_size = 32

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
end

-- Actually write out the populated disk image.
function empty_disk(d)
  local fout = assert(io.open(d.name, "wb"))
  local empty_block = string.char(0xE5):rep(d.block_size * d.total_blocks)
  fout:write(empty_block)
  return fout
end

write_disk(example)
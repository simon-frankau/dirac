# SD card breakout board schematics

## What's this?

These are my reverse-engineered schematics for the SD card breakout
board I'm using. Why? While I'm not exactly an expert on SD card
breakout boards, I wouldn't be surprised if they're not all identical,
and the interpretation of the main board schematics (in the directory
above) rather relies on knowing how the breakout board is wired up and
how it connects to the actual SD card.

# So, what's the issue with the board?

While it has a 5V -> 3.3V regulator, it doesn't do any level
conversion on the signal lines, and SD cards aren't 5V tolerant. I
need to do some conversion on the Dirac side.

## And so?

I've added level conversion hardware to the main Dirac schematic to
handle this. The README.md in the directory above explains.

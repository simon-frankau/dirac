Dirac's Hardware
================

[Schematics](./z80-schematics.pdf)

The schematics in this directory are in Kicad format. I previously
used Eagle, but it seems a good idea to support Open Source. I'm
clearly still learning it, so please forgive the worst
blunders. Feedback is appreciated.

Dirac's implemented using stripboard and a shedload of wires. You've
seen those neat stripboard projects? This is not one of
them. Super-tangled. This explains why you won't find any PCB designs.

Implementation is pretty straightforward, as I've implemented it a
feature at a time. An oscilloscope has been a life-saver, and I've
stuck pin-out labels on top of the chips, which has made working out
what's going on much easier.

Miscellaneous notes
-------------------

* NMI is basically unusable. It's not debounced, so by the time it's
  finished bouncing, the CPU's stack can be all over the place. The
  Spectrum had unusable NMI, so I feel I'm in good company. ;)

* The banking implementation is a bit funky, using as it does the
  74LS289. This is a chip obscure enough they don't even seem to have
  a CMOS version of. It's a small RAM, suitable for holding a banking
  map, but the outputs are inverting, meaning the physical address we
  think we're writing is actually the opposite of what we're really
  writing. We have to rearrange the EEPROM contents at the bank level
  when we write it. We also have to be careful with the TTL/CMOS
  levels between the chips. Fortunately, the big chips are
  TTL-tolerant, and I've used 74HCT for the others that are driven by
  the '289.

* We have a flip-flop to enable banking as the contents are in an
  unknown state at power on. All pages are mapped to bank 0 (physical
  page 0xFF) at start-up, and banking is enabled by the first write
  (and disabled on reset).

* Banking configuration can also be read back, which seemed a nice
  idea if you want to save and restore the current state, but does
  seem overkill really for such a simple design.

* Address decoding is such that you can page in RAM so that writes are
  disabled. Useful for faking ROM.

* There's a bog-standard Z80 CTC and SIO set-up. TO[01] are used to
  clock the SIO, and TO2 and TO3 are chained so that you can get a
  clock suited to a clock interrupt. The SIO output is TTL, so you can
  feed it into a USB serial adapter, or a level converter for
  traditional RS232. There are two ports, so in my implementation I
  have one of each.

* An SD card interface is implemented using the parallel ports.

Memory map
----------

The memory is divided into 4k (12-bit addressable) pages. The top
4-bits of Z80 "virtual" addresses are then mapped into "physical"
addresses in a 20-bit address space. That is, there's a 4-bit-to-8-bit
look-up.

Physical addressing is as follows:

$80000 - $9FFFF RAM, mapped read-only
$C0000 - $DFFFF RAM, mapped read-write

$00000 - $07FFF EEPROM

Yep, we only have 160KB of actual storage mapped into the 1MB address
space.

To perform virtual address mapping, so that address virtual address
$Xabc is mapped to $YZabc, you should "out" $YZ to I/O port $0X. You
can "in" from the same I/O port to get the current mapping.

Initially, banking is disabled, and all slots are mapped to $00xxx,
the bottom of the EEPROM. As soon as you write anything, banking is
enabled, and you will get random contents for the other banking slots.
So, your best bet is to initialise the bottom slot to $00xxx while
you're running code in it, and then initialise the other slots.

### Writing an EEPROM

The address lines that get passed through the banking hardware get
inverted before they actually reach the EEPROM, so you should write
your EEPROMs to cope with A12-A14 being inverted.

Parallel I/O ports and SD card
------------------------------

We have 8 bits of input and output available as a parallel port, at
$30. The bottom 3 bits of each port are used by the SD card SPI
interface:

### Out

$01 - Data
$02 - Clock
$04 - Select (active low)

### In

$01 - Data (inverted)
$02 - Card detected (active low)
$04 - Write protected (active low)

### Interface circuitry

The circuitry might look a little odd, so I'll explain. The SD card
uses 3.3V, and Dirac uses 5V, so we need some conversion. The SD card
has 100K pull-ups, and we use 10K resistors to convert, so we rather
take precedence.

In the outward direction, we need to bring the voltage down, so we use
voltage dividers. The ratio is 1:1, so the voltage is split in half.
2.5V when running off USB might seem a little low, but it should be
logic high for 3.3V logic, and won't go too high if Dirac is run off
e.g. 4x 1.5V AA batteries (giving 3V out, after division).

On the incoming direction, we just provide 5V pull-ups for card
detection and write protection lines (those being implemented as
switches pulling to ground on the SD card socket). The actual data
line is handled differently. 2.5V is TTL high, but not 5V CMOS high.
The input buffer is not HCT (I didn't look far enough ahead in Dirac's
design for that), but the inverter is. So, we pass it through the
inverter to buffer the level. Sadly this inverts the data line, but
that's easy enough to fix in software.

I/O map
-------

The upper nybble of the I/O port number denotes the I/O subsytem, the
lower nybble for addresses within the subsystem. The ports are:

$0X - Banking (see description above)
$1X - CTC
$2X - SIO
$3X - Parallel I/O ports

(And the rest are unassigned right now.)

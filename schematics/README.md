Dirac's Hardware
================

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
  traditional RS232.

* The SD interface has yet to be implemented.

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

I/O map
-------

I haven't got around to wiring up the parallel I/O ports (which I plan
to use to interface SD cards, amongst other things). The upper nybble
of the I/O port number denotes the I/O subsytem, the lower nybble for
addresses within the subsystem. The ports are:

$0X - Banking (see description above)
$1X - CTC
$2X - SIO

(And the rest are unassigned right now.)

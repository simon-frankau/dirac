Dirac: The simplest single-board computer I can face building
=============================================================

Dirac is a simple single-board Z80-based retrocomputer. It's the
simplest one I can face building. I wanted to produce something that's
a bit nicer than a pure minimal computer, so it has:

 * Serial I/O
 * A counter/timer to provide the clock for serial I/O and also allow
   regular timer interrupts
 * Mass storage via SD card
 * Banked RAM

The banked RAM is a bit excessive, but it always seemed a bit magical
when I was small, and a 64KB address space is less than I really
like.

What's the aim?
---------------

The aim is to get CP/M running, with associated programs, with a
probably intermediate step of BASIC. The design is intended to be
retro where convenient. So, it has separate DIP chips for Z80, RAM,
EEPROM, CTC, SIO, and 74-series logic for the glue. I don't use a CPLD
let alone an FPGA or high-power modern microcontroller to cheat.

However, the non-volatile storage is EEPROM rather than EPROM, and I'm
just using a great big SRAM, rather than bothering with the pain of
DRAM. Serial I/O uses a proper Z80 SIO, but one ports connects to a
TTL serial to USB dongle, rather than RS-232 proper (the second port
does real RS232). After a false start, I use an oscillator package,
rather than a raw crystal. Mass storage is an SD card, via a break-out
board. I see little reason to cause myself a lot of pain of using a
more difficult and less available form of storage!

(Having said that, recreating old-school floppy drive control sounds
like a fun project in itself...)

Why's it called Dirac?
----------------------

Projects need names. "Z80-based single board computer" just isn't a
snappy name, and doesn't distinguishing it from any other.

I grew up on a ZX Spectrum. It had colour graphics. This machine has
no graphics at all. It has serial I/O, and that's basically
it. Instead of a spectrum of I/O, it's got a Dirac delta function.

(Random fact: Dirac was a fellow of my old College, and his gown still
hangs in the Master's Lodge. I believe it's chained in place, pesky
undergrads.)

Why's it taken so long?
-----------------------

(I bought my first pile of components in early 2010.)

Children. They're lovely, but they don't mix well with soldering irons!

What's here?
------------

* **[schematics](./schematics/README.md)** covers the hardware
* **[src](./src)** contains the assembly source to program it with
* **[tools](./tools)** contains the tools to do the required
    translations to make workable images

What's the current state?
-------------------------

I tried creating a simple loader. It allows you to encode your
binaries as hex, load them and execute them. With a recent fix, this
is now working reasonably reliably. I can plug the thing in to USB,
it'll power itself from the USB port, and I can talk to the monitor at
4800 8-N-1.

I have code to use the SD card interface in read-only mode, and have a
basic CP/M port running.

It will run Infocom's Hitchhiker's Guide To The Galaxy.

Where did the CP/M parts come from?
-----------------------------------

src/cpm22.asm is a lightly-modified copy of CPM22.Z80, extracted from
http://www.cpm.z80.de/download/cpm2-asm.zip

(I had disassembled a working CP/M image myself, but this comes with
comments and produces the same results so... why not?)

I previously used images/appleiicpm.dsk, which is taken from
http://schorn.ch/cpm/zip/cpm2.zip, as a relatively arbitrary
easy-to-reverse-engineer disk image. I've switched to building my own
disk images.

What do I need?
---------------

* **Kicad** for the schematics
* **zasm** (http://sourceforge.net/projects/zasm/ /
    http://k1.spdns.de/Develop/Projects/zasm/) for the assembly
* **lua** to run the tools

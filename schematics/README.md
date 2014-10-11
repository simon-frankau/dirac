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
  when we write it.

* We have a flip-flop to enable banking as the contents are in an
  unknown state at power on. All pages are mapped to bank 0 (physical
  page 0xFF) at start-up, and banking is enabled by the first write
  (and disabled on reset).

* Banking configuration can also be read back, which seemed a nice
  idea if you want to save and restore the current state, but does
  seem overkill really for such a simple design.

* Address decoding is such that you can page in RAM so that writes are
  disabled. Useful for faking ROM.

* TODO: Discuss CTC and SIO, implement SD interface

Memory map
----------

TODO

I/O map
-------

TODO

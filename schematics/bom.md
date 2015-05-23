Bill of materials
=================

NB: The part numbers on the schematic are often not *quite* right -
I'm using what's available in the parts library that is
pin-compatible. The actual choice of components is detailed below.

ICs
---

* U1 - Z80 CPU
* U2 - 628128 SRAM
* U3 - 28C256 EEPROM (Use a ZIF socket)
* U4,5 - 2x 74289 16x4 inverting RAM
* U6 - 74138 3-to-8 demux
* U7 - 74540 octal inverter with FIXME
* U8 - 7400 quad NAND
* U9 - 7432 quad OR
* U10 - Z80 CTC
* U11 - Z80 SIO/0
* U12 - 74574 octal FIXME
* U13 - 74541 octal FIXME

Resistors
---------

* R1-12 - 12x 10k

Capacitors
----------

* C1 -
* C2-15 - 13x FIXME (One per IC, plus reset-on-start)

Misc
----

* D1 - LED
* SW1,2 - Normally-open push button
* X1 - Clock package
* JP1 - 2 pin jumper
* P1 - 6 pin 0.1" female header

Bill of materials
=================

NB: The part numbers on the schematic are often not *quite* right -
I'm using what's available in the parts library that is
pin-compatible. The actual choice of components is detailed below.

ICs
---

* U1 - Z84C0010PEG CMOS CPU (Z80) 10MHZ, 84C00, DIP40
* U2 - AS6C1008-55PCN SRAM, 1MB, 2.7V-5.5V, 128KX8, PDIP32
* U3 - CAT28C256BL-12 EEPROM, 256K, 32KX8, 120NS, PDIP28 (Use a ZIF socket)
* U4,5 - 2x 74LS289 16x4 inverting RAM with open collector output, DIP16
* U6 - 74HC138N 3-to-8 demux, DIP16
* U7 - 74HCT540N inverting octal buffer with tri-state outputs, DIP20
* U8 - 74HCT00N quad NAND, DIP14
* U9 - 74HCT32N quad OR, DIP14
* U10 - Z84C3006PEG CTC (Z80) 6MHZ, 84C30, DIP28
* U11 - Z84C4006PEG SIO/O (Z80) 6MHZ, 84C40, DIP40
* U12 - 74HC574E, oct D-type FF, DIP20
* U13 - 74HC541N, octal buffer with tri-state outputs, DIP20

Resistors
---------

* R1-8 - 10k resistor network
* R9-12 - 4x 10k, 0.25W 5% resistors

Capacitors
----------

* C1 - 10uF ceramic capacitor
* C2-15 - 13x 0.1uF ceramic capacitors (One per IC, plus reset-on-start)

Misc
----

* D1 - 5mm red LED
* SW1,2 - Normally-open push button
* X1 - Clock package, 2MHz
* JP1 - 2 pin 0.1" header and jumper
* P1 - 6 pin 0.1" female header

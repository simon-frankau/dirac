; Basic test program to exercise my simple Z80-based computer.
;
; We flash some LEDs, and then test banking, memory, CTC and SIO.
; There's also support for testing NMIs.

; Banking    is at port 0x00.
; CTC        is at port 0x10.
; SIO        is at port 0x20.
; LED output is at port 0x70.

; Banked memory map:
; 0x00000 - 0x07FFF - ROM (top 4 bits inverted when programming the EEPROM)
; 0x80000 - 0x9FFFF - RAM - Read-only
; 0xC0000 - 0xDFFFF - RAM - Read-write

#target     rom

; State for interrupts...
pattern:    equ $f000

; Reset vector
#code       RESET,0,$4000
            jp top

; Counter channel 3 interrupt vector
            defs $40 - $
            defw fail
            defw fail
            defw fail
            defw isr

; NMI vector
            defs $66 - $
            jp nmi

; Now the real stuff

; Initial wipe across, no hardware enabled

top:        di ; Could have come here without reset, for whatever reason.
            ld a,$1
            out ($70),a

            ld de,$4000
l1:         dec de
            ld a, d
            or e
            jp nz, l1

            ld a,$2
            out ($70),a

            ld de,$4000
l2:         dec de
            ld a, d
            or e
            jp nz, l2

            ld a,$4
            out ($70),a

            ld de,$4000
l3:         dec de
            ld a, d
            or e
            jp nz, l3

            ld a,$8
            out ($70),a

            ld de,$4000
l4:         dec de
            ld a, d
            or e
            jp nz, l4

            ld a,$10
            out ($70),a

            ld de,$4000
l5:         dec de
            ld a, d
            or e
            jp nz, l5

            ld a,$20
            out ($70),a

            ld de,$4000
l6:         dec de
            ld a, d
            or e
            jp nz, l6

            ld a,$40
            out ($70),a

            ld de,$4000
l7:         dec de
            ld a, d
            or e
            jp nz, l7

            ld a,$80
            out ($70),a

; Enable banking

            ld bc, $0000
            ld a, $00 ; Inverted, selects the default $FF page
            out (bc), a

; And do a few more LEDs

            ld de,$4000
l8:         dec de
            ld a, d
            or e
            jp nz, l8

            ld a,$40
            out ($70),a

            ld de,$4000
l9:         dec de
            ld a, d
            or e
            jp nz, l9

            ld a,$20
            out ($70),a

            ld de,$4000
l10:        dec de
            ld a, d
            or e
            jp nz, l10

            ld a,$10
            out ($70),a

            ld de,$4000
l11:        dec de
            ld a, d
            or e
            jp nz, l11

            ld a,$8
            out ($70),a

            ld de,$4000
l12:        dec de
            ld a, d
            or e
            jp nz, l12

            ld a,$4
            out ($70),a

            ld de,$4000
l13:        dec de
            ld a, d
            or e
            jp nz, l13

            ld a,$2
            out ($70),a

            ld de,$4000
l14:        dec de
            ld a, d
            or e
            jp nz, l14

; Map in some RAM, set SP, and do a pattern with using subroutines

            ld bc, $f000
            ld a, $c0 ; Inverted, selects a RAM page, RW
            out (bc), a

            ld sp, $0000

loop:       ld a, $03
            call disp
            ld a, $06
            call disp
            ld a, $0c
            call disp
            ld a, $18
            call disp
            ld a, $30
            call disp
            ld a, $60
            call disp
            ld a, $c0
            call disp
            ld a, $81
            call disp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Right, the basics work: ROM mapped in page 0x0, RAM mapped in page 0xf
;
; Now, check the mapping slots we can:
; For each value, write different values to all available slots,
; then read them back.

; For each number:
            ld d, 0
blah0:      ld c, 0      ; Lower part of port.

; Write a different number to each slot
            ld l, d      ; Base value to write
            ld b, $e0    ; Last page to write
blah1:      out (bc), l  ; Write page thing
            inc l        ; Write next value to next page
            ld a, b
            sub a, $10   ; Next page
            ld b, a
            jp nz, blah1 ; Don't write page zero
; Read back numbers and check it's ok
            ld l, d      ; Thing to compare against
            ld b, $e0    ; Last page to write
blah2:      in a, (c)    ; Read page thing (NB: Really 'in a, (bc)')
            cp l
            jp nz, fail
            inc l        ; Read next value from next page
            ld a, b
            sub a, $10   ; Next page
            ld b, a
            jp nz, blah2 ; Don't read page zero

            dec d
            jp nz, blah0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Slots all work. On to a RAM test.
;
; Let's map a single slot, and use it to write over all of RAM, then
; read it all back.

; NB: This corrupts stack. Fortunately, not actually using it...

            ld a, 1          ; Display status
            out ($70),a

            ld l, 23         ; Magic modulo.
; Map physical pages C0-DF into slot 1.
            ld h, $c0
ramwouter:  ld bc, $1000
            out (bc), h
; Loop from $1000 to $2000, scribbling values in as we go.
            ld de,$1000
ramwinner:  ld a, l
            ld (de), a
            dec l
            jp nz, rwiskip
            ld l,23
rwiskip:    inc de
            ld a, d
            sub $20
            or e
            jp nz, ramwinner
; Written this page, go to next.
            inc h
            ld a, h
            cp a, $e0
            jp nz, ramwouter

; Having written, read.
            ld a, 3          ; Update status
            out ($70),a

            ld l, 23
            ld h, $c0
ramrouter:  ld bc, $1000
            out (bc), h
; Loop from $1000 to $2000, reading values as we go.
            ld de,$1000
ramrinner:  ld a, (de)
            cp a, l
            jp nz, fail
            dec l
            jp nz, rriskip
            ld l,23
rriskip:    inc de
            ld a, d
            sub $20
            or e
            jp nz, ramrinner
; Written this page, go to next.
            inc h
            ld a, h
            cp a, $e0
            jp nz, ramrouter

; Now, read the read-only mapping, throwing in attempts to write.
            ld a, 7          ; Update status
            out ($70),a

            ld l, 23
; Physical slots 80-9f, this time.
            ld h, $80
ramrwouter: ld bc, $1000
            out (bc), h
; Loop from $1000 to $2000, trying to write, then reading values as we go.
            ld de,$1000
ramrwinner: xor a, a
            ld (de), a
            ld a, (de)
            cp a, l
            jp nz, fail
            dec l
            jp nz, rrwiskip
            ld l,23
rrwiskip:   inc de
            ld a, d
            sub $20
            or e
            jp nz, ramrwinner
; Written this page, go to next.
            inc h
            ld a, h
            cp a, $a0
            jp nz, ramrwouter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Now, a similar test for the ROM
            ld a, $f         ; Update status
            out ($70),a

            ld l, 17
; Physical slots 01-07
            ld h, $01
romouter:   ld bc, $1000
            out (bc), h
; Loop from $1000 to $2000, trying to write, then reading values as we go.
            ld de,$1000
rominner:   xor a, a
            ld (de), a
            ld a, (de)
            cp a, l
            jp nz, fail
            dec l
            jp nz, romiskip
            ld l,17
romiskip:   inc de
            ld a, d
            sub $20
            or e
            jp nz, rominner
; Written this page, go to next.
            inc h
            ld a, h
            cp a, $08
            jp nz, romouter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CTC test

            ; Set interrupt vector to 0x40, just after the restarts.
            ld a, $40
            out ($10), a

            ; Clock channel 0 at 9600 bps:
            ; Disable interrupt, timer mode, prescale 16, falling edge
            ; Auto, time constant, reset, control word
            ld a, $07
            out ($10), a
            ld a, 13 ; 2M / (16 * 9600)
            out ($10), a

            ; Clock channel 1 at 2400 bps:
            ld a, $07
            out ($11), a
            ld a, 52 ; 2M / (16 * 2400)
            out ($11), a

            ; Clock channel 2 at 1 kHz
            ld a, $07
            out ($12), a
            ld a, 125 ; 2M / (16 * 1000)
            out ($12), a

            ; Clock channel 3 at 10 Hz
            ; Enable interrupt, counter, prescale 16, falling edge
            ; Auto, time constant, reset, control word
            ld a, $c7
            out ($13), a
            ld a, 100
            out ($13), a

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SIO test

            ; We will be working with channel A, control port
            ld a, $18 ; Channel reset
            out ($21), a

            ld a, $04 ; WR4
            out ($21), a
            ld a, $04 ; x1 rate, 1 stop bit, no parity
            out ($21), a

            ld a, $01 ; WR1
            out ($21), a
            ld a, $00 ; Disable transmit/receive interrupts
            out ($21), a

            ; WR2 has the interrupt vector - NB channel 2-specific stuff?

            ld a, $05 ; WR5
            out ($21), a
            ld a, $ea ; Enable transmission, RTS, DTR, 8 bits
            out ($21), a

            ld a, $03 ; WR3
            out ($21), a
            ld a, $c1 ; Enable receiving, 8 bits
            out ($21), a
            ; What about auto-enable - send on CTS, receive on DC?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interrupt initialisation
            xor a
            ld (pattern), a ; Initialise the counter
            ld i, a         ; Interrupt vectors in first page.
            im 2            ; Vectored interrupt
            ei              ; Off we go!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End and general subroutines

success:    ; Upper case/lower case switch
            call sio_rd
            ld b, $20
            xor b
            call sio_wr
            jp success

fail:       ld a, $aa
            call disp
            jp fail

disp:       out ($70),a

            ld de,$4000
disp_loop:  dec de
            ld a, d
            or e
            jp nz, disp_loop
            ret

; Write serial
sio_wr:     ld b, a
            ; Wait until transmit buffer has space
sio_wr_lp:  in a, ($21)
            and $04
            jp z, sio_wr_lp
            ; Stick the data in the data register
            ld a, b
            out ($20), a
            ret

; Read serial
sio_rd:     ; Wait until there's a character to receive
            in a, ($21)
            and $01
            jp z, sio_rd
            ; Read the data from the data register
            in a, ($20)
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NMI test code

; We try to preserve registers, and display the SP lower contents,
; so that we can see if we're triggering nested NMIs or whatever.

nmi:        ex af, af'
            exx

            ; Must be a better way of reading SP, but my z80 asm is poor...
            ld hl, 0
            add hl, sp

            ld a, l
            out ($70), a

            ld de,$0000
nmi_loop:   dec de
            ld a, d
            or e
            jp nz, nmi_loop

            exx
            ex af, af'
            retn

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Counter timer test code
;

isr:        push af
            ld a, (pattern)
            inc a
            ld (pattern), a
            out ($70), a
            pop af
            ei ; Must re-enable!
            reti

#end

; Serial I/O program loader/monitor
;
; We initialise the system, mapping RAM into place, and then execute
; very simple (and not human-friendly) commands over serial. The real
; point of this is to provide a mechanism to allow programs to be
; loaded without reprogramming the EEPROM, speeding up the development
; cycle.

; Banking    is at port 0x00.
; CTC        is at port 0x10.
; SIO        is at port 0x20.
; LED output is at port 0x70.

; Banked memory map:
; 0x00000 - 0x07FFF - ROM (top 4 bits inverted when programming the EEPROM)
; 0x80000 - 0x9FFFF - RAM - Read-only
; 0xC0000 - 0xDFFFF - RAM - Read-write

; Calling convention:
; 8-bit and 16-bit parameters passed in A and BC respectively.
; BC, DE and HL preserved, unless BC is used as a parameter, when's it's not.

#target     rom

; Reset vector
#code       RESET,0,$4000
            jp top

; Interrupt vectors - shouldn't be using them.
            defs $40 - $
            defw fail
            defw fail
            defw fail
            defw fail

; NMI vector
            defs $66 - $
            jp fail

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Initialise hardware

top:        ; Could have come here without reset, for whatever reason.
            di

            ; Wait for reset to complete
            ld de,$0000
top_loop:   dec de
            ld a, d
            or e
            jr nz, top_loop

            ; Enable banking for the ROM page.
            ld bc, $0000
            ld a, $00 ; Inverted, selects the default $FF page
            out (bc), a
            ; Map in some RAM, set SP
            ld bc, $f000
            ld a, $c0 ; Inverted, selects a RAM page, RW
            out (bc), a
            ld sp, $0000

; Should use something like the following to map all slots:
;            ld l, d      ; Base value to write
;            ld b, $e0    ; Last page to write
;blah1:      out (bc), l  ; Write page thing
;            inc l        ; Write next value to next page
;            ld a, b
;            sub a, $10   ; Next page
;            ld b, a
;            jr nz, blah1 ; Don't write page zero

            ld a, 1
            out ($70), a

            ; Set up CTC to provide the serial clock.

            ; Set interrupt vector to 0x40, just after the restarts.
            ld a, $40
            out ($10), a

            ; Clock channel 0 at 16 * 4800 bps:
            ; Disable interrupt, counter mode, rising edge
            ; Auto, time constant, reset, control word
            ; The SIO uses 16x clock rate to properly decode async serial.
            ld a, $57
            out ($10), a
            ld a, 13 ; 1M / (16 * 4800)
            out ($10), a

            ld a, 2
            out ($70), a

            ; Set up SIO

            ; We will be working with channel A, control port
            ld a, $18 ; Channel reset
            out ($21), a

            ld a, $04 ; WR4
            out ($21), a
            ld a, $44 ; x16 rate, 1 stop bit, no parity
            out ($21), a

            ld a, $01 ; WR1
            out ($21), a
            ld a, $00 ; Disable transmit/receive interrupts
            out ($21), a

            ld a, $05 ; WR5
            out ($21), a
            ld a, $ea ; Enable transmission, RTS, DTR, 8 bits
            out ($21), a

            ld a, $03 ; WR3
            out ($21), a
            ld a, $c1 ; Enable receiving, 8 bits
            out ($21), a

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Main monitor implementation

            ld a, 3
            out ($70), a

main:       ld bc, str_hi
            call sio_wr_str
mainloop:   ld bc, str_prompt
            call sio_wr_str
            call sio_rd_ws
            and ~$20 ; To upper case
            cp 'H'
            jp z, cmd_help
            cp 'J'
            jp z, cmd_jmp
            cp 'W'
            jp z, cmd_write
            cp 'R'
            jp z, cmd_read
            cp 'M'
            jp z, cmd_map
            cp 'Q'
            jp z, cmd_querymap
            cp 'X'
            jp z, cmd_restart
            jp error

cmd_help:   ld bc, str_help
            call sio_wr_str
            jp mainloop

cmd_jmp:    call sio_rd_16
            ld hl, bc
            ld a, $0a
            call sio_wr
            ; Put a return address on the stack, faking a 'call'.
            ld bc, ok
            push bc
            ; And perform the jp...
            jp (hl)

            ; Destination, count, then data.
cmd_write:  call sio_rd_16
            ld de, bc
            call sio_rd_16
wr_loop:    call sio_rd_8
            ld (de), a
            inc de
            dec bc
            ld a, b
            or c
            jr nz, wr_loop
            jp ok

            ; Destination, count, then data.
cmd_read:   call sio_rd_16
            ld hl, bc
            call sio_rd_16
            ld a, $0a
            call sio_wr
rd_loop:    ld a, (hl)
            call sio_wr_8
            inc hl
            dec bc
            ; Follow with space or newline, depending, to get nice wrapping
            ld a, l
            and $0f
            ld a, ' '
            jr nz, do_space
            ld a, $0a
do_space:   call sio_wr
            ld a, b
            or c
            jr nz, rd_loop
            jp ok

            ; Page, then physical address
cmd_map:    call sio_rd_4
            add a, a
            add a, a
            add a, a
            add a, a
            ld b, a
            ld c, 0
            call sio_rd_8
            ; BC contains virtual address, with page in top nibble
            ; A contains physical page.
            out (bc), a
            jp ok

            ; Dump the current banking map
cmd_querymap:
            ld a, $0a
            call sio_wr
            ld bc, $f000
qm_loop:    call sio_wr_16
            push bc
            ld bc, str_arrow
            call sio_wr_str
            pop bc
            in a, (c) ; Really, in a, (bc).
            call sio_wr_8
            push bc
            ld bc, str_zeros
            call sio_wr_str
            pop bc
            ld a, b
            sub $10
            ld b, a
            jr nc, qm_loop
            jp ok

            ; Physical address to map into virtual page 0 is parameter.
cmd_restart:call sio_rd_8
            ld h, a
            ; Fill in destination address with "out (bc), a".
            ld a, $ed
            ld ($fffe), a
            ld a, $79
            ld ($ffff), a
            ; Now set up BC and A appropriately...
            ld bc, $0000
            ld a, h
            ; BC has virtual address of bottom page
            ; A contains physical page
            ; And go!
            di
            jp $fffe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helper subroutines

; Shouldn't happen cases - unexpected interrupts, etc.
fail:       ld a, $aa
            call disp
            ld a, $55
            call disp
            jr fail

; Error cases where we abort to the top-level loop (normally parse errors)
error:      ld bc, str_eh
            call sio_wr_str
            ld sp,$0000
            jp mainloop

ok:         ld bc, str_ok
            call sio_wr_str
            jp mainloop

; Display something on the debug port
disp:       push de
            out ($70),a
            ld de,$4000
disp_loop:  dec de
            ld a, d
            or e
            jr nz, disp_loop
            pop de
            ret

; Write serial
sio_wr:     push af
            ld a, $80
            out ($70), a
            ; Wait until transmit buffer has space
sio_wr_lp:  in a, ($21)
            and $04
            jr z, sio_wr_lp
            ; Stick the data in the data register
            pop af
            out ($20), a
            ld a, $40
            out ($70), a
            ret

; Read serial
sio_rd:     ; Wait until there's a character to receive
            ld a, $20
            out ($70), a
            in a, ($21)
            and $01
            jr z, sio_rd
            ld a, $10
            out ($70), a
            ; Read the data from the data register
            in a, ($20)
            ret

; Read character with echo
sio_rd_echo:
            call sio_rd
            push af
            call sio_wr
            pop af
            ret

; Read character with echo, ignore whitespace
sio_rd_ws:
            call sio_rd_echo
            cp ' '
            jr z, sio_rd_ws
            cp $09
            jr z, sio_rd_ws
            cp $0d
            jr z, sio_rd_ws
            cp $0a
            ret nz
            ; Print a character to identify continuation line
            ld a, '\'
            call sio_wr
            jr sio_rd_ws

; Write a string
sio_wr_str: ld a, (bc)
            cp 0
            ret z
            call sio_wr
            inc bc
            jr sio_wr_str

; Read a 16-bit hex value
sio_rd_16:  call sio_rd_8
            push af
            call sio_rd_8
            pop bc
            ld c, a
            ret

; Read an 8-bit hex value
sio_rd_8:   push bc
            call sio_rd_4
            add a
            add a
            add a
            add a
            ld b, a
            call sio_rd_4
            add b
            pop bc
            ret

; Read a single hex digit
sio_rd_4:   call sio_rd_ws
            sub '0'
            jp c, error
            cp 10
            ret c
            add '0'
            and ~$20 ; To upper case
            sub 'A'
            jp c, error
            cp 6
            jp nc, error
            add 10
            ret

; Write a 16-bit value
sio_wr_16:  ld a, b
            call sio_wr_8
            ld a, c
            call sio_wr_8
            ret

; Write a byte.
sio_wr_8:   push af
            srl a
            srl a
            srl a
            srl a
            call sio_wr_4
            pop af
            and $0f
            call sio_wr_4
            ret

; Write a single hex digit
sio_wr_4:   cp 10
            jr c, wr_num
            add 'A' - 10
            jp sio_wr
wr_num:     add '0'
            jp sio_wr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Data

str_hi:     defb "*** WELCOME TO THE DIRAC LOADER ***", $0a
            defb "Type 'H' for help", $0a, $00

str_help:
  defb $0a
  defb "H           This help text", $0a
  defb "J xxxx      Jump to xxxx", $0a
  defb "W xxxx yyyy Write yyyy bytes of data, starting at xxxx", $0a
  defb "R xxxx yyyy Read yyyy bytes of data, starting at xxxx", $0a
  defb "M v pp      Map physical page pp to virtual page v", $0a
  defb "Q           Print the current banking memory map", $0a
  defb "X pp        Map physical page pp to virtual page 0 and restart", $0a
  defb $00

str_prompt: defb "> ", $00

str_ok:     defb $0a, "OK",  $0a, $00
str_eh:     defb $0a, "Eh?", $0a, $00
str_nyi:    defb $0a, "NYI", $0a, $00

str_arrow:  defb " -> ", $00
str_zeros:  defb "000", $0a, $00

#end

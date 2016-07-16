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
; SD card    is at port 0x30.
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
            ; Map in RAM, set SP
            ; BC contains virtual address, with page in top nibble
            ; A contains physical page.
            ld bc, $f000                ; Last page to write
            ld l, $cf                   ; Base value to write
map_loop:   out (bc), l                 ; Write page thing
            dec l                       ; Write next value to next page
            ld a, b
            sub a, $10                  ; Next page
            ld b, a
            jr nz, map_loop             ; Don't write page zero

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
            cp 'L'
            jp z, cmd_load
            cp 'B'
            jp z, cmd_boot
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

            ; Destination, and count.
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

            ; Destination, source offset
            ; TODO: Error handling.
cmd_load:   call sio_rd_16
            push bc
            call sio_rd_16
            ld de,bc
            call sio_rd_16
            ld hl,bc
            call cmd17
            pop de              ; Restore destination into DE.
            ; Exit if failed...
            cp $00
            jp nz,error
            call recv_blk
            jp ok

            ; TODO: Error handling.
cmd_boot:   ; Load first sector.
            ld de,0
            ld hl,0
            call cmd17
            ; Exit if failed...
            cp $00
            jp nz,error
            ld de,$1000         ; Set destination for block load.
            call recv_blk
            jp $1000            ; And off we go!

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Serial routines

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
; SD card routines

            ;; Send a command, with zero'd args
send_zcmd:
            ld de,0
            ld hl,0
            ;; Fall through

            ;; Send a command, command in C, args in DE, HL.
send_cmd:   ld b, 1             ; Set CRC to 1.
            ;; Fall through

            ;; Send a command, CRC in B.
send_cmd2:  push bc
            ;; Wait until receiver's ready.
wait_rdy:   call recv_byte
            cp $ff
            jp nz,wait_rdy
            pop bc
            ;; Send command.
            call send_byte
            ld c,d
            call send_byte
            ld c,e
            call send_byte
            ld c,h
            call send_byte
            ld c,l
            call send_byte
            ld c,b
            call send_byte
            call find_resp
            ret

            ;; Receive the extra 4 response bytes.
            ;; TODO: Currently, we just bin them.
recv_long:
            push af
            call recv_byte
            call recv_byte
            call recv_byte
            call recv_byte
            pop af
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Low-level bit-twiddling SD card I/O
;;

            ;; Send the initial sync to the card
send_sync:
            ;; At least 74 cycles with DI and CS high
            ld b,75
sync_loop:  ld a,$05            ; DI and CS set, clock low.
            out ($30),a
            xor a,$2            ; Flip clock bit.
            out ($30),a
            djnz sync_loop
            ret

            ;; Byte to send in C
            ;; Modifies A.
send_byte:  scf
            rl c
sb_loop:    ld a,0              ; CS low, clock low.
            rla
            out ($30),a
            xor a,$2            ; Flip clock bit.
            rl c
            out ($30),a         ; Doesn't affect NZ.
            jp nz,sb_loop
            ret

            ;; Search for the start of a response. This is a 0
            ;; bit from the SD card, which is inverted by the time
            ;; it hits our I/O port.
            ;;
            ;; TODO: Should arrive within 16 cycles. Time out, if needed.
find_resp:  ld a,$01            ; CS low, data high, -ive clk edge to shift.
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,$03            ; CS low, data high, +ive clk edge to latch.
            out ($30),a
            jp nc,find_resp     ; Loop if CD card sent 0.
            ;; Received a 1. Let's read the rest of the byte.
            ld c,$03
            jp rc_loop

            ;; Read a byte into A. Modifies C.
recv_byte:  ld c,$01
rc_loop:    ld a,$01            ; CS low, data high, -ive clk edge to shift.
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,$03            ; CS low, data high, +ive clk edge to latch.
            out ($30),a
            rl c                ; And carry flag rotated into C.
            jp nc,rc_loop
            ld a,c
            cpl                 ; Data is inverted when it hits us.
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SD card  initialisation routine

            ; Initialise SD card for use.
init_sd:    push bc
            push de
            push hl
            ; Send the initial sync
            call send_sync
            ; Send CMD0, with CRC
            ld bc,$9540
            ld de,0
            ld hl,0
            call send_cmd2
            cp $01
            jp nz,ret_sd
            ; Send CMD8, with CRC
            ld bc,$8748
            ld de,0
            ld hl,$01aa
            call send_cmd2
            call recv_long
            cp $01
            jp z,init_sdhc

            ; SDSC or MMC
            call acmd41
            cp $02
            jp c,init_sdv1      ; Jump if code <= 1 ?

            ; MMCv3. UNTESTED!
init_mmc:
            ; Send CMD1 until idle.
            ; TODO: Time out?
            ld c,$40 + 1        ; CMD1
            call send_zcmd
            cp $00
            jp nz, init_mmc
            call cmd16
            jp ret_sd

            ; My example card doesn't do this, so not supported right now.
init_sdhc:
            ld a, '?'
            call sio_wr
            jp ret_sd

init_sdv1:
            ; Call ACMD41 until idle.
            ; TODO: Time out?
            call acmd41
            cp $00
            jp nz,init_sdv1
            call cmd16
            ; Fall through

ret_sd:     pop hl
            pop de
            pop bc
            ret

acmd41:
            ; Send ACMD41, which is a CMD55 then CMD41.
            ld c,$40 + 55
            call send_zcmd
            cp $01
            ret nz
            ld c,$40 + 41
            jp send_zcmd        ; Tail call

cmd16:
            ; CMD16, with block size of 512
            ld c,$40 + 16
            ld de,0
            ld hl,512
            jp send_cmd         ; Tail call

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Data read helpers

cmd17:      ; Make sure SD card is initialised
            call init_sd
            ; Send CMD17 - Single block read
            ld c,$40 + 17       ; CMD17, address in DEHL.
            jp send_cmd         ; Tail call.

            ; Receive a 512-byte block into (DE)
recv_blk:
            ; Expect data token.
data_tok:   call recv_byte
            cp $ff
            jp z,data_tok
            cp $fe
            jp nz,error
            ; DE contains destination address.
            ; Read the sector's worth of data.
            call read256
            call read256
            ; Read the CRC.
            call recv_byte
            call recv_byte

            ; Read 256 bytes worth of data into DE.
read256:    ld b,$00
r256:       call recv_byte
            ld (de),a
            inc de
            djnz r256
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Data

str_hi:     defb "*** WELCOME TO THE DIRAC LOADER ***", $0a
            defb "Type 'H' for help", $0a, $00

str_help:
  defb $0a
  defb "H               This help text", $0a
  defb "J xxxx          Jump to xxxx", $0a
  defb "W xxxx yyyy     Write yyyy bytes of data, starting at xxxx", $0a
  defb "R xxxx yyyy     Read yyyy bytes of data, starting at xxxx", $0a
  defb "M v pp          Map physical page pp to virtual page v", $0a
  defb "Q               Print the current banking memory map", $0a
  defb "X pp            Map physical page pp to virtual page 0 and restart", $0a
  defb "L xxxx yyyyyyyy Load one sector into xxxx from disk offset yyyyyy", $0a
  defb "B               Boot from disk", $0a
  defb $00

str_prompt: defb "> ", $00

str_ok:     defb $0a, "OK",  $0a, $00
str_eh:     defb $0a, "Eh?", $0a, $00
str_nyi:    defb $0a, "NYI", $0a, $00

str_arrow:  defb " -> ", $00
str_zeros:  defb "000", $0a, $00

#end

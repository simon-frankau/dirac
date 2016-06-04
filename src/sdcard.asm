; Basic code to test SD card access with.

#target ROM

#code   ENTRY,0xF000

top:

            ;; Initialise SD card for use.
init_sd:
            ;; At least 74 cycles with DI and CS high
            ld b,10             ; 80 bits > 74 cycles
            ld d,$02            ; CS high - 4 >> 1
init_loop:  ld c,$FF            ; DI high for all bits
            call send_byte
            djnz init_loop
            ;; Send CMD0
            ld d,$00            ; CS low
            ld c,$40            ; CMD0
            call send_byte
            call zero_args
            ld c,$95            ; CRC
            call send_byte
            call get_resp
            ret

            ;; Write 4 0 bytes as arguments.
zero_args:  ld b,$04
za_loop:    ld c,$00
            call send_byte
            djnz za_loop
            ret

            ;; Byte to send in C, other bits of out reg >> 1 in D.
            ;; Modifies A.
send_byte:  scf
            rl c
sb_loop:    ld a,d
            rla
            out ($30),a
            xor a,$2            ; Flip clock bit.
            rl c
            out ($30),a         ; Doesn't affect NZ.
            jp nz,sb_loop
            ret

            ;; Read a byte into A. Output byte base comes from D.
            ;; Modifies E.
read_byte:  ld e,$01
rc_loop:    ld a,d
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,d
            res 1,a             ; Negative edge of clock cycle.
            out ($30),a
            rl e                ; And carry flag rotated into E.
            jp nc,rc_loop
            ld a,e
            ret

            ;; Get a response. Right now, just clocks, rather than
            ;; actually trying to read.
get_resp:   ld d,$03            ; CS low, data high, +ive clk edge to latch.
            ld b,10             ; Should receive a response within 16 cycles.
gr_loop:    call read_byte
            cpl
            call sio_wr_8
            ld a, $0a           ; Linefeed
            call sio_wr
            djnz gr_loop
            ret

; Write one character to initialised serial port
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

#end

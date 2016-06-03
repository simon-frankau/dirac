; Basic code to test SD card access with.

#target ROM

#code   ENTRY,0xF000


top:

            ;; Initialise SD card for use.
init_sd:
            ;; At least 74 cycles with DI and CS high
            ld b,10             ; 80 bits > 74 cycles
            ld d,$02            ; CS high
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

            ;; Get a response. Right now, just clocks, rather than
            ;; actually trying to read.
get_resp:
            ld b,3             ; Should receive a response within 16 cycles.
gr_loop:    ld c,$FF
            call send_byte
            djnz gr_loop
            ret

#end

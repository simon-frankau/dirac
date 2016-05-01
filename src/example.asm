; Example program that can be fed to the monitor to execute.
;
; This can be used for a proof-of-concept of loading code
; over the serial port, but so far this has mostly
; demonstrated to me how flakey the serial port connection is, and
; how you can't reliably transfer hex... although I've yet
; to work out if this is a software issue or a hardware issue...

#target     ROM

#code       ENTRY,0x0000

main:       ld bc, str_hi
            call sio_wr_str
            jr main

str_hi:     defb "This is a demo program for the loader to load", $0a
            defb "If you can see this, things are working", $0a, $00

; Write a string to serial port
sio_wr_str: ld a, (bc)
            cp 0
            ret z
            call sio_wr
            inc bc
            jr sio_wr_str

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

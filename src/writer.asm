;; Simple program to scribble data onto an SD card. Proof of concept.

#target ROM

#code   ENTRY,0x0100

main:
            ld de,$0000
            ld hl,$2000
            call write_block
            ld de,$0004
            ld hl,$0000
            call write_block
            ret

            ; Takes destination address in dehl
write_block:
            ; Send CMD24 - Write single block
            ld c,$40 + 24       ; CMD24
            call send_cmd
            ; Exit if failed...
            cp $00
            jp nz, fail
            ; Pause for a byte
            ld c,$ff
            call send_byte
            ; Write data packet.
            ld c,$fe
            call send_byte
            ld de, data
            call write256
            call write256
            ld c,$00
            call send_byte
            call send_byte
            ; Look for a data response
            call find_resp
            ; A & $f0 == $20 if all's well
            call sio_wr_8
            ; And wait for busy to complete
wbusy:      call recv_byte
            call sio_wr_8
            or a
            jp z,wbusy
            ld bc,done
            call sio_wr_str
            ret

write256:   ld b,$00
w256:       ld a,(de)
            ld c,a
            call send_byte
            inc de
            djnz w256
            ret

fail:       call sio_wr_8
            ld bc,fail1
            call sio_wr_str
            ret

done:       defb " - Apparently all done", $0a, $00

fail1:      defb " - Command-send failed", $0a, $00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command-sending routines

            ; Send a command, command in C, args in DE, HL.
send_cmd:   push bc
            ; Wait until receiver's ready.
wait_rdy:   call recv_byte
            cp $ff
            jp nz,wait_rdy
            pop bc
            ; Send command.
            call send_byte
            ld c,d
            call send_byte
            ld c,e
            call send_byte
            ld c,h
            call send_byte
            ld c,l
            call send_byte
            ld c,1
            call send_byte
            call find_resp
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Low-level bit-twiddling SD card I/O
;;

            ; Byte to send in C
            ; Modifies A.
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

            ; Search for the start of a response. This is a 0
            ; bit from the SD card, which is inverted by the time
            ; it hits our I/O port.
            ;
            ; TODO: Should arrive within 16 cycles. Time out, if needed.
find_resp:  ld a,$01            ; CS low, data high, -ive clk edge to shift.
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,$03            ; CS low, data high, +ive clk edge to latch.
            out ($30),a
            jp nc,find_resp     ; Loop if CD card sent 0.
            ; Received a 1. Let's read the rest of the byte.
            ld c,$03
            jp rc_loop

            ; Read a byte into A. Modifies C.
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
;; Serial port I/O
;;

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

; Write a string
sio_wr_str: ld a, (bc)
            cp 0
            ret z
            call sio_wr
            inc bc
            jr sio_wr_str

data:       defb 'This is a test write.', $0a, $00
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55
            defb $aa, $55, $aa, $55, $aa, $55, $aa, $55

#end

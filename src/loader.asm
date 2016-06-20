;; Bootstrap loader. Loads an image into RAM.
;;
;; Requires image to be in the first 64K and the SD card to not be set
;; up for sector addressing. Also needs the destination to not overlap
;; the loader!

#target ROM

source:     equ $0200           ; Source offset on disk.
dest:       equ $dc00           ; Destination address in memory.
start:      equ $f200           ; Entry point
len:        equ 6511            ; Data length in bytes.
len_blks:   equ (len+511)/512   ; Data length in blocks.

#code   ENTRY,0x1000

; TODO: Need M1CE up-front.

        ;; TODO: Spot failures, retry.
top:
        ;; Load the data
            ld b,len_blks
            ld de,dest
            ld hl,source
ld_loop:    call read_block
            inc h               ; DE already incremented...
            inc h               ; but move HL to next disk block.
            ld a, '.'
            call sio_wr
            djnz ld_loop
        ;; New line.
            ld a, 10
            call sio_wr
        ;; Make the lowest page of memory R/W RAM.
            LD bc,$0000
            LD a,$c0
            OUT (bc), a
            jp start

        ;; Disk offset in HL, memory location in DE.
        ;; Reads 512 bytes, increments DE.
read_block: push bc
            push hl
            push de
            ;; Send CMD17 - Single block read
            ld c,$40 + 17       ; CMD17
            ld de,$0000         ; All within first 64k. HL has lower address.
            call send_cmd
            pop de
            ;; Exit if failed...
            cp $00
            jr nz, rb_ret
            ;; Expect data token.
data_tok:   call recv_byte
            cp $ff
            jp z,data_tok
            cp $fe
            jr nz, rb_ret
            ;; DE contains destination address.
            ;; Read the sector's worth of data.
            call read256
            call read256
            ;; Read the CRC.
            call recv_byte
            call recv_byte
rb_ret:     pop hl
            pop bc
            ret

        ;; Read 256 bytes worth of data into DE.
read256:    ld b,$00
r256:       call recv_byte
            ld (de),a
            inc de
            djnz r256
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command-sending routines


        ;; Send a command, command in C, args in DE, HL.
send_cmd:   ;; Wait until receiver's ready.
wait_rdy:   call recv_byte
            cp $ff
            jp nz,wait_rdy
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
            ld c,1
            call send_byte
            call find_resp
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Low-level bit-twiddling SD card I/O
;;

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

#end

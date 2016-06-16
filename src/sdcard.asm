; Basic code to test SD card access with.

#target ROM

#code   ENTRY,0xF000

top:
            call init_sd

            ld a, 'Y'
            call sio_wr

            ;; Send CMD17 - Single block read
            ld c,$40 + 17       ; CMD17
            ld de,$0001
            ld hl,$d200
            call send_cmd
            cp $00
            ret nz

            ld b,$ff
x:          call get_resp2
            djnz x

            ret

            ;; Initialise SD card for use.
init_sd:
            ;; Send the initial sync
            call send_sync
            ;; Send CMD0, with CRC
            ld bc,$9540
            ld de,0
            ld hl,0
            call send_cmd2
            cp $01
            ret nz
            ;; Send CMD8, with CRC
            ld bc,$8748
            ld de,0
            ld hl,$01aa
            call send_cmd2
            cp $01
            jp z,init_sdhc

            ;; SDSC or MMC
            call acmd41
            cp $02
            jp c,init_sdv1      ; Jump if code <= 1 ?

            ;; MMCv3. UNTESTED!
init_mmc:
            ;; Send CMD1 until idle.
            ;; TODO: Time out?
            ld c,$40 + 1            ; CMD1
            call send_zcmd
            cp $00
            jp nz, init_mmc
            jp cmd16            ; Tail call

        ;; My example card doesn't do this, so not supported right now.
init_sdhc:
            ld a, '?'
            call sio_wr
            ret

init_sdv1:
            ;; Call ACMD41 until idle.
            ;; TODO: Time out?
            call acmd41
            cp $00
            jp nz,init_sdv1
            jp cmd16            ; Tail call

acmd41:
            ;; Send ACMD41, which is a CMD55 then CMD41.
            ld c,$40 + 55
            call send_zcmd
            cp $01
            ret nz
            ld c,$40 + 41
            jp send_zcmd        ; Tail call

cmd16:
            ;; CMD16, with block size of 512
            ld c,$40 + 16
            ld de,0
            ld hl,512
            jp send_cmd         ; Tail call

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command-sending routines

        ;; Send a command, with zero'd args
send_zcmd:
            ld de,0
            ld hl,0
        ;; Fall through

        ;; Send a command, command in C, args in DE, HL.
send_cmd:   ld b, 1             ; Set CRC to 1.
        ;; Fall through

        ;; Send a command, CRC in B.
send_cmd2:  call send_byte
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
            call get_resp
            call recv_long      ; TODO: Rarely necessary...
            ret

        ;; Receive the extra 4 response bytes.
        ;; TODO: Currently, we just bin them.
recv_long:
            push af
            call get_resp2
            call get_resp2
            call get_resp2
            call get_resp2
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
sb_loop:    ld a,0               ; CS low, clock low.
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
find_resp:  ld a,$03            ; CS low, data high, +ive clk edge to latch.
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,$01            ; CS low, data high, -ive clk edge to shift.
            out ($30),a
            jp nc,find_resp     ; Loop if CD card sent 0.
            ;; Received a 1. Let's read the rest of the byte.
            ld e,$03
            jp rc_loop

            ;; Read a byte into A. Modifies E.
recv_byte:  ld e,$01
rc_loop:    ld a,$03            ; CS low, data high, +ive clk edge to latch.
            out ($30),a
            in a,($30)
            rra                 ; Next bit saved in carry flag...
            ld a,$01            ; CS low, data high, -ive clk edge to shift.
            out ($30),a
            rl e                ; And carry flag rotated into E.
            jp nc,rc_loop
            ld a,e
            cpl                 ; Data is inverted when it hits us.
            ret

            ;; Get a response and print it.
get_resp:   call find_resp
            push af
            call sio_wr_8
            ld a, $0a           ; Linefeed
            call sio_wr
            pop af
            ret

get_resp2:  call recv_byte
            call sio_wr_8
            ld a, $0a           ; Linefeed
            call sio_wr
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

#end

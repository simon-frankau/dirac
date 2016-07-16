;; BIOS for CP/M 2.2 on the Dirac SBC.
;;
;; Parts are derived from example CBIOSes. Everything else
;; (C) Copyright 2016 Simon Frankau.
;;

cdisk:          EQU     $0004       ; Address of last logged disk on warm start
iobyte:         EQU     $0003       ; Optional IOBYTE (not implemented).

ndisks:         EQU     4           ; 4 drives

        ;; Number of directory entries per drive, minus one.
drm:            EQU     255
cks:            EQU     (drm + 1) / 4

        ;; Number of blocks on the drive.
dsm:            EQU     255         ; Actually 16-bit
alv:            EQU     (dsm + 1) / 8

        ;; Jump vector for individual routines
BOOT:           JP      boot
WBOOT:          JP      wboot
CONST:          JP      const
CONIN:          JP      conin
CONOUT:         JP      conout
LIST:           JP      list
PUNCH:          JP      punch
READER:         JP      reader
HOME:           JP      home
SELDSK:         JP      seldsk
SETTRK:         JP      settrk
SETSEC:         JP      setsec
SETDMA:         JP      setdma
READ:           JP      read
WRITE:          JP      write
PRSTAT:         JP      listst
SECTRN:         JP      sectran

        ;; Disk parameter headers
        ;;              XLT   0000  0000  0000  DIRBF DPB   CSV   ALV
dpbase:         DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,chk00,all00
                DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,chk01,all01
                DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,chk02,all02
                DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,chk03,all03

dpblk:  ;; Disk parameter block, common to all disks.
                DEFW    32              ; Sectors per track
                DEFB    3               ; Block shift factor
                DEFB    7               ; Block mask
                DEFB    0               ; Null mask
                DEFW    127             ; Disk size - 1
                DEFW    47              ; Directory max
                DEFB    192             ; Alloc 0
                DEFB    0               ; Alloc 1
                DEFW    12              ; Check size - NB can be 0 for HDD
                DEFW    3               ; Track offset

boot:           XOR     A
                LD      (iobyte),A
                LD      (cdisk),A
                LD      SP,$0080
                LD      HL,signon
                CALL    prmsg
                JR      wboot

prmsg:          LD      C,(HL)
                LD      A,C
                CP      '$'
                RET     Z
                CALL    conout
                INC     HL
                JR      prmsg

signon:         DEFM    $0C, 'CP/M-80 Version 2.2c For the Dirac SBC'
                DEFM    $0D, $0A, '$'

wboot:          LD      SP,$0080
        ;; TODO: Reload CCP from disk.
                JP      gocpm

gocpm:          LD      A,$C3           ; C3 is a jmp instruction
                LD      (0),A           ; For jmp to wboot
                LD      HL,(WBOOT)      ; wboot entry point
                LD      (1),HL          ; Set address field for jmp at 0

                LD      (5),A           ; For jmp to BDOS
                LD      HL,FBASE        ; BDOS entry point
                LD      (6),HL          ; Address field of jump at 5 to BDOS

                LD      BC,$0080        ; Default DMA address is 80H
                CALL    setdma
                EI                      ; Enable the interrupt system
                LD      A,(cdisk)       ; Get current disk number
                LD      C,A             ; Send to the CCP
                JP      CBASE           ; Go to CP/M for further processing

        ;; Is a character available?
const:          LD      A,$20
                OUT     ($70),A
                IN      A,($21)
                AND     $01
                NEG
                RET

        ;; Read character, blocking if necessary.
conin:          ; Wait until there's a character to receive
                LD      A,$20
                OUT     ($70),A
                IN      A,($21)
                AND     $01
                JR      Z,conin
                LD      A,$10
                OUT     ($70),A
                ; Read the data from the data register
                IN      A,($20)
                RET

        ;; Write character.
conout:         LD      A,$80
                OUT     ($70),A
                ; Wait until transmit buffer has space
conout2:        IN      A,($21)
                AND     $04
                JR      Z,conout2
                ; Stick the data in the data register
                LD      A,C
                OUT     ($20),A
                LD      A,$40
                OUT     ($70), A
                RET

        ;; 'list' and 'punch' do nothing, 'reader' reports end-of-file.
reader:         LD      A,$1A
list:
punch:          RET

seldsk:         LD      HL,$0000        ; Error return code
                LD      A,C
                LD      (diskno),A
                CP      4               ; Must be between 0 and 3
                RET     NC              ; No carry if 4, 5,...
                                        ; Disk number is in the proper range
        ;; Load disk parameter block address into HL
                LD      A,(diskno)
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      L,A
                LD      H,$00
                LD      DE,dpbase
                ADD     HL,DE
                RET

home:           LD      C,0
        ;; Fall through

settrk:         LD      A,C
                LD      (track),A
                RET

setsec:         LD      A,C
                LD      (sector),A
                RET

setdma:         LD      (dmaad),BC
                RET

        ;; Read from disk!
        ;; We are slightly paranoid about corrupting state.
read:      ld (saved_sp),sp
           ld sp,$ffff

           push bc
           push de
           push hl

           ld d,0
           ld a,(track)
           ld e,a
           ld a,(sector)
           add a
           ld h,a
           ld l,0
           call read_block
           ld de,(dmaad)
           ld hl,sdbuf
           ld bc,128
           ldir

           xor a
           pop hl
           pop de
           pop bc

           ld sp,(saved_sp)
           ret

            ; Disk offset in DEHL.
read_block: ; Send CMD17 - Single block read
            ld c,$40 + 17       ; CMD17
            call send_cmd
            ; Exit if failed...
            cp $00
            ret nz
            ; Expect data token.
data_tok:   call recv_byte
            cp $ff
            jp z,data_tok
            cp $fe
            ret nz
            ; DE contains destination address.
            ; Read the sector's worth of data into sdbuf
            ld de,sdbuf
            call read256
            call read256
            ; Read the CRC.
            call recv_byte
            call recv_byte
            ret

            ; Read 256 bytes worth of data into DE.
read256:    ld b,$00
r256:       call recv_byte
            ld (de),a
            inc de
            djnz r256
            ret

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

        ;; TODO: Currently, just silently fail.
write:          LD      A,0
                RET

        ;; Return list status.
listst:         XOR     A               ; Always not ready
                RET

        ;; We never do sector translation.
sectran:        LD      HL,BC
                RET

dmaad:          DEFW    $0000           ; DMA I/O address
diskno:         DEFB    $00             ; Drive number
track:          DEFB    $00             ; Track number
sector:         DEFB    $00             ; Sector number

        ;; Scratch RAM
dirbf:          DEFS    $80,$00

all00:          DEFS    alv,$00
all01:          DEFS    alv,$00
all02:          DEFS    alv,$00
all03:          DEFS    alv,$00

chk00:          DEFS    cks,$00
chk01:          DEFS    cks,$00
chk02:          DEFS    cks,$00
chk03:          DEFS    cks,$00

sdbuf:          DEFS    512,$00

saved_sp:       DEFW    $0000

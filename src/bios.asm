;; BIOS for CP/M 2.2 on the Dirac SBC.
;;
;; Parts are derived from example CBIOSes. Everything else
;; (C) Copyright 2016 Simon Frankau.
;;

cdisk:          EQU     $0004       ; Address of last logged disk on warm start
iobyte:         EQU     $0003       ; Optional IOBYTE (not implemented).

ndisks:         EQU     4           ; 4 drives

        ;; Constants for disk sector blocking.
BLKSIZ          EQU     1024            ; CP/M allocation size
HSTSIZ          EQU     512             ; Host disk sector size
HSTSPT          EQU     8               ; Host disk sectors/trk
HSTBLK          EQU     HSTSIZ/128      ; CP/M sects/host buff
CPMSPT          EQU     HSTBLK * HSTSPT ; CP/M sectors/track
SECMSK          EQU     HSTBLK-1        ; sector mask

WRALL           EQU     0               ; Write to allocated
WRDIR           EQU     1               ; Write to directory
WRUAL           EQU     2               ; Write to unallocateds

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
                XOR     A               ; 0 to accumulator
                LD      (HSTACT),A      ; Host buffer inactive
                LD      (UNACNT),A      ; Clear unalloc count
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

        ;; Return list status.
listst:         XOR     A               ; Always not ready
                RET

        ;; We never do sector translation.
sectran:        LD      HL,BC
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Blocked I/O routines

        ;; Derived from Appendix G of the CP/M manuals
        ;; (http://www.gaby.de/cpm/manuals/archive/cpm22htm/axg.asm)

home:           LD      A,(HSTWRT)      ; Check for pending write
                OR      A
                JP      NZ,homed
                LD      (HSTACT),A      ; Clear host active flag
homed:          RET

seldsk:         LD      HL,$0000        ; Error return code
                LD      A,C
                LD      (SEKDSK),A
                CP      4               ; Must be between 0 and 3
                RET     NC              ; No carry if 4, 5,...
                                        ; Disk number is in the proper range
        ;; Load disk parameter block address into HL
                LD      A,(SEKDSK)
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      L,A
                LD      H,$00
                LD      DE,dpbase
                ADD     HL,DE
                RET

        ;; TODO: Track can be BC (16-bit?)
settrk:         LD      (SEKTRK),BC
                RET

setsec:         LD      A,C
                LD      (SEKSEC),A
                RET

setdma:         LD      (DMAADR),BC
                RET

read:           XOR     A
                LD      (UNACNT),A
                LD      A,1
                LD      (READOP),A      ; Read operation
                LD      (RSFLAG),A      ; Must read data
                LD      A,WRUAL
                LD      (WRTYPE),A      ; Treat as unalloc
                JP      rwoper          ; To perform the read

        ;; Enter here to perform the read/write
rwoper:         XOR     A               ; Zero to accum
                LD      (ERFLAG),A      ; No errors (yet)
                LD      A,(SEKSEC)      ; Compute host sector
        ;; Shift by 2 - 128 bytes sectors to 512 byte sectors
                OR      A               ; Carry = 0
                RRA                     ; Shift right
                OR      A               ; Carry = 0
                RRA                     ; Shift right
                LD      (SEKHST),A      ; Host sector to seek
        ;; Active host sector?
                LD      HL,HSTACT       ; Host active flag
                LD      A,(HL)
                LD      (HL),1          ; Always becomes 1
                OR      A               ; Was it already?
                JP      Z,filhst        ; Fill host if not
        ;; Host buffer active, same as seek buffer?
                LD      A,(SEKDSK)
                LD      HL,HSTDSK       ; Same disk?
                CP      (HL)            ; SEKDSK = HSTDSK?
                JP      NZ,nomatch
        ;; Same disk, same track?
                LD      HL,HSTTRK
                CALL    sektrkcmp       ; SEKTRK = HSTTRK?
                JP      NZ,nomatch
        ;; Same disk, same track, same buffer?
                LD      A,(SEKHST)
                LD      HL,HSTSEC       ; SEKHST = HSTSEC?
                CP      (HL)
                JP      Z,match         ; Skip if match
nomatch:
        ;; Proper disk, but not correct sector
                LD      A,(HSTWRT)      ; Host written?
                OR      A
                CALL    NZ,WRITEHST     ; Clear host buff
filhst:
        ;; May have to fill the host buffer
                LD      A,(SEKDSK)
                LD      (HSTDSK),A
                LD      HL,(SEKTRK)
                LD      (HSTTRK),HL
                LD      A,(SEKHST)
                LD      (HSTSEC),A
                LD      A,(RSFLAG)      ; Need to read?
                OR      A
                CALL    NZ,READHST      ; Yes, if 1
                XOR     A               ; 0 to accum
                LD      (HSTWRT),A      ; No pending write
match:
        ;; Copy data to or from buffer
                LD      A,(SEKSEC)      ; Mask buffer number
                AND     A,SECMSK        ; Least signif bits
                LD      L,A             ; Ready to shift
                LD      H,0             ; Double count
                ADD     HL,HL           ; Shift left by 7
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
        ;; HL has relative host buffer address
                LD      DE,HSTBUF
                ADD     HL,DE           ; HL = host address
                EX      DE,HL           ; Now in DE
                LD      HL,(DMAADR)     ; Get/put CP/M data
                LD      C,128           ; Length of move
                LD      A,(READOP)      ; Which way?
                OR      A
                JP      NZ,rwmove       ; Skip if read
        ;; Write operation, mark and switch direction
                LD      A,1
                LD      (HSTWRT),A      ; HSTWRT = 1
                EX      DE,HL           ; Source/dest swap
rwmove:
        ;; C initially 128, DE is source, HL is dest
                LD      A,(DE)          ; Source character
                INC     DE
                LD      (HL),A          ; To dest
                INC     HL
                DEC     C               ; Loop 128 times
                JP      NZ,rwmove
        ;; Data has been moved to/from host buffer
                LD      A,(WRTYPE)      ; Write type
                CP      WRDIR           ; To directory?
                LD      A,(ERFLAG)      ; In case of errors
                RET     NZ              ; No further processing
        ;; Clear host buffer for directory write
                OR      A               ; Errors?
                RET     NZ              ; Skip if so
                XOR     A               ; 0 to accum
                LD      (HSTWRT),A      ; Buffer written
                CALL    WRITEHST
                LD      A,(ERFLAG)
                RET

sektrkcmp:
        ;; HL = .UNATRK or .HSTTRK, compare with SEKTRK
                EX      DE,HL
                LD      HL,SEKTRK
                LD      A,(DE)          ; Low byte compare
                CP      (HL)            ; Same?
                RET     NZ              ; Return if not
        ;; Low bytes equal, test high 1s
                INC     DE
                INC     HL
                LD      A,(DE)
                CP      (HL)            ; Sets flags
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Raw I/O routines

WRITEHST:
        ;; HSTDSK = HOST DISK #, HSTTRK = HOST TRACK #,
        ;; HSTSEC = HOST SECT #. WRITE "HSTSIZ" BYTES
        ;; FROM HSTBUF AND RETURN ERROR FLAG IN ERFLAG.
        ;; RETURN ERFLAG NON-ZERO IF ERROR
                RET
        ;;
READHST:
        ;; HSTDSK = host disk #, HSTTRK = host track #,
        ;; HSTSEC = host sect #. Read "HSTSIZ" bytes
        ;; into HSTBUF and return error flag in ERFLAG.
            ld (saved_sp),sp
            ld sp,$ffff

            push bc
            push de
            push hl

            ld d,0
            ld a,(HSTTRK)
            ld e,a
            ld a,(HSTSEC)
            add a
            ld h,a
            ld l,0
            call read_block

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
            ; Read the sector's worth of data into HSTBUF
            ld de,HSTBUF
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uninitialised data

        ;; Variables for blocked I/O
SEKDSK:         DEFB    $00             ; SEEK DISK NUMBER
SEKTRK:         DEFW    $0000           ; SEEK TRACK NUMBER
SEKSEC:         DEFB    $00             ; SEEK SECTOR NUMBER

HSTDSK:         DEFB    $00             ; HOST DISK NUMBER
HSTTRK:         DEFW    $0000           ; HOST TRACK NUMBER
HSTSEC:         DEFB    $00             ; HOST SECTOR NUMBER

SEKHST:         DEFB    $00             ; SEEK SHR SECSHF
HSTACT:         DEFB    $00             ; HOST ACTIVE FLAG
HSTWRT:         DEFB    $00             ; HOST WRITTEN FLAG

UNACNT:         DEFB    $00             ; UNALLOC REC CNT
UNADSK:         DEFB    $00             ; LAST UNALLOC DISK
UNATRK:         DEFW    $0000           ; LAST UNALLOC TRACK
UNASEC:         DEFB    $00             ; LAST UNALLOC SECTOR

ERFLAG:         DEFB    $00             ; ERROR REPORTING
RSFLAG:         DEFB    $00             ; READ SECTOR FLAG
READOP:         DEFB    $00             ; 1 IF READ OPERATION
WRTYPE:         DEFB    $00             ; WRITE OPERATION TYPE
DMAADR:         DEFW    $0000           ; LAST DMA ADDRESS
HSTBUF:         DEFS    HSTSIZ          ; HOST BUFFER

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

saved_sp:       DEFW    $0000

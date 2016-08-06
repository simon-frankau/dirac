;; BIOS for CP/M 2.2 on the Dirac SBC.
;;
;; Parts are derived from example CBIOSes. Everything else
;; (C) Copyright 2016 Simon Frankau.
;;

cdisk:          EQU     $0004       ; Address of last logged disk on warm start
iobyte:         EQU     $0003       ; Optional IOBYTE (not implemented).

ndisks:         EQU     4           ; 4 drives

        ;; How much is needed to load everything up to the start of the BIOS?
nsects:         EQU     (BOOT - CBASE + 511) / 512

        ;; Constants for disk sector blocking.
blksiz          EQU     4096            ; CP/M allocation size
hstsiz          EQU     512             ; Host disk sector size
hstspt          EQU     8               ; Host disk sectors/trk
hstblk          EQU     hstsiz/128      ; CP/M sects/host buff
cpmspt          EQU     hstblk * hstspt ; CP/M sectors/track
secmsk          EQU     hstblk-1        ; sector mask

wrall           EQU     0               ; Write to allocated
wrdir           EQU     1               ; Write to directory
wrual           EQU     2               ; Write to unallocateds

        ;; Number of blocks on the drive.
dsm:            EQU     4095
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
        ;;              XLT   0000  0000  0000  DIRBF DPB     CSV   ALV
dpbase:         DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,  $0000,all00
                DEFW    $0000,$0000,$0000,$0000,dirbf,dpblk,  $0000,all01
dpbase_ram:     DEFW    $0000,$0000,$0000,$0000,dirbf,ram_blk,$0000,all02

dpblk:  ;; Disk parameter block, for larger disk (16M, 4K blocks)
                DEFW    32              ; Sectors per track
                DEFB    5               ; Block shift factor
                DEFB    31              ; Block mask
                DEFB    1               ; Extent mask
                DEFW    4095 - 3        ; Disk size - 1 (exclude reserved)
                DEFW    1023            ; Directory max
                DEFB    $FF             ; Alloc 0
                DEFB    $00             ; Alloc 1
                DEFW    0               ; Check size
                DEFW    3               ; Track offset

ram_blk: ;; Disk parameter block, for RAM disk - 64K, 1K blocks
                DEFW    32              ; Sectors per track
                DEFB    3               ; Block shift factor
                DEFB    7               ; Block mask
                DEFB    0               ; Extent mask
                DEFW    63              ; Disk size - 1 (exclude reserved)
                DEFW    31              ; Directory max
                DEFB    $80             ; Alloc 0
                DEFB    $00             ; Alloc 1
                DEFW    0               ; Check size
                DEFW    0               ; Track offset

boot:           XOR     A
                LD      (iobyte),A
                LD      (cdisk),A
                LD      SP,$0080
                LD      HL,signon
                CALL    prmsg
                CALL    ram_init
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

        ;; Warm boot code based on the skeleton BIOS.
wboot:  ;; Simplest case is to read the disk until all sectors loaded
                LD      SP,$0080        ; Use space below buffer for stack

        ;; Read CP/M in using raw readhst calls...
        ;; First, initialise disk and track.
                XOR     A
                LD      (hstdsk),A
                LD      DE,0
                LD      (hsttrk),DE
        ;; Then set up loop variables
                LD      DE,CBASE
                LD      B,nsects
                LD      C,1
load1:
        ;; Load destination in DE.
        ;; Number of blocks to read in B
        ;; Current block in C
                LD      A,C
                LD      (hstsec),A
                PUSH    BC
                PUSH    DE
                CALL    readhst
                LD      A,(erflag)
                OR      A
                JR      NZ,wboot
                POP     DE
                LD      BC,512
                LD      HL,hstbuf
                LDIR
                POP     BC
        ;; DE already updated. Update B, C and loop.
                INC     C
                DJNZ    load1

        ;; Disk subsystem initialisation...
                XOR     A               ; 0 to accumulator
                LD      (hstact),A      ; Host buffer inactive
                LD      (unacnt),A      ; Clear unalloc count
                LD      C,0             ; Select disk 0
                CALL    seldsk
                CALL    home            ; Go to track 00
        ;; Fall through...

gocpm:          LD      A,$C3           ; C3 is a jmp instruction
                LD      (0),A           ; For jmp to wboot
                LD      HL,WBOOT        ; wboot entry point
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

home:           LD      BC,0            ; Actually go to track 0!
                LD      (sektrk),BC
                LD      A,(hstwrt)      ; Check for pending write
                OR      A
                RET     NZ
                LD      (hstact),A      ; Clear host active flag
                RET

seldsk:         LD      HL,$0000        ; Error return code
                LD      A,C
                LD      (sekdsk),A
                CP      'M' - 'A'
                JR      Z,seldsk_ram
                CP      2               ; Must be between 0 and 1
                RET     NC              ; No carry if 2, 3, 4, 5,...
                                        ; Disk number is in the proper range
        ;; Load disk parameter block address into HL
                LD      A,(sekdsk)
                ADD     A,A
                ADD     A,A
                ADD     A,A
                ADD     A,A
                LD      L,A
                LD      H,$00
                LD      DE,dpbase
                ADD     HL,DE
                RET

        ;; Select RAM disk
seldsk_ram:     LD      HL,dpbase_ram
                RET

settrk:         LD      (sektrk),BC
                RET

setsec:         LD      A,C
                LD      (seksec),A
                RET

setdma:         LD      (dmaadr),BC
                RET

read:           LD      A,(sekdsk)
                CP      'M' - 'A'
                JP      Z,read_ram
                XOR     A
                LD      (unacnt),A
                LD      A,1
                LD      (readop),A      ; Read operation
                LD      (rsflag),A      ; Must read data
                LD      A,wrual
                LD      (wrtype),A      ; Treat as unalloc
                JP      rwoper          ; To perform the read

write:          LD      A,(sekdsk)
                CP      'M' - 'A'
                JP      Z,write_ram
                XOR     A               ; 0 to accumulator
                LD      (readop),A      ; Not a read operation
                LD      A,C             ; Write type in C
                LD      (wrtype),A
                CP      wrual           ; Write unallocated?
                JP      NZ,chkuna       ; Check for unalloc

        ;; Write to unallocated, set parameters
                LD      A,blksiz/128    ; Next unalloc recs
                LD      (unacnt),A
                LD      A,(sekdsk)      ; Disk to seek
                LD      (unadsk),A      ; unadsk = sekdsk
                LD      HL,(sektrk)
                LD      (unatrk),HL     ; unatrk = sectrk
                LD      A,(seksec)
                LD      (unasec),A      ; unasec = seksec

chkuna:
        ;; Check for write to unallocated sector
                LD      A,(unacnt)      ; Any unalloc remain?
                OR      A
                JP      Z,alloc         ; Skip if not

        ;; More unallocated records remain
                DEC     A               ; unacnt = unacnt-1
                LD      (unacnt),A
                LD      A,(sekdsk)      ; Same disk?
                LD      HL,unadsk
                CP      (HL)            ; sekdsk = unadsk?
                JP      NZ,alloc        ; Skip if not

        ;; Disks are the same
                LD      HL,unatrk
                CALL    sektrkcmp       ; sektrk = unatrk?
                JP      NZ,alloc        ; Skip if not

        ;; Tracks are the same
                LD      A,(seksec)      ; Same sector?
                LD      HL,unasec
                CP      (HL)            ; seksec = unasec?
                JP      NZ,alloc        ; Skip if not

        ;; Match, move to next sector for future ref
                INC     (HL)            ; unasec = unasec+1
                LD      A,(HL)          ; End of track?
                CP      cpmspt          ; Count CP/M sectors
                JP      C,noovf         ; Skip if no overflow

        ;; Overflow to next track
                LD      (HL),0          ; unasec = 0
                LD      HL,(unatrk)
                INC     HL
                LD      (unatrk),HL     ; unatrk = unatrk + 1

noovf:
        ; Match found, mark as unnecessary read
                XOR     A               ; 0 to accumulator
                LD      (rsflag),A      ; rsflag = 0
                JP      rwoper          ; To perform the write

alloc:
        ; Not an unallocated record, requires pre-read
                XOR     A               ; 0 to accum
                LD      (unacnt),A      ; unacnt = 0
                INC     A               ; 1 to accum
                LD      (rsflag),A      ; rsflag = 1

        ;; Enter here to perform the read/write
rwoper:         XOR     A               ; Zero to accum
                LD      (erflag),A      ; No errors (yet)
                LD      A,(seksec)      ; Compute host sector
        ;; Shift by 2 - 128 bytes sectors to 512 byte sectors
                OR      A               ; Carry = 0
                RRA                     ; Shift right
                OR      A               ; Carry = 0
                RRA                     ; Shift right
                LD      (sekhst),A      ; Host sector to seek
        ;; Active host sector?
                LD      HL,hstact       ; Host active flag
                LD      A,(HL)
                LD      (HL),1          ; Always becomes 1
                OR      A               ; Was it already?
                JP      Z,filhst        ; Fill host if not
        ;; Host buffer active, same as seek buffer?
                LD      A,(sekdsk)
                LD      HL,hstdsk       ; Same disk?
                CP      (HL)            ; sekdsk = hstdsk?
                JP      NZ,nomatch
        ;; Same disk, same track?
                LD      HL,hsttrk
                CALL    sektrkcmp       ; sektrk = hsttrk?
                JP      NZ,nomatch
        ;; Same disk, same track, same buffer?
                LD      A,(sekhst)
                LD      HL,hstsec       ; sekhst = hstsec?
                CP      (HL)
                JP      Z,match         ; Skip if match
nomatch:
        ;; Proper disk, but not correct sector
                LD      A,(hstwrt)      ; Host written?
                OR      A
                CALL    NZ,writehst     ; Clear host buff
filhst:
        ;; May have to fill the host buffer
                LD      A,(sekdsk)
                LD      (hstdsk),A
                LD      HL,(sektrk)
                LD      (hsttrk),HL
                LD      A,(sekhst)
                LD      (hstsec),A
                LD      A,(rsflag)      ; Need to read?
                OR      A
                CALL    NZ,readhst      ; Yes, if 1
                XOR     A               ; 0 to accum
                LD      (hstwrt),A      ; No pending write
match:
        ;; Copy data to or from buffer
                LD      A,(seksec)      ; Mask buffer number
                AND     A,secmsk        ; Least signif bits
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
                LD      DE,hstbuf
                ADD     HL,DE           ; HL = host address
                EX      DE,HL           ; Now in DE
                LD      HL,(dmaadr)     ; Get/put CP/M data
                LD      C,128           ; Length of move
                LD      A,(readop)      ; Which way?
                OR      A
                JP      NZ,rwmove       ; Skip if read
        ;; Write operation, mark and switch direction
                LD      A,1
                LD      (hstwrt),A      ; hstwrt = 1
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
                LD      A,(wrtype)      ; Write type
                CP      wrdir           ; To directory?
                LD      A,(erflag)      ; In case of errors
                RET     NZ              ; No further processing
        ;; Clear host buffer for directory write
                OR      A               ; Errors?
                RET     NZ              ; Skip if so
                XOR     A               ; 0 to accum
                LD      (hstwrt),A      ; Buffer written
                CALL    writehst
                LD      A,(erflag)
                RET

sektrkcmp:
        ;; HL = .unatrk or .hsttrk, compare with sektrk
                EX      DE,HL
                LD      HL,sektrk
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

writehst:
        ;; hstdsk = host disk #, hsttrk = host track #,
        ;; hstsec = host sect #. Write "hstsiz" bytes
        ;; from hstbuf and return error flag in erflag.
        ;; Return erflag non-zero if error
                CALL    get_sd_addr
        ;; Disk offset now in DEHL. Do the write
                ; Send CMD24 - Write single block
                LD      C,$40 + 24      ; CMD24
                CALL    send_cmd
                ; Exit if failed...
                CP      $00
                RET     NZ
                ; Pause for a byte
                LD      C,$FF
                CALL    send_byte
                ; Write data packet.
                LD      C,$FE
                CALL    send_byte
                LD      DE,hstbuf
                CALL    write256
                CALL    write256
                LD      C,$00
                CALL    send_byte
                CALL    send_byte
                ; Look for a data response
                CALL    find_resp
                ; TODO Error handling
                ; A & $f0 == $20 if all's well
                ; And wait for busy to complete
wbusy:          CALL    recv_byte
                OR      A
                JR      Z,wbusy
                RET

write256:       LD      B,$00
w256:           LD      A,(DE)
                LD      C,A
                CALL    send_byte
                INC     DE
                DJNZ    w256
                RET

readhst:
        ;; hstdsk = host disk #, hsttrk = host track #,
        ;; hstsec = host sect #. Read "hstsiz" bytes
        ;; into hstbuf and return error flag in erflag.
                CALL    get_sd_addr
        ;; Disk offset now in DEHL. Do the read
                ; Send CMD17 - Single block read
                LD      C,$40 + 17      ; CMD17
                CALL    send_cmd
                ; Exit if failed...
                OR      A
                RET     NZ
                ; Expect data token.
data_tok:       CALL    recv_byte
                CP      $FF
                JR      Z,data_tok
                CP      $FE
                RET     NZ
                ; DE contains destination address.
                ; Read the sector's worth of data into hstbuf
                LD      DE,hstbuf
                CALL    read256
                CALL    read256
                ; Read the CRC.
                CALL    recv_byte
                CALL    recv_byte
                RET

                ; Read 256 bytes worth of data into DE.
read256:        LD      B,$00
r256:           CALL    recv_byte
                LD      (de),a
                INC     DE
                DJNZ    r256
                RET

        ;; Get the address for the write into DEHL.
get_sd_addr:
        ;; Each track is 4K, so offset the track number by 4 bits.
                LD      HL,(hsttrk)
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
                ADD     HL,HL
        ;; DE contains the top end of the address...
                LD      A,(hstdsk)
                LD      D,A
                LD      E,H
        ;; And HL contains the bottom end.
                LD      A,(hstsec)
                ADD     A,A
                ADD     A,L
                LD      H,A
                LD      L,0
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command-sending routines

                ; Send a command, command in C, args in DE, HL.
send_cmd:       PUSH    BC
                ; Wait until receiver's ready.
wait_rdy:       CALL    recv_byte
                CP      $FF
                JR      NZ,wait_rdy
                POP     BC
                ; Send command.
                CALL    send_byte
                LD      C,D
                CALL    send_byte
                LD      C,E
                CALL    send_byte
                LD      C,H
                CALL    send_byte
                LD      C,L
                CALL    send_byte
                LD      C,1
                CALL    send_byte
                CALL    find_resp
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Low-level bit-twiddling SD card I/O
;;

                ; Byte to send in C
                ; Modifies A.
send_byte:      SCF
                RL      C
sb_loop:        LD      A,0         ; CS low, clock low.
                RLA
                OUT     ($30),A
                XOR     A,$2        ; Flip clock bit.
                RL      C
                OUT     ($30),A     ; Doesn't affect NZ.
                JR      NZ,sb_loop
                RET

                ; Search for the start of a response. This is a 0
                ; bit from the SD card, which is inverted by the time
                ; it hits our I/O port.
                ;
                ; TODO: Should arrive within 16 cycles. Time out, if needed.
find_resp:      LD      A,$01       ; CS low, data high, -ive clk edge - shift
                OUT     ($30),A
                IN      A,($30)
                RRA                 ; Next bit saved in carry flag...
                LD      A,$03       ; CS low, data high, +ive clk edge - latch
                OUT     ($30),A
                JR      NC,find_resp    ; Loop if SD card sent 0.
                ; Received a 1. Let's read the rest of the byte.
                LD      C,$03
                JR      rc_loop

                ; Read a byte into A. Modifies C.
recv_byte:      LD      C,$01
rc_loop:        LD      A,$01       ; CS low, data high, -ive clk edge - shift
                OUT     ($30),A
                IN      A,($30)
                RRA                 ; Next bit saved in carry flag...
                LD      A,$03       ; CS low, data high, +ive clk edge - latch
                OUT     ($30),A
                RL      C           ; And carry flag rotated into C.
                JR      NC,rc_loop
                LD      A,C
                CPL                 ; Data is inverted when it hits us.
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RAM disk routines

        ;; TODO: Interrupts?

        ;; Initialise RAM disk
ram_init:       ; Map page containing directories into $0000
                LD      BC,$0000
                LD      A,$D0
                OUT     (BC),A
                ; LDIR to clear the page
                LD      A,$E5
                LD      (0),A
                LD      BC,$0FFF
                LD      DE,1
                LD      HL,0
                JR      ram_done

read_ram:       CALL    ram_prep
                JR      ram_done
                RET

write_ram:      CALL    ram_prep
                EX      DE,HL
                JR      ram_done

        ;; Prepare for a RAM disk op. Returns BC,DE,HL set up for an LDIR read.
ram_prep:       LD      DE,(dmaadr)
        ;; Need to load BC with $0000 or $4000, depending on DE.
                LD      BC,$4000    ; Default to high page
                LD      A,D
                CP      $10
                JR      C,rp2       ; Jump if dmaadr < $1000
                XOR     A
                LD      B,A         ; High buffer, so map to low page.
rp2:            LD      A,(sektrk)
                ADD     $D0         ; Pages D0-DF for RAM disk
                OUT     (BC),A      ; And map the page
        ;; Appropriate has been page mapped in at BC
                LD      A,(seksec)
                RRCA                ; Rotated value
                LD      H,A         ; Save all bits to H
                AND     $80         ; Keep top bit in L
                LD      L,A
                XOR     H           ; And then knock out top bit in H
                LD      H,A
                ADD     HL,BC       ; Add base to this offset
        ;; Disk address in HL
                LD      BC,$80
        ;; BC, DE and HL set up.
                RET

        ;; Perform the copy, and tidy up
ram_done:       LDIR
        ;; Restore both possible places that may have been changed.
                LD      BC,$0000
                LD      A,$C0
                OUT     (BC),A
                LD      BC,$4000
                LD      A,$C4
                OUT     (BC),A
        ;; Success!
                XOR     A
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uninitialised data

        ;; Variables for sector-blocking I/O
sekdsk:         DEFB    $00             ; Seek disk number
sektrk:         DEFW    $0000           ; Seek track number
seksec:         DEFB    $00             ; Seek sector number

hstdsk:         DEFB    $00             ; Host disk number
hsttrk:         DEFW    $0000           ; Host track number
hstsec:         DEFB    $00             ; Host sector number

sekhst:         DEFB    $00             ; Seek SHR secshf
hstact:         DEFB    $00             ; Host active flag
hstwrt:         DEFB    $00             ; Host written flag

unacnt:         DEFB    $00             ; Unalloc rec cnt
unadsk:         DEFB    $00             ; Last unalloc disk
unatrk:         DEFW    $0000           ; Last unalloc track
unasec:         DEFB    $00             ; Last unalloc sector

erflag:         DEFB    $00             ; Error reporting
rsflag:         DEFB    $00             ; Read sector flag
readop:         DEFB    $00             ; 1 if read operation
wrtype:         DEFB    $00             ; Write operation type
dmaadr:         DEFW    $0000           ; Last DMA address
hstbuf:         DEFS    hstsiz          ; Host buffer

        ;; Scratch RAM
dirbf:          DEFS    $80,$00

all00:          DEFS    alv,$00
all01:          DEFS    alv,$00
all02:          DEFS    8,$00           ; RAM disk only has 64 blocks

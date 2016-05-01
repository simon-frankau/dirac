; Simple cylon/knightrider thing
; Dumbest possible implementation - no dependency on RAM, can just be dropped
; in at 0x0000.
;
; Assumes that you will be fixing your LEDs on port 0.

#target     rom

#code       RESET,0,$4000

top:        ld a,$1
            out (0),a

            ld de,0
l1:         dec de
            ld a, d
            or e
            jp nz, l1

            ld a,$2
            out (0),a

            ld de,0
l2:         dec de
            ld a, d
            or e
            jp nz, l2

            ld a,$4
            out (0),a

            ld de,0
l3:         dec de
            ld a, d
            or e
            jp nz, l3

            ld a,$8
            out (0),a

            ld de,0
l4:         dec de
            ld a, d
            or e
            jp nz, l4

            ld a,$10
            out (0),a

            ld de,0
l5:         dec de
            ld a, d
            or e
            jp nz, l5

            ld a,$20
            out (0),a

            ld de,0
l6:         dec de
            ld a, d
            or e
            jp nz, l6

            ld a,$40
            out (0),a

            ld de,0
l7:         dec de
            ld a, d
            or e
            jp nz, l7

            ld a,$80
            out (0),a

            ld de,0
l8:         dec de
            ld a, d
            or e
            jp nz, l8

            ld a,$40
            out (0),a

            ld de,0
l9:         dec de
            ld a, d
            or e
            jp nz, l9

            ld a,$20
            out (0),a

            ld de,0
l10:        dec de
            ld a, d
            or e
            jp nz, l10

            ld a,$10
            out (0),a

            ld de,0
l11:        dec de
            ld a, d
            or e
            jp nz, l11

            ld a,$8
            out (0),a

            ld de,0
l12:        dec de
            ld a, d
            or e
            jp nz, l12

            ld a,$4
            out (0),a

            ld de,0
l13:        dec de
            ld a, d
            or e
            jp nz, l13

            ld a,$2
            out (0),a

            ld de,0
l14:        dec de
            ld a, d
            or e
            jp nz, l14

            jp top

#end

PUBLIC out_hs_7
EXTRN out_hu_6:proc
EXTRN X:word

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_hs_7 proc near
    ret
out_hs_7 endp
CSEG ENDS
END
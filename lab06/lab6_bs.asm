PUBLIC out_bs_3
EXTRN X:word
EXTRN out_bu_2:proc

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_bs_3 proc near
    ret
out_bs_3 endp
CSEG ENDS
END
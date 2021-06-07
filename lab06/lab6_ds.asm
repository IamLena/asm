PUBLIC out_ds_5
EXTRN out_du_4:proc
EXTRN X:word

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_ds_5 proc near
    ret
out_ds_5 endp
CSEG ENDS
END
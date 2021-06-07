PUBLIC out_bu_2
EXTRN X:word

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
	
out_bu_2 proc near
    ret
out_bu_2 endp
CSEG ENDS
END
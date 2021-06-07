PUBLIC out_hs_7
EXTRN out_hu_6:proc
EXTRN X:word

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_hs_7 proc near
    mov ax, seg X
	mov ds, ax
	mov dl, '-'
	mov ah, 2
	int 21h
	neg X
	call out_hu_6
	neg X
    ret
out_hs_7 endp
CSEG ENDS
END
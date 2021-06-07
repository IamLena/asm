PUBLIC out_bs_3
EXTRN X:word
EXTRN out_bu_2:proc

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_bs_3 proc near
    mov ax, seg X
	mov ds, ax
	mov dl, '-'
	mov ah, 2
	int 21h
	neg X
	call out_bu_2
	neg X
    ret
out_bs_3 endp
CSEG ENDS
END
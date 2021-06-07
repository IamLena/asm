PUBLIC out_ds_5
EXTRN out_du_4:proc
EXTRN X:word

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG
out_ds_5 proc near
    mov ax, seg X
	mov ds, ax
	mov dl, '-'
	mov ah, 2
	int 21h
	neg X
	call out_du_4
	neg X
    ret
out_ds_5 endp
CSEG ENDS
END
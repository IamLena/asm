PUBLIC out_hu_6
EXTRN X:word

DATAS SEGMENT PARA PUBLIC 'DATA2'
	hu_str db 5 dup(' ')
	symbols db "0123456789ABCDEF"
	str_end db 13, 10, '$'
DATAS ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DATAS
out_hu_6 proc near
    mov ax, seg X
	mov ds, ax
	mov bx, X
    mov ax, DATAS
	mov ds, ax
	mov di, OFFSET hu_str
	mov si, 12d
	mov cx, 4
	mov ax, 0f000h
	mov dl, 0
shift_loop:
    push bx
	push cx
	and bx, ax
	
	mov cx, si
	ror bx, cl
	mov bl, symbols[bx]
	cmp bl, '0'
	jne write
	cmp dl, 0
	je continue
	
write:
    inc dl
	mov byte ptr [di], bl
	inc di
continue:
	sub si, 4
	mov cl, 4
	ror ax, cl
	pop cx
	pop bx
	loop shift_loop
    
	
	mov byte ptr [di], '$'
	mov dx, OFFSET hu_str
	mov ah, 9
	int 21h
	mov dx, OFFSET str_end
	int 21h
	mov ax, seg X
	mov ds, ax
	
    ret
out_hu_6 endp
CSEG ENDS
END
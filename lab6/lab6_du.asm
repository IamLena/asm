PUBLIC out_du_4
EXTRN X:word

DATAS SEGMENT PARA PUBLIC 'DATA2'
	du_str db 6 dup(' ')
	str_end db 13, 10, '$'
DATAS ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DATAS
out_du_4 proc near
    mov ax, seg X
	mov ds, ax
	mov bx, X
    mov ax, DATAS
	mov ds, ax
	mov cx, 0
	mov di, OFFSET du_str
	mov ax, bx
	mov bx, 10

div_loop:	
	xor dx, dx
	div bx
	add dl, '0'
	push dx
	inc cx
	cmp ax, 0
	jne div_loop
	
get_num:
    pop dx
	mov byte ptr [di], dl
	inc di
	loop get_num
	
	mov byte ptr [di], '$'
	mov dx, OFFSET du_str
	mov ah, 9
	int 21h
	mov dx, OFFSET str_end
	int 21h
	mov ax, seg X
	mov ds, ax
	
    ret
out_du_4 endp
CSEG ENDS
END
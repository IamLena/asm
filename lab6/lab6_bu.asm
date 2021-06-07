PUBLIC out_bu_2
EXTRN X:word

DATAS SEGMENT PARA PUBLIC 'DATA2'
	bu_str db 17 dup(' ')
	str_end db 13, 10, '$'
DATAS ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DATAS
	
out_bu_2 proc near
    mov ax, seg X
	mov ds, ax
	mov bx, X
    mov ax, DATAS
	mov ds, ax
	mov cx, 16d
	mov di, OFFSET bu_str
	mov ax, 0
	
bu_loop:
    rol bx, 1
	jc out_1
	cmp ax, 0
	je loop_end
	mov byte ptr [di], '0'
	jmp loop_end
out_1:
    cmp ax, 0
	jne cont
	mov ax, cx
cont:
    mov byte ptr [di], '1'
loop_end:
    inc di
	loop bu_loop
	mov byte ptr [di], "$"
	sub di, ax
	mov ah, 9
	mov dx, di
	int 21h
	mov dx, OFFSET str_end
	int 21h
	mov ax, seg X
	mov ds, ax
    ret
out_bu_2 endp
CSEG ENDS
END
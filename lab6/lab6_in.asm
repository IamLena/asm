PUBLIC input_x_1
EXTRN X:word

DATAS SEGMENT PARA PUBLIC 'DATA2'
    buf label BYTE
    maxl db 7 
	actl db ?
	text db 7 dup(0)
	welcome db 13, 10, "input a number: $"
DATAS ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DATAS
	
str_to_num proc near
    push bx
    mov si, dx
	mov di, 10
	mov cl, al
	xor ax, ax
mul_loop:
    mov bl, [si]
	inc si
	sub bl, '0'
	mul di
	jc cf_error
	add ax, bx
	jc cf_error
	loop mul_loop
	jmp str_to_num_exit
cf_error:
    xor ax, ax
	stc
str_to_num_exit:
	pop bx
	ret
str_to_num endp

input_x_1 proc near
    mov ax, DATAS
	mov ds, ax
	mov ah, 9
	mov dx, OFFSET welcome
	int 21h
	mov ah, 0Ah
	mov dx, OFFSET buf
	int 21h
	mov al, actl
	add dx, 2
	mov bx, dx
	mov bl, [bx]
	cmp bl, '-'
	jne positive
	inc dx
	dec al
positive:
    mov actl, al
	call str_to_num
	jc finish
	cmp bl, '-'
	jne check_pos
	cmp ax, 32768d
	ja inp_error
	not ax
	inc ax
	clc
	jmp finish

inp_error:
   xor ax, ax
   stc 
   jmp finish   
check_pos:
    cmp ax, 32767d
	ja inp_error
	clc
finish:
	mov bx, seg X
	mov ds, bx
	mov X, 0
    mov X, ax
	;mov al, actl
    ret
input_x_1 endp
CSEG ENDS
END
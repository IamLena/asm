Sseg Segment para stack 'stack'
	db 64 dup (0)
sseg ends

dseg segment word 'data'
	greets	db 13
		db 10
		db 'input the option number: $'

	xin	db 13
		db 10
		db 'input x: $'

	menu	db '0) show menu'
		db 13
		db 10
		db '1) input x'
		db 13
		db 10
		db '2) unsigned binary'
		db 13
		db 10
		db '3) singed binary'
		db 13
		db 10
		db '4) unsigned decimal'
		db 13
		db 10
		db '5) singed decimal'
		db 13
		db 10
		db '6) unsigned hexidecimal'
		db 13
		db 10
		db '7) singed hexidecimal'
		db 13
		db 10
		db '8) exit$'

	X	dw 0
	ok	db 'okay$'
dseg ends

cseg segment para public 'code'
	assume ds:dseg, ss:sseg, cs:cseg

option0 proc near
	call enter
	mov dx, offset menu
	mov ah, 09h
	int 21h
	ret
option0 endp

inputx:
	call input
	call output
	cmp bl, 10
	jne number
	ret

number:
	cmp bl, 30h
	jl M0
	cmp bl, 38h
	jg M0
	
	mov al, ah
	mul bl
	mov x, ax
	mov bh, 00
	add x, bx	
	jmp inputx

option1 proc near
	mov dx, offset xin
	mov ah, 09h
	int 21h
	jmp inputx
	ret
option1 endp

option2 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option2 endp

option3 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option3 endp

option4 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option4 endp

option5 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option5 endp

option6 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option6 endp

option7 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	ret
option7 endp

option8 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
	mov ah, 4ch
	int 21h
option8 endp

input proc near
	mov ah, 07h
	int 21h
	mov bl, al
	ret
input endp

output proc near
	mov dl, bl
	mov ah, 02h
	int 21h
	ret
output endp

enter proc near
	mov dl, 13
	mov ah, 02h
	int 21h
	mov dl, 10
	mov ah, 02h
	int 21h
	ret
enter endp

start:
	mov ax, dseg
	mov ds, ax
	call option0

M0:
	mov dx, offset greets
	mov ah, 09h
	int 21h
	call input
	call output
	call enter
	cmp bl, 30h		;0
	jne M1
	call option0
	JMP M0
M1:
	cmp bl, 31h		;1
	jne M2
	call option1
	jmp m0

M2:
	cmp bl, 32h		;2
	jne M3
	call option2
	jmp m0

M3:
	cmp bl, 33h		;3
	jne M4
	call option3
	jmp m0

M4:
	cmp bl, 34h		;4
	jne M5
	call option4
	jmp m0

M5:
	cmp bl, 35h		;5
	jne M6
	call option5
	jmp m0

M6:
	cmp bl, 36h		;6
	jne M7
	call option6
	jmp m0

M7:
	cmp bl, 37h		;7
	jne M8
	call option7
	jmp m0

M8:
	cmp bl, 38h		;8
	jne M0
	call option8
	jmp m0

cseg ends
	end START

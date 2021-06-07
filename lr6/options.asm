public operation0
public operation1
public operation2
public operation3
public operation4
public operation5
public operation6
public operation7
public operation8

EXTRN enter:near

sseg Segment para stack 'stack'
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

option1 proc near
	mov dx, offset ok
	mov ah, 09h
	int 21h
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

cseg ends

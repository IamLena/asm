public input
public output
public enter

EXTRN enter:near

cseg segment para public 'code'
	assume cs:cseg

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

cseg ends


EXTRN option0:near
EXTRN option1:near
EXTRN option2:near
EXTRN option3:near
EXTRN option4:near
EXTRN option5:near
EXTRN option6:near
EXTRN option7:near
EXTRN option8:near

EXTRN input:near
EXTRN output:near
EXTRN greets:near
EXTRN enter:near

dseg segment word 'data'
dseg ends

sseg Segment para stack 'stack'
	db 64 dup (0)
sseg ends

cseg segment word 'code'
    assume SS:sseg, CS:cseg, DS:dseg

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
    end start
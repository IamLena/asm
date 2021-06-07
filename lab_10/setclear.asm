SSTACK SEGMENT PARA STACK 'STACK'
	DB 64 DUP (0)
SSTACK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	N DB 2
	P DB 0
	X DB 10
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME SS:SSTACK, DS:DSEG, CS:CSEG

setclear PROC FAR
	MOV AX, DSEG
	MOV DS, AX

	; translate x to bynary
	; get bynary 0001000 1 - n
	mov bx, 1
	mov cl, n
	sal bx, cl
	
	cmp P, 0
	je setzero
	jmp setone

setzero:
	not bx
	and x, bx
	jmp end_prog

setone: 
	or x, bx
	jmp end_prog

END_PROG:
	;ret
	MOV AL, 0
	MOV AH, 4Ch
	INT 21h	

setclear ENDP
	
CSEG ENDS
END setclear

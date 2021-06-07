SSTACK SEGMENT PARA STACK 'STACK'
	DB 64 DUP (0)
SSTACK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	x DB 5 DUP (1,2,3,4,5)
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME SS:SSTACK, DS:DSEG, CS:CSEG

START PROC FAR
	MOV AX, DSEG
	MOV DS, AX

	MOV DX, 5

	MOV SI, 1
	MOV DI, 5

	MOV BX, OFFSET X

LOOP2:
	XCHG AL, X[BX][SI]
	XCHG AL, X[BX][DI]
	XCHG AL, X[BX][SI]

	INC SI
	ADD DI, 5
	CMP SI, DX
	JE LOOP1		;if si == N jump loop1
	JMP LOOP2

LOOP1:
	ADD BX, 6
	DEC DX
	MOV SI, 1
	MOV DI, 5

	CMP DL, 1
	JE END_PROG	
	
	JMP LOOP2


END_PROG:
	MOV AL, 0
	MOV AH, 4Ch
	INT 21h	

START ENDP
	
CSEG ENDS
END START
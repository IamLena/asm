.386
.model FLAT,C
public f
.code
f:
	PUSH EBP
	MOV EBP, ESP
	MOV ECX, [EBP + 8]; N
	MOV EBX, [EBP + 12]; *G

	CMP ECX, 1
	JE ENDPROG

	MOV EAX, [EBX]
	IMUL ECX
	MOV [EBX], EAX
	DEC ECX

	PUSH EBX
	PUSH ECX
	CALL F
	ADD ESP, 8

ENDPROG:
	POP EBP
	RET
END
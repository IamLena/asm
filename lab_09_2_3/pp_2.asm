.386
.model FLAT, c
PUBLIC f
.code
f:
    push EBP
	mov EBP, ESP
	mov ECX, [EBP + 8]
    mov EDX, [EBP + 12]
	
factorial:
	cmp ECX, 0h
	je assign

	dec ECX ;если поменять местами команды push и dec, то появляется ошибка переполнения стека
	push EDX
	push ECX

	call f

	pop ECX
	pop EDX

	inc ECX

    push EDX
    mul ECX
	pop EDX
	jmp return

assign:
    mov EAX, 1h
return:
    mov [EDX], EAX
	pop EBP
	ret
END
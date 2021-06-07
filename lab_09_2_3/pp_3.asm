.386
.model FLAT, c
PUBLIC f
.code

factorial proc near
	cmp ECX, 0h
	je done
	push EDX
    mul ECX
	pop EDX
	dec ECX
	call factorial
done:
	ret
factorial endp

f:
    push EBP
	mov EBP, ESP
	mov ECX, [EBP + 8]
    mov EDX, [EBP + 12]
	mov EAX, 1h
	call factorial
return:
    mov [EDX], EAX
	pop EBP
	ret
END

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
	cmp ECX, 1h
	je assign
	;mov EAX, [EDX]
	;push EDX
	;mul ECX
	;pop EDX
	;mov [EDX], EAX
	dec ECX
	push EDX
	push ECX
	call f
	pop ECX
	pop EDX
	;add ESP, 8

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
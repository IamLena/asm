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
	push EBX
	mov ECX, [EBP + 8] ; n
    mov EDX, [EBP + 12] ; *g
	mov EAX, 1h
	call factorial

return:
    mov [EDX], EAX
	pop EBX
	pop EBP
	ret
END
EXTRN X:word

cseg segment para public 'code'
    assume CS:cseg

welcome proc near
    MOV DX, SEG X
    MOV AH, 09h
    INT 21h
    ret
welcome endp

cseg ends
PUBLIC welcome
end
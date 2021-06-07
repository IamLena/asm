;input x

public option1

dseg2 segment para public 'data2'
    maxlength db 7
    reallength db ?
    text 7 dup(0)
    mes db 13, 10, 'input a nubmer: $'
dseg2 ends

cseg segment para public 'code'
    assume DS:dseg2, CS:cseg

option1 proc near
    mov ax, dseg
    mov ds, ax

    mov dx, offset mes
    mov ah, 09h
    int 21h
    ret
option1 endp
cseg ends
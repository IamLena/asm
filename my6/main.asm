sseg segment para stack 'stack'
    db 64 dup (0)
sseg ends

dseg segment para public 'data'
    menu0 db 13, 10, '0) print menu'
    menu1 db 13, 10, '1) input x'
    menu2 db 13, 10, '2) binary unsigned'
    menu3 db 13, 10, '3) binary signed'
    menu4 db 13, 10, '4) decimal unsigned'
    menu5 db 13, 10, '5) decimal signed'
    menu6 db 13, 10, '6) hexidecimal unsigned'
    menu7 db 13, 10, '7) hexidecimal signed'
    menu8 db 13, 10, '8) exit$'
    welcome db 13, 10, 'chose the option: $'
    option dw option1, option2  ;, option3, option4, option5, option6, option7

    buf label byte
    maxlength db 7
    reallength db ?
    text db 7 dup(0)
    mes db 13, 10, 'input a nubmer: $'

dseg ends

cseg segment para public 'code'
    assume SS:sseg, DS:dseg, CS:cseg

print_menu:
    mov dx, offset menu0
    mov ah, 09h
    int 21h

input_option:
    mov dx, offset welcome
    mov ah, 09h
    int 21h

    mov ah, 07h
    int 21h

    mov dl, al
    mov ah, 02h
    int 21h

    cmp dl, 30h
    je print_menu
    jl input_option
    
    cmp dl, 38h
    je exit
    jg input_option

    mov dh, 0
    dec dl
    sub dx, 30h
    mov si, dx
    call option[si]

    jmp input_option

main:
    mov ax, dseg
    mov ds, ax

    jmp print_menu

exit:
    mov ah, 4ch
    int 21h

option1 proc near
    mov ax, dseg
    mov ds, ax

    mov dx, offset mes
    mov ah, 09h
    int 21h

    mov dx, offset buf
    mov ah, 0Ah
    int 21h

    mov al, reallength
    mov bx, dx
    add bx, 2
    mov dl, [bx]
    cmp dl, '-'
    jne positive
    dec dl
    dec al

positive:
    

    ret
option1 endp


option2 proc near
    mov dl, 1
    mov ah, 02h
    int 21h
    ret
option2 endp

cseg ends
    end main
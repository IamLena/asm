Public X
EXTRN welcome:near

sseg segment para stack 'stack'
    db 64 dup (0)
sseg ends

dseg segment para public 'data'
    X db 'Chose the option: $'
dseg ends

cseg segment word public 'code'
    assume SS:sseg, CS:cseg, DS:dseg

start:
    call welcome
    MOV ah, 4ch
    INT 21h

cseg ends
    end start
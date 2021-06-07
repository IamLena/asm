EXTRN input_x_1:near
EXTRN out_bu_2:near
EXTRN out_bs_3:near
EXTRN out_du_4:near
EXTRN out_ds_5:near
EXTRN out_hu_6:near
EXTRN out_hs_7:near

SSEG SEGMENT PARA STACK 'STACK'
    db 64 dup(0)
SSEG ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	error_str db 13, 10
	          db "Input error"
	          db 13, 10
			  db "$"
	menu	db 13, 10, "0) show menu"
			db 13, 10, "1) input number X"
			db 13, 10, "2) print binary unsigned"
			db 13, 10, "3) print binary signed"
			db 13, 10, "4) print decimal unsigned"
			db 13, 10, "5) print decimal signed"
			db 13, 10, "6) print hex unsigned"
			db 13, 10, "7) print hex signed"
			db 13, 10, "8) exit$"
	welcome db 13, 10, "chose an option: $"
	FUNC     dw input_x_1, out_bu_2, out_bs_3, out_du_4, out_ds_5, out_hu_6, out_hs_7
	X        dw 10
	         db "$"
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DSEG, SS:SSEG
	
read:
	mov dx, offset welcome
	mov ah, 09h
	int 21h
	
	mov ah, 07h
	int 21h
	mov bl, al
	mov dl, al
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	mov dl, 10
	mov ah, 02h
	int 21h
	
	cmp bl, 30h	
	je print_menu
	cmp bl, 38h
	je exit
	jg read
	
	dec bl
	mov bh, 0
	sub bx, 30h

	mov si, bx
	call FUNC[si]
	jmp read
	
print_menu:
    mov ah, 9h
	mov dx, OFFSET menu
	int 21h
	jmp read
main:
    mov ax, DSEG
	mov ds, ax
	jmp print_menu

exit:
    mov ah, 4ch
	mov al, 0
	int 21h
    
CSEG ENDS
PUBLIC X
END main

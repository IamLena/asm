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
	menu_str db 13, 10
			 db "0 - show menu;"
			 db 13, 10
			 db "1 - input number X;"
			 db 13, 10
			 db "2 - print binary unsigned;"
			 db 13, 10
			 db "3 - print binary signed;"
			 db 13, 10
			 db "4 - print decimal unsigned;"
			 db 13, 10
			 db "5 - print decimal signed;"
			 db 13, 10
			 db "6 - print hex unsigned;"
			 db 13, 10
			 db "7 - print hex signed;"
			 db 13, 10
			 db "8 - exit."
			 db 13, 10
			 db "$"
	FUNC     dw out_bu_2, out_bs_3, out_du_4, out_ds_5, out_hu_6, out_hs_7
	X        dw 10
	         db "$"
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DSEG, SS:SSEG

call_input:
    call input_x_1
	;jc error_message
    jmp print_menu	

error_message:
    mov ah, 9h
	mov dx, OFFSET error_str
	int 21h
	jmp print_menu
	
read:
	mov ah, 07h
	int 21h
	cmp al, 30h	
	je print_menu
	cmp al, 38h
	je exit
	jg error_message
	cmp al, 31h
	je call_input
	mov ah, 0
	sub ax, 32h
	mov dl, 2
	mul dl
	mov si, ax
	call FUNC[si]
	jmp print_menu
	
print_menu:
    mov ah, 9h
	mov dx, OFFSET menu_str
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

bits 16 
org 0x7c00
boot:
	mov si,options
.loop:	
	call print
	jz getOption
	jmp .loop
halt:
	cli 
	hlt 

options:
	db "What pizza do you want",13,10
	db "1: Pizza salami",13,10
	db "2: Pizza hawaii",13,10
	db "3: Pizza kipspinazie",13,10,0

print:
	.loop:
		mov ah,0x0e
		lodsb
		int 0x10
		or al,0
		je .done
		jmp .loop
	.done:
		ret

printChar:
	mov bh,0
	mov ah, 0ah
	int 10H
	ret

getOption:
	mov ah,00h
	int 16H
	cmp al,49
	je printOptionSalami
	cmp al,50
	je printOptionHawaii
	cmp al,51
	je printOptionKipSpinazie
	ret

printOptionHawaii:
	mov si,optionHawaii
	call print
	call halt

printOptionSalami:
	mov si,optionSalami
	call print	
	call halt

printOptionKipSpinazie:
	mov si,optionKipSpinazie
	call print
	call halt

optionHawaii:
	db "",13,10
	db "May you rot in hell",13,10,0

optionSalami:
	db "",13,10	
	db "Good choise",13,10,0

optionKipSpinazie:
	db "",13,10
	db "fdfsdf",13,10,0

times 510 - ($-$$) db 0 
dw 0xaa55 

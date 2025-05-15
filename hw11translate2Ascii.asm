	SECTION .data
inputBuffer:
	db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
	byteCount  equ 8; 8 bytes

hexTable:
	db '0123456789ABCDEF'	; lookup table for hex digits

	SECTION .bss
outputBuffer:
	resb 40			; reserve space for output

	SECTION .text
	global _start
_start:
	mov ecx, byteCount	; loop counter set to byteCount 
	mov esi, inputBuffer	; source index is input buffer
	mov edi, outputBuffer	; destination index is output buffer
	mov ebx, hexTable	; base address at hex trable
ascii_loop:
	;; put into 2 halves of bits, (7-4, 3-0) for each hex char
	;;  high nibble
	mov al, [esi]		; load one input byte
	shr al, 4		; bits 7-4
	mov dl, [ebx + eax]	; write hex character to the output buffer
	mov [edi], dl
	inc edi			

	;; low nibble
	mov al, [esi]		; same input byte into al
	and al, 0x0F		; 3-0 bits
	mov dl, [ebx + eax]	; look up ascii char
	mov [edi], dl		; write 2nd hex char
	inc edi

	; add space unless done
	dec ecx			; dec byte count
	jz  finished_ascii	; if 0, go to finished
	mov byte [edi], ' '	; else, add space
	inc edi			

	inc esi                 ; point to next input buffer byte
	jmp ascii_loop		; repeat

finished_ascii:
	; write newline
	mov byte [edi], 0x0A	
	inc edi			; past the newline

	mov edx, edi                 ; copy edi to edx
	sub edx, outputBuffer        ; get length of buffer
	mov ecx, outputBuffer        ; point at start of data
	mov ebx, 1                   ; standard output
	mov eax, 4                   ; sys_write
	int 0x80		     ; write(1, outputBuffer, len)

	xor ebx, ebx 		     ; zero out
 	mov eax, 1                   ; sys exit
	int 0x80

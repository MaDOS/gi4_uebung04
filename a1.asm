SECTION .data
msg_input_format DB "%d", 0x0
msg_input DB "x=", 0x0
msg_output DB "%d!=%d", 0xA, 0x0

SECTION .bss
x RESD 1

SECTION .text
global _start
extern printf
extern scanf

_start:
push ebp
mov ebp, esp

	push msg_input
	call printf
	add esp, 0x4 * 0x1

	push x
	push msg_input_format
	call scanf
	add esp, 0x4 * 0x2

	push dword [x]
	call fak
	add esp, 0x4 * 0x1

	push eax
	push dword [x]
	push msg_output
	call printf
	add esp, 0x4 * 0x3

leave
mov ebx, 0x0
mov eax, 0x1
int 0x80

fak:;(int x)
push ebp
mov ebp, esp
	mov eax, dword[ebp + 0x8]
	mov ecx, eax
	cmp eax, 0x0
	JG fak_calc
	mov eax, 0x1
	JMP fak_end
fak_calc:
	cmp ecx, 0x3
	JL fak_end
	dec ecx
	imul ecx
	JMP fak_calc
fak_end:
leave
ret

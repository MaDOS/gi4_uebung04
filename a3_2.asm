SECTION .data
a TIMES 10 DD 0

SECTION .text
global _start

_start:
push ebp
mov ebp, esp

	mov ecx, 0
loop:
	inc ecx

	mov dword [ a + 0x4 * ecx ], ecx

	cmp ecx, 10
	JL loop


leave
mov ebx, 0
mov eax, 1
int 0x80

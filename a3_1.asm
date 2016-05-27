SECTION .data
a DD 0
b DD 7

SECTION .text
global _start

_start:
push ebp
mov ebp, esp

	mov eax, dword[ a ]
	inc eax

	jz azero
	mov ebx, 1
	jmp end
azero:
	mov ebx, 0
	jmp end

end:
	mov dword[ b ], ebx

mov esp, ebp
pop ebp

mov ebx, 0
mov eax, 1
int 0x80

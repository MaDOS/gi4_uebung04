SECTION .data
msg_input DB "F(n) | n=",0
msg_input_format DB "%d",0
msg_output DB "F(%d) = %lu",10,0

SECTION .bss
ergebnis RESQ 1
n RESD 1
curr RESQ 1
last RESQ 1

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

	push n
	push msg_input_format
	call scanf
	add esp, 0x4 * 0x2

	push dword [n]
	call fib
	add esp, 0x4 * 0x1

	push dword [ergebnis]
	push dword [ergebnis + 0x4]
	push dword [n]
	push msg_output
	call printf
	add esp, 0x4 * 0x4

mov ebx, 0
mov eax, 1
int 0x80
leave
ret

fib:;(int n) returns: long ergebnis
push ebp
mov ebp, esp
pusha

	mov dword [ergebnis], 0x0
	mov dword [ergebnis + 0x4], 0x0
	mov dword [curr], 0x0
	mov dword [curr + 0x4], 0x1
	mov dword [last], 0x0
	mov dword [last + 0x4], 0x1

	mov eax, dword [ebp + 0x8]
	mov ecx, 0x3

	cmp eax, 0x0				; n < 0 ? invalid arg -> ergebnis = 0
	JL fib_OV
	cmp eax, 0x2				; n <= 2 ? ergebnis = (n+1)>> 1 : calc
	JNLE fib_calc
	inc eax
	shr eax, 1
	mov dword [ergebnis], 0x0
	mov dword [ergebnis + 0x4], eax
	JMP fib_end

fib_calc:
	mov eax, dword [curr + 0x4]			;|ergebnis = curr + last
	add eax, dword [last + 0x4]			; |
	mov dword [ergebnis + 0x4], eax			; |
	mov eax, dword [curr]				; |
	adc eax, dword [last]				; |
	mov dword [ergebnis], eax			; |
	JO fib_OV					;Overflow: ergebnis exceeds 64bit range
	mov eax, dword [curr + 0x4]			;|last = curr
	mov dword[last + 0x4], eax			; |
	mov eax, dword [curr]				; |
	mov dword [last], eax				; |
	mov eax, dword[ergebnis + 0x4]			;|curr = ergebnis
	mov dword[curr + 0x4], eax			; |
	mov eax, dword [ergebnis]			; |
	mov dword[curr], eax				; |

	inc ecx
	cmp ecx, dword [n] 					;loop header
	JLE fib_calc
	JMP fib_end

fib_OV:
	mov dword [ergebnis], 0x0
	mov dword [ergebnis + 0x4], 0x0
	JMP fib_end

fib_end:
popa
leave
ret

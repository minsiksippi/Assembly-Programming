TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
INCLUDE hw2.inc

.code
main PROC

mov eax,0
mov ebx,1
mov edx,1
mov ecx, fib


L1:
	mov ebx,eax
	add eax,edx
	mov edx,ebx

Loop L1

call DumpRegs
INVOKE ExitProcess,0
main ENDP

END main

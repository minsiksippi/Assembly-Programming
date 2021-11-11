TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
INCLUDE hw1.inc
result DWORD 0

.code
main PROC

mov ecx, LENGTHOF array1 - 1
mov esi, OFFSET array1

L1:
	mov eax, [esi]
	mov ebx, [esi + 4]
	
	sub ebx,eax
	add result,ebx
	add esi, 4
	mov edx, result
	Loop L1

mov eax, edx

call DumpRegs
INVOKE ExitProcess,0
main ENDP
END main

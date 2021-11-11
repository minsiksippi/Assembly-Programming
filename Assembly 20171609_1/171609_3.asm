TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
INCLUDE hw3.inc
count DWORD 0
result1 DWORD 0
result2 DWORD 0

.code
main PROC

mov eax,X
mov ecx,Y
mov edx, eax
mov ebx, 0

L1:
	mov count, ecx
	mov ecx, eax
	mov result1,edx
	
L2:	
	add result1,ebx
	Loop L2
    sub result1, ebx

	mov ecx, count
	mov ebx,result1
	mov edx, result1
    
	Loop L1


mov eax,Y
mov ecx,X
mov edx, eax
mov ebx, 0

L3:
	mov count, ecx
	mov ecx, eax
	mov result2,edx
L4:
	add result2,ebx
	Loop L4
	 sub result2, ebx

	mov ecx, count
	mov ebx,result2
	mov edx, result2
	Loop L3

mov eax, result1
mov ebx, result2

call DumpRegs
INVOKE ExitProcess,0
main ENDP

END main



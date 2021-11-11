TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
var1 BYTE "65", 0

.code
main PROC

mov edx, offset var1
mov ecx, LENGTHOF var1 - 1
mov eax,0

L1:
mov ebx, eax 
add eax, eax  
add eax, ebx
add eax, eax
add eax, ebx 

add al, [edx]  
sub al, 30h  
inc edx  
loop L1

call DumpRegs
exit
main ENDP
END main
TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
str1 BYTE "1. x AND y" ,0dh,0ah
   BYTE "2. x OR y" ,0dh,0ah
   BYTE "3. NOT x" ,0dh,0ah
   BYTE "4. x XOR y" ,0dh,0ah
   BYTE "5. Exit program", 0dh,0ah,0dh,0ah ,0
   

str2 BYTE "Enter x: ",0
str3 BYTE "Enter y: ",0
str4 BYTE "Choose Calculation Mode : ",0

msgAND BYTE "Result of x AND y : ", 0
msgOR BYTE "Result of x OR y : ", 0
msgNOT BYTE "Result of NOT x : ", 0
msgXOR BYTE "Result of x XOR y : ", 0

temp DWORD ?
tmp2 byte ?
numm BYTE 1 DUP(?)

msgbye BYTE "Bye!", 0
msgReturn BYTE "Do you want to change the mode(Y/N)? : ", 0
msgYN BYTE 1 DUP(?)
msgInputYN BYTE 1 DUP(?)

caseTable BYTE 0                            
       
EntrySize = ($ - caseTable)
   BYTE 1
   DWORD AND_op
   BYTE 2
   DWORD OR_op
   BYTE 3
   DWORD NOT_op
   BYTE 4
   DWORD XOR_op
NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC

Initial:
    call crlf
    mov edx, OFFSET str1
    call WriteString

Loop1:   
    mov edx, OFFSET str4
    call WriteString
    mov edx, OFFSET numm
    call ReadDec
    clc
    mov edi, eax
    call Correctt 
    JNZ Loop1 
    
Loop2:
    mov eax, edi
    ;call dumpregs
    Call Func1
    jc Loop4

Loop3:
    call crlf

    mov edx, OFFSET msgReturn
    call WriteString
    
    mov edx, OFFSET msgYN
    mov ecx, 4
    call ReadString
    
    mov edx, OFFSET msgYN
    cmp [msgYN], 'N'
    je Loop2
    cmp [msgYN], 'Y'
    je Initial

    Jmp Loop3

Loop4:
    call crlf
   mov edx, OFFSET msgbye
   call WriteString
   exit
main ENDP


Func1 PROC
   cmp al, '5'
   je L3

   mov ebx,OFFSET caseTable
   mov ecx,NumberOfEntries

L1:
   cmp al,[ebx]
   jne L2
   call NEAR PTR [ebx + TYPE caseTable] 
   jmp L4

L2:
   add ebx,EntrySize
   loop L1

L3:
   stc

L4:
   ret
Func1 ENDP


AND_op PROC
   call PrintFunc
   
   mov edx, OFFSET msgAND
   call WriteString

   AND eax, ebx
   call WriteHex
   call crlf
   ret
AND_op ENDP


OR_op PROC
   call PrintFunc
   
   mov edx, OFFSET msgOR
   call WriteString
   OR eax, ebx
   call WriteHex
   call crlf
   ret
OR_op ENDP


NOT_op PROC
   mov edx, OFFSET str2
   call WriteString
   call ReadHex         
   NOT eax
   mov edx, OFFSET msgNOT
   call WriteString
   call WriteHex
   call crlf
   ret
NOT_op ENDP


XOR_op PROC
   call PrintFunc
   
   mov edx, OFFSET msgXOR
   call WriteString

   XOR eax, ebx
   call WriteHex
   call crlf
   ret
XOR_op ENDP

Correctt PROC
    cmp al,1
    jb LL1
    cmp al,5
    ja LL1
    test ax,0    
   
    LL1: ret
Correctt ENDP


PrintFunc PROC
    mov edx, OFFSET str2
    call WriteString

    call ReadHex     
    mov ebx, eax

    mov edx, OFFSET str3
    call WriteString
    call ReadHex
    ret
PrintFunc ENDP


END main
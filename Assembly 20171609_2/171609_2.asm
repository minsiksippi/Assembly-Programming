TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
temp DWORD ?
msgSize DWORD ?
var2 DWORD ?
var3 DWORD 1
msg1 BYTE "Enter a Multiplier : ", 0
msg2 BYTE "Enter a Multiplicand : ", 0
msg3 BYTE "Produce : ", 0
msg4 BYTE "Bye!", 0

.code
main PROC  
mov eax, 1
mov var2, 1
mov var3, 1

Loop1:
    mov eax, 1
    mov ebx, eax
    mov edx,OFFSET msg1
    mov msgSize, edx
    call WriteString
    call ReadHex
    jc Loop2 
   
    mov ebx,eax
    mov edx,OFFSET msg2
    call WriteString
    call ReadHex
    jc Loop2

    mov ecx, 32
    mov var2, 1
    mov edx, eax
    mov edx, eax
    mov temp,eax
    mov eax, 0
 
Loop3:
    shr edx, 1
    mov var2, edx
    jnc Loop4
    add eax, ebx
    mov var3, eax
    mov temp,eax

Loop4:
    shl ebx, 1
    loop Loop3

    LLoop4:
        mov edx,OFFSET msg3 
        mov msgSize, edx
        call WriteString
        call WriteHex 
        call CRLF
        jmp Loop1 

Loop2: 
    mov edx,OFFSET msg4
    call WriteString 

main ENDP
END main
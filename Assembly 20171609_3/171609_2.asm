TITLE TEST code : My First Assembly Code

INCLUDE Irvine32.inc

Get_frequencies PROTO,sttr:PTR BYTE, ttab:PTR DWORD   

.data
target BYTE "AAEBDCFBBC",0
freqTable DWORD 256 DUP(0)
msgcolon BYTE ": ", 0
temp DWORD ?

.code
main PROC
    INVOKE Get_frequencies, ADDR target, ADDR freqTable
    mov ecx, LENGTHOF freqTable 
    mov edx, OFFSET target
    mov ebx, 0 
    mov esi, OFFSET freqTable
    
L1:    
    mov eax,[esi] 
    mov temp, eax
    cmp eax,0  
    jbe L2  

    mov eax,ebx   
    call WriteChar

    mov edx,OFFSET msgcolon  
    call WriteString

    mov eax, [esi] 
    mov temp, eax
    call WriteDec
    call Crlf

L2:
    add esi, TYPE freqTable 
    mov temp, esi
    add ebx, 1 
    loop L1

    call Crlf
    exit

main ENDP

Get_frequencies PROC, sttr:PTR BYTE, ttab:PTR DWORD  
        mov esi, sttr
        mov edi, ttab
         
    Loop1: 
        mov eax,0 
        mov temp, eax
        mov al, [esi]
        add esi, 1

        cmp al,0 
        je  Loop2 
        
        shl eax,2 
        mov temp, eax
        inc DWORD PTR [edi + eax]   
        jmp Loop1   

    Loop2:
        ret

Get_frequencies ENDP

END main
TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc

.data
msg1 BYTE "Type_A_String: ",0
msg2 BYTE "A_Word_for_Search: ",0
msgChange BYTE "Changed : ",0
msgBye BYTE "Bye!",0
tempmsg BYTE 50 DUP(0)
result BYTE 40 DUP(0)

msg3 BYTE "F", 0
msg4 BYTE "T", 0
Success BYTE "Found",0
Fail BYTE "Not found",0

check DWORD ?
len_msg2 DWORD ? 
len_word DWORD ? 
wordTemp DWORD ?
wordSize DWORD ?


.code
main PROC
    mov eax, 1
    mov wordTemp, 0
    mov wordSize, 0
    mov edi, 0

Loop1:

    Loop2:
         mov edx, OFFSET msg1
         call WriteString
         mov edx, OFFSET tempmsg
         mov ecx, SIZEOF tempmsg - 1
         call ReadString
         mov wordTemp, 1
         cmp eax, 28h
         ja Loop2

    cmp eax,edi
    je ByeLoop
    ;;;;;;go to end

    mov len_word, eax
    mov edx, OFFSET msg2
    mov wordTemp, OFFSET msg3
    mov wordSize, SIZEOF msg3 -1
    call WriteString

    LoopSt :
        mov edx,OFFSET result
        mov ecx,SIZEOF result - 1
        call ReadString
        mov ebx,eax
        mov len_msg2,ebx
        cmp eax,edi
        je ByeLoop 

    LoopCancel :
        mov esi,0 
        mov edi,0 
        mov wordTemp, 0
        mov wordSize, 0
        mov ebx,0 
    
    Loop3 :
        cmp edi, len_word  
        jae NotLoop    
        mov al,tempmsg[edi]
        cmp al, 20h 
        jne Loop4 
        inc edi 
        jmp Loop3

    Loop4 :
        add ebx, 1     
        add edi, 1
        mov al,tempmsg[edi]                        
        cmp al, 20h 
        je Loop5 
        cmp al, 0 

        LLoop4 :
            je Loop5
            jmp Loop4 

    Loop5 :
        cmp ebx, len_msg2
        je Loop6 
        mov ebx,0 
        jmp Loop3

    Loop6 :
        push edi
        sub edi, ebx 
        mov ecx, ebx

    Loop7 :   
        mov al, tempmsg[edi]
        cmp al, result[esi]
        jne Loop8  
        add edi, 1
        add esi, 1
        loop Loop7                                 
        jmp Loop9   
        
    Loop8:
        pop edi
        add edi, 1
        mov esi,0
        mov ebx,0
        jmp Loop3

    Loop9 :      
        mov edx,OFFSET Success  
        call WriteString
        call CRLF
        mov edx,OFFSET msgChange  
        call WriteString
        jmp Loop10 

    Loop10 : 
        mov al,tempmsg[edi]
        cmp al,0
        je Loop12 

        LLoop10:
            sub edi,len_msg2 
            mov esi,edi 
            mov check, esi
            add esi,len_msg2
            mov ecx, len_word 
            mov check, ecx
            sub check, 1
            sub ecx, edi               
            sub ecx, len_msg2
            add ecx, 1 

    Loop11:
        mov al,tempmsg[esi + 1]
        mov tempmsg[edi],al
        add esi, 1
        add edi, 1
        loop Loop11
        mov check, edi
        add check, esi
        mov tempmsg[esi],0
        jmp Loop13

    Loop12:
        sub edi, len_msg2
        mov tempmsg[edi], 0
        jmp Loop13

    Loop13 :
        mov edx,OFFSET tempmsg 
        call WriteString
        call CRLF

        LLoop13:
            mov eax, 1
            mov edi, 0
            jmp Loop1         
 
    NotLoop :
        mov edx, OFFSET Fail 
        call WriteString
        call CRLF

        ;mov edx, OFFSET msg3
        mov edx, OFFSET msgChange 
        call WriteString

        ;mov edx, OFFSET msg4
        mov edx, OFFSET tempmsg  
        call WriteString
        call CRLF

        mov eax, 1
        add eax, 1
        sub eax, 1
        mov edi, 0
        jmp Loop1  

    ByeLoop: 
        mov edx, OFFSET msgBye
        call WriteString 

    Loop14 :
        mov check, 0
        mov wordTemp, 0
        mov wordSize, 0

main ENDP
END main
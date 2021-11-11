TITLE TEST code : My First Assembly Code

INCLUDE Irvine32.inc

.data
INCLUDE hw4.inc

.code
main PROC
    mov esi,0
    mov edi,LENGTHOF source - 1
    mov ecx,SIZEOF source
    mov target[edi],0
    SUB edi,1

L1:
    mov al,source[esi]
    mov target[edi],al
    inc esi
    dec edi
    loop L1

    mov edx, OFFSET target
    call WriteString

    exit
    main ENDP
END main
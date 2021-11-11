TITLE TEST code : My First Assembly Code

INCLUDE irvine32.inc
.data

INCLUDE hw3.inc

EvenLen DWORD ?
EvenData DWORD 100 DUP(?) 

HolLen DWORD ?
HolData DWORD 100 DUP(?)

NewLen DWORD ?
NewData DWORD 100 DUP(?)
string1 BYTE "Before order : ",0
string2 BYTE "After order : ",0

.code
main PROC	
	mov edx, OFFSET string1
	call WriteString
	mov ecx, LenData
	cmp ecx, 1
	je ONE
	mov edx, OFFSET ArrData
	dec ecx	
	call print_num	

	mov eax, LenData
	AND eax, 1h
	cmp eax,0
	je EVENL

	mov edx, OFFSET ArrData +4
	mov esi, OFFSET EvenData 
	mov eax, LenData
	mov NewLen, eax
	shr eax, 1
	mov ecx, eax
	mov EvenLen, eax
	mov HolLen, eax
	
	inc HolLen
	Loop1:
		mov eax,[edx]
		add edx, 8
		mov [esi], eax
		add esi,4
		Loop Loop1

	mov eax, LenData
	shr eax, 1
	mov ecx, eax
	mov esi, OFFSET EvenData 
	Loop2 :	
		add esi,4
		Loop Loop2
		

	mov edx, OFFSET ArrData
	mov esi, OFFSET HolData 
	mov eax, LenData
	shr eax, 1
	add eax, 1
	mov ecx, eax

	Loop3:
		mov eax,[edx]
		add edx, 8
		mov [esi], eax
		add esi,4
	
		Loop Loop3

	mov eax, LenData
	shr eax, 1
	add eax, 1
	mov ecx, eax
	mov esi, OFFSET HolData 

	Loop4:
		add esi,4
		Loop Loop4
	;pushad	

mov ecx, HolLen
mov edx, OFFSET HolData
dec ecx	

LL1:	
	mov eax,[edx]	
	XOR ax,0FFFFh	
	mov esi, edx	
	pushad			

LL2:
	add edx,4		
	mov ebx,[edx]	
	XOR bx, 0FFFFh	
	cmp eax, ebx	
	jna	CCONTINUE	
	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
CCONTINUE:
	loop LL2
	popad
	add edx,4	
	loop LL1

mov ecx, EvenLen
cmp ecx, 1
je JUM4
mov edx, OFFSET EvenData
dec ecx	

L3:
	mov eax,[edx]
	mov esi, edx	
	pushad
L4:
	add edx,4	
	mov ebx,[edx]		
	cmp eax, ebx	
	ja	CONTINUE2	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
CONTINUE2:
	loop L4
	popad
	add edx,4	
	loop L3

mov ecx, EvenLen
mov edx, OFFSET EvenData
dec ecx	

L1:	
	mov eax,[edx]	
	XOR ax,0FFFFh	
	mov esi, edx	
	pushad			

L2:
	add edx,4		
	mov ebx,[edx]	
	XOR bx, 0FFFFh	
	cmp ebx, eax	
	jna	CONTINUE	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
CONTINUE:
	loop L2
	popad
	add edx,4	
	loop L1

JUM4:

mov ecx, NewLen
mov edx, OFFSET NewData
mov esi, OFFSET HolData

Loop10:
	mov eax,[esi]
	mov [edx],eax
	add edx, 8
	add esi,4
	Loop Loop10

mov ecx, NewLen
mov edx, OFFSET NewData
mov edi, OFFSET EvenData
add edx,4
Loop11:
	mov eax,[edi]
	mov [edx],eax
	add edx,8
	add edi,4
	Loop Loop11

jmp ENDL

EVENL:

mov edx, OFFSET ArrData +4
	mov esi, OFFSET EvenData 
	mov eax, LenData
	mov NewLen, eax
	shr eax, 1
	mov ecx, eax
	mov EvenLen, eax
	mov HolLen, eax
	
	ELoop1:
		mov eax,[edx]
		add edx, 8
		mov [esi], eax
		add esi,4
		Loop ELoop1
		
	mov eax, LenData
	shr eax, 1
	mov ecx, eax
	mov esi, OFFSET EvenData 

	ELoop2 :
		add esi,4
		Loop ELoop2

	mov edx, OFFSET ArrData
	mov esi, OFFSET HolData 
	mov eax, LenData
	shr eax, 1
	add eax, 1
	mov ecx, eax

	ELoop3:
		mov eax,[edx]
		add edx, 8
		mov [esi], eax
		add esi,4
		Loop ELoop3

	mov eax, LenData
	shr eax, 1
	add eax, 1
	mov ecx, eax
	mov esi, OFFSET HolData 

	ELoop4:
		add esi,4
		Loop ELoop4

mov ecx, EvenLen
mov edx, OFFSET EvenData
cmp ecx, 1
je JUM1
dec ecx	

EL3:
	mov eax,[edx]
	mov esi, edx	
	pushad
EL4:
	add edx,4	
	mov ebx,[edx]		
	cmp eax, ebx
	ja	ECONTINUE2	
	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
ECONTINUE2:
	loop EL4
	popad
	add edx,4	
	loop EL3

mov ecx, EvenLen
mov edx, OFFSET EvenData
dec ecx	

EL1:	
	mov eax,[edx]	
	XOR ax,0FFFFh	
	mov esi, edx	
	pushad			

EL2:
	add edx,4		
	mov ebx,[edx]	
	XOR bx, 0FFFFh	
	cmp ebx, eax	
	jna	ECONTINUE	
	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
ECONTINUE:
	loop EL2
	popad
	add edx,4	
	loop EL1

JUM1:
	
mov ecx, HolLen
cmp ecx, 1
je JUM2
mov edx, OFFSET HolData
dec ecx	

ELL1:	
	mov eax,[edx]	
	XOR ax,0FFFFh	
	mov esi, edx	
	pushad			

ELL2:
	add edx,4		
	mov ebx,[edx]	
	XOR bx, 0FFFFh	
	cmp eax, ebx	
	jna	ECCONTINUE	
	
	mov eax, [esi]	
	mov edi, [edx]	
	mov [esi], edi	
	mov [edx], eax
	mov eax, ebx
	
ECCONTINUE:
	loop ELL2
	popad
	add edx,4	
	loop ELL1

JUM2:
	
mov ecx, NewLen
mov edx, OFFSET NewData
mov esi, OFFSET HolData

ELoop10:
	mov eax,[esi]
	;call WriteHex
	;call crlf
	mov [edx],eax
	add edx, 8
	add esi,4
	Loop ELoop10


mov ecx, NewLen
mov edx, OFFSET NewData
mov edi, OFFSET EvenData
add edx,4

ELoop11:
	mov eax,[edi]
	;call WriteHex
	;call crlf
	mov [edx],eax
	add edx,8
	add edi,4
	Loop ELoop11

ENDL:
	mov edx, OFFSET string2
	call WriteString
	popad
	mov edx, OFFSET NewData
	mov ecx, NewLen
	dec ecx
	call print_num
	jmp ENN

ONE:
	mov edx, OFFSET ArrData
	mov eax, [edx]
	call WriteHex
	call crlf

	mov edx, OFFSET string2
	call WriteString
	mov edx, OFFSET ArrData
	mov eax, [edx]
	call WriteHex

ENN:
	INVOKE ExitProcess, 0

main ENDP	

print_num PROC
	pushad

P:	
	mov eax, [edx]	
	add edx, 4		
	call WriteHex	
	mov al,","		
	call Writechar
	loop P

	mov eax, [edx]	
	add edx, 4		
	call WriteHex	
	call Crlf	
	popad

	ret
print_num ENDP

END main
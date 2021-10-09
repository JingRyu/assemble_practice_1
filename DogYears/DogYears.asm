TITLE Dog Years Calculator     (DogYears.asm)

; Author: Jing Liu
; Last Modified: Now!
; OSU email address: ONID_ID@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number:                 Due Date:
; Description: This file is provided as a template from which you may work
;              when developing assembly projects in CS271.

include irvine32.inc

DOG_FACTOR = 7

.data

userName BYTE 33 DUP(0)  ;string to be entered by user
userAge DWORD ?			; Integer to be entered by user
intro_1 BYTE "Hi, my name is Jing, and I'm here to tell you your age in dog years!", 0
prompt_1 BYTE "What's your name£¿ ", 0
intro_2 BYTE "Nice to meet you", 0
prompt_2 BYTE "What's your age? ", 0
dogAge DWORD ? ; to be calculated
result_1 BYTE "Wow, that's ", 0
result_2 BYTE " in dog years!", 0
goodBye BYTE "So long and farewell, ", 0

.code
main PROC

; Introduce programmer
	mov EDX, OFFSET intro_1
	call WriteString
	call CrLf

; Get user name
	mov edx, OFFSET prompt_1
	call WriteString
	mov edx, OFFSET userName
	mov ecx, 32
	call ReadString

; Get user age
	mov edx, OFFSET prompt_2
	call WriteString
	call ReadDec
	mov userAge, eax

; Calculate age in dog years
	mov eax, userAge
	mov ebx, DOG_FACTOR
	mul ebx
	mov dogAge, eax

; Report the result
	mov edx, OFFSET result_1
	call WriteString
	mov eax, dogAge
	call WriteDec
	mov edx, OFFSET result_2
	call WriteString
	call CrLf

; Say goodbye
	mov EDX, OFFSET goodBye
	call WriteString
	mov EDX, OFFSET userName
	call WriteString
	call CrLf

	Invoke ExitProcess,0	; exit to operating system
main ENDP

END main

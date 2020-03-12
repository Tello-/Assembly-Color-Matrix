;-----------------------------------------------------------------------------------------
;Student: Josh Lollis
;Class: CSCI 241
;Instructor: Ding
;Assignment: Chapter 5, Pr 8
;Due Date: 3/5/2020

;Description:
;This program displays each combination of the 16 foreground and 16 background colors of cmd.exe
;-----------------------------------------------------------------------------------------

; Symbolic Constants::::
columns = 16
rows = 16
defaultColor = 08h ; Light Grey on Black
; ::::::::::::::::::::::

INCLUDE Irvine32.inc
.data

	colorTheme		BYTE	1 dup(0)
	character		BYTE	"X", 0			; Had to allocate memory in order for edx to have something to point to

.code
main PROC
	
	mov ecx,rows ; set outer loop count
	L1:
		movzx ax, colorTheme 
		call SetTextColor

		mov ebx, ecx ; hold onto outer loop count
		mov ecx,columns ; set inner loop count
		
		L2:	
			movzx ax, colorTheme
			call SetTextColor
			mov edx, OFFSET character
			call WriteString
			inc colorTheme
		loop L2 ; repeat the inner loop	
		
		call CRLF 
		mov eax, 150
		call DELAY

		mov ecx, ebx ; restore outer loop cout

	loop L1 ; repeat the outer loop
	 
	mov colorTheme, defaultColor
	movzx ax, colorTheme ; return cmd.exe to its original theme
	call SetTextColor

	exit
main ENDP

END main
;B Mohlamonyane 224504217
;M Ngalo 224054505
;NZ Mashabane 224345933
;N Shivambu  223695523
;RX Chauke  223149308
;k Mophuthing 224518307

status equ 03h
porta equ 05h
portb equ 06h
trisa equ 85h
trisb equ 86h

org 0000h
	goto init

init
	bsf status, 5
	movlw 0xff
	movwf trisa
	;bcf status, 5

	;bsf status, 5
	movlw 0x00
	movwf trisb
	bcf status, 5
	goto main


main:
	movlw 0x00
	movwf portb

	btfsc porta, 0
	call switch_led_1
	;movlw 0xff
	;movwf portb

	btfsc porta, 1
	call switch_led_2

	goto main

switch_led_1:
	bsf portb, 0
	btfsc porta, 0
	goto switch_led_1
	return

switch_led_2:
	bsf portb, 1
	btfsc porta, 1
	goto switch_led_2
	return
end
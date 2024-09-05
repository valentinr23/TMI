.include "m328pdef.inc"
.cseg
.org 0x00

; Config. incial de los pines
ldi r16, 0xFF  ;configura los pinD 0 a 7 como salida 0b11111100
out DDRD, r16  ;escribe en DDRD

ldi r16, 0x0F   ;los pines 0 a 3 como salida 0b0000 1111
out DDRB, r16

;Aseguramos que inicializa PORTD como apagado
ldi r16, 0x00
out PORTD, r16
out PORTB, r16


;Bucle principal
main_loop:
          ;Cara Feliz
          ldi r17, 0x07   ;0b0000 0000 fila 1
          ldi r16, 0xC3   ;0b1100 0011
          out PORTB, r17  ;selecciona la fila 1
          out PORTD, r16  ;Prende los leds fila 1
          call delay

          ldi r17, 0x06   ;0b0000 0001 fila 2
          ldi r16, 0x99   ;0b1001 1001
          out PORTB, r17  ;selecciona la fila 2
          out PORTD, r16  ;Prende los leds fila 2
          call delay

          ldi r17, 0x05   ;0b0000 0010 fila 3
          ldi r16, 0xBD   ;0b1100 0010
          out PORTB, r17  ;selecciona la fila 3
          out PORTD, r16  ;Prende los leds fila 3
          call delay

          ldi r17, 0x04   ;0b0000 0011 fila 4
          ldi r16, 0x00   ;0b0000 0000
          out PORTB, r17  ;selecciona la fila 4
          out PORTD, r16  ;Prende los leds fila 4
          call delay

          ldi r17, 0x03   ;0b0000 0100 fila 5
          ldi r16, 0xFF   ;0b1111 1111
          out PORTB, r17  ;selecciona la fila 5
          out PORTD, r16  ;Prende los leds fila 5
          call delay

          ldi r17, 0x02   ;0b0000 0101 fila 6
          ldi r16, 0xDB   ;0b1101 1011
          out PORTB, r17  ;selecciona la fila 6
          out PORTD, r16  ;Prende los leds fila 6
          call delay

          ldi r17, 0x01   ;0b0000 0110 fila 7
          ldi r16, 0xDB   ;0b1101 1011
          out PORTB, r17  ;selecciona la fila 1
          out PORTD, r16  ;Prende los leds fila 1
          call delay

          ldi r17, 0x00   ;0b0000 0110 fila 7
          ldi r16, 0xDB   ;0b1101 1011
          out PORTB, r17  ;selecciona la fila 1
          out PORTD, r16  ;Prende los leds fila 1
          call delay

          rjmp main_loop ;repite el bucle principal




;Rutina de retardo
delay:
      ldi r20,30  ;contador externo
      ldi r19,1  ;contador medio
      ldi r18,1    ;contador interno
L1:
   dec r20 ;decrementa el contador externo
   brne L1 ;repite si r20 no es 0
   dec r19 ;decrementa el contador medio
   brne L1 ;repite si r19 no es 0
   dec r18 ;decrementa el contador interno
   brne L1 ;repite si r18 no es 0
   ret     ;sale de la rutina de retardo


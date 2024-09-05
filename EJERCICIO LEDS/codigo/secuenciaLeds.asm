.include "m328pdef.inc"
.cseg
.org 0x00

; Config. incial de los pines
ldi r16, 0xFF  ;configura los pinD 0 a 7 como salida 0b11111100
out DDRD, r16  ;escribe en DDRD


;Aseguramos que inicializa PORTD como apagado
ldi r16, 0x00
out PORTD, r16



;Bucle principal
main_loop:
          ;SECUENCIA 1
          ldi r16, 0xFE   ;0b11111110
          out PORTD, r16  ;Prende el led 1
          call delay

          ldi r16, 0xFD   ;0b11111101
          out PORTD, r16  ;Prende el led 2
          call delay

          ldi r16, 0xFB   ;0b11111011
          out PORTD, r16  ;Prende el led 3
          call delay

          ldi r16, 0xF7   ;0b11110111
          out PORTD, r16  ;Prende el led 4
          call delay

          ldi r16, 0xEF   ;0b11101111
          out PORTD, r16  ;Prende el led 5
          call delay

          ldi r16, 0xDF   ;0b11011111
          out PORTD, r16  ;Prende el led 6
          call delay

          ldi r16, 0xBF   ;0b10111111
          out PORTD, r16  ;Prende el led 7
          call delay

          ldi r16, 0x7F  ;0b01111111
          out PORTD, r16 ;Prende el led 8
          call delay     ;llama a la rutina de delay


          ;SECUENCIA 2
          ldi r16, 0xFE   ;0b 1111 1110
          out PORTD, r16  ;Prende el led 1
          call delay

          ldi r16, 0xFC   ;0b 1111 1100
          out PORTD, r16  ;Prende el led 2
          call delay

          ldi r16, 0xF8   ;0b 1111 1000
          out PORTD, r16  ;Prende el led 3
          call delay

          ldi r16, 0xF0   ;0b 1111 0000
          out PORTD, r16  ;Prende el led 4
          call delay

          ldi r16, 0xE0   ;0b 1110 0000
          out PORTD, r16  ;Prende el led 5
          call delay

          ldi r16, 0xC0   ;0b 1100 0000
          out PORTD, r16  ;Prende el led 6
          call delay

          ldi r16, 0x80   ;0b 1000 0000
          out PORTD, r16  ;Prende el led 7
          call delay

          ldi r16, 0x00  ;0b 0000 0000
          out PORTD, r16 ;Prende el led 8
          call delay     ;llama a la rutina de delay

          ;SECUENCIA 3
          ldi r16, 0xFF   ;0b11111110
          out PORTD, r16  ;Prende el led 1
          call delay

          ldi r16, 0x7E   ;0b11111101
          out PORTD, r16  ;Prende el led 2
          call delay

          ldi r16, 0x3C   ;0b11111011
          out PORTD, r16  ;Prende el led 3
          call delay

          ldi r16, 0x18   ;0b11110111
          out PORTD, r16  ;Prende el led 4
          call delay

          ldi r16, 0x00   ;0b11110111
          out PORTD, r16  ;Prende el led 4
          call delay

          rjmp main_loop ;repite el bucle principal




;Rutina de retardo
delay:
      ldi r20,100  ;contador externo
      ldi r19,100  ;contador medio
      ldi r18,20    ;contador interno
L1:
   dec r20 ;decrementa el contador externo
   brne L1 ;repite si r20 no es 0
   dec r19 ;decrementa el contador medio
   brne L1 ;repite si r19 no es 0
   dec r18 ;decrementa el contador interno
   brne L1 ;repite si r18 no es 0
   ret     ;sale de la rutina de retardo

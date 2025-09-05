; 10 SYS (4096)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $30, $39, $36, $29, $00, $00, $00
*=$1000
  
MAIN
  ;load low byte of interrupt routine
  lda #<interrupt_raster_routine_red
  sta $0314 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #>interrupt_raster_routine_red
  sta $0315 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #100
  sta $d012 ;set raster interrupt scanlione to line 100
loop
  jmp loop  
  
interrupt_raster_routine_red
  sei
  ASL $D019          ; Acknowledge the interrupt
  lda #2 ;color red
  sta $d020 ;border color
  lda #<interrupt_raster_routine_blue
  sta $0314 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #>interrupt_raster_routine_blue
  sta $0315 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #200
  sta $d012 ;set raster interrupt scanlione to line 100
  cli
  JMP $EA31          ; Jump to KERNAL's routine for other tasks
 
interrupt_raster_routine_blue
  sei
  ASL $D019          ; Acknowledge the interrupt
  lda #14 ;color blue
  sta $d020 ;border color
  lda #<interrupt_raster_routine_red
  sta $0314 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #>interrupt_raster_routine_red
  sta $0315 ;Vector to IRQ Interrupt Routine low byte normally $EA31)
  lda #100
  sta $d012 ;set raster interrupt scanlione to line 100
  cli
  JMP $EA31          ; Jump to KERNAL's routine for other tasks
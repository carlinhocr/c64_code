; 10 SYS (4096)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $30, $39, $36, $29, $00, $00, $00
*=$1000

MAIN
  sei
loop
  lda #100 ;load 100 decimal
wait100
  cmp $d012 ;compara with the current raster scanline number register
  bne wait100
  lda #2 ; color red
  sta $d020 ;border color


  lda #200
wait200
  cmp $d012 ;compara with the current raster scanline number register
  bne wait200
  lda #14 ;color light blue again
  sta $d020 ;border color 
  
  jmp loop

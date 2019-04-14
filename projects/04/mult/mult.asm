// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

  // Put your code here.
  @2    //Set R2 to 0
  M=0
  @0
  D=M
  @END
  D;JEQ  //If R0 is 0, jump to end

  @1
  D=M
  @END
  D;JEQ  // If R1 is 0, jump to end

(LOOP)
  @0
  D=M
  @2
  M=D+M
  @1
  M=M-1
  D=M
  @LOOP
  D;JGT  // Jump to loop when R1 is greater than 0

(END)
  @END
  0;JMP

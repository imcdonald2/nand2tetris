// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(START)
  //Init addr as the start of the screen
  //Init end of screen
  @SCREEN
  D=A
  @addr
  M=D
  @24576 //End of screen
  D=A
  @end
  M=D

  //Jump to PRESSED if KBD, else fall through to NOTPRESS naturally
  @KBD
  D=M
  @PRESS
  D;JGT

(NOTPRESS)
  // This is jumped to when no key is detected as pressed.
  // This will clear the entire screen, then move on to STILLNOTPRESS
  @addr
  A=M
  M=0
  D=A+1

  @addr
  M=D
  D=M

  @end
  D=D-M

  @NOTPRESS
  D;JLT

(STILLNOTPRESS)
  // If KBD is pressed, jump to START, else repeat STILLNOTPRESS
  @KBD
  D=M
  @START
  D;JGT
  @STILLNOTPRESS
  0;JMP

(PRESS)
  // This is jumped to when a key is detected as pressed.
  // This will draw the entire screen, then move on to STILLPRESSED.
  @addr
  A=M
  M=-1
  D=A+1

  @addr
  M=D
  D=M

  @end
  D=D-M

  @PRESS
  D;JLT

(STILLPRESS)
  // If KBD is not pressed, jump to start, else repeat STILLPRESS
  @KBD
  D=M
  @START
  D;JEQ
  @STILLPRESS
  0;JMP



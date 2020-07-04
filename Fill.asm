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

(LOOP)
	@SCREEN
	D=A
	@addr
	M=D-M 		//addr = SCREEN

	@8192
	D=A
	@n
	M=D 		//n = KBD-SCREEN (8192)

	@i
	M=0			//i=0

	@KBD
	D=M
	@WHITE
	D; JEQ		//if KBD==0 goto WHITE

	@BLACK
	D; JGT		//if KBD!=0 goto BLACK

(WHITE)
	@i
	D=M
	@n
	D=D-M
	@LOOP
	D; JEQ		//if i==n goto LOOP

	@addr
	A=M
	M=0			//screen white

	@i
	M=M+1		//i++

	@addr
	M=M+1		//addr++
 
	@WHITE
	0; JMP		//goto WHITE

	
(BLACK)
	@i
	D=M
	@n
	D=D-M
	@LOOP
	D; JEQ		//if i==n goto LOOP

	@addr
	A=M
	M=-1		//screen black

	@i
	M=M+1		//i++

	@addr
	M=M+1		//addr++
	
	@BLACK
	0; JMP		//goto BLACK
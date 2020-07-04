// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2
M=0		//R2=0

@R1
D=M
@END
D, JEQ	//if R1==0 goto END

(LOOP)
	@R0
	D=M
	@END
	D, JEQ	//if R0==0 goto END
	@R2
	M=M+D	//else mult = R0+R2	

	@R1
	M=M-1	//R1--
	D=M
	@END
	D, JEQ	//if R1==0 goto END

	@LOOP
	0, JMP	//else goto LOOP

(END)
	@END
	0, JMP	//infinite loop
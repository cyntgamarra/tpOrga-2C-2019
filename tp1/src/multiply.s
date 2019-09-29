#include <mips/regdef.h>


# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define new 16
#define r1 20
#define c2 24
#define sum 28
#define r2 32
#define index_m1 36
#define index_m2 40
#define index_new 44

# Saved-registers area (SRA).
#define GP 48
#define FP 52
#define RA 56
#define PADDING_1 60

# ABA caller.
#define m1 64
#define m2 68

# Calle's Stack frame size 
#define SIZE_SF 64


#t0 : i
#t1 : n
#t2 : &m1
#t3 : &m2
#t4 : offset
#t5 :
#t6 : &m


.abicalls
.text
.align  2
.globl matrix_multiply
.ent matrix_multiply

matrix_multiply :
	# Debugger metadata.
	.frame  $fp,SIZE_SF,ra

	# Pipeline magic.
	.set  noreorder
	.cpload  GP
	.set  reorder

	# Allocate memory for the stack.
	subu sp , sp , SIZE_SF

	# SRA beginning area.
	.cprestore GP


	# Save the callee-saved registers used by the caller in the SRA.
	sw gp , GP(sp)
	sw $fp , FP(sp)
	sw ra , RA(sp)

	# We adopt the convention of using the frame pointer
	# as our index in the stack.
	move $fp , sp 


	# Now we save the arguments that were loaded by the caller
	# in the area reserved by the callee.
	sw a0 , m1($fp)
	sw a1 , m2($fp) 

##############################
# body:     matrix_multiply  #
##############################

	lw t0 , m1($fp)          #t0 : &m1
	lw t1 , 0(t0)            #t1 : m1− >rows
	addi t0 , t0 , 4 
	lw t2 , 0(t0)            #t2 : m1− >cols
	mul t3 , t1 , t2         #t3 : m1− >rows ∗m1− >cols

	lw a0 , t1 
	lw a1 , t2 
	jal create_matrix
	beqz v0 , retornar_null
	sw v0 , new($fp)

	li t0 , 0
	sw t0 , r1($fp)

for:
	lw t0 , r1($fp)      
	bge t0 , t1 , retornar_not_null
	sll t5 , t0 , 1        

	#m1− >array[i]
	lw t2 , m1($fp)
	addi t2 , t2 , 8
	addu t2 , t2 , t5
	lh t2 , 0(t2)

	#m2− >array[i]
	lw t3 , m2($fp)
	addi t3 , t3 , 8
	addu t3 , t3 , t5
	lh t3 , 0(t3)

	#m−>array[i] = m1−>array[i] ∗ m2−>array[i]
	mul t2 , t3 , t2
	lw t6 , new($fp)
	addi t6 , t6 , 8
	addu t6 , t6 , t5
	sh t2 , 0 (t6)

	#i++
	addi t0 , t0 , 1
	sw t0 , new($fp)
	b for

retornal null :
	lw v0 , 0
	b exit_function

retornar_not_null :
	lw v0 , new($fp)
	b exit_function

exit_function :
	# Stack frame unwinding. Restoring callee-saved reg
	move sp , $fp
	lw ra , RA(sp)
	lw $fp , FP(sp)
	lw gp , GP(sp)

	# Delete stack frame space and return
	addu sp , sp , SIZE_SF
	jr ra

.end matrix_multiply
.size  matrix_multiply, .-matrix_multiply

#include <mips/regdef.h>
#include <sys/syscall.h>


## Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

//# Local and Temporary Area (LTA).
#define new 28
#define r1 24
#define c2 20
#define r2 16

//# Saved-registers area (SRA).
#define GP 32
#define FP 36
#define RA 40

#define PADDING_1 60

## ABA caller.
#define m1 44
#define m2 48

//# Calles Stack frame size 
#define SIZE_SF 48

.abicalls
.text
.align  2
.globl matrix_multiply
.ent matrix_multiply

matrix_multiply :
	## Debugger metadata.
	.frame $fp, SIZE_SF, ra

	## Pipeline magic.
	.set noreorder
	.cpload t9
	.set  reorder

	## Allocate memory for the stack.
	subu sp, sp, SIZE_SF

	## SRA beginning area.
	.cprestore GP


	## Save the callee-saved registers used by the caller in the SRA.
	sw gp , GP(sp)
	sw $fp , FP(sp)
	sw ra , RA(sp)

	## We adopt the convention of using the frame pointer
	## as our index in the stack.
	move $fp , sp 


	## Now we save the arguments that were loaded by the caller
	## in the area reserved by the callee.
	sw a0 , m1($fp)
	sw a1 , m2($fp) 

##############################
## body:    matrix_multiply ##
##############################

	lw t0 , m1($fp)          	##t0 : &m1
	lw t1 , 0(t0)          		##t1 : m1− >rows
	addi t0 , t0 , 4 
	lw t2 , 0(t0)            	##t2 : m1− >cols
	mul t3 , t1 , t2         	##t3 : m1− >rows ∗m1− >cols

	b _create_matrix
cont_matrix_mult:
	li t0 , 0
	sw t0 , r1($fp)


forRowsM1:
	lw t0 , m1($fp)          	##t0 : &m1
	lw t1 , 0(t0)            	##t1 : m1− >rows
	lw t0 , r1($fp)			##t0 : r1
	bge t0 , t1 , return_not_null   ##if r1 >= m1->rows 
	
	##c2 = 0
	li t2 , 0
	sw t2 , c2($fp)

forCols:
	lw t3, m2($fp)			##t3 : &m2
	lw t4, 4(t3)			##t4 : m2->cols
	lw t3, c2($fp)			##t3 : c2
	bge t3, t4, end_forCols   	##if c2 >= m2->rows

	l.d $f0, zeroDouble  		##f0 : 0.0

	##r2 = 0
	li t2, 0
	sw t2, r2($fp)

forRowsM2:
	lw t3, m2($fp)			##t3 : &m2
	lw t4, 0(t3)			##t4 : m2->rows
	lw t3, r2($fp)			##t3 : r2
	bge t3, t4, end_forRowsM2   	##if r2 >= m2->rows

	lw t3, m2($fp)			##t3 : &m2
	lw t4, 4(t3)			##t4 : m2->cols
	lw t0, m1($fp)          	##t0 : &m1
	lw t1 , 4(t0)            	##t1 : m1− >cols
	lw t2, r1($fp)			##t2 : r1
	lw t5, r2($fp)			##t5 : r2
	lw t6, c2($fp)			##t6 : c2

	mul t7, t2, t1			##t7 : r1 * m1->cols
	addu t7, t7, t5			##t7 : t7 + r2  #(t7=index_m1)

	addi t0, t0, 8			##t0 : &(m1->array)
	lw t0, 0(t0)
	mul t7, t7, 8
	addu t0, t0, t7			##t0 : &(m1->array[index_m1])				

	l.d $f2, 0(t0)			##f2 : m1->array[index_m1]

	mul t7, t5, t4			##t7 : r2 * m2->cols
	addu t7, t7, t6			##t7 : t7 + c2 #(t7=index_m2)

	lw t1, m2($fp)			##t1 : &m2
	addi t1, t1, 8			##t1 : &(m2->array)
	lw t1, 0(t1)
	mul t7, t7, 8
	addu t1, t1, t7			##t1 : &(m2->array[index_m2])

  	l.d $f4, 0(t1)			##f4 : m2->array[index_m2]

	mul.d $f2, $f2, $f4		##f2 : m1->array[index_m1] * m2->array[index_m2]
	add.d $f0, $f0, $f2		##f0 : f0 + f2

	##r2++
	lw t3, r2($fp)
	addi t3, t3, 1
	sw t3, r2($fp)

	b forRowsM2

end_forRowsM2:
	lw t2, r1($fp)			##t2 : r1
	lw t0 , m1($fp)          	##t0 : &m1
	lw t1 , 4(t0)            	##t1 : m1− >cols
	mul t1, t1, t2			##t1 : m1->cols * r1
	lw t0, c2($fp)			##t0 : c2
	addu t1, t1, t0			##t1 : t1 + c2 #(t1=index_new)

	lw t0, new($fp)			##t0 : &new
	addi t0, t0, 8			##t0 : &(new->array)
	lw t0, 0(t0)
	mul t1, t1, 8
	addu t0, t0, t1			##t0 : &(new->array[new_index])
	s.d $f0, 0(t0)			##new->array[new_index] = f0 #(f0=sum)

	##c2++
	lw t3, c2($fp)
	addi t3, t3, 1
	sw t3, c2($fp)

	b forCols

end_forCols:
	##r1++
	lw t3, r1($fp)
	addi t3, t3, 1
	sw t3, r1($fp)
	b forRowsM1

return_null:
	li v0 , 0
	b exit_function

return_not_null:
	lw v0 , new($fp)
	b exit_function

exit_function:
	## Stack frame unwinding. Restoring callee-saved reg
	move sp , $fp
	lw ra , RA(sp)
	lw $fp , FP(sp)
	lw gp , GP(sp)

	## Delete stack frame space and return
	addu sp , sp , SIZE_SF
	jr ra


_create_matrix:
	//#t1 : arg0, t2 : arg1

	li t0, 3
	li t1, 4
	mul a0, t0, t1 # 3 args de 4 bytes
	jal mymalloc
	sw v0 , new($fp)
	beqz v0 , return_null  # if (!new) return null

	lw t0 , m1($fp)         	##t0 : &m1
	lw t0 , 0(t0)            	##t0 : m1− >rows 

	lw t1, new($fp)			##t1 = &new->rows
	sw t0, 0(t1)			##new->rows = t0 = m1->rows
	sw t0, 4(t1)			##new->cols = t0 = m1->cols
	
	mul a0, t0, 8			## sizeof(double) * rows
	mul a0, a0, t0			## a0 *= cols
	jal mymalloc
	bnez v0 , ctnue  # if (!new) return null
free_mtrx:
	lw a0, new($fp)
	jal myfree
	b return_null
ctnue:
	lw t1, new($fp)			 ##t1 = &new->rows
	sw v0, 8(t1)		 	 ##new->array = malloc()
	b cont_matrix_mult


.end matrix_multiply
.size  matrix_multiply, .-matrix_multiply

zeroDouble: .double 0.0

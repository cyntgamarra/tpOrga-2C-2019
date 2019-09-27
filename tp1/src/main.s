# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define codecState 16
#define errmsgCodecState 20

# Saved-registers area (SRA).
#define GP 56
#define FP 60
#define RA 64
#define PADDING_1 68

# ABA caller.
#define argc PADDING_1 + 4
#define argv argc + 4

# Calle's Stack frame size 
#define SIZE_SF PADDING_1 + 4

	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"hV\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	#Debugger metada
	.frame	$fp,SIZE_SF, ra
	
	#Pipeline magic
	.set	noreorder
	.cpload	$t9
	.set	reorder

	# Allocate memory for the stack.
	subu	sp,sp,SIZE_SF

	# SRA beginning area.
	.cprestore GP

	# Save the callee-saved registers used by the caller in the SRA.
	sw	ra,RA(sp)
	sw	$fp,FP($sp)
	sw	gp,GP($sp)

	# We adopt the convention of using the frame pointer
	# as our index in the stack.
	move	$fp,$sp

	# Now we save the arguments that were loaded by the caller
	# in the area reserved by the callee.
	sw	$a0,argc($fp)
	sw	$a1,argv($fp)

	##############################
	# body: main                 #
	##############################
	sb	$zero,24($fp)
	addu	$v0,$fp,25
	move	$a0,$v0
	la	$t9,CommandCreate
	jal	$ra,$t9
	lhu	$v0,$LC0
	sh	$v0,32($fp)
	lbu	$v0,$LC0+2
	sb	$v0,34($fp)
	addu	$v0,$fp,32
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	move	$a2,$v0
	la	$t9,getopt
	jal	$ra,$t9
	sw	$v0,40($fp)
$L18:
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L19
	lb	$v0,24($fp)
	bne	$v0,$zero,$L19
	lw	$v0,40($fp)
	sw	$v0,48($fp)
	li	$v0,86			# 0x56
	lw	$v1,48($fp)
	beq	$v1,$v0,$L24
	li	$v0,104			# 0x68
	lw	$v1,48($fp)
	beq	$v1,$v0,$L23
	b	$L25
$L23:
	la	$t9,CommandHelp
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
	b	$L22
$L24:
	la	$t9,CommandVersion
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
	b	$L22
$L25:
	addu	$v0,$fp,25
	move	$a0,$v0
	la	$t9,CommandSetError
	jal	$ra,$t9
$L22:
	addu	$v0,$fp,32
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	move	$a2,$v0
	la	$t9,getopt
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L18
$L19:
	lb	$v0,24($fp)
	beq	$v0,$zero,$L27
	sw	$zero,44($fp)
	b	$L17
$L27:
	addu	$v0,$fp,25
	move	$a0,$v0
	la	$t9,CommandHasError
	jal	$ra,$t9
	bne	$v0,$zero,$L28
	la	$t9,process
	jal	$ra,$t9
	bne	$v0,$zero,$L29
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L17
$L29:
	sw	$zero,44($fp)
	b	$L17
$L28:
	la	$t9,CommandErrArg
	jal	$ra,$t9
	li	$v1,1			# 0x1
	sw	$v1,44($fp)
$L17:
	lw	$v0,44($fp)

	# Stack frame unwinding. Restoring callee-saved reg
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)

	# Delete stack frame space and return
	addu	sp,sp,SIZE_SF
	j	ra

	.end	main
	.size	main, .-main

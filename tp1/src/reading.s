	.file	1 "reading.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%lg\000"
	.align	2
$LC1:
	.ascii	"Error al leer archivo\n\000"
	.text
	.align	2
	.globl	read_matrix_array
	.ent	read_matrix_array
read_matrix_array:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	mult	$v0,$v1
	mflo	$v0
	sw	$v0,24($fp)
	sw	$zero,28($fp)
$L18:
	lw	$v0,28($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L21
	b	$L19
$L21:
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,60($fp)
	addu	$v0,$v1,$v0
	la	$a0,$LC0
	move	$a1,$v0
	la	$t9,scanf
	jal	$ra,$t9
	bgtz	$v0,$L20
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L17
$L20:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L18
$L19:
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
$L17:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	read_matrix_array
	.size	read_matrix_array, .-read_matrix_array
	.rdata
	.align	2
$LC2:
	.ascii	"Error de memoria\n\000"
	.align	2
$LC3:
	.ascii	"Error al imprimir matriz\n\000"
	.text
	.align	2
	.globl	read_and_multiply
	.ent	read_and_multiply
read_and_multiply:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	lw	$a0,64($fp)
	lw	$a1,64($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L24
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,44($fp)
	b	$L23
$L24:
	lw	$a0,64($fp)
	lw	$a1,64($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L25
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	sw	$zero,44($fp)
	b	$L23
$L25:
	lw	$v0,24($fp)
	lw	$a0,64($fp)
	lw	$a1,8($v0)
	la	$t9,read_matrix_array
	jal	$ra,$t9
	sb	$v0,32($fp)
	lw	$v0,28($fp)
	lw	$a0,64($fp)
	lw	$a1,8($v0)
	la	$t9,read_matrix_array
	jal	$ra,$t9
	sb	$v0,33($fp)
	lbu	$v0,32($fp)
	beq	$v0,$zero,$L27
	lbu	$v0,33($fp)
	bne	$v0,$zero,$L26
$L27:
	lw	$a0,24($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	sw	$zero,44($fp)
	b	$L23
$L26:
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,36($fp)
	li	$v0,1			# 0x1
	sb	$v0,40($fp)
	la	$a0,__sF+88
	lw	$a1,36($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	bgez	$v0,$L28
	la	$a0,__sF+176
	la	$a1,$LC3
	la	$t9,fprintf
	jal	$ra,$t9
	sb	$zero,40($fp)
$L28:
	lw	$a0,24($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,36($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lbu	$v0,40($fp)
	sw	$v0,44($fp)
$L23:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	read_and_multiply
	.size	read_and_multiply, .-read_and_multiply
	.rdata
	.align	2
$LC4:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	process
	.ent	process
process:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	.set	noreorder
	nop
	.set	reorder
$L30:
	la	$a0,$LC4
	addu	$a1,$fp,24
	la	$t9,scanf
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L32
	b	$L31
$L32:
	lw	$a0,24($fp)
	la	$t9,read_and_multiply
	jal	$ra,$t9
	bne	$v0,$zero,$L30
	sw	$zero,28($fp)
	b	$L29
$L31:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
$L29:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	process
	.size	process, .-process
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

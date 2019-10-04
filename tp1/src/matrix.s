	.file	1 "matrix.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L18
	sw	$zero,28($fp)
	b	$L17
$L18:
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$s0,24($fp)
	lw	$v1,48($fp)
	lw	$v0,52($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L19
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,28($fp)
	b	$L17
$L19:
	lw	$v0,24($fp)
	sw	$v0,28($fp)
$L17:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC0:
	.ascii	"%lu \000"
	.align	2
$LC1:
	.ascii	"%g \000"
	.align	2
$LC2:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
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
	sw	$a1,68($fp)
	lw	$v0,68($fp)
	lw	$a0,64($fp)
	la	$a1,$LC0
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bgez	$v0,$L22
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,40($fp)
	b	$L21
$L22:
	sw	$zero,28($fp)
$L23:
	lw	$v0,68($fp)
	lw	$v1,28($fp)
	lw	$v0,0($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L26
	b	$L24
$L26:
	sw	$zero,32($fp)
$L27:
	lw	$v0,68($fp)
	lw	$v1,32($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L30
	b	$L25
$L30:
	lw	$v0,68($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,36($fp)
	lw	$a0,68($fp)
	lw	$v0,36($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,64($fp)
	la	$a1,$LC1
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bgez	$v0,$L29
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,40($fp)
	b	$L21
$L29:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L27
$L25:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L23
$L24:
	lw	$a0,64($fp)
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bgez	$v0,$L32
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,40($fp)
	b	$L21
$L32:
	sw	$zero,40($fp)
$L21:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	lw	$v0,80($fp)
	lw	$v1,80($fp)
	lw	$a0,0($v0)
	lw	$a1,4($v1)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L34
	sw	$zero,60($fp)
	b	$L33
$L34:
	sw	$zero,28($fp)
$L35:
	lw	$v0,80($fp)
	lw	$v1,28($fp)
	lw	$v0,0($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L38
	b	$L36
$L38:
	sw	$zero,32($fp)
$L39:
	lw	$v0,84($fp)
	lw	$v1,32($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L42
	b	$L37
$L42:
	sw	$zero,40($fp)
	sw	$zero,44($fp)
	sw	$zero,48($fp)
$L43:
	lw	$v0,84($fp)
	lw	$v1,48($fp)
	lw	$v0,0($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L46
	b	$L44
$L46:
	lw	$v0,80($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,48($fp)
	addu	$v0,$v1,$v0
	sw	$v0,52($fp)
	lw	$v0,84($fp)
	lw	$v1,48($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,56($fp)
	lw	$a0,80($fp)
	lw	$v0,52($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a1,$v1,$v0
	lw	$a0,84($fp)
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,40($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,40($fp)
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	b	$L43
$L44:
	lw	$v0,80($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,56($fp)
	lw	$a0,24($fp)
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,40($fp)
	s.d	$f0,0($v0)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L39
$L37:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L35
$L36:
	lw	$v0,24($fp)
	sw	$v0,60($fp)
$L33:
	lw	$v0,60($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

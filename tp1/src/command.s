	.file	1 "command.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Usage:\n\000"
	.align	2
$LC1:
	.ascii	"  tp0 -h\n\000"
	.align	2
$LC2:
	.ascii	"  tp0 -V\n\000"
	.align	2
$LC3:
	.ascii	"  tp0 < in_file > out_file\n\000"
	.align	2
$LC4:
	.ascii	"Options:\n\000"
	.align	2
$LC5:
	.ascii	"  -V, --version    Print version and quit.\n\000"
	.align	2
$LC6:
	.ascii	"  -h, --help       Print this information and quit.\n\000"
	.align	2
$LC7:
	.ascii	"Examples:\n\000"
	.align	2
$LC8:
	.ascii	"  tp0 < in.txt > out.txt\n\000"
	.align	2
$LC9:
	.ascii	"  cat in.txt | tp0 > out.txt\n\000"
	.text
	.align	2
	.globl	CommandHelp
	.ent	CommandHelp
CommandHelp:
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
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC3
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC7
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandHelp
	.size	CommandHelp, .-CommandHelp
	.rdata
	.align	2
$LC10:
	.ascii	"Version: 0.1\n\000"
	.text
	.align	2
	.globl	CommandVersion
	.ent	CommandVersion
CommandVersion:
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
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandVersion
	.size	CommandVersion, .-CommandVersion
	.rdata
	.align	2
$LC11:
	.ascii	"Invalid Arguments\n\000"
	.align	2
$LC12:
	.ascii	"  tp0 -h.\n\000"
	.align	2
$LC13:
	.ascii	"  tp0 -V.\n\000"
	.align	2
$LC14:
	.ascii	"  tp0 < in_file > out_file.\n\000"
	.align	2
$LC15:
	.ascii	"  tp0 < in.txt > out.txtn\n\000"
	.text
	.align	2
	.globl	CommandErrArg
	.ent	CommandErrArg
CommandErrArg:
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
	la	$a0,__sF+176
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC4
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC15
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandErrArg
	.size	CommandErrArg, .-CommandErrArg
	.align	2
	.globl	CommandCreate
	.ent	CommandCreate
CommandCreate:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v0,16($fp)
	sb	$zero,0($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandCreate
	.size	CommandCreate, .-CommandCreate
	.align	2
	.globl	CommandSetError
	.ent	CommandSetError
CommandSetError:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v1,16($fp)
	li	$v0,1			# 0x1
	sb	$v0,0($v1)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandSetError
	.size	CommandSetError, .-CommandSetError
	.align	2
	.globl	CommandHasError
	.ent	CommandHasError
CommandHasError:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandHasError
	.size	CommandHasError, .-CommandHasError
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

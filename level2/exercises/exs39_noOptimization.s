	.file	"exs39.c"
	.text
	.section	.rodata
.LC0:
	.string	"equal"
.LC1:
	.string	"unequal"
.LC2:
	.string	"%u: p and q are %s, *p is %u\n"
	.text
	.globl	fgoto
	.type	fgoto, @function
fgoto:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -28(%rbp)
	movq	$0, -24(%rbp)
.L2:
	cmpq	$0, -24(%rbp)
	je	.L3
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jne	.L4
	leaq	.LC0(%rip), %rax
	jmp	.L5
.L4:
	leaq	.LC1(%rip), %rax
.L5:
	movl	-28(%rbp), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	addl	$1, -28(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	ja	.L8
	jmp	.L2
.L8:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fgoto, .-fgoto
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

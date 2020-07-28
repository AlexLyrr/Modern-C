	.file	"exs30.c"
	.text
.Ltext0:
	.section	.rodata.doAtExit.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\n***********\nabnormal exit, last open file was %s\n"
	.section	.text.doAtExit,"ax",@progbits
	.p2align 4,,15
	.globl	doAtExit
	.type	doAtExit, @function
doAtExit:
.LFB31:
	.file 1 "/media/sf_vbx_shared/study material/Programming/C/code/Modern C/level3/exercises/exs30.c"
	.loc 1 170 0
	.cfi_startproc
	.loc 1 171 0
	movq	lastOpen(%rip), %rax
	testq	%rax, %rax
	je	.L9
	.loc 1 171 0 is_stmt 0 discriminator 1
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.L9
.LVL0:
.LBB23:
.LBB24:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 97 0 is_stmt 1
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	jmp	__fprintf_chk@PLT
.LVL1:
	.p2align 4,,10
	.p2align 3
.L9:
.LBE24:
.LBE23:
	.loc 1 176 0
	rep ret
	.cfi_endproc
.LFE31:
	.size	doAtExit, .-doAtExit
	.section	.text.signal_handler,"ax",@progbits
	.p2align 4,,15
	.type	signal_handler, @function
signal_handler:
.LFB30:
	.loc 1 149 0
	.cfi_startproc
.LVL2:
	movslq	%edi, %rax
.LVL3:
.LBB33:
.LBB34:
	.file 3 "/media/sf_vbx_shared/study material/Programming/C/code/Modern C/level3/exercises/sighandler.h"
	.loc 3 51 0
	cmpq	sh_known(%rip), %rax
.LBE34:
.LBE33:
	.loc 1 149 0
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 149 0
	movq	%rax, %rbx
.LBB39:
.LBB37:
	.loc 3 51 0
	jb	.L23
.L12:
.LVL4:
.LBE37:
.LBE39:
	.loc 1 151 0
	cmpl	$15, %ebx
	je	.L14
	cmpl	$18, %ebx
	je	.L21
	cmpl	$6, %ebx
	je	.L24
.LVL5:
.LBB40:
.LBB41:
	.loc 1 160 0
	xorl	%esi, %esi
	movl	%ebx, %edi
.LVL6:
	call	__sysv_signal@PLT
.LVL7:
	.loc 1 161 0
	movl	%ebx, interrupt(%rip)
.LVL8:
.L21:
.LBE41:
.LBE40:
	.loc 1 164 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LVL9:
	ret
.LVL10:
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
.LBB42:
.LBB38:
.LBB35:
.LBB36:
	.loc 3 51 0
	leaq	sh_counts(%rip), %rdx
	lock addq	$1, (%rdx,%rax,8)
	jmp	.L12
.LVL11:
.L24:
.LBE36:
.LBE35:
.LBE38:
.LBE42:
	.loc 1 153 0
	movl	$1, %edi
.LVL12:
	call	_Exit@PLT
.LVL13:
.L14:
	.loc 1 152 0
	movl	$1, %edi
.LVL14:
	call	quick_exit@PLT
.LVL15:
	.cfi_endproc
.LFE30:
	.size	signal_handler, .-signal_handler
	.section	.text.descend.constprop.2,"ax",@progbits
	.p2align 4,,15
	.type	descend.constprop.2, @function
descend.constprop.2:
.LFB35:
	.loc 1 61 0
	.cfi_startproc
.LVL16:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 65 0
	leal	3(%rsi), %eax
	.loc 1 61 0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r15
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 65 0
	cmpl	$38, %eax
	ja	.L80
	.loc 1 76 0
	movl	$38, %r13d
	.loc 1 66 0
	leal	1(%rsi), %ebp
.LVL17:
	.loc 1 76 0
	leaq	head(%rip), %r14
	movq	%rdi, %rbx
	movq	%rdx, %r12
	subq	%rax, %r13
.LVL18:
.L27:
	.loc 1 68 0
	testq	%rbx, %rbx
	je	.L33
	cmpb	$0, (%rbx)
	jne	.L81
.LVL19:
.L33:
	.loc 1 69 0
	movl	interrupt(%rip), %eax
	testl	%eax, %eax
	jne	.L82
.LVL20:
.LBB61:
.LBB62:
	.loc 2 262 0
	movq	stdin(%rip), %rdx
	movl	$256, %esi
	movq	%r12, %rdi
	call	fgets@PLT
.LVL21:
.LBE62:
.LBE61:
.LBB64:
.LBB65:
	.loc 1 26 0
	testq	%rax, %rax
.LBE65:
.LBE64:
.LBB67:
.LBB63:
	.loc 2 262 0
	movq	%rax, %rbx
.LVL22:
.LBE63:
.LBE67:
.LBB68:
.LBB66:
	.loc 1 26 0
	je	.L29
	call	__ctype_b_loc@PLT
.LVL23:
	movq	(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L30:
	movsbq	(%rbx), %rax
	testb	$32, 1(%rdx,%rax,2)
	je	.L27
.LVL24:
	addq	$1, %rbx
.LVL25:
	jne	.L30
.L29:
.LVL26:
.LBE66:
.LBE68:
	.loc 1 72 0
	cmpl	$1, %ebp
	jne	.L47
	.loc 1 96 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 70 0
	xorl	%eax, %eax
	.loc 1 96 0
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL27:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL28:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL29:
	ret
.LVL30:
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	.loc 1 76 0
	movq	stdout(%rip), %rsi
	leaq	0(%r13,%r14), %rdi
	call	fputs@PLT
.LVL31:
.L34:
	.loc 1 77 0
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L27
	.loc 1 78 0
	cmpb	$123, %al
	je	.L36
	cmpb	$125, %al
	jne	.L83
	.loc 1 86 0
	cmpl	$1, %ebp
	je	.L84
.L44:
.LVL32:
	.loc 1 96 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 86 0
	movq	%rbx, %rax
	.loc 1 96 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL33:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL34:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL35:
	ret
.LVL36:
	.p2align 4,,10
	.p2align 3
.L83:
	.cfi_restore_state
.LBB69:
.LBB70:
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdio.h"
	.loc 4 81 0
	movq	stdout(%rip), %rsi
.LBE70:
.LBE69:
	.loc 1 78 0
	movsbl	%al, %edi
.LVL37:
.LBB72:
.LBB71:
	.loc 4 81 0
	call	_IO_putc@PLT
.LVL38:
.LBE71:
.LBE72:
	.loc 1 77 0
	addq	$1, %rbx
.LVL39:
	jne	.L34
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L36:
.LBB73:
.LBB74:
.LBB75:
.LBB76:
	.loc 4 81 0
	movq	stdout(%rip), %rsi
	movl	$10, %edi
.LBE76:
.LBE75:
.LBE74:
.LBE73:
	.loc 1 80 0
	addq	$1, %rbx
.LVL40:
.LBB83:
.LBB81:
.LBB78:
.LBB77:
	.loc 4 81 0
	call	_IO_putc@PLT
.LVL41:
.LBE77:
.LBE78:
	.loc 1 49 0
	cmpl	$-1, %eax
	je	.L38
.LVL42:
.LBB79:
.LBB80:
	.loc 1 26 0
	testq	%rbx, %rbx
	je	.L39
	call	__ctype_b_loc@PLT
.LVL43:
	movq	(%rax), %rdx
	jmp	.L40
.LVL44:
	.p2align 4,,10
	.p2align 3
.L41:
	addq	$1, %rbx
.LVL45:
	je	.L39
.L40:
	movsbq	(%rbx), %rax
	testb	$32, 1(%rdx,%rax,2)
	jne	.L41
.L39:
.LVL46:
.LBE80:
.LBE79:
.LBE81:
.LBE83:
	.loc 1 81 0
	movq	%rbx, %rdi
	movq	%r15, %rcx
	movq	%r12, %rdx
	movl	%ebp, %esi
	call	descend.constprop.2
.LVL47:
.LBB84:
.LBB85:
.LBB86:
.LBB87:
	.loc 4 81 0
	movq	stdout(%rip), %rsi
	movl	$10, %edi
.LBE87:
.LBE86:
.LBE85:
.LBE84:
	.loc 1 83 0
	leaq	1(%rax), %rbx
.LVL48:
.LBB93:
.LBB92:
.LBB89:
.LBB88:
	.loc 4 81 0
	call	_IO_putc@PLT
.LVL49:
.LBE88:
.LBE89:
	.loc 1 49 0
	cmpl	$-1, %eax
	je	.L38
.LVL50:
.LBB90:
.LBB91:
	.loc 1 26 0
	testq	%rbx, %rbx
	je	.L33
	call	__ctype_b_loc@PLT
.LVL51:
	movq	(%rax), %rdx
	jmp	.L42
.LVL52:
	.p2align 4,,10
	.p2align 3
.L43:
	addq	$1, %rbx
.LVL53:
	je	.L33
.L42:
	movsbq	(%rbx), %rax
	testb	$32, 1(%rdx,%rax,2)
	jne	.L43
	jmp	.L27
.LVL54:
.L82:
.LBE91:
.LBE90:
.LBE92:
.LBE93:
	.loc 1 69 0
	movl	$5, %esi
	movq	%r15, %rdi
	call	__longjmp_chk@PLT
.LVL55:
.L47:
	.loc 1 72 0
	movl	$1, %esi
	movq	%r15, %rdi
	call	__longjmp_chk@PLT
.LVL56:
.L80:
	.loc 1 65 0
	movl	$3, %esi
.LVL57:
	movq	%rcx, %rdi
.LVL58:
	call	__longjmp_chk@PLT
.LVL59:
.L84:
	.loc 1 86 0
	movl	$2, %esi
	movq	%r15, %rdi
	call	__longjmp_chk@PLT
.LVL60:
.L38:
.LBB94:
.LBB82:
	.loc 1 49 0
	movl	$4, %esi
	movq	%r15, %rdi
	call	__longjmp_chk@PLT
.LVL61:
.LBE82:
.LBE94:
	.cfi_endproc
.LFE35:
	.size	descend.constprop.2, .-descend.constprop.2
	.section	.rodata.basic_blocks.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"All %0.0d%c %c blocks have been closed correctly\n"
	.align 8
.LC2:
	.string	"Warning: %d %c %c blocks have not been closed properly\n"
	.align 8
.LC3:
	.string	"Error: closing too many (%d) %c %c blocks\n"
	.align 8
.LC4:
	.string	"Error: nesting (%d) of %c %c blocks is too deep\n"
	.align 8
.LC5:
	.string	"Error: EOF for stdout at nesting (%d) of %c %c blocks\n"
	.align 8
.LC6:
	.string	"Interrupted at level %d of %c %c block nesting\n"
	.align 8
.LC7:
	.string	"Error: unknown error within (%d) %c %c blocks\n"
	.align 8
.LC8:
	.string	"is somebody trying to kill us?"
	.align 8
.LC9:
	.string	"/media/sf_vbx_shared/study material/Programming/C/code/Modern C/level3/exercises/exs30.c"
	.section	.text.basic_blocks,"ax",@progbits
	.p2align 4,,15
	.globl	basic_blocks
	.type	basic_blocks, @function
basic_blocks:
.LFB29:
	.loc 1 100 0
	.cfi_startproc
	subq	$504, %rsp
	.cfi_def_cfa_offset 512
	.loc 1 100 0
	movq	%fs:40, %rax
	movq	%rax, 488(%rsp)
	xorl	%eax, %eax
.LVL62:
	.loc 1 106 0
	leaq	16(%rsp), %rdi
	.loc 1 103 0
	leaq	.LC1(%rip), %rax
	movq	%rax, 8(%rsp)
	.loc 1 106 0
	call	_setjmp@PLT
.LVL63:
	cmpl	$5, %eax
	ja	.L87
	.loc 1 106 0 is_stmt 0 discriminator 1
	leaq	.L89(%rip), %rdx
	movl	%eax, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata.basic_blocks,"a",@progbits
	.align 4
	.align 4
.L89:
	.long	.L88-.L89
	.long	.L97-.L89
	.long	.L91-.L89
	.long	.L92-.L89
	.long	.L93-.L89
	.long	.L94-.L89
	.section	.text.basic_blocks
	.p2align 4,,10
	.p2align 3
.L97:
	.loc 1 111 0 is_stmt 1
	leaq	.LC2(%rip), %rax
	movq	%rax, 8(%rsp)
.LVL64:
	.p2align 4,,10
	.p2align 3
.L90:
	.loc 1 134 0
	movq	stdout(%rip), %rdi
	call	fflush@PLT
.LVL65:
.LBB95:
.LBB96:
	.loc 2 97 0
	movq	8(%rsp), %rdx
	movq	stderr(%rip), %rdi
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	$125, %r9d
	movl	$123, %r8d
	movl	$1, %esi
	call	__fprintf_chk@PLT
.LVL66:
.LBE96:
.LBE95:
	.loc 1 136 0
	movl	interrupt(%rip), %eax
	testl	%eax, %eax
	je	.L85
	.loc 1 137 0
	movq	stderr(%rip), %rdi
	movl	interrupt(%rip), %esi
	leaq	.LC8(%rip), %r8
	leaq	.LC9(%rip), %rdx
	movl	$138, %ecx
	call	sh_print@PLT
.LVL67:
	.loc 1 139 0
	movl	interrupt(%rip), %edi
	call	raise@PLT
.LVL68:
.L85:
	.loc 1 141 0
	movq	488(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L100
	addq	$504, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL69:
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_restore_state
	.loc 1 115 0
	leaq	.LC3(%rip), %rax
	movq	%rax, 8(%rsp)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L92:
.LVL70:
	.loc 1 119 0
	leaq	.LC4(%rip), %rax
	movq	%rax, 8(%rsp)
	.loc 1 121 0
	jmp	.L90
.LVL71:
	.p2align 4,,10
	.p2align 3
.L93:
	.loc 1 123 0
	leaq	.LC5(%rip), %rax
	movq	%rax, 8(%rsp)
	.loc 1 125 0
	jmp	.L90
.LVL72:
	.p2align 4,,10
	.p2align 3
.L94:
	.loc 1 127 0
	leaq	.LC6(%rip), %rax
	movq	%rax, 8(%rsp)
	.loc 1 129 0
	jmp	.L90
.LVL73:
	.p2align 4,,10
	.p2align 3
.L88:
	.loc 1 108 0
	leaq	16(%rsp), %rcx
	leaq	224(%rsp), %rdx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	descend.constprop.2
.LVL74:
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L87:
.LVL75:
	.loc 1 131 0
	leaq	.LC7(%rip), %rax
	movq	%rax, 8(%rsp)
	jmp	.L90
.LVL76:
.L100:
	.loc 1 141 0
	call	__stack_chk_fail@PLT
.LVL77:
	.cfi_endproc
.LFE29:
	.size	basic_blocks, .-basic_blocks
	.section	.rodata.main.str1.8,"aMS",@progbits,1
	.align 8
.LC10:
	.string	"we could not establish line buffering for stdout, terminating."
	.section	.rodata.main.str1.1,"aMS",@progbits,1
.LC11:
	.string	"r"
.LC12:
	.string	"++++++++++ %s +++++++++++\n"
	.section	.text.startup.main,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB32:
	.loc 1 178 0
	.cfi_startproc
.LVL78:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.loc 1 180 0
	xorl	%esi, %esi
.LVL79:
	movl	$296, %ecx
	movl	$1, %edx
	.loc 1 178 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 180 0
	movq	stdout(%rip), %rdi
.LVL80:
	call	setvbuf@PLT
.LVL81:
	testl	%eax, %eax
	jne	.L114
	.loc 1 186 0
	leaq	doAtExit(%rip), %rdi
	movl	%eax, %r13d
	call	atexit@PLT
.LVL82:
	.loc 1 187 0
	leaq	doAtExit(%rip), %rdi
	call	at_quick_exit@PLT
.LVL83:
.LBB97:
	.loc 1 189 0
	movq	sh_known(%rip), %rbp
	cmpq	$1, %rbp
	jbe	.L104
	.loc 1 190 0
	leaq	signal_handler(%rip), %r12
	.loc 1 189 0
	movl	$1, %ebx
.LVL84:
	.p2align 4,,10
	.p2align 3
.L105:
	.loc 1 190 0 discriminator 3
	movl	%ebx, %edi
	movq	%r12, %rsi
	call	sh_enable@PLT
.LVL85:
	.loc 1 189 0 discriminator 3
	leal	1(%rbx), %eax
	cmpq	%rbp, %rax
	movq	%rax, %rbx
.LVL86:
	jb	.L105
.LVL87:
.L104:
.LBE97:
	.loc 1 193 0
	subl	$1, %r15d
.LVL88:
	jle	.L115
	.loc 1 195 0
	addq	$8, %r14
.LVL89:
	movq	%r14, lastOpen(%rip)
.LVL90:
.L108:
	.loc 1 195 0 is_stmt 0 discriminator 1
	movq	lastOpen(%rip), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L112
	.loc 1 196 0 is_stmt 1
	movq	stdin(%rip), %rdx
	leaq	.LC11(%rip), %rsi
	call	freopen@PLT
.LVL91:
	testq	%rax, %rax
	.loc 1 197 0
	movq	lastOpen(%rip), %rax
	.loc 1 196 0
	je	.L116
.LVL92:
.LBB98:
.LBB99:
	.loc 2 104 0
	movq	(%rax), %rdx
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL93:
.L107:
.LBE99:
.LBE98:
	.loc 1 202 0 discriminator 2
	call	basic_blocks
.LVL94:
	.loc 1 195 0 discriminator 2
	addq	$8, lastOpen(%rip)
	jmp	.L108
.LVL95:
.L114:
	.loc 1 181 0
	movq	stderr(%rip), %rcx
	leaq	.LC10(%rip), %rdi
	movl	$62, %edx
	movl	$1, %esi
	.loc 1 183 0
	movl	$1, %r13d
	.loc 1 181 0
	call	fwrite@PLT
.LVL96:
.L112:
	.loc 1 205 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL97:
.L115:
	.cfi_restore_state
	.loc 1 192 0
	movq	%r14, lastOpen(%rip)
	jmp	.L107
.LVL98:
.L116:
	.loc 1 197 0
	movq	(%rax), %rdi
	.loc 1 198 0
	movl	$1, %r13d
	.loc 1 197 0
	call	perror@PLT
.LVL99:
	.loc 1 198 0
	jmp	.L112
	.cfi_endproc
.LFE32:
	.size	main, .-main
	.section	.bss.lastOpen,"aw",@nobits
	.align 8
	.type	lastOpen, @object
	.size	lastOpen, 8
lastOpen:
	.zero	8
	.section	.bss.interrupt,"aw",@nobits
	.align 4
	.type	interrupt, @object
	.size	interrupt, 4
interrupt:
	.zero	4
	.section	.rodata.head,"a",@progbits
	.align 32
	.type	head, @object
	.size	head, 38
head:
	.string	">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>| "
	.text
.Letext0:
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/setjmp.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.file 8 "/usr/include/setjmp.h"
	.file 9 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 12 "/usr/include/stdio.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h"
	.file 14 "/usr/include/signal.h"
	.file 15 "/usr/include/ctype.h"
	.file 16 "/usr/include/stdlib.h"
	.file 17 "<built-in>"
	.file 18 "/usr/include/x86_64-linux-gnu/bits/setjmp2.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xeb4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF136
	.byte	0xc
	.long	.LASF137
	.long	.LASF138
	.long	.Ldebug_ranges0+0x1a0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x5
	.byte	0x8c
	.long	0x5a
	.uleb128 0x4
	.long	.LASF8
	.byte	0x5
	.byte	0x8d
	.long	0x5a
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x84
	.uleb128 0x7
	.long	0x79
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x8
	.long	0x84
	.uleb128 0x4
	.long	.LASF10
	.byte	0x5
	.byte	0xca
	.long	0x53
	.uleb128 0x9
	.byte	0x7
	.byte	0x4
	.long	0x37
	.byte	0xf
	.byte	0x2f
	.long	0xf9
	.uleb128 0xa
	.long	.LASF11
	.value	0x100
	.uleb128 0xa
	.long	.LASF12
	.value	0x200
	.uleb128 0xa
	.long	.LASF13
	.value	0x400
	.uleb128 0xa
	.long	.LASF14
	.value	0x800
	.uleb128 0xa
	.long	.LASF15
	.value	0x1000
	.uleb128 0xa
	.long	.LASF16
	.value	0x2000
	.uleb128 0xa
	.long	.LASF17
	.value	0x4000
	.uleb128 0xa
	.long	.LASF18
	.value	0x8000
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.uleb128 0xb
	.long	.LASF20
	.byte	0x2
	.uleb128 0xb
	.long	.LASF21
	.byte	0x4
	.uleb128 0xb
	.long	.LASF22
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF23
	.byte	0x6
	.byte	0x1f
	.long	0x104
	.uleb128 0xc
	.long	0x5a
	.long	0x114
	.uleb128 0xd
	.long	0x3e
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.byte	0x80
	.byte	0x7
	.byte	0x5
	.long	0x129
	.uleb128 0xf
	.long	.LASF25
	.byte	0x7
	.byte	0x7
	.long	0x129
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x3e
	.long	0x139
	.uleb128 0xd
	.long	0x3e
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x7
	.byte	0x8
	.long	0x114
	.uleb128 0x10
	.long	.LASF31
	.byte	0xc8
	.byte	0x8
	.byte	0x21
	.long	0x175
	.uleb128 0xf
	.long	.LASF26
	.byte	0x8
	.byte	0x27
	.long	0xf9
	.byte	0
	.uleb128 0xf
	.long	.LASF27
	.byte	0x8
	.byte	0x28
	.long	0x53
	.byte	0x40
	.uleb128 0xf
	.long	.LASF28
	.byte	0x8
	.byte	0x29
	.long	0x139
	.byte	0x48
	.byte	0
	.uleb128 0x4
	.long	.LASF29
	.byte	0x8
	.byte	0x2d
	.long	0x180
	.uleb128 0xc
	.long	0x144
	.long	0x190
	.uleb128 0xd
	.long	0x3e
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF30
	.byte	0x9
	.byte	0xd8
	.long	0x3e
	.uleb128 0x8
	.long	0x190
	.uleb128 0x10
	.long	.LASF32
	.byte	0xd8
	.byte	0xa
	.byte	0xf5
	.long	0x320
	.uleb128 0xf
	.long	.LASF33
	.byte	0xa
	.byte	0xf6
	.long	0x53
	.byte	0
	.uleb128 0xf
	.long	.LASF34
	.byte	0xa
	.byte	0xfb
	.long	0x79
	.byte	0x8
	.uleb128 0xf
	.long	.LASF35
	.byte	0xa
	.byte	0xfc
	.long	0x79
	.byte	0x10
	.uleb128 0xf
	.long	.LASF36
	.byte	0xa
	.byte	0xfd
	.long	0x79
	.byte	0x18
	.uleb128 0xf
	.long	.LASF37
	.byte	0xa
	.byte	0xfe
	.long	0x79
	.byte	0x20
	.uleb128 0xf
	.long	.LASF38
	.byte	0xa
	.byte	0xff
	.long	0x79
	.byte	0x28
	.uleb128 0x11
	.long	.LASF39
	.byte	0xa
	.value	0x100
	.long	0x79
	.byte	0x30
	.uleb128 0x11
	.long	.LASF40
	.byte	0xa
	.value	0x101
	.long	0x79
	.byte	0x38
	.uleb128 0x11
	.long	.LASF41
	.byte	0xa
	.value	0x102
	.long	0x79
	.byte	0x40
	.uleb128 0x11
	.long	.LASF42
	.byte	0xa
	.value	0x104
	.long	0x79
	.byte	0x48
	.uleb128 0x11
	.long	.LASF43
	.byte	0xa
	.value	0x105
	.long	0x79
	.byte	0x50
	.uleb128 0x11
	.long	.LASF44
	.byte	0xa
	.value	0x106
	.long	0x79
	.byte	0x58
	.uleb128 0x11
	.long	.LASF45
	.byte	0xa
	.value	0x108
	.long	0x363
	.byte	0x60
	.uleb128 0x11
	.long	.LASF46
	.byte	0xa
	.value	0x10a
	.long	0x369
	.byte	0x68
	.uleb128 0x11
	.long	.LASF47
	.byte	0xa
	.value	0x10c
	.long	0x53
	.byte	0x70
	.uleb128 0x11
	.long	.LASF48
	.byte	0xa
	.value	0x110
	.long	0x53
	.byte	0x74
	.uleb128 0x11
	.long	.LASF49
	.byte	0xa
	.value	0x112
	.long	0x61
	.byte	0x78
	.uleb128 0x11
	.long	.LASF50
	.byte	0xa
	.value	0x116
	.long	0x30
	.byte	0x80
	.uleb128 0x11
	.long	.LASF51
	.byte	0xa
	.value	0x117
	.long	0x45
	.byte	0x82
	.uleb128 0x11
	.long	.LASF52
	.byte	0xa
	.value	0x118
	.long	0x36f
	.byte	0x83
	.uleb128 0x11
	.long	.LASF53
	.byte	0xa
	.value	0x11c
	.long	0x37f
	.byte	0x88
	.uleb128 0x11
	.long	.LASF54
	.byte	0xa
	.value	0x125
	.long	0x6c
	.byte	0x90
	.uleb128 0x11
	.long	.LASF55
	.byte	0xa
	.value	0x12d
	.long	0x77
	.byte	0x98
	.uleb128 0x11
	.long	.LASF56
	.byte	0xa
	.value	0x12e
	.long	0x77
	.byte	0xa0
	.uleb128 0x11
	.long	.LASF57
	.byte	0xa
	.value	0x12f
	.long	0x77
	.byte	0xa8
	.uleb128 0x11
	.long	.LASF58
	.byte	0xa
	.value	0x130
	.long	0x77
	.byte	0xb0
	.uleb128 0x11
	.long	.LASF59
	.byte	0xa
	.value	0x132
	.long	0x190
	.byte	0xb8
	.uleb128 0x11
	.long	.LASF60
	.byte	0xa
	.value	0x133
	.long	0x53
	.byte	0xc0
	.uleb128 0x11
	.long	.LASF61
	.byte	0xa
	.value	0x135
	.long	0x385
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF62
	.byte	0xb
	.byte	0x7
	.long	0x1a0
	.uleb128 0x12
	.long	.LASF139
	.byte	0xa
	.byte	0x9a
	.uleb128 0x10
	.long	.LASF63
	.byte	0x18
	.byte	0xa
	.byte	0xa0
	.long	0x363
	.uleb128 0xf
	.long	.LASF64
	.byte	0xa
	.byte	0xa1
	.long	0x363
	.byte	0
	.uleb128 0xf
	.long	.LASF65
	.byte	0xa
	.byte	0xa2
	.long	0x369
	.byte	0x8
	.uleb128 0xf
	.long	.LASF66
	.byte	0xa
	.byte	0xa6
	.long	0x53
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x332
	.uleb128 0x6
	.byte	0x8
	.long	0x1a0
	.uleb128 0xc
	.long	0x84
	.long	0x37f
	.uleb128 0xd
	.long	0x3e
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x32b
	.uleb128 0xc
	.long	0x84
	.long	0x395
	.uleb128 0xd
	.long	0x3e
	.byte	0x13
	.byte	0
	.uleb128 0x13
	.long	.LASF140
	.uleb128 0x14
	.long	.LASF67
	.byte	0xa
	.value	0x13f
	.long	0x395
	.uleb128 0x14
	.long	.LASF68
	.byte	0xa
	.value	0x140
	.long	0x395
	.uleb128 0x14
	.long	.LASF69
	.byte	0xa
	.value	0x141
	.long	0x395
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x7
	.long	0x3be
	.uleb128 0x15
	.long	.LASF70
	.byte	0xc
	.byte	0x87
	.long	0x369
	.uleb128 0x15
	.long	.LASF71
	.byte	0xc
	.byte	0x88
	.long	0x369
	.uleb128 0x15
	.long	.LASF72
	.byte	0xc
	.byte	0x89
	.long	0x369
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF73
	.uleb128 0x4
	.long	.LASF74
	.byte	0xd
	.byte	0x8
	.long	0x90
	.uleb128 0x16
	.long	0x3f1
	.uleb128 0x4
	.long	.LASF75
	.byte	0xe
	.byte	0x48
	.long	0x40c
	.uleb128 0x6
	.byte	0x8
	.long	0x412
	.uleb128 0x17
	.long	0x41d
	.uleb128 0x18
	.long	0x53
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF76
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF77
	.uleb128 0x4
	.long	.LASF78
	.byte	0x3
	.byte	0xd
	.long	0x43b
	.uleb128 0x8
	.long	0x42b
	.uleb128 0x10
	.long	.LASF78
	.byte	0x10
	.byte	0x3
	.byte	0xe
	.long	0x460
	.uleb128 0xf
	.long	.LASF79
	.byte	0x3
	.byte	0xf
	.long	0x3be
	.byte	0
	.uleb128 0xf
	.long	.LASF80
	.byte	0x3
	.byte	0x10
	.long	0x3be
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.long	0x436
	.long	0x46b
	.uleb128 0x19
	.byte	0
	.uleb128 0x8
	.long	0x460
	.uleb128 0x15
	.long	.LASF81
	.byte	0x3
	.byte	0x1b
	.long	0x46b
	.uleb128 0x15
	.long	.LASF82
	.byte	0x3
	.byte	0x1d
	.long	0x19b
	.uleb128 0xc
	.long	0x3e
	.long	0x491
	.uleb128 0x19
	.byte	0
	.uleb128 0x15
	.long	.LASF83
	.byte	0x3
	.byte	0x29
	.long	0x486
	.uleb128 0xc
	.long	0x8b
	.long	0x4ac
	.uleb128 0xd
	.long	0x3e
	.byte	0x25
	.byte	0
	.uleb128 0x8
	.long	0x49c
	.uleb128 0x1a
	.long	.LASF90
	.byte	0x1
	.byte	0x13
	.long	0x4ac
	.uleb128 0x9
	.byte	0x3
	.quad	head
	.uleb128 0x1b
	.long	.LASF141
	.byte	0x7
	.byte	0x4
	.long	0x37
	.byte	0x1
	.byte	0x23
	.long	0x4fc
	.uleb128 0xb
	.long	.LASF84
	.byte	0
	.uleb128 0xb
	.long	.LASF85
	.byte	0x1
	.uleb128 0xb
	.long	.LASF86
	.byte	0x2
	.uleb128 0xb
	.long	.LASF87
	.byte	0x3
	.uleb128 0xb
	.long	.LASF88
	.byte	0x4
	.uleb128 0xb
	.long	.LASF89
	.byte	0x5
	.byte	0
	.uleb128 0x1a
	.long	.LASF91
	.byte	0x1
	.byte	0x3a
	.long	0x3fc
	.uleb128 0x9
	.byte	0x3
	.quad	interrupt
	.uleb128 0x9
	.byte	0x7
	.byte	0x4
	.long	0x37
	.byte	0x1
	.byte	0x62
	.long	0x526
	.uleb128 0xa
	.long	.LASF92
	.value	0x100
	.byte	0
	.uleb128 0x1a
	.long	.LASF93
	.byte	0x1
	.byte	0xa7
	.long	0x53b
	.uleb128 0x9
	.byte	0x3
	.quad	lastOpen
	.uleb128 0x6
	.byte	0x8
	.long	0x79
	.uleb128 0x1c
	.long	.LASF142
	.byte	0x1
	.byte	0xb2
	.long	0x53
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x6d6
	.uleb128 0x1d
	.long	.LASF94
	.byte	0x1
	.byte	0xb2
	.long	0x53
	.long	.LLST23
	.uleb128 0x1d
	.long	.LASF95
	.byte	0x1
	.byte	0xb2
	.long	0x53b
	.long	.LLST24
	.uleb128 0x1e
	.string	"RUN"
	.byte	0x1
	.byte	0xc9
	.quad	.L107
	.uleb128 0x1f
	.quad	.LBB97
	.quad	.LBE97-.LBB97
	.long	0x5cc
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0xbd
	.long	0x37
	.long	.LLST25
	.uleb128 0x21
	.quad	.LVL85
	.long	0xdaf
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x99a
	.quad	.LBB98
	.quad	.LBE98-.LBB98
	.byte	0x1
	.byte	0xc8
	.long	0x611
	.uleb128 0x24
	.long	0x9aa
	.long	.LLST26
	.uleb128 0x21
	.quad	.LVL93
	.long	0xdba
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL81
	.long	0xdc5
	.long	0x634
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0x128
	.byte	0
	.uleb128 0x25
	.quad	.LVL82
	.long	0xdd1
	.long	0x653
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	doAtExit
	.byte	0
	.uleb128 0x25
	.quad	.LVL83
	.long	0xddd
	.long	0x672
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	doAtExit
	.byte	0
	.uleb128 0x25
	.quad	.LVL91
	.long	0xde9
	.long	0x691
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x26
	.quad	.LVL94
	.long	0x752
	.uleb128 0x25
	.quad	.LVL96
	.long	0xdf4
	.long	0x6c8
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x3e
	.byte	0
	.uleb128 0x26
	.quad	.LVL99
	.long	0xe03
	.byte	0
	.uleb128 0x27
	.long	.LASF96
	.byte	0x1
	.byte	0xaa
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x73a
	.uleb128 0x28
	.long	0x9b7
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.byte	0x1
	.byte	0xac
	.uleb128 0x24
	.long	0x9d2
	.long	.LLST0
	.uleb128 0x29
	.long	0x9c7
	.uleb128 0x2a
	.quad	.LVL1
	.long	0xe0f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LASF143
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	0x752
	.uleb128 0x2c
	.string	"sig"
	.byte	0x1
	.byte	0x95
	.long	0x53
	.byte	0
	.uleb128 0x27
	.long	.LASF97
	.byte	0x1
	.byte	0x64
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x89b
	.uleb128 0x1a
	.long	.LASF98
	.byte	0x1
	.byte	0x65
	.long	0x89b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x2d
	.long	.LASF99
	.byte	0x1
	.byte	0x66
	.long	0x37
	.byte	0
	.uleb128 0x2e
	.long	.LASF100
	.byte	0x1
	.byte	0x67
	.long	0x3be
	.long	.LLST21
	.uleb128 0x1a
	.long	.LASF101
	.byte	0x1
	.byte	0x69
	.long	0x175
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x23
	.long	0x9b7
	.quad	.LBB95
	.quad	.LBE95-.LBB95
	.byte	0x1
	.byte	0x87
	.long	0x7fe
	.uleb128 0x24
	.long	0x9d2
	.long	.LLST22
	.uleb128 0x29
	.long	0x9c7
	.uleb128 0x21
	.quad	.LVL66
	.long	0xe0f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -504
	.byte	0x6
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x8
	.byte	0x7b
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.byte	0x8
	.byte	0x7d
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL63
	.long	0xe1a
	.long	0x817
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.byte	0
	.uleb128 0x26
	.quad	.LVL65
	.long	0xe25
	.uleb128 0x25
	.quad	.LVL67
	.long	0xe30
	.long	0x856
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x8a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x26
	.quad	.LVL68
	.long	0xe3b
	.uleb128 0x25
	.quad	.LVL74
	.long	0xac6
	.long	0x88d
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.byte	0
	.uleb128 0x26
	.quad	.LVL77
	.long	0xe46
	.byte	0
	.uleb128 0xc
	.long	0x84
	.long	0x8ab
	.uleb128 0xd
	.long	0x3e
	.byte	0xff
	.byte	0
	.uleb128 0x2f
	.long	.LASF104
	.byte	0x1
	.byte	0x3d
	.long	0x3be
	.byte	0x1
	.long	0x900
	.uleb128 0x2c
	.string	"act"
	.byte	0x1
	.byte	0x3d
	.long	0x3be
	.uleb128 0x2c
	.string	"dp"
	.byte	0x1
	.byte	0x3e
	.long	0x37
	.uleb128 0x2c
	.string	"len"
	.byte	0x1
	.byte	0x3f
	.long	0x190
	.uleb128 0x30
	.long	.LASF98
	.byte	0x1
	.byte	0x3f
	.long	0x79
	.uleb128 0x30
	.long	.LASF101
	.byte	0x1
	.byte	0x40
	.long	0x900
	.uleb128 0x31
	.long	.LASF102
	.byte	0x1
	.byte	0x43
	.uleb128 0x31
	.long	.LASF103
	.byte	0x1
	.byte	0x5d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x144
	.uleb128 0x2f
	.long	.LASF105
	.byte	0x1
	.byte	0x30
	.long	0x3be
	.byte	0x1
	.long	0x92b
	.uleb128 0x2c
	.string	"s"
	.byte	0x1
	.byte	0x30
	.long	0x3be
	.uleb128 0x30
	.long	.LASF101
	.byte	0x1
	.byte	0x30
	.long	0x900
	.byte	0
	.uleb128 0x2f
	.long	.LASF106
	.byte	0x1
	.byte	0x19
	.long	0x3be
	.byte	0x1
	.long	0x945
	.uleb128 0x2c
	.string	"s"
	.byte	0x1
	.byte	0x19
	.long	0x3be
	.byte	0
	.uleb128 0x32
	.long	.LASF144
	.byte	0x3
	.byte	0x32
	.byte	0x3
	.long	0x95d
	.uleb128 0x2c
	.string	"sig"
	.byte	0x3
	.byte	0x32
	.long	0x53
	.byte	0
	.uleb128 0x33
	.long	.LASF108
	.byte	0x2
	.byte	0xfc
	.long	0x79
	.byte	0x3
	.long	0x98f
	.uleb128 0x2c
	.string	"__s"
	.byte	0x2
	.byte	0xfc
	.long	0x7f
	.uleb128 0x2c
	.string	"__n"
	.byte	0x2
	.byte	0xfc
	.long	0x53
	.uleb128 0x30
	.long	.LASF107
	.byte	0x2
	.byte	0xfc
	.long	0x995
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x320
	.uleb128 0x7
	.long	0x98f
	.uleb128 0x33
	.long	.LASF109
	.byte	0x2
	.byte	0x66
	.long	0x53
	.byte	0x3
	.long	0x9b7
	.uleb128 0x30
	.long	.LASF110
	.byte	0x2
	.byte	0x66
	.long	0x3c4
	.uleb128 0x34
	.byte	0
	.uleb128 0x33
	.long	.LASF111
	.byte	0x2
	.byte	0x5f
	.long	0x53
	.byte	0x3
	.long	0x9df
	.uleb128 0x30
	.long	.LASF107
	.byte	0x2
	.byte	0x5f
	.long	0x995
	.uleb128 0x30
	.long	.LASF110
	.byte	0x2
	.byte	0x5f
	.long	0x3c4
	.uleb128 0x34
	.byte	0
	.uleb128 0x35
	.long	.LASF145
	.byte	0x4
	.byte	0x4f
	.long	0x53
	.byte	0x3
	.long	0x9fb
	.uleb128 0x2c
	.string	"__c"
	.byte	0x4
	.byte	0x4f
	.long	0x53
	.byte	0
	.uleb128 0x36
	.long	0x73a
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xac6
	.uleb128 0x24
	.long	0x746
	.long	.LLST1
	.uleb128 0x37
	.long	0x945
	.quad	.LBB33
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x96
	.long	0xa5f
	.uleb128 0x24
	.long	0x951
	.long	.LLST2
	.uleb128 0x38
	.long	0x945
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x24
	.long	0x951
	.long	.LLST3
	.byte	0
	.byte	0
	.uleb128 0x39
	.long	0x73a
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.long	0xa9b
	.uleb128 0x24
	.long	0x746
	.long	.LLST4
	.uleb128 0x21
	.quad	.LVL7
	.long	0xe4f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL13
	.long	0xe5e
	.long	0xab2
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.quad	.LVL15
	.long	0xe6a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x36
	.long	0x8ab
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0xdaf
	.uleb128 0x24
	.long	0x8bb
	.long	.LLST5
	.uleb128 0x24
	.long	0x8c6
	.long	.LLST6
	.uleb128 0x24
	.long	0x8db
	.long	.LLST7
	.uleb128 0x24
	.long	0x8e6
	.long	.LLST8
	.uleb128 0x3a
	.long	0x8f1
	.uleb128 0x3b
	.long	0x8f8
	.quad	.L44
	.uleb128 0x3c
	.long	0x8d0
	.value	0x100
	.uleb128 0x37
	.long	0x95d
	.quad	.LBB61
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x46
	.long	0xb68
	.uleb128 0x29
	.long	0x983
	.uleb128 0x24
	.long	0x978
	.long	.LLST9
	.uleb128 0x24
	.long	0x96d
	.long	.LLST10
	.uleb128 0x21
	.quad	.LVL21
	.long	0xe76
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x100
	.byte	0
	.byte	0
	.uleb128 0x37
	.long	0x92b
	.quad	.LBB64
	.long	.Ldebug_ranges0+0x70
	.byte	0x1
	.byte	0x46
	.long	0xb96
	.uleb128 0x24
	.long	0x93b
	.long	.LLST11
	.uleb128 0x26
	.quad	.LVL23
	.long	0xe85
	.byte	0
	.uleb128 0x37
	.long	0x9df
	.quad	.LBB69
	.long	.Ldebug_ranges0+0xa0
	.byte	0x1
	.byte	0x59
	.long	0xbc4
	.uleb128 0x24
	.long	0x9ef
	.long	.LLST12
	.uleb128 0x26
	.quad	.LVL38
	.long	0xe90
	.byte	0
	.uleb128 0x37
	.long	0x906
	.quad	.LBB73
	.long	.Ldebug_ranges0+0xd0
	.byte	0x1
	.byte	0x50
	.long	0xc6d
	.uleb128 0x24
	.long	0x91f
	.long	.LLST13
	.uleb128 0x24
	.long	0x916
	.long	.LLST14
	.uleb128 0x37
	.long	0x9df
	.quad	.LBB75
	.long	.Ldebug_ranges0+0x110
	.byte	0x1
	.byte	0x31
	.long	0xc21
	.uleb128 0x24
	.long	0x9ef
	.long	.LLST15
	.uleb128 0x21
	.quad	.LVL41
	.long	0xe90
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x92b
	.quad	.LBB79
	.quad	.LBE79-.LBB79
	.byte	0x1
	.byte	0x32
	.long	0xc53
	.uleb128 0x24
	.long	0x93b
	.long	.LLST16
	.uleb128 0x26
	.quad	.LVL43
	.long	0xe85
	.byte	0
	.uleb128 0x21
	.quad	.LVL61
	.long	0xe9c
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x37
	.long	0x906
	.quad	.LBB84
	.long	.Ldebug_ranges0+0x140
	.byte	0x1
	.byte	0x53
	.long	0xcf9
	.uleb128 0x24
	.long	0x91f
	.long	.LLST17
	.uleb128 0x24
	.long	0x916
	.long	.LLST18
	.uleb128 0x37
	.long	0x9df
	.quad	.LBB86
	.long	.Ldebug_ranges0+0x170
	.byte	0x1
	.byte	0x31
	.long	0xcca
	.uleb128 0x24
	.long	0x9ef
	.long	.LLST19
	.uleb128 0x21
	.quad	.LVL49
	.long	0xe90
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	0x92b
	.quad	.LBB90
	.quad	.LBE90-.LBB90
	.byte	0x1
	.byte	0x32
	.uleb128 0x24
	.long	0x93b
	.long	.LLST20
	.uleb128 0x26
	.quad	.LVL51
	.long	0xe85
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL31
	.long	0xeab
	.long	0xd14
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.byte	0
	.uleb128 0x25
	.quad	.LVL47
	.long	0xac6
	.long	0xd3e
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.quad	.LVL55
	.long	0xe9c
	.long	0xd5b
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x25
	.quad	.LVL56
	.long	0xe9c
	.long	0xd78
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x25
	.quad	.LVL59
	.long	0xe9c
	.long	0xd95
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x33
	.byte	0
	.uleb128 0x21
	.quad	.LVL60
	.long	0xe9c
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF112
	.long	.LASF112
	.byte	0x3
	.byte	0x60
	.uleb128 0x3d
	.long	.LASF113
	.long	.LASF113
	.byte	0x2
	.byte	0x57
	.uleb128 0x3e
	.long	.LASF114
	.long	.LASF114
	.byte	0xc
	.value	0x126
	.uleb128 0x3e
	.long	.LASF115
	.long	.LASF115
	.byte	0x10
	.value	0x250
	.uleb128 0x3e
	.long	.LASF116
	.long	.LASF116
	.byte	0x10
	.value	0x258
	.uleb128 0x3d
	.long	.LASF117
	.long	.LASF117
	.byte	0xc
	.byte	0xee
	.uleb128 0x3f
	.long	.LASF124
	.long	.LASF126
	.byte	0x11
	.byte	0
	.long	.LASF124
	.uleb128 0x3e
	.long	.LASF118
	.long	.LASF118
	.byte	0xc
	.value	0x307
	.uleb128 0x3d
	.long	.LASF119
	.long	.LASF119
	.byte	0x2
	.byte	0x55
	.uleb128 0x3d
	.long	.LASF120
	.long	.LASF120
	.byte	0x8
	.byte	0x3a
	.uleb128 0x3d
	.long	.LASF121
	.long	.LASF121
	.byte	0xc
	.byte	0xcc
	.uleb128 0x3d
	.long	.LASF122
	.long	.LASF122
	.byte	0x3
	.byte	0x51
	.uleb128 0x3d
	.long	.LASF123
	.long	.LASF123
	.byte	0xe
	.byte	0x7b
	.uleb128 0x40
	.long	.LASF146
	.long	.LASF146
	.uleb128 0x3f
	.long	.LASF125
	.long	.LASF127
	.byte	0xe
	.byte	0x5d
	.long	.LASF125
	.uleb128 0x3e
	.long	.LASF128
	.long	.LASF128
	.byte	0x10
	.value	0x272
	.uleb128 0x3e
	.long	.LASF129
	.long	.LASF129
	.byte	0x10
	.value	0x26c
	.uleb128 0x3f
	.long	.LASF108
	.long	.LASF130
	.byte	0x2
	.byte	0xf2
	.long	.LASF108
	.uleb128 0x3d
	.long	.LASF131
	.long	.LASF131
	.byte	0xf
	.byte	0x4f
	.uleb128 0x3e
	.long	.LASF132
	.long	.LASF132
	.byte	0xa
	.value	0x1b2
	.uleb128 0x3f
	.long	.LASF133
	.long	.LASF134
	.byte	0x12
	.byte	0x19
	.long	.LASF133
	.uleb128 0x3e
	.long	.LASF135
	.long	.LASF135
	.byte	0xc
	.value	0x272
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0xa
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xa
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST23:
	.quad	.LVL78
	.quad	.LVL80
	.value	0x1
	.byte	0x55
	.quad	.LVL80
	.quad	.LVL88
	.value	0x1
	.byte	0x5f
	.quad	.LVL95
	.quad	.LVL96
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL78
	.quad	.LVL79
	.value	0x1
	.byte	0x54
	.quad	.LVL79
	.quad	.LVL89
	.value	0x1
	.byte	0x5e
	.quad	.LVL89
	.quad	.LVL90
	.value	0x3
	.byte	0x7e
	.sleb128 -8
	.byte	0x9f
	.quad	.LVL90
	.quad	.LVL95
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL95
	.quad	.LVL96
	.value	0x1
	.byte	0x5e
	.quad	.LVL96
	.quad	.LVL97
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL98
	.value	0x1
	.byte	0x5e
	.quad	.LVL98
	.quad	.LFE32
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL83
	.quad	.LVL84
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL84
	.quad	.LVL86
	.value	0x1
	.byte	0x53
	.quad	.LVL86
	.quad	.LVL87
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL92
	.quad	.LVL93
	.value	0xa
	.byte	0x3
	.quad	.LC12
	.byte	0x9f
	.quad	0
	.quad	0
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL62
	.quad	.LVL64
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	.LVL64
	.quad	.LVL69
	.value	0x3
	.byte	0x91
	.sleb128 -504
	.quad	.LVL69
	.quad	.LVL70
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	.LVL70
	.quad	.LVL71
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	.LVL71
	.quad	.LVL72
	.value	0xa
	.byte	0x3
	.quad	.LC5
	.byte	0x9f
	.quad	.LVL72
	.quad	.LVL73
	.value	0xa
	.byte	0x3
	.quad	.LC6
	.byte	0x9f
	.quad	.LVL73
	.quad	.LVL75
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	.LVL75
	.quad	.LVL76
	.value	0xa
	.byte	0x3
	.quad	.LC7
	.byte	0x9f
	.quad	.LVL76
	.quad	.LFE29
	.value	0x3
	.byte	0x91
	.sleb128 -504
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL65
	.quad	.LVL66
	.value	0x3
	.byte	0x91
	.sleb128 -504
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL2
	.quad	.LVL6
	.value	0x1
	.byte	0x55
	.quad	.LVL6
	.quad	.LVL7-1
	.value	0x1
	.byte	0x50
	.quad	.LVL7-1
	.quad	.LVL9
	.value	0x1
	.byte	0x53
	.quad	.LVL9
	.quad	.LVL10
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL10
	.quad	.LVL12
	.value	0x1
	.byte	0x55
	.quad	.LVL12
	.quad	.LVL13-1
	.value	0x1
	.byte	0x50
	.quad	.LVL13-1
	.quad	.LVL13
	.value	0x1
	.byte	0x53
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x55
	.quad	.LVL14
	.quad	.LVL15-1
	.value	0x1
	.byte	0x50
	.quad	.LVL15-1
	.quad	.LFE30
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x1
	.byte	0x50
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL5
	.quad	.LVL8
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL16
	.quad	.LVL18
	.value	0x1
	.byte	0x55
	.quad	.LVL18
	.quad	.LVL19
	.value	0x1
	.byte	0x53
	.quad	.LVL30
	.quad	.LVL33
	.value	0x1
	.byte	0x53
	.quad	.LVL33
	.quad	.LVL36
	.value	0x1
	.byte	0x50
	.quad	.LVL36
	.quad	.LVL38
	.value	0x1
	.byte	0x53
	.quad	.LVL38
	.quad	.LVL39
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	.LVL39
	.quad	.LVL40
	.value	0x1
	.byte	0x53
	.quad	.LVL40
	.quad	.LVL44
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL47
	.quad	.LVL49-1
	.value	0x1
	.byte	0x50
	.quad	.LVL49-1
	.quad	.LVL52
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL56
	.quad	.LVL58
	.value	0x1
	.byte	0x55
	.quad	.LVL58
	.quad	.LVL59
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL59
	.quad	.LVL60
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x1
	.byte	0x54
	.quad	.LVL17
	.quad	.LVL27
	.value	0x1
	.byte	0x56
	.quad	.LVL27
	.quad	.LVL30
	.value	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL30
	.quad	.LVL32
	.value	0x1
	.byte	0x56
	.quad	.LVL32
	.quad	.LVL36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL36
	.quad	.LVL56
	.value	0x1
	.byte	0x56
	.quad	.LVL56
	.quad	.LVL57
	.value	0x1
	.byte	0x54
	.quad	.LVL57
	.quad	.LVL59
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL59
	.quad	.LFE35
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL16
	.quad	.LVL18
	.value	0x1
	.byte	0x51
	.quad	.LVL18
	.quad	.LVL28
	.value	0x1
	.byte	0x5c
	.quad	.LVL28
	.quad	.LVL30
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL30
	.quad	.LVL34
	.value	0x1
	.byte	0x5c
	.quad	.LVL34
	.quad	.LVL36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL36
	.quad	.LVL56
	.value	0x1
	.byte	0x5c
	.quad	.LVL56
	.quad	.LVL59-1
	.value	0x1
	.byte	0x51
	.quad	.LVL59-1
	.quad	.LVL59
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL59
	.quad	.LFE35
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL16
	.quad	.LVL18
	.value	0x1
	.byte	0x52
	.quad	.LVL18
	.quad	.LVL29
	.value	0x1
	.byte	0x5f
	.quad	.LVL29
	.quad	.LVL30
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL30
	.quad	.LVL35
	.value	0x1
	.byte	0x5f
	.quad	.LVL35
	.quad	.LVL36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL36
	.quad	.LVL56
	.value	0x1
	.byte	0x5f
	.quad	.LVL56
	.quad	.LVL59-1
	.value	0x1
	.byte	0x52
	.quad	.LVL59-1
	.quad	.LFE35
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL20
	.quad	.LVL22
	.value	0x4
	.byte	0xa
	.value	0x100
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL20
	.quad	.LVL22
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL22
	.quad	.LVL23-1
	.value	0x1
	.byte	0x50
	.quad	.LVL23-1
	.quad	.LVL24
	.value	0x1
	.byte	0x53
	.quad	.LVL24
	.quad	.LVL25
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	.LVL25
	.quad	.LVL26
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL36
	.quad	.LVL37
	.value	0x9
	.byte	0x70
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL37
	.quad	.LVL38-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL40
	.quad	.LVL46
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL40
	.quad	.LVL44
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL40
	.quad	.LVL41
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL42
	.quad	.LVL44
	.value	0x1
	.byte	0x53
	.quad	.LVL44
	.quad	.LVL45
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	.LVL45
	.quad	.LVL46
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL48
	.quad	.LVL54
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL48
	.quad	.LVL52
	.value	0x1
	.byte	0x53
	.quad	.LVL52
	.quad	.LVL53
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	.LVL53
	.quad	.LVL54
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL48
	.quad	.LVL49
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL50
	.quad	.LVL52
	.value	0x1
	.byte	0x53
	.quad	.LVL52
	.quad	.LVL53
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	.LVL53
	.quad	.LVL54
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB33
	.quad	.LBE33
	.quad	.LBB39
	.quad	.LBE39
	.quad	.LBB42
	.quad	.LBE42
	.quad	0
	.quad	0
	.quad	.LBB61
	.quad	.LBE61
	.quad	.LBB67
	.quad	.LBE67
	.quad	0
	.quad	0
	.quad	.LBB64
	.quad	.LBE64
	.quad	.LBB68
	.quad	.LBE68
	.quad	0
	.quad	0
	.quad	.LBB69
	.quad	.LBE69
	.quad	.LBB72
	.quad	.LBE72
	.quad	0
	.quad	0
	.quad	.LBB73
	.quad	.LBE73
	.quad	.LBB83
	.quad	.LBE83
	.quad	.LBB94
	.quad	.LBE94
	.quad	0
	.quad	0
	.quad	.LBB75
	.quad	.LBE75
	.quad	.LBB78
	.quad	.LBE78
	.quad	0
	.quad	0
	.quad	.LBB84
	.quad	.LBE84
	.quad	.LBB93
	.quad	.LBE93
	.quad	0
	.quad	0
	.quad	.LBB86
	.quad	.LBE86
	.quad	.LBB89
	.quad	.LBE89
	.quad	0
	.quad	0
	.quad	.LFB31
	.quad	.LFE31
	.quad	.LFB30
	.quad	.LFE30
	.quad	.LFB35
	.quad	.LFE35
	.quad	.LFB29
	.quad	.LFE29
	.quad	.LFB32
	.quad	.LFE32
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF109:
	.string	"printf"
.LASF136:
	.ascii	"GNU C11 7.5.0 -march=haswell -mmmx -mno-3dnow -msse -msse2 -"
	.ascii	"msse3 -mssse3 -mno-sse4a -mcx16 -msahf -mmovbe -maes -mno-sh"
	.ascii	"a -mpclmul -mpopcnt -mabm -mno-lwp -mno-fma -mno-fma4 -mno-x"
	.ascii	"op -mno-bmi -mno-sgx -mno-bmi2 -mno-tbm -mavx -mavx2 -msse4."
	.ascii	"2 -msse4.1 -mlzcnt -mno-rtm -mno-hle -mrdrnd -mno-f16c -mfsg"
	.ascii	"sbase -mrdseed -mprfchw -mno-adx -mfxsr -mxsave -mno-xsaveop"
	.ascii	"t -mno-avx512f -mno-avx512er -mno-avx512cd -mno-avx512pf -mn"
	.ascii	"o-prefetchwt1 -mclflushopt -mno-xsavec -mno-xsaves -mno-avx5"
	.ascii	"12dq -mno-avx512bw -mno-avx512vl -mno-avx512ifma -mno-avx512"
	.ascii	"vbmi -mno-avx51"
	.string	"24fmaps -mno-avx5124vnniw -mno-clwb -mno-mwaitx -mno-clzero -mno-pku -mno-rdpid --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=6144 -mtune=generic -ggdb -O3 -std=c11 -fdata-sections -ffunction-sections -fstack-protector-strong"
.LASF18:
	.string	"_ISgraph"
.LASF46:
	.string	"_chain"
.LASF23:
	.string	"__jmp_buf"
.LASF30:
	.string	"size_t"
.LASF52:
	.string	"_shortbuf"
.LASF92:
	.string	"maxline"
.LASF16:
	.string	"_ISspace"
.LASF122:
	.string	"sh_print"
.LASF123:
	.string	"raise"
.LASF69:
	.string	"_IO_2_1_stderr_"
.LASF12:
	.string	"_ISlower"
.LASF75:
	.string	"__sighandler_t"
.LASF85:
	.string	"plusL"
.LASF77:
	.string	"long long unsigned int"
.LASF86:
	.string	"plusR"
.LASF97:
	.string	"basic_blocks"
.LASF13:
	.string	"_ISalpha"
.LASF115:
	.string	"atexit"
.LASF14:
	.string	"_ISdigit"
.LASF73:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF126:
	.string	"__builtin_fwrite"
.LASF82:
	.string	"sh_known"
.LASF31:
	.string	"__jmp_buf_tag"
.LASF47:
	.string	"_fileno"
.LASF83:
	.string	"sh_counts"
.LASF35:
	.string	"_IO_read_end"
.LASF141:
	.string	"state"
.LASF6:
	.string	"long int"
.LASF33:
	.string	"_flags"
.LASF22:
	.string	"_ISalnum"
.LASF50:
	.string	"_cur_column"
.LASF102:
	.string	"NEW_LINE"
.LASF137:
	.string	"/media/sf_vbx_shared/study material/Programming/C/code/Modern C/level3/exercises/exs30.c"
.LASF113:
	.string	"__printf_chk"
.LASF49:
	.string	"_old_offset"
.LASF54:
	.string	"_offset"
.LASF125:
	.string	"__sysv_signal"
.LASF91:
	.string	"interrupt"
.LASF19:
	.string	"_ISblank"
.LASF87:
	.string	"tooDeep"
.LASF21:
	.string	"_ISpunct"
.LASF132:
	.string	"_IO_putc"
.LASF63:
	.string	"_IO_marker"
.LASF70:
	.string	"stdin"
.LASF26:
	.string	"__jmpbuf"
.LASF2:
	.string	"unsigned int"
.LASF96:
	.string	"doAtExit"
.LASF111:
	.string	"fprintf"
.LASF25:
	.string	"__val"
.LASF107:
	.string	"__stream"
.LASF3:
	.string	"long unsigned int"
.LASF140:
	.string	"_IO_FILE_plus"
.LASF38:
	.string	"_IO_write_ptr"
.LASF24:
	.string	"__sigset_t"
.LASF79:
	.string	"name"
.LASF65:
	.string	"_sbuf"
.LASF112:
	.string	"sh_enable"
.LASF89:
	.string	"interrupted"
.LASF1:
	.string	"short unsigned int"
.LASF145:
	.string	"putchar"
.LASF99:
	.string	"depth"
.LASF42:
	.string	"_IO_save_base"
.LASF117:
	.string	"freopen"
.LASF53:
	.string	"_lock"
.LASF93:
	.string	"lastOpen"
.LASF48:
	.string	"_flags2"
.LASF60:
	.string	"_mode"
.LASF108:
	.string	"fgets"
.LASF71:
	.string	"stdout"
.LASF81:
	.string	"sh_pairs"
.LASF101:
	.string	"jmpTarget"
.LASF67:
	.string	"_IO_2_1_stdin_"
.LASF118:
	.string	"perror"
.LASF27:
	.string	"__mask_was_saved"
.LASF39:
	.string	"_IO_write_end"
.LASF80:
	.string	"desc"
.LASF34:
	.string	"_IO_read_ptr"
.LASF120:
	.string	"_setjmp"
.LASF116:
	.string	"at_quick_exit"
.LASF139:
	.string	"_IO_lock_t"
.LASF32:
	.string	"_IO_FILE"
.LASF135:
	.string	"fputs"
.LASF7:
	.string	"__off_t"
.LASF74:
	.string	"sig_atomic_t"
.LASF128:
	.string	"_Exit"
.LASF66:
	.string	"_pos"
.LASF121:
	.string	"fflush"
.LASF45:
	.string	"_markers"
.LASF84:
	.string	"execution"
.LASF76:
	.string	"_Bool"
.LASF0:
	.string	"unsigned char"
.LASF41:
	.string	"_IO_buf_end"
.LASF78:
	.string	"sh_pair"
.LASF106:
	.string	"skipspace"
.LASF5:
	.string	"short int"
.LASF138:
	.string	"/media/sf_vbx_shared/study material/Programming/C/code/Modern C/level3/exercises/build"
.LASF51:
	.string	"_vtable_offset"
.LASF68:
	.string	"_IO_2_1_stdout_"
.LASF62:
	.string	"FILE"
.LASF100:
	.string	"format"
.LASF119:
	.string	"__fprintf_chk"
.LASF146:
	.string	"__stack_chk_fail"
.LASF130:
	.string	"__fgets_alias"
.LASF90:
	.string	"head"
.LASF127:
	.string	"signal"
.LASF129:
	.string	"quick_exit"
.LASF144:
	.string	"sh_count"
.LASF9:
	.string	"char"
.LASF131:
	.string	"__ctype_b_loc"
.LASF103:
	.string	"ASCEND"
.LASF20:
	.string	"_IScntrl"
.LASF133:
	.string	"__longjmp_chk"
.LASF15:
	.string	"_ISxdigit"
.LASF98:
	.string	"buffer"
.LASF64:
	.string	"_next"
.LASF8:
	.string	"__off64_t"
.LASF36:
	.string	"_IO_read_base"
.LASF44:
	.string	"_IO_save_end"
.LASF110:
	.string	"__fmt"
.LASF134:
	.string	"longjmp"
.LASF55:
	.string	"__pad1"
.LASF56:
	.string	"__pad2"
.LASF57:
	.string	"__pad3"
.LASF58:
	.string	"__pad4"
.LASF59:
	.string	"__pad5"
.LASF28:
	.string	"__saved_mask"
.LASF61:
	.string	"_unused2"
.LASF72:
	.string	"stderr"
.LASF95:
	.string	"argv"
.LASF29:
	.string	"jmp_buf"
.LASF104:
	.string	"descend"
.LASF11:
	.string	"_ISupper"
.LASF43:
	.string	"_IO_backup_base"
.LASF114:
	.string	"setvbuf"
.LASF143:
	.string	"signal_handler"
.LASF124:
	.string	"fwrite"
.LASF94:
	.string	"argc"
.LASF105:
	.string	"end_line"
.LASF88:
	.string	"eofOut"
.LASF142:
	.string	"main"
.LASF37:
	.string	"_IO_write_base"
.LASF10:
	.string	"__sig_atomic_t"
.LASF40:
	.string	"_IO_buf_base"
.LASF17:
	.string	"_ISprint"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

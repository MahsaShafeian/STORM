	.file	"sha.c"
	.text
	.type	sha_transform, @function
sha_transform:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $752, %rsp
	movq	%rdi, -728(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -708(%rbp)
	jmp	.L2
.L3:
	movq	-728(%rbp), %rax
	movl	-708(%rbp), %edx
	movslq	%edx, %rdx
	addq	$6, %rdx
	movq	8(%rax,%rdx,8), %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	%rdx, -656(%rbp,%rax,8)
	addl	$1, -708(%rbp)
.L2:
	cmpl	$15, -708(%rbp)
	jle	.L3
	movl	$16, -708(%rbp)
	jmp	.L4
.L5:
	movl	-708(%rbp), %eax
	subl	$3, %eax
	cltq
	movq	-656(%rbp,%rax,8), %rdx
	movl	-708(%rbp), %eax
	subl	$8, %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	xorq	%rax, %rdx
	movl	-708(%rbp), %eax
	subl	$14, %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	xorq	%rax, %rdx
	movl	-708(%rbp), %eax
	subl	$16, %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	xorq	%rax, %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	%rdx, -656(%rbp,%rax,8)
	addl	$1, -708(%rbp)
.L4:
	cmpl	$79, -708(%rbp)
	jle	.L5
	movq	-728(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -704(%rbp)
	movq	-728(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -696(%rbp)
	movq	-728(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -688(%rbp)
	movq	-728(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -680(%rbp)
	movq	-728(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -672(%rbp)
	movl	$0, -708(%rbp)
	jmp	.L6
.L7:
	movq	-704(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-704(%rbp), %rax
	shrq	$27, %rax
	movq	%rdx, %rcx
	orq	%rax, %rcx
	movq	-696(%rbp), %rax
	andq	-688(%rbp), %rax
	movq	%rax, %rdx
	movq	-696(%rbp), %rax
	notq	%rax
	andq	-680(%rbp), %rax
	orq	%rdx, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-672(%rbp), %rax
	addq	%rax, %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	addq	%rdx, %rax
	addq	$1518500249, %rax
	movq	%rax, -664(%rbp)
	movq	-680(%rbp), %rax
	movq	%rax, -672(%rbp)
	movq	-688(%rbp), %rax
	movq	%rax, -680(%rbp)
	movq	-696(%rbp), %rax
	salq	$30, %rax
	movq	%rax, %rdx
	movq	-696(%rbp), %rax
	shrq	$2, %rax
	orq	%rdx, %rax
	movq	%rax, -688(%rbp)
	movq	-704(%rbp), %rax
	movq	%rax, -696(%rbp)
	movq	-664(%rbp), %rax
	movq	%rax, -704(%rbp)
	addl	$1, -708(%rbp)
.L6:
	cmpl	$19, -708(%rbp)
	jle	.L7
	movl	$20, -708(%rbp)
	jmp	.L8
.L9:
	movq	-704(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-704(%rbp), %rax
	shrq	$27, %rax
	orq	%rax, %rdx
	movq	-696(%rbp), %rax
	xorq	-688(%rbp), %rax
	xorq	-680(%rbp), %rax
	addq	%rax, %rdx
	movq	-672(%rbp), %rax
	addq	%rax, %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	addq	%rdx, %rax
	addq	$1859775393, %rax
	movq	%rax, -664(%rbp)
	movq	-680(%rbp), %rax
	movq	%rax, -672(%rbp)
	movq	-688(%rbp), %rax
	movq	%rax, -680(%rbp)
	movq	-696(%rbp), %rax
	salq	$30, %rax
	movq	%rax, %rdx
	movq	-696(%rbp), %rax
	shrq	$2, %rax
	orq	%rdx, %rax
	movq	%rax, -688(%rbp)
	movq	-704(%rbp), %rax
	movq	%rax, -696(%rbp)
	movq	-664(%rbp), %rax
	movq	%rax, -704(%rbp)
	addl	$1, -708(%rbp)
.L8:
	cmpl	$39, -708(%rbp)
	jle	.L9
	movl	$40, -708(%rbp)
	jmp	.L10
.L11:
	movq	-704(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-704(%rbp), %rax
	shrq	$27, %rax
	movq	%rdx, %rcx
	orq	%rax, %rcx
	movq	-688(%rbp), %rax
	orq	-680(%rbp), %rax
	andq	-696(%rbp), %rax
	movq	%rax, %rdx
	movq	-688(%rbp), %rax
	andq	-680(%rbp), %rax
	orq	%rdx, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-672(%rbp), %rax
	addq	%rax, %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	addq	%rax, %rdx
	movl	$2400959708, %eax
	addq	%rdx, %rax
	movq	%rax, -664(%rbp)
	movq	-680(%rbp), %rax
	movq	%rax, -672(%rbp)
	movq	-688(%rbp), %rax
	movq	%rax, -680(%rbp)
	movq	-696(%rbp), %rax
	salq	$30, %rax
	movq	%rax, %rdx
	movq	-696(%rbp), %rax
	shrq	$2, %rax
	orq	%rdx, %rax
	movq	%rax, -688(%rbp)
	movq	-704(%rbp), %rax
	movq	%rax, -696(%rbp)
	movq	-664(%rbp), %rax
	movq	%rax, -704(%rbp)
	addl	$1, -708(%rbp)
.L10:
	cmpl	$59, -708(%rbp)
	jle	.L11
	movl	$60, -708(%rbp)
	jmp	.L12
.L13:
	movq	-704(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-704(%rbp), %rax
	shrq	$27, %rax
	orq	%rax, %rdx
	movq	-696(%rbp), %rax
	xorq	-688(%rbp), %rax
	xorq	-680(%rbp), %rax
	addq	%rax, %rdx
	movq	-672(%rbp), %rax
	addq	%rax, %rdx
	movl	-708(%rbp), %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	addq	%rax, %rdx
	movl	$3395469782, %eax
	addq	%rdx, %rax
	movq	%rax, -664(%rbp)
	movq	-680(%rbp), %rax
	movq	%rax, -672(%rbp)
	movq	-688(%rbp), %rax
	movq	%rax, -680(%rbp)
	movq	-696(%rbp), %rax
	salq	$30, %rax
	movq	%rax, %rdx
	movq	-696(%rbp), %rax
	shrq	$2, %rax
	orq	%rdx, %rax
	movq	%rax, -688(%rbp)
	movq	-704(%rbp), %rax
	movq	%rax, -696(%rbp)
	movq	-664(%rbp), %rax
	movq	%rax, -704(%rbp)
	addl	$1, -708(%rbp)
.L12:
	cmpl	$79, -708(%rbp)
	jle	.L13
	movq	-728(%rbp), %rax
	movq	(%rax), %rdx
	movq	-704(%rbp), %rax
	addq	%rax, %rdx
	movq	-728(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-728(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-696(%rbp), %rax
	addq	%rax, %rdx
	movq	-728(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-728(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-688(%rbp), %rax
	addq	%rax, %rdx
	movq	-728(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-728(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-680(%rbp), %rax
	addq	%rax, %rdx
	movq	-728(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-728(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-672(%rbp), %rax
	addq	%rax, %rdx
	movq	-728(%rbp), %rax
	movq	%rdx, 32(%rax)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sha_transform, .-sha_transform
	.type	byte_reverse, @function
byte_reverse:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-44(%rbp), %eax
	cltq
	shrq	$3, %rax
	movl	%eax, -44(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L16
.L17:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -12(%rbp)
	movq	-24(%rbp), %rax
	movzbl	1(%rax), %eax
	movb	%al, -11(%rbp)
	movq	-24(%rbp), %rax
	movzbl	2(%rax), %eax
	movb	%al, -10(%rbp)
	movq	-24(%rbp), %rax
	movzbl	3(%rax), %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movzbl	-10(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movzbl	-11(%rbp), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	leaq	3(%rax), %rdx
	movzbl	-12(%rbp), %eax
	movb	%al, (%rdx)
	addq	$8, -24(%rbp)
	addl	$1, -28(%rbp)
.L16:
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L17
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	byte_reverse, .-byte_reverse
	.globl	sha_init
	.type	sha_init, @function
sha_init:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$1732584193, (%rax)
	movq	-8(%rbp), %rax
	movl	$4023233417, %edx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	$2562383102, %ecx
	movq	%rcx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$271733878, 24(%rax)
	movq	-8(%rbp), %rax
	movl	$3285377520, %esi
	movq	%rsi, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	nop
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	sha_init, .-sha_init
	.globl	sha_update
	.type	sha_update, @function
sha_update:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	40(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L21
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
.L21:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	movq	48(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	shrq	$29, %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
	jmp	.L22
.L23:
	movq	-8(%rbp), %rax
	leaq	56(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	addq	$56, %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	byte_reverse
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	sha_transform
	addq	$64, -16(%rbp)
	subl	$64, -20(%rbp)
.L22:
	cmpl	$63, -20(%rbp)
	jg	.L23
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	leaq	56(%rax), %rcx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	sha_update, .-sha_update
	.globl	sha_final
	.type	sha_final, @function
sha_final:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	shrq	$3, %rax
	andl	$63, %eax
	movl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	leaq	56(%rax), %rcx
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	addq	%rcx, %rax
	movb	$-128, (%rax)
	cmpl	$56, -20(%rbp)
	jle	.L25
	movl	$64, %eax
	subl	-20(%rbp), %eax
	cltq
	movq	-40(%rbp), %rdx
	leaq	56(%rdx), %rcx
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$0, %esi
	movq	%rcx, %rdi
	call	memset@PLT
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	byte_reverse
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	sha_transform
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movl	$56, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	jmp	.L26
.L25:
	movl	$56, %eax
	subl	-20(%rbp), %eax
	cltq
	movq	-40(%rbp), %rdx
	leaq	56(%rdx), %rcx
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$0, %esi
	movq	%rcx, %rdi
	call	memset@PLT
.L26:
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	byte_reverse
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 168(%rax)
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 176(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	sha_transform
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sha_final, .-sha_final
	.globl	sha_stream
	.type	sha_stream, @function
sha_stream:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
    subq    $48, %rsp
	movq	%rdi, -8232(%rbp)
	movq	%rsi, -8240(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-8232(%rbp), %rax
	movq	%rax, %rdi
	call	sha_init
	jmp	.L28
.L29:
	movl	-8212(%rbp), %edx
	leaq	-8208(%rbp), %rcx
	movq	-8232(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	sha_update
.L28:
	movq	-8240(%rbp), %rdx
	leaq	-8208(%rbp), %rax
	movq	%rdx, %rcx
	movl	$8192, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movl	%eax, -8212(%rbp)
	cmpl	$0, -8212(%rbp)
	jg	.L29
	movq	-8232(%rbp), %rax
	movq	%rax, %rdi
	call	sha_final
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	sha_stream, .-sha_stream
	.section	.rodata
	.align 8
.LC0:
	.string	"%08lx %08lx %08lx %08lx %08lx\n"
	.text
	.globl	sha_print
	.type	sha_print, @function
sha_print:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	sha_print, .-sha_print
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

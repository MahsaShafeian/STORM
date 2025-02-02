	.file	"sha.c"
	.text
	.type	sha_transform,	@function
sha_transform:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$752,	%rsp
	movq	%rdi,	-708(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-16(%rbp)		#this_line_update!
	xorl	%eax,	%eax
	movl	$0,	-4(%rbp)		#this_line_update!
	jmp	.L2
.L3:
	movq	-708(%rbp),	%rax		#this_line_update!
	movl	-4(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	$6,	%rdx
	movq	8(%rax,%rdx,8),	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	%rdx,	-40(%rbp),		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L2:
	cmpl	$15,	-4(%rbp)		#this_line_update!
	jle	.L3
	movl	$16,	-4(%rbp)		#this_line_update!
	jmp	.L4
.L5:
	movl	-4(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	cltq
	movq	-40(%rbp),	%rdx		#this_line_update!
	movl	-4(%rbp),	%eax		#this_line_update!
	subl	$8,	%eax
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	xorq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	subl	$14,	%eax
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	xorq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	subl	$16,	%eax
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	xorq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	%rdx,	-40(%rbp),		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L4:
	cmpl	$79,	-4(%rbp)		#this_line_update!
	jle	.L5
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	movq	%rax,	-32(%rbp)		#this_line_update!
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	8(%rax),	%rax
	movq	%rax,	8(%rbp)		#this_line_update!
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	16(%rax),	%rax
	movq	%rax,	-732(%rbp)		#this_line_update!
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	24(%rax),	%rax
	movq	%rax,	-752(%rbp)		#this_line_update!
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	32(%rax),	%rax
	movq	%rax,	0(%rbp)		#this_line_update!
	movl	$0,	-4(%rbp)		#this_line_update!
	jmp	.L6
.L7:
	movq	-32(%rbp),	%rax		#this_line_update!
	salq	$5,	%rax
	movq	%rax,	%rdx
	movq	-32(%rbp),	%rax		#this_line_update!
	shrq	$27,	%rax
	movq	%rdx,	%rcx
	orq	%rax,	%rcx
	movq	8(%rbp),	%rax		#this_line_update!
	andq	-732(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	notq	%rax
	andq	-752(%rbp),	%rax		#this_line_update!
	orq	%rdx,	%rax
	leaq	(%rcx,%rax),	%rdx
	movq	0(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	addq	$1518500249,	%rax
	movq	%rax,	-24(%rbp)		#this_line_update!
	movq	-752(%rbp),	%rax		#this_line_update!
	movq	%rax,	0(%rbp)		#this_line_update!
	movq	-732(%rbp),	%rax		#this_line_update!
	movq	%rax,	-752(%rbp)		#this_line_update!
	movq	8(%rbp),	%rax		#this_line_update!
	salq	$30,	%rax
	movq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	shrq	$2,	%rax
	orq	%rdx,	%rax
	movq	%rax,	-732(%rbp)		#this_line_update!
	movq	-32(%rbp),	%rax		#this_line_update!
	movq	%rax,	8(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	-32(%rbp)		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L6:
	cmpl	$19,	-4(%rbp)		#this_line_update!
	jle	.L7
	movl	$20,	-4(%rbp)		#this_line_update!
	jmp	.L8
.L9:
	movq	-32(%rbp),	%rax		#this_line_update!
	salq	$5,	%rax
	movq	%rax,	%rdx
	movq	-32(%rbp),	%rax		#this_line_update!
	shrq	$27,	%rax
	orq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	xorq	-732(%rbp),	%rax		#this_line_update!
	xorq	-752(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	0(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	addq	$1859775393,	%rax
	movq	%rax,	-24(%rbp)		#this_line_update!
	movq	-752(%rbp),	%rax		#this_line_update!
	movq	%rax,	0(%rbp)		#this_line_update!
	movq	-732(%rbp),	%rax		#this_line_update!
	movq	%rax,	-752(%rbp)		#this_line_update!
	movq	8(%rbp),	%rax		#this_line_update!
	salq	$30,	%rax
	movq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	shrq	$2,	%rax
	orq	%rdx,	%rax
	movq	%rax,	-732(%rbp)		#this_line_update!
	movq	-32(%rbp),	%rax		#this_line_update!
	movq	%rax,	8(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	-32(%rbp)		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L8:
	cmpl	$39,	-4(%rbp)		#this_line_update!
	jle	.L9
	movl	$40,	-4(%rbp)		#this_line_update!
	jmp	.L10
.L11:
	movq	-32(%rbp),	%rax		#this_line_update!
	salq	$5,	%rax
	movq	%rax,	%rdx
	movq	-32(%rbp),	%rax		#this_line_update!
	shrq	$27,	%rax
	movq	%rdx,	%rcx
	orq	%rax,	%rcx
	movq	-732(%rbp),	%rax		#this_line_update!
	orq	-752(%rbp),	%rax		#this_line_update!
	andq	8(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdx
	movq	-732(%rbp),	%rax		#this_line_update!
	andq	-752(%rbp),	%rax		#this_line_update!
	orq	%rdx,	%rax
	leaq	(%rcx,%rax),	%rdx
	movq	0(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	$2400959708,	%eax
	addq	%rdx,	%rax
	movq	%rax,	-24(%rbp)		#this_line_update!
	movq	-752(%rbp),	%rax		#this_line_update!
	movq	%rax,	0(%rbp)		#this_line_update!
	movq	-732(%rbp),	%rax		#this_line_update!
	movq	%rax,	-752(%rbp)		#this_line_update!
	movq	8(%rbp),	%rax		#this_line_update!
	salq	$30,	%rax
	movq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	shrq	$2,	%rax
	orq	%rdx,	%rax
	movq	%rax,	-732(%rbp)		#this_line_update!
	movq	-32(%rbp),	%rax		#this_line_update!
	movq	%rax,	8(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	-32(%rbp)		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L10:
	cmpl	$59,	-4(%rbp)		#this_line_update!
	jle	.L11
	movl	$60,	-4(%rbp)		#this_line_update!
	jmp	.L12
.L13:
	movq	-32(%rbp),	%rax		#this_line_update!
	salq	$5,	%rax
	movq	%rax,	%rdx
	movq	-32(%rbp),	%rax		#this_line_update!
	shrq	$27,	%rax
	orq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	xorq	-732(%rbp),	%rax		#this_line_update!
	xorq	-752(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	0(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-4(%rbp),	%eax		#this_line_update!
	cltq
	movq	-40(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	$3395469782,	%eax
	addq	%rdx,	%rax
	movq	%rax,	-24(%rbp)		#this_line_update!
	movq	-752(%rbp),	%rax		#this_line_update!
	movq	%rax,	0(%rbp)		#this_line_update!
	movq	-732(%rbp),	%rax		#this_line_update!
	movq	%rax,	-752(%rbp)		#this_line_update!
	movq	8(%rbp),	%rax		#this_line_update!
	salq	$30,	%rax
	movq	%rax,	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	shrq	$2,	%rax
	orq	%rdx,	%rax
	movq	%rax,	-732(%rbp)		#this_line_update!
	movq	-32(%rbp),	%rax		#this_line_update!
	movq	%rax,	8(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	-32(%rbp)		#this_line_update!
	addl	$1,	-4(%rbp)		#this_line_update!
.L12:
	cmpl	$79,	-4(%rbp)		#this_line_update!
	jle	.L13
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rdx
	movq	-32(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	%rdx,	(%rax)
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	8(%rax),	%rdx
	movq	8(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	%rdx,	8(%rax)
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	16(%rax),	%rdx
	movq	-732(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	%rdx,	16(%rax)
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	24(%rax),	%rdx
	movq	-752(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	%rdx,	24(%rax)
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	32(%rax),	%rdx
	movq	0(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movq	-708(%rbp),	%rax		#this_line_update!
	movq	%rdx,	32(%rax)
	nop
	movq	-16(%rbp),	%rax		#this_line_update!
	subq	%fs:40,	%rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE6:
	.size	sha_transform,	.-sha_transform
	.type	byte_reverse,	@function
byte_reverse:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	-24(%rbp)		#this_line_update!
	movl	%esi,	-8(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	0(%rbp)		#this_line_update!
	xorl	%eax,	%eax
	movl	-8(%rbp),	%eax		#this_line_update!
	cltq
	shrq	$3,	%rax
	movl	%eax,	-8(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	-40(%rbp)		#this_line_update!
	movl	$0,	-16(%rbp)		#this_line_update!
	jmp	.L16
.L17:
	movq	-40(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movb	%al,	12(%rbp)		#this_line_update!
	movq	-40(%rbp),	%rax		#this_line_update!
	movzbl	1(%rax),	%eax
	movb	%al,	-36(%rbp)		#this_line_update!
	movq	-40(%rbp),	%rax		#this_line_update!
	movzbl	2(%rax),	%eax
	movb	%al,	-12(%rbp)		#this_line_update!
	movq	-40(%rbp),	%rax		#this_line_update!
	movzbl	3(%rax),	%eax
	movb	%al,	-20(%rbp)		#this_line_update!
	movzbl	-20(%rbp),	%edx		#this_line_update!
	movq	-40(%rbp),	%rax		#this_line_update!
	movb	%dl,	(%rax)
	movq	-40(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movzbl	-12(%rbp),	%eax		#this_line_update!
	movb	%al,	(%rdx)
	movq	-40(%rbp),	%rax		#this_line_update!
	leaq	2(%rax),	%rdx
	movzbl	-36(%rbp),	%eax		#this_line_update!
	movb	%al,	(%rdx)
	movq	-40(%rbp),	%rax		#this_line_update!
	leaq	3(%rax),	%rdx
	movzbl	12(%rbp),	%eax		#this_line_update!
	movb	%al,	(%rdx)
	addq	$8,	-40(%rbp)		#this_line_update!
	addl	$1,	-16(%rbp)		#this_line_update!
.L16:
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-8(%rbp),	%eax		#this_line_update!
	jl	.L17
	nop
	movq	0(%rbp),	%rax		#this_line_update!
	subq	%fs:40,	%rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE7:
	.size	byte_reverse,	.-byte_reverse
	.globl	sha_init
	.type	sha_init,	@function
sha_init:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	-44(%rbp)		#this_line_update!
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	$1732584193,	(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	$4023233417,	%edx
	movq	%rdx,	8(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	$2562383102,	%ecx
	movq	%rcx,	16(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	$271733878,	24(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	$3285377520,	%esi
	movq	%rsi,	32(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	$0,	40(%rax)
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	$0,	48(%rax)
	nop
				leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE8:
	.size	sha_init,	.-sha_init
	.globl	sha_update
	.type	sha_update,	@function
sha_update:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	-24(%rbp)		#this_line_update!
	movq	%rsi,	-44(%rbp)		#this_line_update!
	movl	%edx,	-12(%rbp)		#this_line_update!
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	40(%rax),	%rdx
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	salq	$3,	%rax
	addq	%rax,	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	40(%rax),	%rax
	cmpq	%rax,	%rdx
	jnb	.L21
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	48(%rax),	%rax
	leaq	1(%rax),	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rdx,	48(%rax)
.L21:
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	40(%rax),	%rdx
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	salq	$3,	%rax
	addq	%rax,	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rdx,	40(%rax)
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	48(%rax),	%rdx
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	shrq	$29,	%rax
	addq	%rax,	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rdx,	48(%rax)
	jmp	.L22
.L23:
	movq	-24(%rbp),	%rax		#this_line_update!
	leaq	56(%rax),	%rcx
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	$64,	%edx
	movq	%rax,	%rsi
	movq	%rcx,	%rdi
	call	memcpy@PLT
	movq	-24(%rbp),	%rax		#this_line_update!
	addq	$56,	%rax
	movl	$64,	%esi
	movq	%rax,	%rdi
	call	byte_reverse
	movq	-24(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_transform
	addq	$64,	-44(%rbp)		#this_line_update!
	subl	$64,	-12(%rbp)		#this_line_update!
.L22:
	cmpl	$63,	-12(%rbp)		#this_line_update!
	jg	.L23
	movl	-12(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	leaq	56(%rax),	%rcx
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rsi
	movq	%rcx,	%rdi
	call	memcpy@PLT
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE9:
	.size	sha_update,	.-sha_update
	.globl	sha_final
	.type	sha_final,	@function
sha_final:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	12(%rbp)		#this_line_update!
	movq	12(%rbp),	%rax		#this_line_update!
	movq	40(%rax),	%rax
	movq	%rax,	-28(%rbp)		#this_line_update!
	movq	12(%rbp),	%rax		#this_line_update!
	movq	48(%rax),	%rax
	movq	%rax,	-40(%rbp)		#this_line_update!
	movq	-28(%rbp),	%rax		#this_line_update!
	shrq	$3,	%rax
	andl	$63,	%eax
	movl	%eax,	-16(%rbp)		#this_line_update!
	movq	12(%rbp),	%rax		#this_line_update!
	leaq	56(%rax),	%rcx
	movl	-16(%rbp),	%eax		#this_line_update!
	leal	1(%rax),	%edx
	movl	%edx,	-16(%rbp)		#this_line_update!
	cltq
	addq	%rcx,	%rax
	movb	$-128,	(%rax)
	cmpl	$56,	-16(%rbp)		#this_line_update!
	jle	.L25
	movl	$64,	%eax
	subl	-16(%rbp),	%eax		#this_line_update!
	cltq
	movq	12(%rbp),	%rdx		#this_line_update!
	leaq	56(%rdx),	%rcx
	movl	-16(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	%rdx,	%rcx
	movq	%rax,	%rdx
	movl	$0,	%esi
	movq	%rcx,	%rdi
	call	memset@PLT
	movq	12(%rbp),	%rax		#this_line_update!
	addq	$56,	%rax
	movl	$64,	%esi
	movq	%rax,	%rdi
	call	byte_reverse
	movq	12(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_transform
	movq	12(%rbp),	%rax		#this_line_update!
	addq	$56,	%rax
	movl	$56,	%edx
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	jmp	.L26
.L25:
	movl	$56,	%eax
	subl	-16(%rbp),	%eax		#this_line_update!
	cltq
	movq	12(%rbp),	%rdx		#this_line_update!
	leaq	56(%rdx),	%rcx
	movl	-16(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	%rdx,	%rcx
	movq	%rax,	%rdx
	movl	$0,	%esi
	movq	%rcx,	%rdi
	call	memset@PLT
.L26:
	movq	12(%rbp),	%rax		#this_line_update!
	addq	$56,	%rax
	movl	$64,	%esi
	movq	%rax,	%rdi
	call	byte_reverse
	movq	12(%rbp),	%rax		#this_line_update!
	movq	-40(%rbp),	%rdx		#this_line_update!
	movq	%rdx,	168(%rax)
	movq	12(%rbp),	%rax		#this_line_update!
	movq	-28(%rbp),	%rdx		#this_line_update!
	movq	%rdx,	176(%rax)
	movq	12(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_transform
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE10:
	.size	sha_final,	.-sha_final
	.globl	sha_stream
	.type	sha_stream,	@function
sha_stream:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$4096,	%rsp
	orq	$0,	(%rsp)
	subq	$4096,	%rsp
	orq	$0,	(%rsp)
				subq				$48,	%rsp
	movq	%rdi,	4(%rbp)		#this_line_update!
	movq	%rsi,	-8224(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8236(%rbp)		#this_line_update!
	xorl	%eax,	%eax
	movq	4(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_init
	jmp	.L28
.L29:
	movl	-8228(%rbp),	%edx		#this_line_update!
	leaq	-16(%rbp),	%rcx		#this_line_update!
	movq	4(%rbp),	%rax		#this_line_update!
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	call	sha_update
.L28:
	movq	-8224(%rbp),	%rdx		#this_line_update!
	leaq	-16(%rbp),	%rax		#this_line_update!
	movq	%rdx,	%rcx
	movl	$8192,	%edx
	movl	$1,	%esi
	movq	%rax,	%rdi
	call	fread@PLT
	movl	%eax,	-8228(%rbp)		#this_line_update!
	cmpl	$0,	-8228(%rbp)		#this_line_update!
	jg	.L29
	movq	4(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_final
	nop
	movq	-8236(%rbp),	%rax		#this_line_update!
	subq	%fs:40,	%rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE11:
	.size	sha_stream,	.-sha_stream
	.section	.rodata
	.align	8
.LC0:
	.string	"%08lx	%08lx	%08lx	%08lx	%08lx\n"
	.text
	.globl	sha_print
	.type	sha_print,	@function
sha_print:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	-48(%rbp)		#this_line_update!
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	32(%rax),	%rdi
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	24(%rax),	%rsi
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	16(%rax),	%rcx
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	8(%rax),	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	movq	%rdi,	%r9
	movq	%rsi,	%r8
	movq	%rax,	%rsi
	leaq	.LC0(%rip),	%rax
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE12:
	.size	sha_print,	.-sha_print
	.ident	"GCC:	(Ubuntu	11.4.0-1ubuntu1~22.04)	11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align	8
	.long	1f	-	0f
	.long	4f	-	1f
	.long	5
0:
	.string	"GNU"
1:
	.align	8
	.long	0xc0000002
	.long	3f	-	2f
2:
	.long	0x3
3:
	.align	8
4:

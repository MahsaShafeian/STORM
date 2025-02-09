	.file	"main.c"
	.text
	.section	.rodata
	.align	8
.LC0:
	.string	"Usage:	fft	<waves>	<length>	-i"
.LC1:
	.string	"-i	performs	an	inverse	fft"
.LC2:
	.string	"make	<waves>	random	sinusoids"
	.align	8
.LC3:
	.string	"<length>	is	the	number	of	samples"
.LC4:
	.string	"-i"
.LC6:
	.string	"RealOut:"
.LC7:
	.string	"%f	\t"
.LC8:
	.string	"ImagOut:"
	.text
	.globl	main
	.type	main,	@function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$112,	%rsp		#this_line_update!
	movl	%edi,	-104(%rbp)		#this_line_update!
	movq	%rsi,	-64(%rbp)		#this_line_update!
	movl	$0,	-36(%rbp)		#this_line_update!
	cmpl	$2,	-104(%rbp)		#this_line_update!
	jg	.L2
	leaq	.LC0(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC1(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC2(%rip),	%rax
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	printf@PLT
	leaq	.LC3(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$-1,	%edi
	call	exit@PLT
.L2:
	cmpl	$4,	-104(%rbp)		#this_line_update!
	jne	.L3
	movq	-64(%rbp),	%rax		#this_line_update!
	addq	$24,	%rax
	movq	(%rax),	%rax
	movl	$2,	%edx
	leaq	.LC4(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	call	strncmp@PLT
	testl	%eax,	%eax
	sete	%al
	movzbl	%al,	%eax
	movl	%eax,	-36(%rbp)		#this_line_update!
.L3:
	movq	-64(%rbp),	%rax		#this_line_update!
	addq	$16,	%rax
	movq	(%rax),	%rax
	movq	%rax,	%rdi
	call	atoi@PLT
	movl	%eax,	-12(%rbp)		#this_line_update!
	movq	-64(%rbp),	%rax		#this_line_update!
	addq	$8,	%rax
	movq	(%rax),	%rax
	movq	%rax,	%rdi
	call	atoi@PLT
	movl	%eax,	-112(%rbp)		#this_line_update!
	movl	$1,	%edi
	call	srand@PLT
	movl	-12(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-20(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-28(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-44(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-80(%rbp)		#this_line_update!
	movl	-112(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-88(%rbp)		#this_line_update!
	movl	-112(%rbp),	%eax		#this_line_update!
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-8(%rbp)
	movl	$0,	-32(%rbp)		#this_line_update!
	jmp	.L4
.L5:
	call	rand@PLT
	movslq	%eax,	%rdx
	imulq	$274877907,	%rdx,	%rdx
	shrq	$32,	%rdx
	sarl	$6,	%edx
	movl	%eax,	%ecx
	sarl	$31,	%ecx
	subl	%ecx,	%edx
	imull	$1000,	%edx,	%ecx
	subl	%ecx,	%eax
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rcx
	movq	-88(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%edx,	%xmm0
	movss	%xmm0,	(%rax)
	call	rand@PLT
	movslq	%eax,	%rdx
	imulq	$274877907,	%rdx,	%rdx
	shrq	$32,	%rdx
	sarl	$6,	%edx
	movl	%eax,	%ecx
	sarl	$31,	%ecx
	subl	%ecx,	%edx
	imull	$1000,	%edx,	%ecx
	subl	%ecx,	%eax
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rcx
	movq	-8(%rbp),	%rax
	addq	%rcx,	%rax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%edx,	%xmm0
	movss	%xmm0,	(%rax)
	addl	$1,	-32(%rbp)		#this_line_update!
.L4:
	movl	-32(%rbp),	%eax		#this_line_update!
	cmpl	-112(%rbp),	%eax		#this_line_update!
	jb	.L5
	movl	$0,	-32(%rbp)		#this_line_update!
	jmp	.L6
.L15:
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	pxor	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	movl	$0,	-108(%rbp)		#this_line_update!
	jmp	.L7
.L14:
	call	rand@PLT
	andl	$1,	%eax
	testl	%eax,	%eax
	je	.L8
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm2,	%xmm2
	cvtss2sd	%xmm0,	%xmm2
	movsd	%xmm2,	-72(%rbp)		#this_line_update!
	movl	-108(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-88(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm3,	%xmm3
	cvtss2sd	%xmm0,	%xmm3
	movsd	%xmm3,	-52(%rbp)		#this_line_update!
	movl	-108(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movss	(%rax),	%xmm1
	movl	-32(%rbp),	%eax		#this_line_update!
	testq	%rax,	%rax
	js	.L9
	pxor	%xmm0,	%xmm0
	cvtsi2ssq	%rax,	%xmm0
	jmp	.L10
.L9:
	movq	%rax,	%rdx
	shrq	%rdx
	andl	$1,	%eax
	orq	%rax,	%rdx
	pxor	%xmm0,	%xmm0
	cvtsi2ssq	%rdx,	%xmm0
	addss	%xmm0,	%xmm0
.L10:
	mulss	%xmm1,	%xmm0
	pxor	%xmm4,	%xmm4
	cvtss2sd	%xmm0,	%xmm4
	movq	%xmm4,	%rax
	movq	%rax,	%xmm0
	call	cos@PLT
	mulsd	-52(%rbp),	%xmm0		#this_line_update!
	addsd	-72(%rbp),	%xmm0		#this_line_update!
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	jmp	.L11
.L8:
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm7,	%xmm7
	cvtss2sd	%xmm0,	%xmm7
	movsd	%xmm7,	-72(%rbp)		#this_line_update!
	movl	-108(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-88(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm2,	%xmm2
	cvtss2sd	%xmm0,	%xmm2
	movsd	%xmm2,	-52(%rbp)		#this_line_update!
	movl	-108(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movss	(%rax),	%xmm1
	movl	-32(%rbp),	%eax		#this_line_update!
	testq	%rax,	%rax
	js	.L12
	pxor	%xmm0,	%xmm0
	cvtsi2ssq	%rax,	%xmm0
	jmp	.L13
.L12:
	movq	%rax,	%rdx
	shrq	%rdx
	andl	$1,	%eax
	orq	%rax,	%rdx
	pxor	%xmm0,	%xmm0
	cvtsi2ssq	%rdx,	%xmm0
	addss	%xmm0,	%xmm0
.L13:
	mulss	%xmm1,	%xmm0
	pxor	%xmm3,	%xmm3
	cvtss2sd	%xmm0,	%xmm3
	movq	%xmm3,	%rax
	movq	%rax,	%xmm0
	call	sin@PLT
	mulsd	-52(%rbp),	%xmm0		#this_line_update!
	addsd	-72(%rbp),	%xmm0		#this_line_update!
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
.L11:
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-28(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	pxor	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	addl	$1,	-108(%rbp)		#this_line_update!
.L7:
	movl	-108(%rbp),	%eax		#this_line_update!
	cmpl	-112(%rbp),	%eax		#this_line_update!
	jb	.L14
	addl	$1,	-32(%rbp)		#this_line_update!
.L6:
	movl	-32(%rbp),	%eax		#this_line_update!
	cmpl	-12(%rbp),	%eax		#this_line_update!
	jb	.L15
	movq	-80(%rbp),	%r8		#this_line_update!
	movq	-44(%rbp),	%rdi		#this_line_update!
	movq	-28(%rbp),	%rcx		#this_line_update!
	movq	-20(%rbp),	%rdx		#this_line_update!
	movl	-36(%rbp),	%esi		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	movq	%r8,	%r9
	movq	%rdi,	%r8
	movl	%eax,	%edi
	movl	$0,	%eax
	call	fft_float@PLT
	leaq	.LC6(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	-32(%rbp)		#this_line_update!
	jmp	.L16
.L17:
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm6,	%xmm6
	cvtss2sd	%xmm0,	%xmm6
	movq	%xmm6,	%rax
	movq	%rax,	%xmm0
	leaq	.LC7(%rip),	%rax
	movq	%rax,	%rdi
	movl	$1,	%eax
	call	printf@PLT
	addl	$1,	-32(%rbp)		#this_line_update!
.L16:
	movl	-32(%rbp),	%eax		#this_line_update!
	cmpl	-12(%rbp),	%eax		#this_line_update!
	jb	.L17
	movl	$10,	%edi
	call	putchar@PLT
	leaq	.LC8(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	-32(%rbp)		#this_line_update!
	jmp	.L18
.L19:
	movl	-32(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	pxor	%xmm7,	%xmm7
	cvtss2sd	%xmm0,	%xmm7
	movq	%xmm7,	%rax
	movq	%rax,	%xmm0
	leaq	.LC7(%rip),	%rax
	movq	%rax,	%rdi
	movl	$1,	%eax
	call	printf@PLT
	addl	$1,	-32(%rbp)		#this_line_update!
.L18:
	movl	-32(%rbp),	%eax		#this_line_update!
	cmpl	-12(%rbp),	%eax		#this_line_update!
	jb	.L19
	movl	$10,	%edi
	call	putchar@PLT
	movq	-20(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-28(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-44(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-80(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-88(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-8(%rbp),	%rax
	movq	%rax,	%rdi
	call	free@PLT
	movl	$0,	%edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	main,	.-main
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

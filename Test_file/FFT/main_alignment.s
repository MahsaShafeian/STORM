	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Usage: fft <waves> <length> -i"
.LC1:
	.string	"-i performs an inverse fft"
.LC2:
	.string	"make <waves> random sinusoids"
	.align 8
.LC3:
	.string	"<length> is the number of samples"
.LC4:
	.string	"-i"
.LC6:
	.string	"RealOut:"
.LC7:
	.string	"%f \t"
.LC8:
	.string	"ImagOut:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	$0, -60(%rbp)
	cmpl	$2, -84(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	cmpl	$4, -84(%rbp)
	jne	.L3
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movl	$2, %edx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -60(%rbp)
.L3:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -56(%rbp)
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -52(%rbp)
	movl	$1, %edi
	call	srand@PLT
	movl	-56(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	movl	-56(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	-56(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-56(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	-52(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	-52(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L4
.L5:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$1000, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movss	%xmm0, (%rax)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$274877907, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$1000, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -68(%rbp)
.L4:
	movl	-68(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L5
	movl	$0, -68(%rbp)
	jmp	.L6
.L15:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	$0, -64(%rbp)
	jmp	.L7
.L14:
	call	rand@PLT
	andl	$1, %eax
	testl	%eax, %eax
	je	.L8
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	%xmm2, -104(%rbp)
	movl	-64(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -112(%rbp)
	movl	-64(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-68(%rbp), %eax
	testq	%rax, %rax
	js	.L9
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L10
.L9:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L10:
	mulss	%xmm1, %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	mulsd	-112(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	jmp	.L11
.L8:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm7, %xmm7
	cvtss2sd	%xmm0, %xmm7
	movsd	%xmm7, -104(%rbp)
	movl	-64(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	%xmm2, -112(%rbp)
	movl	-64(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-68(%rbp), %eax
	testq	%rax, %rax
	js	.L12
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L13
.L12:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L13:
	mulss	%xmm1, %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin@PLT
	mulsd	-112(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
.L11:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -64(%rbp)
.L7:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L14
	addl	$1, -68(%rbp)
.L6:
	movl	-68(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jb	.L15
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	-60(%rbp), %esi
	movl	-56(%rbp), %eax
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%eax, %edi
	movl	$0, %eax
	call	fft_float@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -68(%rbp)
	jmp	.L16
.L17:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm6, %xmm6
	cvtss2sd	%xmm0, %xmm6
	movq	%xmm6, %rax
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -68(%rbp)
.L16:
	movl	-68(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jb	.L17
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -68(%rbp)
	jmp	.L18
.L19:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm7, %xmm7
	cvtss2sd	%xmm0, %xmm7
	movq	%xmm7, %rax
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -68(%rbp)
.L18:
	movl	-68(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jb	.L19
	movl	$10, %edi
	call	putchar@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	main, .-main
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

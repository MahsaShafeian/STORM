	.file	"fourierf.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Error in fft_float():  %s == NULL\n"
	.text
	.type	CheckPointer, @function
CheckPointer:
.LFB6:
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
	cmpq	$0, -8(%rbp)
	jne	.L3
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	CheckPointer, .-CheckPointer
	.section	.rodata
	.align 8
.LC2:
	.string	"Error in fft():  NumSamples=%u is not power of two\n"
.LC4:
	.string	"RealIn"
.LC5:
	.string	"RealOut"
.LC6:
	.string	"ImagOut"
	.text
	.globl	fft_float
	.type	fft_float, @function
fft_float:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $240, %rsp
	movl	%edi, -180(%rbp)
	movl	%esi, -184(%rbp)
	movq	%rdx, -192(%rbp)
	movq	%rcx, -200(%rbp)
	movq	%r8, -208(%rbp)
	movq	%r9, -216(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -144(%rbp)
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	IsPowerOfTwo@PLT
	testl	%eax, %eax
	jne	.L5
	movq	stderr(%rip), %rax
	movl	-180(%rbp), %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L5:
	cmpl	$0, -184(%rbp)
	je	.L6
	movsd	-144(%rbp), %xmm0
	movq	.LC3(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
.L6:
	movq	-192(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	CheckPointer
	movq	-208(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	CheckPointer
	movq	-216(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	CheckPointer
	movl	-180(%rbp), %eax
	movl	%eax, %edi
	call	NumberOfBitsNeeded@PLT
	movl	%eax, -152(%rbp)
	movl	$0, -172(%rbp)
	jmp	.L7
.L10:
	movl	-152(%rbp), %edx
	movl	-172(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	ReverseBits@PLT
	movl	%eax, -168(%rbp)
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-192(%rbp), %rax
	addq	%rax, %rdx
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rcx
	movq	-208(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	cmpq	$0, -200(%rbp)
	je	.L8
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-200(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	jmp	.L9
.L8:
	pxor	%xmm0, %xmm0
.L9:
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	%xmm0, (%rax)
	addl	$1, -172(%rbp)
.L7:
	movl	-172(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jb	.L10
	movl	$1, -156(%rbp)
	movl	$2, -160(%rbp)
	jmp	.L11
.L18:
	movl	-160(%rbp), %eax
	testq	%rax, %rax
	js	.L12
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L13
.L12:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L13:
	movsd	-144(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -128(%rbp)
	movsd	-128(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -120(%rbp)
	movsd	-128(%rbp), %xmm0
	movq	.LC3(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -112(%rbp)
	movsd	-128(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movq	%xmm0, %rax
	movq	%rax, -104(%rbp)
	movsd	-128(%rbp), %xmm0
	movq	.LC3(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movq	%xmm0, %rax
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	movl	$0, -172(%rbp)
	jmp	.L14
.L17:
	movsd	-104(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-96(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-120(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-112(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	-172(%rbp), %eax
	movl	%eax, -168(%rbp)
	movl	$0, -164(%rbp)
	jmp	.L15
.L16:
	movsd	-56(%rbp), %xmm0
	mulsd	-88(%rbp), %xmm0
	movsd	-48(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-64(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-88(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	-168(%rbp), %edx
	movl	-156(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -148(%rbp)
	movsd	-64(%rbp), %xmm1
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm2
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	cvtss2sd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	-64(%rbp), %xmm1
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm1
	movsd	-32(%rbp), %xmm2
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	subsd	-80(%rbp), %xmm0
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	subsd	-72(%rbp), %xmm0
	movl	-148(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	-80(%rbp), %xmm0
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	-72(%rbp), %xmm0
	movl	-168(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -168(%rbp)
	addl	$1, -164(%rbp)
.L15:
	movl	-164(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jb	.L16
	movl	-160(%rbp), %eax
	addl	%eax, -172(%rbp)
.L14:
	movl	-172(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jb	.L17
	movl	-160(%rbp), %eax
	movl	%eax, -156(%rbp)
	sall	-160(%rbp)
.L11:
	movl	-160(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.L18
	cmpl	$0, -184(%rbp)
	je	.L25
	movl	-180(%rbp), %eax
	testq	%rax, %rax
	js	.L20
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L21
.L20:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L21:
	movsd	%xmm0, -136(%rbp)
	movl	$0, -172(%rbp)
	jmp	.L22
.L23:
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	divsd	-136(%rbp), %xmm0
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	divsd	-136(%rbp), %xmm0
	movl	-172(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -172(%rbp)
.L22:
	movl	-172(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jb	.L23
.L25:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	fft_float, .-fft_float
	.section	.rodata
	.align 8
.LC1:
	.long	1413754136
	.long	1075388923
	.align 16
.LC3:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC8:
	.long	0
	.long	-1073741824
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

	.file	"fourierf.c"
	.text
	.section	.rodata
	.align	8
.LC0:
	.string	"Error	in	fft_float():		%s	==	NULL\n"
	.text
	.type	CheckPointer,	@function
CheckPointer:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$48,	%rsp		#this_line_update!
	movq	%rdi,	-8(%rbp)
	movq	%rsi,	-24(%rbp)		#this_line_update!
	cmpq	$0,	-8(%rbp)
	jne	.L3
	movq	stderr(%rip),	%rax
	movq	-24(%rbp),	%rdx		#this_line_update!
	leaq	.LC0(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$1,	%edi
	call	exit@PLT
.L3:
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE6:
	.size	CheckPointer,	.-CheckPointer
	.section	.rodata
	.align	8
.LC2:
	.string	"Error	in	fft():		NumSamples=%u	is	not	power	of	two\n"
.LC4:
	.string	"RealIn"
.LC5:
	.string	"RealOut"
.LC6:
	.string	"ImagOut"
	.text
	.globl	fft_float
	.type	fft_float,	@function
fft_float:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$240,	%rsp
	movl	%edi,	-232(%rbp)		#this_line_update!
	movl	%esi,	-20(%rbp)		#this_line_update!
	movq	%rdx,	-144(%rbp)		#this_line_update!
	movq	%rcx,	-160(%rbp)		#this_line_update!
	movq	%r8,	-120(%rbp)		#this_line_update!
	movq	%r9,	-44(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movsd	.LC1(%rip),	%xmm0
	movsd	%xmm0,	-108(%rbp)		#this_line_update!
	movl	-232(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edi
	call	IsPowerOfTwo@PLT
	testl	%eax,	%eax
	jne	.L5
	movq	stderr(%rip),	%rax
	movl	-232(%rbp),	%edx		#this_line_update!
	leaq	.LC2(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$1,	%edi
	call	exit@PLT
.L5:
	cmpl	$0,	-20(%rbp)		#this_line_update!
	je	.L6
	movsd	-108(%rbp),	%xmm0		#this_line_update!
	movq	.LC3(%rip),	%xmm1
	xorpd	%xmm1,	%xmm0
	movsd	%xmm0,	-108(%rbp)		#this_line_update!
.L6:
	movq	-144(%rbp),	%rax		#this_line_update!
	leaq	.LC4(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	CheckPointer
	movq	-120(%rbp),	%rax		#this_line_update!
	leaq	.LC5(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	CheckPointer
	movq	-44(%rbp),	%rax		#this_line_update!
	leaq	.LC6(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	CheckPointer
	movl	-232(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edi
	call	NumberOfBitsNeeded@PLT
	movl	%eax,	-64(%rbp)		#this_line_update!
	movl	$0,	-236(%rbp)		#this_line_update!
	jmp	.L7
.L10:
	movl	-64(%rbp),	%edx		#this_line_update!
	movl	-236(%rbp),	%eax		#this_line_update!
	movl	%edx,	%esi
	movl	%eax,	%edi
	call	ReverseBits@PLT
	movl	%eax,	-220(%rbp)		#this_line_update!
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-144(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rcx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movss	(%rdx),	%xmm0
	movss	%xmm0,	(%rax)
	cmpq	$0,	-160(%rbp)		#this_line_update!
	je	.L8
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-160(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	jmp	.L9
.L8:
	pxor	%xmm0,	%xmm0
.L9:
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	%xmm0,	(%rax)
	addl	$1,	-236(%rbp)		#this_line_update!
.L7:
	movl	-236(%rbp),	%eax		#this_line_update!
	cmpl	-232(%rbp),	%eax		#this_line_update!
	jb	.L10
	movl	$1,	-12(%rbp)		#this_line_update!
	movl	$2,	-240(%rbp)		#this_line_update!
	jmp	.L11
.L18:
	movl	-240(%rbp),	%eax		#this_line_update!
	testq	%rax,	%rax
	js	.L12
	pxor	%xmm0,	%xmm0
	cvtsi2sdq	%rax,	%xmm0
	jmp	.L13
.L12:
	movq	%rax,	%rdx
	shrq	%rdx
	andl	$1,	%eax
	orq	%rax,	%rdx
	pxor	%xmm0,	%xmm0
	cvtsi2sdq	%rdx,	%xmm0
	addsd	%xmm0,	%xmm0
.L13:
	movsd	-108(%rbp),	%xmm1		#this_line_update!
	divsd	%xmm0,	%xmm1
	movsd	%xmm1,	-208(%rbp)		#this_line_update!
	movsd	-208(%rbp),	%xmm1		#this_line_update!
	movsd	.LC8(%rip),	%xmm0
	mulsd	%xmm0,	%xmm1
	movq	%xmm1,	%rax
	movq	%rax,	%xmm0
	call	sin@PLT
	movq	%xmm0,	%rax
	movq	%rax,	-184(%rbp)		#this_line_update!
	movsd	-208(%rbp),	%xmm0		#this_line_update!
	movq	.LC3(%rip),	%xmm1
	xorpd	%xmm1,	%xmm0
	movq	%xmm0,	%rax
	movq	%rax,	%xmm0
	call	sin@PLT
	movq	%xmm0,	%rax
	movq	%rax,	-96(%rbp)		#this_line_update!
	movsd	-208(%rbp),	%xmm1		#this_line_update!
	movsd	.LC8(%rip),	%xmm0
	mulsd	%xmm0,	%xmm1
	movq	%xmm1,	%rax
	movq	%rax,	%xmm0
	call	cos@PLT
	movq	%xmm0,	%rax
	movq	%rax,	-152(%rbp)		#this_line_update!
	movsd	-208(%rbp),	%xmm0		#this_line_update!
	movq	.LC3(%rip),	%xmm1
	xorpd	%xmm1,	%xmm0
	movq	%xmm0,	%rax
	movq	%rax,	%xmm0
	call	cos@PLT
	movq	%xmm0,	%rax
	movq	%rax,	-60(%rbp)		#this_line_update!
	movsd	-60(%rbp),	%xmm0		#this_line_update!
	addsd	%xmm0,	%xmm0
	movsd	%xmm0,	-52(%rbp)		#this_line_update!
	movl	$0,	-236(%rbp)		#this_line_update!
	jmp	.L14
.L17:
	movsd	-152(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-80(%rbp)		#this_line_update!
	movsd	-60(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-128(%rbp)		#this_line_update!
	movsd	-184(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-192(%rbp)		#this_line_update!
	movsd	-96(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-176(%rbp)		#this_line_update!
	movl	-236(%rbp),	%eax		#this_line_update!
	movl	%eax,	-220(%rbp)		#this_line_update!
	movl	$0,	-28(%rbp)		#this_line_update!
	jmp	.L15
.L16:
	movsd	-128(%rbp),	%xmm0		#this_line_update!
	mulsd	-52(%rbp),	%xmm0		#this_line_update!
	movsd	-80(%rbp),	%xmm1		#this_line_update!
	subsd	%xmm1,	%xmm0
	movsd	%xmm0,	-216(%rbp)		#this_line_update!
	movsd	-128(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-80(%rbp)		#this_line_update!
	movsd	-216(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-128(%rbp)		#this_line_update!
	movsd	-176(%rbp),	%xmm0		#this_line_update!
	mulsd	-52(%rbp),	%xmm0		#this_line_update!
	movsd	-192(%rbp),	%xmm1		#this_line_update!
	subsd	%xmm1,	%xmm0
	movsd	%xmm0,	-168(%rbp)		#this_line_update!
	movsd	-176(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-192(%rbp)		#this_line_update!
	movsd	-168(%rbp),	%xmm0		#this_line_update!
	movsd	%xmm0,	-176(%rbp)		#this_line_update!
	movl	-220(%rbp),	%edx		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movsd	-216(%rbp),	%xmm1		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	mulsd	%xmm1,	%xmm0
	movsd	-168(%rbp),	%xmm2		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm1
	cvtss2sd	%xmm1,	%xmm1
	mulsd	%xmm2,	%xmm1
	subsd	%xmm1,	%xmm0
	movsd	%xmm0,	-136(%rbp)		#this_line_update!
	movsd	-216(%rbp),	%xmm1		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	mulsd	%xmm0,	%xmm1
	movsd	-168(%rbp),	%xmm2		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	mulsd	%xmm2,	%xmm0
	addsd	%xmm1,	%xmm0
	movsd	%xmm0,	-36(%rbp)		#this_line_update!
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	subsd	-136(%rbp),	%xmm0		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	subsd	-36(%rbp),	%xmm0		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	addsd	-136(%rbp),	%xmm0		#this_line_update!
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	addsd	-36(%rbp),	%xmm0		#this_line_update!
	movl	-220(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	addl	$1,	-220(%rbp)		#this_line_update!
	addl	$1,	-28(%rbp)		#this_line_update!
.L15:
	movl	-28(%rbp),	%eax		#this_line_update!
	cmpl	-12(%rbp),	%eax		#this_line_update!
	jb	.L16
	movl	-240(%rbp),	%eax		#this_line_update!
	addl	%eax,	-236(%rbp)		#this_line_update!
.L14:
	movl	-236(%rbp),	%eax		#this_line_update!
	cmpl	-232(%rbp),	%eax		#this_line_update!
	jb	.L17
	movl	-240(%rbp),	%eax		#this_line_update!
	movl	%eax,	-12(%rbp)		#this_line_update!
	sall	-160(%rbp)
.L11:
	movl	-240(%rbp),	%eax		#this_line_update!
	cmpl	-232(%rbp),	%eax		#this_line_update!
	jbe	.L18
	cmpl	$0,	-20(%rbp)		#this_line_update!
	je	.L25
	movl	-232(%rbp),	%eax		#this_line_update!
	testq	%rax,	%rax
	js	.L20
	pxor	%xmm0,	%xmm0
	cvtsi2sdq	%rax,	%xmm0
	jmp	.L21
.L20:
	movq	%rax,	%rdx
	shrq	%rdx
	andl	$1,	%eax
	orq	%rax,	%rdx
	pxor	%xmm0,	%xmm0
	cvtsi2sdq	%rdx,	%xmm0
	addsd	%xmm0,	%xmm0
.L21:
	movsd	%xmm0,	-88(%rbp)		#this_line_update!
	movl	$0,	-236(%rbp)		#this_line_update!
	jmp	.L22
.L23:
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	divsd	-88(%rbp),	%xmm0		#this_line_update!
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movss	(%rax),	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	divsd	-88(%rbp),	%xmm0		#this_line_update!
	movl	-236(%rbp),	%eax		#this_line_update!
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	(%rax)
	addl	$1,	-236(%rbp)		#this_line_update!
.L22:
	movl	-236(%rbp),	%eax		#this_line_update!
	cmpl	-232(%rbp),	%eax		#this_line_update!
	jb	.L23
.L25:
	nop
	movq	-8(%rbp),	%rax
	subq	$48,	%rsp		#this_line_update!
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE7:
	.size	fft_float,	.-fft_float
	.section	.rodata
	.align	8
.LC1:
	.long	1413754136
	.long	1075388923
	.align	16
.LC3:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align	8
.LC8:
	.long	0
	.long	-1073741824
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

	.file	"fftmisc.c"
	.text
	.globl	IsPowerOfTwo
	.type	IsPowerOfTwo, @function
IsPowerOfTwo:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$1, -4(%rbp)
	ja	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	andl	-4(%rbp), %eax
	testl	%eax, %eax
	je	.L4
	movl	$0, %eax
	jmp	.L3
.L4:
	movl	$1, %eax
.L3:
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	IsPowerOfTwo, .-IsPowerOfTwo
	.section	.rodata
	.align 8
.LC0:
	.string	">>> Error in fftmisc.c: argument %d to NumberOfBitsNeeded is too small.\n"
	.text
	.globl	NumberOfBitsNeeded
	.type	NumberOfBitsNeeded, @function
NumberOfBitsNeeded:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$1, -20(%rbp)
	ja	.L6
	movq	stderr(%rip), %rax
	movl	-20(%rbp), %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L6:
	movl	$0, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	andl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L7
	movl	-4(%rbp), %eax
	jmp	.L10
.L7:
	addl	$1, -4(%rbp)
	jmp	.L9
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	NumberOfBitsNeeded, .-NumberOfBitsNeeded
	.globl	ReverseBits
	.type	ReverseBits, @function
ReverseBits:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-20(%rbp), %eax
	andl	$1, %eax
	orl	%edx, %eax
	movl	%eax, -4(%rbp)
	shrl	-20(%rbp)
	addl	$1, -8(%rbp)
.L12:
	movl	-8(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jb	.L13
	movl	-4(%rbp), %eax
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ReverseBits, .-ReverseBits
	.globl	Index_to_frequency
	.type	Index_to_frequency, @function
Index_to_frequency:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jb	.L16
	pxor	%xmm0, %xmm0
	jmp	.L17
.L16:
	movl	-4(%rbp), %eax
	shrl	%eax
	cmpl	%eax, -8(%rbp)
	ja	.L18
	movl	-8(%rbp), %eax
	testq	%rax, %rax
	js	.L19
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L20
.L19:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L20:
	movl	-4(%rbp), %eax
	testq	%rax, %rax
	js	.L21
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	jmp	.L22
.L21:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
.L22:
	divsd	%xmm1, %xmm0
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L23
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L24
.L23:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L24:
	movq	.LC2(%rip), %xmm1
	movapd	%xmm0, %xmm2
	xorpd	%xmm1, %xmm2
	movl	-4(%rbp), %eax
	testq	%rax, %rax
	js	.L25
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	jmp	.L26
.L25:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
.L26:
	divsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
.L17:
	movq	%xmm0, %rax
	movq	%rax, %xmm0
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Index_to_frequency, .-Index_to_frequency
	.section	.rodata
	.align 16
.LC2:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
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

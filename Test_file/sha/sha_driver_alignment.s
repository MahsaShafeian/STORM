	.file	"sha_driver.c"
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"error opening %s for reading\n"
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
    subq    $240, %rsp
	movl	%edi, -212(%rbp)
	movq	%rsi, -224(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -212(%rbp)
	jg	.L4
	movq	stdin(%rip), %rax
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rdx
	leaq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sha_stream@PLT
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	sha_print@PLT
	jmp	.L3
.L6:
	addq	$8, -224(%rbp)
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -200(%rbp)
	cmpq	$0, -200(%rbp)
	jne	.L5
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L5:
	movq	-200(%rbp), %rdx
	leaq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sha_stream@PLT
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	sha_print@PLT
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L4:
	subl	$1, -212(%rbp)
	cmpl	$0, -212(%rbp)
	jne	.L6
.L3:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
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

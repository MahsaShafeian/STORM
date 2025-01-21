	.file	"sha_driver.c"
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"error	opening	%s	for	reading\n"
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
				subq				$240,	%rsp
	movl	%edi,	-228(%rbp)		#this_line_update!
	movq	%rsi,	-216(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-200(%rbp)		#this_line_update!
	xorl	%eax,	%eax
	cmpl	$1,	-228(%rbp)		#this_line_update!
	jg	.L4
	movq	stdin(%rip),	%rax
	movq	%rax,	-208(%rbp)		#this_line_update!
	movq	-208(%rbp),	%rdx		#this_line_update!
	leaq	12(%rbp),	%rax		#this_line_update!
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	sha_stream@PLT
	leaq	12(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_print@PLT
	jmp	.L3
.L6:
	addq	$8,	-216(%rbp)		#this_line_update!
	movq	-216(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	leaq	.LC0(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	fopen@PLT
	movq	%rax,	-208(%rbp)		#this_line_update!
	cmpq	$0,	-208(%rbp)		#this_line_update!
	jne	.L5
	movq	-216(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	movq	%rax,	%rsi
	leaq	.LC1(%rip),	%rax
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	printf@PLT
	jmp	.L4
.L5:
	movq	-208(%rbp),	%rdx		#this_line_update!
	leaq	12(%rbp),	%rax		#this_line_update!
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	sha_stream@PLT
	leaq	12(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	sha_print@PLT
	movq	-208(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	fclose@PLT
.L4:
	subl	$1,	-228(%rbp)		#this_line_update!
	cmpl	$0,	-228(%rbp)		#this_line_update!
	jne	.L6
.L3:
	movl	$0,	%eax
	movq	-200(%rbp),	%rdx		#this_line_update!
	subq	%fs:40,	%rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa	7,	8
	ret
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

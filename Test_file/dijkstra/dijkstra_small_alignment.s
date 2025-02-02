	.file	"dijkstra_small.c"
	.text
	.globl	qHead
	.bss
	.align 8
	.type	qHead, @object
	.size	qHead, 8
qHead:
	.zero	8
	.globl	AdjMatrix
	.align 32
	.type	AdjMatrix, @object
	.size	AdjMatrix, 40000
AdjMatrix:
	.zero	40000
	.globl	g_qCount
	.align 4
	.type	g_qCount, @object
	.size	g_qCount, 4
g_qCount:
	.zero	4
	.globl	rgnNodes
	.align 32
	.type	rgnNodes, @object
	.size	rgnNodes, 800
rgnNodes:
	.zero	800
	.globl	ch
	.align 4
	.type	ch, @object
	.size	ch, 4
ch:
	.zero	4
	.globl	iPrev
	.align 4
	.type	iPrev, @object
	.size	iPrev, 4
iPrev:
	.zero	4
	.globl	iNode
	.align 4
	.type	iNode, @object
	.size	iNode, 4
iNode:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	iCost
	.align 4
	.type	iCost, @object
	.size	iCost, 4
iCost:
	.zero	4
	.globl	iDist
	.align 4
	.type	iDist, @object
	.size	iDist, 4
iDist:
	.zero	4
	.section	.rodata
.LC0:
	.string	" %d"
	.text
	.globl	print_path
	.type	print_path, @function
print_path:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	$9999, %eax
	je	.L2
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	print_path
.L2:
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_path, .-print_path
	.section	.rodata
.LC1:
	.string	"Out of memory.\n"
	.text
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB1:
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
	movl	%edx, -28(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	qHead(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L4:
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	cmpq	$0, -16(%rbp)
	jne	.L7
	movq	-8(%rbp), %rax
	movq	%rax, qHead(%rip)
	jmp	.L6
.L8:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L7:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L6:
	movl	g_qCount(%rip), %eax
	addl	$1, %eax
	movl	%eax, g_qCount(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	enqueue, .-enqueue
	.globl	dequeue
	.type	dequeue, @function
dequeue:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	qHead(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	qHead(%rip), %rax
	testq	%rax, %rax
	je	.L11
	movq	qHead(%rip), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	qHead(%rip), %rax
	movl	4(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movq	qHead(%rip), %rax
	movl	8(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	qHead(%rip), %rax
	movq	16(%rax), %rax
	movq	%rax, qHead(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	g_qCount(%rip), %eax
	subl	$1, %eax
	movl	%eax, g_qCount(%rip)
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	dequeue, .-dequeue
	.globl	qcount
	.type	qcount, @function
qcount:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	g_qCount(%rip), %eax
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	qcount, .-qcount
	.section	.rodata
	.align 8
.LC2:
	.string	"Shortest path is 0 in cost. Just stay where you are."
.LC3:
	.string	"Shortest path is %d in cost. "
.LC4:
	.string	"Path is: "
	.text
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB4:
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
	movl	$0, ch(%rip)
	jmp	.L15
.L16:
	movl	ch(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	$9999, (%rdx,%rax)
	movl	ch(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+rgnNodes(%rip), %rax
	movl	$9999, (%rdx,%rax)
	movl	ch(%rip), %eax
	addl	$1, %eax
	movl	%eax, ch(%rip)
.L15:
	movl	ch(%rip), %eax
	cmpl	$99, %eax
	jle	.L16
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L17
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L18
.L17:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+rgnNodes(%rip), %rax
	movl	$9999, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movl	$9999, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	enqueue
	jmp	.L19
.L24:
	leaq	iPrev(%rip), %rax
	movq	%rax, %rdx
	leaq	iDist(%rip), %rax
	movq	%rax, %rsi
	leaq	iNode(%rip), %rax
	movq	%rax, %rdi
	call	dequeue
	movl	$0, i(%rip)
	jmp	.L20
.L23:
	movl	iNode(%rip), %eax
	movl	i(%rip), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	AdjMatrix(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, iCost(%rip)
	movl	iCost(%rip), %eax
	cmpl	$9999, %eax
	je	.L21
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$9999, %eax
	je	.L22
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	iCost(%rip), %ecx
	movl	iDist(%rip), %edx
	addl	%ecx, %edx
	cmpl	%edx, %eax
	jle	.L21
.L22:
	movl	iDist(%rip), %ecx
	movl	iCost(%rip), %edx
	movl	i(%rip), %eax
	addl	%edx, %ecx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	i(%rip), %edx
	movl	iNode(%rip), %eax
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	4+rgnNodes(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	movl	iNode(%rip), %edx
	movl	iDist(%rip), %ecx
	movl	iCost(%rip), %eax
	addl	%eax, %ecx
	movl	i(%rip), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	enqueue
.L21:
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L20:
	movl	i(%rip), %eax
	cmpl	$99, %eax
	jle	.L23
.L19:
	call	qcount
	testl	%eax, %eax
	jg	.L24
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	rgnNodes(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	rgnNodes(%rip), %rax
	movq	%rax, %rdi
	call	print_path
	movl	$10, %edi
	call	putchar@PLT
.L18:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	dijkstra, .-dijkstra
	.section	.rodata
.LC5:
	.string	"Usage: dijkstra <filename>\n"
	.align 8
.LC6:
	.string	"Only supports matrix size is #define'd.\n"
.LC7:
	.string	"r"
.LC8:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -36(%rbp)
	jg	.L26
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$27, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L26:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L27
.L30:
	movl	$0, -20(%rbp)
	jmp	.L28
.L29:
	leaq	-28(%rbp), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	-28(%rbp), %edx
	movl	-20(%rbp), %eax
	movslq	%eax, %rsi
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rcx
	leaq	AdjMatrix(%rip), %rax
	movl	%edx, (%rcx,%rax)
	addl	$1, -20(%rbp)
.L28:
	cmpl	$99, -20(%rbp)
	jle	.L29
	addl	$1, -24(%rbp)
.L27:
	cmpl	$99, -24(%rbp)
	jle	.L30
	movl	$0, -24(%rbp)
	movl	$50, -20(%rbp)
	jmp	.L31
.L32:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	dijkstra
	addl	$1, -24(%rbp)
	addl	$1, -20(%rbp)
.L31:
	cmpl	$19, -24(%rbp)
	jle	.L32
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE5:
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

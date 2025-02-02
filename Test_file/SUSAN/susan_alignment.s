	.file	"susan.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Usage: susan <in.pgm> <out.pgm> [options]\n"
.LC1:
	.string	"-s : Smoothing mode (default)"
.LC2:
	.string	"-e : Edges mode"
.LC3:
	.string	"-c : Corners mode\n"
	.align 8
.LC4:
	.string	"See source code for more information about setting the thresholds"
	.align 8
.LC5:
	.string	"-t <thresh> : Brightness threshold, all modes (default=20)"
	.align 8
.LC6:
	.string	"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)"
	.align 8
.LC7:
	.string	"-3 : Use flat 3x3 mask, edges or smoothing mode"
	.align 8
.LC8:
	.string	"-n : No post-processing on the binary edge map (runs much faster); edges mode"
	.align 8
.LC9:
	.string	"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode"
	.align 8
.LC10:
	.string	"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode"
	.align 8
.LC11:
	.string	"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)"
	.align 8
.LC12:
	.string	"\nSUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	usage, .-usage
	.section	.rodata
.LC13:
	.string	"is"
.LC14:
	.string	"Image %s not binary PGM.\n"
	.text
	.globl	getint
	.type	getint, @function
getint:
.LFB7:
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
    subq    $1904, %rsp
	movq	%rdi, -10040(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-10040(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movl	%eax, -10024(%rbp)
.L7:
	cmpl	$35, -10024(%rbp)
	jne	.L3
	movq	-10040(%rbp), %rdx
	leaq	-10016(%rbp), %rax
	movl	$9000, %esi
	movq	%rax, %rdi
	call	fgets@PLT
.L3:
	cmpl	$-1, -10024(%rbp)
	jne	.L4
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L4:
	cmpl	$47, -10024(%rbp)
	jle	.L5
	cmpl	$57, -10024(%rbp)
	jle	.L15
.L5:
	movq	-10040(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movl	%eax, -10024(%rbp)
	jmp	.L7
.L15:
	nop
	movl	$0, -10020(%rbp)
.L11:
	movl	-10020(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-10024(%rbp), %eax
	subl	$48, %eax
	addl	%edx, %eax
	movl	%eax, -10020(%rbp)
	movq	-10040(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movl	%eax, -10024(%rbp)
	cmpl	$-1, -10024(%rbp)
	jne	.L8
	movl	-10020(%rbp), %eax
	jmp	.L12
.L8:
	cmpl	$47, -10024(%rbp)
	jle	.L10
	cmpl	$57, -10024(%rbp)
	jg	.L10
	jmp	.L11
.L10:
	movl	-10020(%rbp), %eax
.L12:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	getint, .-getint
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"Can't input image %s.\n"
	.align 8
.LC17:
	.string	"Image %s does not have binary PGM header.\n"
.LC18:
	.string	"Image %s is wrong size.\n"
	.text
	.globl	get_image
	.type	get_image, @function
get_image:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $176, %rsp
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%rdx, -152(%rbp)
	movq	%rcx, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-136(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L17
	movq	stderr(%rip), %rax
	movq	-136(%rbp), %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L17:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -112(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -111(%rbp)
	movzbl	-112(%rbp), %eax
	cmpb	$80, %al
	jne	.L18
	movzbl	-111(%rbp), %eax
	cmpb	$53, %al
	je	.L19
.L18:
	movq	stderr(%rip), %rax
	movq	-136(%rbp), %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L19:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	getint
	movq	-152(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	getint
	movq	-160(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	getint
	movl	%eax, -124(%rbp)
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-144(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movq	-160(%rbp), %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	movslq	%eax, %rdx
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	movq	-120(%rbp), %rcx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	testq	%rax, %rax
	jne	.L20
	movq	stderr(%rip), %rax
	movq	-136(%rbp), %rdx
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L20:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_image, .-get_image
	.section	.rodata
.LC19:
	.string	"w"
.LC20:
	.string	"Can't output image%s.\n"
.LC21:
	.string	"P5\n"
.LC22:
	.string	"%d %d\n"
.LC23:
	.string	"255\n"
.LC24:
	.string	"Can't write image %s.\n"
	.text
	.globl	put_image
	.type	put_image, @function
put_image:
.LFB9:
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
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L23
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L23:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-40(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-8(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	-36(%rbp), %eax
	imull	-40(%rbp), %eax
	movslq	%eax, %rsi
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	cmpq	$1, %rax
	je	.L24
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L24:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	put_image, .-put_image
	.globl	int_to_uchar
	.type	int_to_uchar, @function
int_to_uchar:
.LFB10:
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
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L26
.L29:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jge	.L27
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
.L27:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L28
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L28:
	addl	$1, -12(%rbp)
.L26:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L29
	movl	-4(%rbp), %eax
	subl	%eax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L30
.L31:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	cltd
	idivl	-8(%rbp)
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -12(%rbp)
.L30:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L31
	nop
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	int_to_uchar, .-int_to_uchar
	.globl	setup_brightness_lut
	.type	setup_brightness_lut, @function
setup_brightness_lut:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$516, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	258(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	$-256, -8(%rbp)
	jmp	.L33
.L35:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-8(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-28(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	cmpl	$6, -32(%rbp)
	jne	.L34
	movss	-4(%rbp), %xmm0
	mulss	%xmm0, %xmm0
	movss	-4(%rbp), %xmm1
	mulss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
.L34:
	movss	-4(%rbp), %xmm0
	movss	.LC25(%rip), %xmm1
	xorps	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movsd	.LC26(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	%rdx, %rax
	cvttss2sil	-4(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
.L33:
	cmpl	$256, -8(%rbp)
	jle	.L35
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	setup_brightness_lut, .-setup_brightness_lut
	.globl	susan_principle
	.type	susan_principle, @function
susan_principle:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movl	%r8d, -64(%rbp)
	movl	%r9d, -68(%rbp)
	movl	-64(%rbp), %eax
	imull	-68(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$3, -28(%rbp)
	jmp	.L37
.L41:
	movl	$3, -24(%rbp)
	jmp	.L38
.L40:
	movl	$100, -20(%rbp)
	movl	-28(%rbp), %eax
	subl	$3, %eax
	imull	-64(%rbp), %eax
	movslq	%eax, %rdx
	movl	-24(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	-28(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	addq	$2, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jg	.L39
	movl	-28(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-60(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, (%rdx)
.L39:
	addl	$1, -24(%rbp)
.L38:
	movl	-64(%rbp), %eax
	subl	$3, %eax
	cmpl	%eax, -24(%rbp)
	jl	.L40
	addl	$1, -28(%rbp)
.L37:
	movl	-68(%rbp), %eax
	subl	$3, %eax
	cmpl	%eax, -28(%rbp)
	jl	.L41
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	susan_principle, .-susan_principle
	.globl	susan_principle_small
	.type	susan_principle_small, @function
susan_principle_small:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movl	%r8d, -64(%rbp)
	movl	%r9d, -68(%rbp)
	movl	-64(%rbp), %eax
	imull	-68(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$730, -60(%rbp)
	movl	$1, -28(%rbp)
	jmp	.L43
.L47:
	movl	$1, -24(%rbp)
	jmp	.L44
.L46:
	movl	$100, -20(%rbp)
	movl	-28(%rbp), %eax
	subl	$1, %eax
	imull	-64(%rbp), %eax
	movslq	%eax, %rdx
	movl	-24(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	-28(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	addq	$2, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jg	.L45
	movl	-28(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-60(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, (%rdx)
.L45:
	addl	$1, -24(%rbp)
.L44:
	movl	-64(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -24(%rbp)
	jl	.L46
	addl	$1, -28(%rbp)
.L43:
	movl	-68(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -28(%rbp)
	jl	.L47
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	susan_principle_small, .-susan_principle_small
	.globl	median
	.type	median, @function
median:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movl	%edx, -80(%rbp)
	movl	%ecx, -84(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-76(%rbp), %eax
	subl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -48(%rbp)
	movl	-76(%rbp), %eax
	subl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -44(%rbp)
	movl	-76(%rbp), %eax
	subl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -40(%rbp)
	movl	-76(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -36(%rbp)
	movl	-76(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -32(%rbp)
	movl	-76(%rbp), %eax
	addl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -28(%rbp)
	movl	-76(%rbp), %eax
	addl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -24(%rbp)
	movl	-76(%rbp), %eax
	addl	$1, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -20(%rbp)
	movl	$0, -60(%rbp)
	jmp	.L49
.L53:
	movl	$0, -56(%rbp)
	jmp	.L50
.L52:
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jle	.L51
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -52(%rbp)
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-56(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-52(%rbp), %edx
	movl	%edx, -48(%rbp,%rax,4)
.L51:
	addl	$1, -56(%rbp)
.L50:
	movl	$7, %eax
	subl	-60(%rbp), %eax
	cmpl	%eax, -56(%rbp)
	jl	.L52
	addl	$1, -60(%rbp)
.L49:
	cmpl	$6, -60(%rbp)
	jle	.L53
	movl	-36(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	median, .-median
	.globl	enlarge
	.type	enlarge, @function
enlarge:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	%r8d, -52(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L57
.L58:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edx
	imull	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	-8(%rbp), %ecx
	movl	-52(%rbp), %edx
	addl	%edx, %ecx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edi
	movl	-52(%rbp), %edx
	addl	%edx, %edx
	addl	%edi, %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memcpy@PLT
	addl	$1, -8(%rbp)
.L57:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L58
	movl	$0, -8(%rbp)
	jmp	.L59
.L60:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edx
	imull	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	-52(%rbp), %edx
	subl	$1, %edx
	movl	%edx, %ecx
	subl	-8(%rbp), %ecx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edi
	movl	-52(%rbp), %edx
	addl	%edx, %edx
	addl	%edi, %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-48(%rbp), %rdx
	movl	(%rdx), %edx
	subl	-8(%rbp), %edx
	leal	-1(%rdx), %ecx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edx
	imull	%ecx, %edx
	movslq	%edx, %rdx
	addq	%rdx, %rsi
	movq	-48(%rbp), %rdx
	movl	(%rdx), %ecx
	movl	-52(%rbp), %edx
	addl	%edx, %ecx
	movl	-8(%rbp), %edx
	addl	%edx, %ecx
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edi
	movl	-52(%rbp), %edx
	addl	%edx, %edx
	addl	%edi, %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memcpy@PLT
	addl	$1, -8(%rbp)
.L59:
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L60
	movl	$0, -8(%rbp)
	jmp	.L61
.L64:
	movl	$0, -4(%rbp)
	jmp	.L62
.L63:
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	subl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	subl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
.L62:
	movq	-48(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L63
	addl	$1, -8(%rbp)
.L61:
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L64
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-48(%rbp), %rax
	movl	(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	enlarge, .-enlarge
	.section	.rodata
	.align 8
.LC29:
	.string	"Distance_thresh (%f) too big for integer arithmetic.\n"
	.align 8
.LC30:
	.string	"Either reduce it to <=15 or recompile with variable \"total\""
	.align 8
.LC31:
	.string	"as a float: see top \"defines\" section."
	.align 8
.LC32:
	.string	"Mask size (1.5*distance_thresh+1=%d) too big for image (%dx%d).\n"
	.text
	.globl	susan_smoothing
	.type	susan_smoothing, @function
susan_smoothing:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
    subq    $176, %rsp
	.cfi_offset 3, -24
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movl	%edx, -148(%rbp)
	movl	%ecx, -152(%rbp)
	movq	%r8, -160(%rbp)
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -136(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, -48(%rbp)
	cmpl	$0, -132(%rbp)
	jne	.L66
	pxor	%xmm1, %xmm1
	cvtss2sd	-136(%rbp), %xmm1
	movsd	.LC27(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	jmp	.L67
.L66:
	movl	$1, -116(%rbp)
.L67:
	movl	$0, -92(%rbp)
	movss	-136(%rbp), %xmm0
	comiss	.LC28(%rip), %xmm0
	jbe	.L68
	cmpl	$0, -92(%rbp)
	jne	.L68
	pxor	%xmm2, %xmm2
	cvtss2sd	-136(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L68:
	movl	-116(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-148(%rbp), %eax
	cmpl	%eax, %edx
	jge	.L70
	movl	-116(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-152(%rbp), %eax
	cmpl	%eax, %edx
	jl	.L71
.L70:
	movl	-152(%rbp), %ecx
	movl	-148(%rbp), %edx
	movl	-116(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %edi
	call	exit@PLT
.L71:
	movl	-116(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-148(%rbp), %eax
	addl	%eax, %edx
	movl	-116(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	-152(%rbp), %eax
	addl	%ecx, %eax
	imull	%edx, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	-116(%rbp), %edi
	leaq	-152(%rbp), %rcx
	leaq	-148(%rbp), %rdx
	movq	-40(%rbp), %rsi
	leaq	-144(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	movl	$0, %eax
	call	enlarge
	cmpl	$0, -132(%rbp)
	jne	.L72
	movl	-116(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	movl	-148(%rbp), %eax
	subl	-76(%rbp), %eax
	movl	%eax, -72(%rbp)
	movl	-76(%rbp), %eax
	imull	%eax, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -56(%rbp)
	movss	-136(%rbp), %xmm0
	mulss	%xmm0, %xmm0
	movss	.LC25(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -68(%rbp)
	movl	-116(%rbp), %eax
	negl	%eax
	movl	%eax, -112(%rbp)
	jmp	.L73
.L76:
	movl	-116(%rbp), %eax
	negl	%eax
	movl	%eax, -108(%rbp)
	jmp	.L74
.L75:
	movl	-112(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-108(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	divss	-68(%rbp), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movsd	.LC26(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -104(%rbp)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movl	-104(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -108(%rbp)
.L74:
	movl	-108(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L75
	addl	$1, -112(%rbp)
.L73:
	movl	-112(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L76
	movl	-116(%rbp), %eax
	movl	%eax, -112(%rbp)
	jmp	.L77
.L86:
	movl	-116(%rbp), %eax
	movl	%eax, -108(%rbp)
	jmp	.L78
.L85:
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-144(%rbp), %rcx
	movl	-112(%rbp), %eax
	subl	-116(%rbp), %eax
	movl	%eax, %edx
	movl	-148(%rbp), %eax
	imull	%edx, %eax
	movslq	%eax, %rdx
	movl	-108(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movl	-116(%rbp), %eax
	cltq
	subq	%rax, %rdx
	leaq	(%rcx,%rdx), %rax
	movq	%rax, -64(%rbp)
	movq	-144(%rbp), %rdx
	movl	-148(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %ecx
	movl	-108(%rbp), %eax
	addl	%ecx, %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movl	-116(%rbp), %eax
	negl	%eax
	movl	%eax, -100(%rbp)
	jmp	.L79
.L82:
	movl	-116(%rbp), %eax
	negl	%eax
	movl	%eax, -104(%rbp)
	jmp	.L80
.L81:
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	imull	%edx, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	addl	$1, -104(%rbp)
.L80:
	movl	-104(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L81
	movl	-72(%rbp), %eax
	cltq
	addq	%rax, -64(%rbp)
	addl	$1, -100(%rbp)
.L79:
	movl	-100(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L82
	movl	-96(%rbp), %eax
	subl	$10000, %eax
	movl	%eax, -80(%rbp)
	cmpl	$0, -80(%rbp)
	jne	.L83
	movl	-148(%rbp), %ecx
	movq	-144(%rbp), %rax
	movq	-48(%rbp), %rbx
	leaq	1(%rbx), %rdx
	movq	%rdx, -48(%rbp)
	movl	-108(%rbp), %edx
	movl	-112(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	median
	movb	%al, (%rbx)
	jmp	.L84
.L83:
	movl	-88(%rbp), %eax
	imull	$-10000, %eax, %edx
	movl	-92(%rbp), %eax
	addl	%edx, %eax
	cltd
	idivl	-80(%rbp)
	movl	%eax, %ecx
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -48(%rbp)
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L84:
	addl	$1, -108(%rbp)
.L78:
	movl	-148(%rbp), %eax
	subl	-116(%rbp), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L85
	addl	$1, -112(%rbp)
.L77:
	movl	-152(%rbp), %eax
	subl	-116(%rbp), %eax
	cmpl	%eax, -112(%rbp)
	jl	.L86
	jmp	.L95
.L72:
	movl	$1, -112(%rbp)
	jmp	.L88
.L93:
	movl	$1, -108(%rbp)
	jmp	.L89
.L92:
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movq	-144(%rbp), %rcx
	movl	-112(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-148(%rbp), %eax
	imull	%edx, %eax
	movslq	%eax, %rdx
	movl	-108(%rbp), %eax
	cltq
	addq	%rdx, %rax
	subq	$1, %rax
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	-144(%rbp), %rdx
	movl	-148(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %ecx
	movl	-108(%rbp), %eax
	addl	%ecx, %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movl	-148(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movl	-148(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movq	-64(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	negq	%rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	addl	%eax, -96(%rbp)
	movl	-80(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%eax, -92(%rbp)
	movl	-96(%rbp), %eax
	subl	$100, %eax
	movl	%eax, -80(%rbp)
	cmpl	$0, -80(%rbp)
	jne	.L90
	movl	-148(%rbp), %ecx
	movq	-144(%rbp), %rax
	movq	-48(%rbp), %rbx
	leaq	1(%rbx), %rdx
	movq	%rdx, -48(%rbp)
	movl	-108(%rbp), %edx
	movl	-112(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	median
	movb	%al, (%rbx)
	jmp	.L91
.L90:
	movl	-88(%rbp), %eax
	imull	$-100, %eax, %edx
	movl	-92(%rbp), %eax
	addl	%edx, %eax
	cltd
	idivl	-80(%rbp)
	movl	%eax, %ecx
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -48(%rbp)
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L91:
	addl	$1, -108(%rbp)
.L89:
	movl	-148(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -108(%rbp)
	jl	.L92
	addl	$1, -112(%rbp)
.L88:
	movl	-152(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -112(%rbp)
	jl	.L93
.L95:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	susan_smoothing, .-susan_smoothing
	.globl	edge_draw
	.type	edge_draw, @function
edge_draw:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	movl	%r8d, -60(%rbp)
	cmpl	$0, -60(%rbp)
	jne	.L97
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L98
.L100:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L99
	movq	-16(%rbp), %rax
	subq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
	movl	-52(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
	movl	-52(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
.L99:
	addq	$1, -16(%rbp)
	addl	$1, -20(%rbp)
.L98:
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L100
.L97:
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L101
.L103:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L102
	movq	-16(%rbp), %rax
	subq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L102:
	addq	$1, -16(%rbp)
	addl	$1, -20(%rbp)
.L101:
	movl	-52(%rbp), %eax
	imull	-56(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L103
	nop
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	edge_draw, .-edge_draw
	.globl	susan_thin
	.type	susan_thin, @function
susan_thin:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $176, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movl	%edx, -164(%rbp)
	movl	%ecx, -168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$4, -120(%rbp)
	jmp	.L105
.L139:
	movl	$4, -116(%rbp)
	jmp	.L106
.L138:
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L107
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -112(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movslq	%eax, %rdx
	movl	-116(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %edx
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	addl	%eax, %edx
	movq	-56(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	leal	(%rcx,%rax), %edx
	movl	-164(%rbp), %eax
	cltq
	leaq	2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	addl	%eax, %edx
	movl	-164(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	addl	%eax, %edx
	movl	-164(%rbp), %eax
	cltq
	addq	%rax, %rax
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	addl	%eax, %edx
	movl	-164(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	(%rax,%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -108(%rbp)
	cmpl	$0, -108(%rbp)
	jne	.L108
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$100, (%rax)
.L108:
	cmpl	$1, -108(%rbp)
	jne	.L109
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$5, %al
	ja	.L109
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -48(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -40(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movl	$0, -32(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L110
	movl	$0, -48(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -36(%rbp)
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -40(%rbp)
	movl	-24(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
	movl	-20(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -16(%rbp)
	jmp	.L111
.L110:
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L112
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -36(%rbp)
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -28(%rbp)
	movl	-24(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -24(%rbp)
	movl	-16(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-20(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -20(%rbp)
	jmp	.L111
.L112:
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L113
	movl	$0, -40(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -28(%rbp)
	movl	-48(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -48(%rbp)
	movl	-16(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -36(%rbp)
	movl	-20(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-24(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -24(%rbp)
	jmp	.L111
.L113:
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L114
	movl	$0, -36(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -24(%rbp)
	movl	-44(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -44(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -20(%rbp)
	movl	-40(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -40(%rbp)
	movl	-16(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-28(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -28(%rbp)
	jmp	.L111
.L114:
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L115
	movl	$0, -28(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -16(%rbp)
	movl	-44(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -44(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -20(%rbp)
	movl	-48(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
	movl	-24(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -24(%rbp)
	movl	-36(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -36(%rbp)
	jmp	.L111
.L115:
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L116
	movl	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -20(%rbp)
	movl	-48(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -48(%rbp)
	movl	-16(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movl	-44(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movl	-28(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
	movl	-40(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -40(%rbp)
	jmp	.L111
.L116:
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L117
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -36(%rbp)
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -28(%rbp)
	movl	-48(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
	movl	-40(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -40(%rbp)
	movl	-44(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -44(%rbp)
	jmp	.L111
.L117:
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L111
	movl	$0, -16(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -20(%rbp)
	movl	-24(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -24(%rbp)
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -40(%rbp)
	movl	-44(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movl	-36(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -36(%rbp)
	movl	-48(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -48(%rbp)
.L111:
	movl	$0, -140(%rbp)
	movl	$0, -124(%rbp)
	jmp	.L118
.L122:
	movl	$0, -128(%rbp)
	jmp	.L119
.L121:
	movl	-124(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%edx, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	%eax, -140(%rbp)
	jge	.L120
	movl	-124(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%edx, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -140(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, -136(%rbp)
	movl	-128(%rbp), %eax
	movl	%eax, -132(%rbp)
.L120:
	addl	$1, -128(%rbp)
.L119:
	cmpl	$2, -128(%rbp)
	jle	.L121
	addl	$1, -124(%rbp)
.L118:
	cmpl	$2, -124(%rbp)
	jle	.L122
	cmpl	$0, -140(%rbp)
	jle	.L109
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$3, %al
	ja	.L123
	movl	-120(%rbp), %edx
	movl	-136(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-132(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$4, (%rax)
	jmp	.L124
.L123:
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-120(%rbp), %ecx
	movl	-136(%rbp), %eax
	addl	%ecx, %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %ecx
	movl	-116(%rbp), %eax
	addl	%eax, %ecx
	movl	-132(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-160(%rbp), %rax
	addq	%rcx, %rax
	addl	$1, %edx
	movb	%dl, (%rax)
.L124:
	movl	-136(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-132(%rbp), %eax
	addl	%edx, %eax
	cmpl	$2, %eax
	jg	.L109
	movl	-136(%rbp), %eax
	subl	$1, %eax
	addl	%eax, -120(%rbp)
	movl	-132(%rbp), %eax
	subl	$2, %eax
	addl	%eax, -116(%rbp)
	cmpl	$3, -120(%rbp)
	jg	.L125
	movl	$4, -120(%rbp)
.L125:
	cmpl	$3, -116(%rbp)
	jg	.L109
	movl	$4, -116(%rbp)
.L109:
	cmpl	$2, -108(%rbp)
	jne	.L126
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -104(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -100(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -96(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -92(%rbp)
	movl	-104(%rbp), %edx
	movl	-100(%rbp), %eax
	addl	%eax, %edx
	movl	-96(%rbp), %eax
	addl	%eax, %edx
	movl	-92(%rbp), %eax
	addl	%edx, %eax
	cmpl	$2, %eax
	jne	.L127
	movl	-104(%rbp), %eax
	orl	-92(%rbp), %eax
	movl	%eax, %edx
	movl	-100(%rbp), %eax
	orl	-96(%rbp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L127
	cmpl	$0, -104(%rbp)
	je	.L128
	cmpl	$0, -100(%rbp)
	je	.L129
	movl	$0, -128(%rbp)
	movl	$-1, -124(%rbp)
	jmp	.L130
.L129:
	movl	$-1, -128(%rbp)
	movl	$0, -124(%rbp)
	jmp	.L130
.L128:
	cmpl	$0, -100(%rbp)
	je	.L131
	movl	$1, -128(%rbp)
	movl	$0, -124(%rbp)
	jmp	.L130
.L131:
	movl	$0, -128(%rbp)
	movl	$1, -124(%rbp)
.L130:
	movl	-120(%rbp), %edx
	movl	-124(%rbp), %eax
	addl	%edx, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-112(%rbp), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	comisd	.LC33(%rip), %xmm0
	jbe	.L142
	cmpl	$0, -128(%rbp)
	jne	.L134
	movl	-124(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-120(%rbp), %eax
	addl	%edx, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	jbe	.L134
	movl	-124(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-120(%rbp), %eax
	addl	%edx, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	jbe	.L134
	movl	-124(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-120(%rbp), %eax
	addl	%edx, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	ja	.L135
.L134:
	cmpl	$0, -124(%rbp)
	jne	.L142
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	jbe	.L142
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	jbe	.L142
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	jbe	.L142
.L135:
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$100, (%rax)
	movl	-120(%rbp), %edx
	movl	-124(%rbp), %eax
	addl	%edx, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%eax, %edx
	movl	-128(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$3, (%rax)
	jmp	.L142
.L127:
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -88(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -76(%rbp)
	movl	-88(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%eax, %edx
	movl	-76(%rbp), %eax
	addl	%edx, %eax
	cmpl	$2, %eax
	jne	.L126
	movl	-76(%rbp), %eax
	orl	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-88(%rbp), %eax
	orl	-80(%rbp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L126
	movl	-120(%rbp), %eax
	subl	$2, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%cl
	movl	-120(%rbp), %eax
	subl	$2, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	orl	%ecx, %eax
	movzbl	%al, %eax
	andl	-88(%rbp), %eax
	movl	%eax, %edx
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %ecx
	movl	-116(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-160(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%sil
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %ecx
	movl	-116(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-160(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	orl	%esi, %eax
	movzbl	%al, %eax
	andl	-76(%rbp), %eax
	movl	%edx, %ecx
	orl	%eax, %ecx
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%sil
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	orl	%esi, %eax
	movzbl	%al, %eax
	andl	-84(%rbp), %eax
	orl	%eax, %ecx
	movl	-120(%rbp), %eax
	addl	$2, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%sil
	movl	-120(%rbp), %eax
	addl	$2, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	orl	%esi, %eax
	movzbl	%al, %eax
	andl	-80(%rbp), %eax
	orl	%ecx, %eax
	testl	%eax, %eax
	je	.L126
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$100, (%rax)
	subl	$1, -120(%rbp)
	subl	$2, -116(%rbp)
	cmpl	$3, -120(%rbp)
	jg	.L136
	movl	$4, -120(%rbp)
.L136:
	cmpl	$3, -116(%rbp)
	jg	.L126
	movl	$4, -116(%rbp)
	jmp	.L126
.L142:
	nop
.L126:
	cmpl	$2, -108(%rbp)
	jle	.L107
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -88(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -84(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -80(%rbp)
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -76(%rbp)
	movl	-88(%rbp), %edx
	movl	-84(%rbp), %eax
	addl	%eax, %edx
	movl	-80(%rbp), %eax
	addl	%eax, %edx
	movl	-76(%rbp), %eax
	addl	%edx, %eax
	cmpl	$1, %eax
	jle	.L107
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -104(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -100(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -96(%rbp)
	movl	-120(%rbp), %eax
	addl	$1, %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$7, %al
	setbe	%al
	movzbl	%al, %eax
	movl	%eax, -92(%rbp)
	movl	-104(%rbp), %eax
	orl	-88(%rbp), %eax
	movl	%eax, -72(%rbp)
	movl	-100(%rbp), %eax
	orl	-84(%rbp), %eax
	movl	%eax, -68(%rbp)
	movl	-92(%rbp), %eax
	orl	-80(%rbp), %eax
	movl	%eax, -64(%rbp)
	movl	-96(%rbp), %eax
	orl	-76(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	-72(%rbp), %edx
	movl	-68(%rbp), %eax
	addl	%eax, %edx
	movl	-64(%rbp), %eax
	addl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%eax, %edx
	movl	-88(%rbp), %eax
	andl	-68(%rbp), %eax
	movl	%eax, %ecx
	movl	-84(%rbp), %eax
	andl	-64(%rbp), %eax
	addl	%eax, %ecx
	movl	-80(%rbp), %eax
	andl	-60(%rbp), %eax
	addl	%eax, %ecx
	movl	-76(%rbp), %eax
	andl	-72(%rbp), %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cmpl	$1, %eax
	jg	.L107
	movl	-120(%rbp), %eax
	imull	-164(%rbp), %eax
	movl	%eax, %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movb	$100, (%rax)
	subl	$1, -120(%rbp)
	subl	$2, -116(%rbp)
	cmpl	$3, -120(%rbp)
	jg	.L137
	movl	$4, -120(%rbp)
.L137:
	cmpl	$3, -116(%rbp)
	jg	.L107
	movl	$4, -116(%rbp)
.L107:
	addl	$1, -116(%rbp)
.L106:
	movl	-164(%rbp), %eax
	subl	$4, %eax
	cmpl	%eax, -116(%rbp)
	jl	.L138
	addl	$1, -120(%rbp)
.L105:
	movl	-168(%rbp), %eax
	subl	$4, %eax
	cmpl	%eax, -120(%rbp)
	jl	.L139
	nop
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L140
	call	__stack_chk_fail@PLT
.L140:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	susan_thin, .-susan_thin
	.globl	susan_edges
	.type	susan_edges, @function
susan_edges:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movl	%r8d, -100(%rbp)
	movl	%r9d, -104(%rbp)
	movl	-104(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$3, -52(%rbp)
	jmp	.L144
.L148:
	movl	$3, -48(%rbp)
	jmp	.L145
.L147:
	movl	$100, -28(%rbp)
	movl	-52(%rbp), %eax
	subl	$3, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jg	.L146
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rax, %rdx
	movl	-100(%rbp), %eax
	subl	-28(%rbp), %eax
	movl	%eax, (%rdx)
.L146:
	addl	$1, -48(%rbp)
.L145:
	movl	-104(%rbp), %eax
	subl	$3, %eax
	cmpl	%eax, -48(%rbp)
	jl	.L147
	addl	$1, -52(%rbp)
.L144:
	movl	16(%rbp), %eax
	subl	$3, %eax
	cmpl	%eax, -52(%rbp)
	jl	.L148
	movl	$4, -52(%rbp)
	jmp	.L149
.L176:
	movl	$4, -48(%rbp)
	jmp	.L150
.L175:
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L151
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -32(%rbp)
	movl	-100(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	cmpl	$600, -28(%rbp)
	jle	.L152
	movl	-52(%rbp), %eax
	subl	$3, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movl	-24(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -60(%rbp)
	pxor	%xmm0, %xmm0
	cvtss2sd	-60(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-28(%rbp), %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm1, %xmm2
	movsd	.LC34(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L183
	movl	$0, -56(%rbp)
	cmpl	$0, -24(%rbp)
	jne	.L155
	movss	.LC35(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	jmp	.L156
.L155:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-20(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-24(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
.L156:
	pxor	%xmm0, %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L184
	movss	-60(%rbp), %xmm0
	movss	.LC25(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
	movl	$-1, -36(%rbp)
	jmp	.L159
.L184:
	movl	$1, -36(%rbp)
.L159:
	movss	.LC37(%rip), %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L185
	movl	$0, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L162
.L185:
	movss	-60(%rbp), %xmm0
	comiss	.LC38(%rip), %xmm0
	jbe	.L186
	movl	$1, -44(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L162
.L186:
	cmpl	$0, -36(%rbp)
	jle	.L165
	movl	$1, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L162
.L165:
	movl	$-1, -44(%rbp)
	movl	$1, -40(%rbp)
.L162:
	movl	-52(%rbp), %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L166
	movl	-52(%rbp), %eax
	subl	-44(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	subl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L166
	movl	-44(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L166
	movl	-44(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-52(%rbp), %eax
	subl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L166
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
	jmp	.L166
.L183:
	movl	$1, -56(%rbp)
	jmp	.L166
.L152:
	movl	$1, -56(%rbp)
.L166:
	cmpl	$1, -56(%rbp)
	jne	.L151
	movl	-52(%rbp), %eax
	subl	$3, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	subl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	sall	$2, %eax
	addl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -36(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L167
	movss	.LC35(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	jmp	.L168
.L167:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-20(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
.L168:
	movss	.LC37(%rip), %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L187
	movl	$0, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L171
.L187:
	movss	-60(%rbp), %xmm0
	comiss	.LC38(%rip), %xmm0
	jbe	.L188
	movl	$1, -44(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L171
.L188:
	cmpl	$0, -36(%rbp)
	jle	.L174
	movl	$-1, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L171
.L174:
	movl	$1, -44(%rbp)
	movl	$1, -40(%rbp)
.L171:
	movl	-52(%rbp), %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L151
	movl	-52(%rbp), %eax
	subl	-44(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	subl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L151
	movl	-44(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L151
	movl	-44(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-52(%rbp), %eax
	subl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L151
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$2, (%rax)
.L151:
	addl	$1, -48(%rbp)
.L150:
	movl	-104(%rbp), %eax
	subl	$4, %eax
	cmpl	%eax, -48(%rbp)
	jl	.L175
	addl	$1, -52(%rbp)
.L149:
	movl	16(%rbp), %eax
	subl	$4, %eax
	cmpl	%eax, -52(%rbp)
	jl	.L176
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	susan_edges, .-susan_edges
	.globl	susan_edges_small
	.type	susan_edges_small, @function
susan_edges_small:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movl	%r8d, -100(%rbp)
	movl	%r9d, -104(%rbp)
	movl	-104(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$730, -100(%rbp)
	movl	$1, -52(%rbp)
	jmp	.L190
.L194:
	movl	$1, -48(%rbp)
	jmp	.L191
.L193:
	movl	$100, -28(%rbp)
	movl	-52(%rbp), %eax
	subl	$1, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jg	.L192
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rax, %rdx
	movl	-100(%rbp), %eax
	subl	-28(%rbp), %eax
	movl	%eax, (%rdx)
.L192:
	addl	$1, -48(%rbp)
.L191:
	movl	-104(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -48(%rbp)
	jl	.L193
	addl	$1, -52(%rbp)
.L190:
	movl	16(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -52(%rbp)
	jl	.L194
	movl	$2, -52(%rbp)
	jmp	.L195
.L222:
	movl	$2, -48(%rbp)
	jmp	.L196
.L221:
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L197
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -32(%rbp)
	movl	-100(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	cmpl	$250, -28(%rbp)
	jle	.L198
	movl	-52(%rbp), %eax
	subl	$1, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -20(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movl	-24(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -60(%rbp)
	pxor	%xmm0, %xmm0
	cvtss2sd	-60(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-28(%rbp), %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm1, %xmm2
	movsd	.LC39(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L229
	movl	$0, -56(%rbp)
	cmpl	$0, -24(%rbp)
	jne	.L201
	movss	.LC35(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	jmp	.L202
.L201:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-20(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-24(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
.L202:
	pxor	%xmm0, %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L230
	movss	-60(%rbp), %xmm0
	movss	.LC25(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
	movl	$-1, -36(%rbp)
	jmp	.L205
.L230:
	movl	$1, -36(%rbp)
.L205:
	movss	.LC37(%rip), %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L231
	movl	$0, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L208
.L231:
	movss	-60(%rbp), %xmm0
	comiss	.LC38(%rip), %xmm0
	jbe	.L232
	movl	$1, -44(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L208
.L232:
	cmpl	$0, -36(%rbp)
	jle	.L211
	movl	$1, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L208
.L211:
	movl	$-1, -44(%rbp)
	movl	$1, -40(%rbp)
.L208:
	movl	-52(%rbp), %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L212
	movl	-52(%rbp), %eax
	subl	-44(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	subl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L212
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
	jmp	.L212
.L229:
	movl	$1, -56(%rbp)
	jmp	.L212
.L198:
	movl	$1, -56(%rbp)
.L212:
	cmpl	$1, -56(%rbp)
	jne	.L197
	movl	-52(%rbp), %eax
	subl	$1, %eax
	imull	-104(%rbp), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -36(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	addq	$2, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movl	-104(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	subl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -61(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -24(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -20(%rbp)
	movzbl	-61(%rbp), %eax
	addl	%eax, -36(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L213
	movss	.LC35(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	jmp	.L214
.L213:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-24(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-20(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
.L214:
	movss	.LC37(%rip), %xmm0
	comiss	-60(%rbp), %xmm0
	jbe	.L233
	movl	$0, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L217
.L233:
	movss	-60(%rbp), %xmm0
	comiss	.LC38(%rip), %xmm0
	jbe	.L234
	movl	$1, -44(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L217
.L234:
	cmpl	$0, -36(%rbp)
	jle	.L220
	movl	$-1, -44(%rbp)
	movl	$1, -40(%rbp)
	jmp	.L217
.L220:
	movl	$1, -44(%rbp)
	movl	$1, -40(%rbp)
.L217:
	movl	-52(%rbp), %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L197
	movl	-52(%rbp), %eax
	subl	-44(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	subl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L197
	movl	-52(%rbp), %eax
	imull	-104(%rbp), %eax
	movl	%eax, %edx
	movl	-48(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$2, (%rax)
.L197:
	addl	$1, -48(%rbp)
.L196:
	movl	-104(%rbp), %eax
	subl	$2, %eax
	cmpl	%eax, -48(%rbp)
	jl	.L221
	addl	$1, -52(%rbp)
.L195:
	movl	16(%rbp), %eax
	subl	$2, %eax
	cmpl	%eax, -52(%rbp)
	jl	.L222
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	susan_edges_small, .-susan_edges_small
	.globl	corner_draw
	.type	corner_draw, @function
corner_draw:
.LFB21:
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
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L236
.L238:
	cmpl	$0, -40(%rbp)
	jne	.L237
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	subl	$1, %eax
	imull	-36(%rbp), %eax
	movslq	%eax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	addq	%rcx, %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
	movl	-36(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
	movl	-36(%rbp), %eax
	cltq
	subq	$2, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$-1, (%rax)
	movq	-8(%rbp), %rax
	movb	$-1, (%rax)
	addl	$1, -12(%rbp)
	jmp	.L236
.L237:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	imull	-36(%rbp), %eax
	movslq	%eax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	leaq	(%rcx,%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	addl	$1, -12(%rbp)
.L236:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	8(%rax), %eax
	cmpl	$7, %eax
	jne	.L238
	nop
    leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	corner_draw, .-corner_draw
	.section	.rodata
.LC42:
	.string	"Too many corners.\n"
	.text
	.globl	susan_corners
	.type	susan_corners, @function
susan_corners:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    addq    $-176, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movl	%ecx, -108(%rbp)
	movq	%r8, -120(%rbp)
	movl	%r9d, -112(%rbp)
	movl	-112(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-112(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-112(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$5, -60(%rbp)
	jmp	.L240
.L268:
	movl	$5, -56(%rbp)
	jmp	.L241
.L267:
	movl	$100, -68(%rbp)
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movslq	%eax, %rdx
	movl	-56(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	addq	$2, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movl	-112(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movl	-112(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movl	-112(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.L242
	movl	$0, -52(%rbp)
	movl	$0, -48(%rbp)
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movslq	%eax, %rdx
	movl	-56(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -48(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -48(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -48(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -52(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -52(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	addq	$2, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -52(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -52(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	movl	%eax, %ecx
	leal	0(,%rax,4), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -48(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, %eax
	addl	%eax, -48(%rbp)
	movl	-112(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	subl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -48(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -69(%rbp)
	movzbl	-69(%rbp), %eax
	addl	%eax, -52(%rbp)
	movzbl	-69(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, -48(%rbp)
	movl	-52(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -44(%rbp)
	movl	-48(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, -40(%rbp)
	movl	-44(%rbp), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -64(%rbp)
	movl	-68(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -64(%rbp)
	jle	.L242
	movl	-40(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.L243
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-48(%rbp), %xmm0
	movl	-52(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L244
	movl	$-1, %eax
	jmp	.L245
.L244:
	movl	$1, %eax
.L245:
	movl	%eax, -64(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-36(%rbp), %xmm0
	jbe	.L280
	pxor	%xmm0, %xmm0
	cvtss2sd	-36(%rbp), %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L248
.L280:
	pxor	%xmm1, %xmm1
	cvtss2sd	-36(%rbp), %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L248:
	movl	-60(%rbp), %edx
	addl	%edx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movss	-36(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	addss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L281
	movss	-36(%rbp), %xmm0
	addss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L251
.L281:
	movss	-36(%rbp), %xmm0
	addss	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L251:
	movl	-60(%rbp), %ecx
	addl	%ecx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %ecx
	movl	-56(%rbp), %eax
	addl	%eax, %ecx
	movl	-64(%rbp), %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movslq	%eax, %rcx
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L282
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L254
.L282:
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L254:
	movl	-60(%rbp), %edx
	addl	%edx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	leal	(%rdx,%rax), %esi
	movl	-64(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%esi, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -64(%rbp)
	jmp	.L255
.L243:
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-52(%rbp), %xmm0
	movl	-48(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	cmpl	$0, -48(%rbp)
	jns	.L256
	movl	$-1, %eax
	jmp	.L257
.L256:
	movl	$1, %eax
.L257:
	movl	%eax, -64(%rbp)
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	pxor	%xmm0, %xmm0
	comiss	-36(%rbp), %xmm0
	jbe	.L283
	pxor	%xmm0, %xmm0
	cvtss2sd	-36(%rbp), %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L260
.L283:
	pxor	%xmm1, %xmm1
	cvtss2sd	-36(%rbp), %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L260:
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-64(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	-60(%rbp), %eax
	addl	%ecx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %ecx
	movl	-56(%rbp), %eax
	addl	%eax, %ecx
	movss	-36(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	addss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L284
	movss	-36(%rbp), %xmm0
	addss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L263
.L284:
	movss	-36(%rbp), %xmm0
	addss	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L263:
	addl	%ecx, %eax
	movslq	%eax, %rcx
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movl	-64(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L285
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LC40(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	jmp	.L266
.L285:
	movss	-36(%rbp), %xmm1
	movss	.LC41(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC40(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
.L266:
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -64(%rbp)
.L255:
	cmpl	$290, -64(%rbp)
	jle	.L242
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rax, %rdx
	movl	-108(%rbp), %eax
	subl	-68(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-52(%rbp), %eax
	imull	$51, %eax, %eax
	movl	-60(%rbp), %edx
	movl	%edx, %ecx
	imull	-112(%rbp), %ecx
	movl	-56(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rdx, %rcx
	cltd
	idivl	-68(%rbp)
	movl	%eax, (%rcx)
	movl	-48(%rbp), %eax
	imull	$51, %eax, %eax
	movl	-60(%rbp), %edx
	movl	%edx, %ecx
	imull	-112(%rbp), %ecx
	movl	-56(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	cltd
	idivl	-68(%rbp)
	movl	%eax, (%rcx)
.L242:
	addl	$1, -56(%rbp)
.L241:
	movl	-112(%rbp), %eax
	subl	$5, %eax
	cmpl	%eax, -56(%rbp)
	jl	.L267
	addl	$1, -60(%rbp)
.L240:
	movl	16(%rbp), %eax
	subl	$5, %eax
	cmpl	%eax, -60(%rbp)
	jl	.L268
	movl	$0, -68(%rbp)
	movl	$5, -60(%rbp)
	jmp	.L269
.L273:
	movl	$5, -56(%rbp)
	jmp	.L270
.L272:
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	subl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jle	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$1, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$2, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-60(%rbp), %eax
	addl	$3, %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L271
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 8(%rax)
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rax, %rdx
	movl	-56(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, 12(%rdx)
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, 16(%rdx)
	movl	-60(%rbp), %eax
	imull	-112(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rax, %rdx
	movzbl	%cl, %eax
	movl	%eax, 20(%rdx)
	addl	$1, -68(%rbp)
	cmpl	$15000, -68(%rbp)
	jne	.L271
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L271:
	addl	$1, -56(%rbp)
.L270:
	movl	-112(%rbp), %eax
	subl	$5, %eax
	cmpl	%eax, -56(%rbp)
	jl	.L272
	addl	$1, -60(%rbp)
.L269:
	movl	16(%rbp), %eax
	subl	$5, %eax
	cmpl	%eax, -60(%rbp)
	jl	.L273
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movl	$7, 8(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	susan_corners, .-susan_corners
	.globl	susan_corners_quick
	.type	susan_corners_quick, @function
susan_corners_quick:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    subq    $112, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movl	%ecx, -76(%rbp)
	movq	%r8, -88(%rbp)
	movl	%r9d, -80(%rbp)
	movl	-80(%rbp), %eax
	imull	16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$7, -32(%rbp)
	jmp	.L287
.L291:
	movl	$7, -28(%rbp)
	jmp	.L288
.L290:
	movl	$100, -36(%rbp)
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movslq	%eax, %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-80(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-80(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-80(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	addq	$2, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movl	-80(%rbp), %eax
	cltq
	subq	$6, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movl	-80(%rbp), %eax
	cltq
	subq	$5, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movl	-80(%rbp), %eax
	cltq
	subq	$3, %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	negq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.L289
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-76(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, (%rdx)
.L289:
	addl	$1, -28(%rbp)
.L288:
	movl	-80(%rbp), %eax
	subl	$7, %eax
	cmpl	%eax, -28(%rbp)
	jl	.L290
	addl	$1, -32(%rbp)
.L287:
	movl	16(%rbp), %eax
	subl	$7, %eax
	cmpl	%eax, -32(%rbp)
	jl	.L291
	movl	$0, -36(%rbp)
	movl	$7, -32(%rbp)
	jmp	.L292
.L296:
	movl	$7, -28(%rbp)
	jmp	.L293
.L295:
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-32(%rbp), %eax
	addl	$3, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L294
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 8(%rax)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -24(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$1374389535, %rcx, %rcx
	shrq	$32, %rcx
	sarl	$3, %ecx
	sarl	$31, %eax
	movl	%eax, %esi
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%eax, 20(%rdx)
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %edx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %esi
	movl	-28(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	-2(%rax), %rsi
	movq	-56(%rbp), %rax
	addq	%rsi, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %esi
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rsi,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, -24(%rbp)
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-24(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %edx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %esi
	movl	-28(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-56(%rbp), %rax
	addq	%rsi, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %esi
	movl	-32(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rsi,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	addl	%eax, -24(%rbp)
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rdx,%rax), %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %edx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %ecx
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %esi
	movl	-28(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-56(%rbp), %rax
	addq	%rsi, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %esi
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	movslq	%eax, %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	subl	$2, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rsi,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, -20(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-20(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %edx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	-2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %ecx
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %esi
	movl	-28(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	-1(%rax), %rsi
	movq	-56(%rbp), %rax
	addq	%rsi, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rcx,%rax), %esi
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	movslq	%eax, %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	1(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %esi
	movl	-32(%rbp), %eax
	subl	$1, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	2(%rax), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	leal	(%rsi,%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	addl	%eax, -20(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$-2004318071, %rcx, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$3, %ecx
	sarl	$31, %eax
	movl	%eax, %esi
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%eax, 12(%rdx)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$-2004318071, %rcx, %rcx
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$3, %ecx
	sarl	$31, %eax
	movl	%eax, %esi
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%eax, 16(%rdx)
	addl	$1, -36(%rbp)
	cmpl	$15000, -36(%rbp)
	jne	.L294
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$18, %edx
	movl	$1, %esi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L294:
	addl	$1, -28(%rbp)
.L293:
	movl	-80(%rbp), %eax
	subl	$7, %eax
	cmpl	%eax, -28(%rbp)
	jl	.L295
	addl	$1, -32(%rbp)
.L292:
	movl	16(%rbp), %eax
	subl	$7, %eax
	cmpl	%eax, -32(%rbp)
	jl	.L296
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movl	$7, 8(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	susan_corners_quick, .-susan_corners_quick
	.section	.rodata
.LC44:
	.string	"No argument following -d"
.LC45:
	.string	"No argument following -t"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-356352(%rsp), %r11
    subq    $360208, %rsp
    orq     $0, (%rsp)
	subq	$3856, %rsp
	movl	%edi, -360196(%rbp)
	movq	%rsi, -360208(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, -360180(%rbp)
	movl	$3, -360176(%rbp)
	movl	$20, -360172(%rbp)
	movl	$0, -360168(%rbp)
	movl	$1, -360164(%rbp)
	movl	$0, -360160(%rbp)
	movl	$0, -360156(%rbp)
	movl	$0, -360152(%rbp)
	movl	$1850, -360144(%rbp)
	movl	$2650, -360140(%rbp)
	movl	$0, -360148(%rbp)
	cmpl	$2, -360196(%rbp)
	jg	.L298
	movl	$0, %eax
	call	usage
.L298:
	movq	-360208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-360184(%rbp), %rcx
	leaq	-360188(%rbp), %rdx
	leaq	-360136(%rbp), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	get_image
	jmp	.L299
.L318:
	movl	-360176(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-360208(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -360104(%rbp)
	movq	-360104(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L300
	addq	$1, -360104(%rbp)
	movq	-360104(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$51, %eax
	cmpl	$65, %eax
	ja	.L317
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L303(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L303(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L303:
	.long	.L312-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L311-.L303
	.long	.L310-.L303
	.long	.L309-.L303
	.long	.L308-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L317-.L303
	.long	.L307-.L303
	.long	.L317-.L303
	.long	.L306-.L303
	.long	.L305-.L303
	.long	.L317-.L303
	.long	.L304-.L303
	.long	.L302-.L303
	.text
.L304:
	movl	$0, -360148(%rbp)
	jmp	.L317
.L308:
	movl	$1, -360148(%rbp)
	jmp	.L317
.L310:
	movl	$2, -360148(%rbp)
	jmp	.L317
.L306:
	movl	$1, -360168(%rbp)
	jmp	.L317
.L307:
	movl	$0, -360164(%rbp)
	jmp	.L317
.L311:
	movl	$1, -360156(%rbp)
	jmp	.L317
.L312:
	movl	$1, -360160(%rbp)
	jmp	.L317
.L305:
	movl	$1, -360152(%rbp)
	jmp	.L317
.L309:
	addl	$1, -360176(%rbp)
	movl	-360176(%rbp), %eax
	cmpl	-360196(%rbp), %eax
	jl	.L313
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L313:
	movl	-360176(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-360208(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -360180(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-360180(%rbp), %xmm0
	ja	.L337
	jmp	.L317
.L337:
	movl	$1, -360160(%rbp)
	jmp	.L317
.L302:
	addl	$1, -360176(%rbp)
	movl	-360176(%rbp), %eax
	cmpl	-360196(%rbp), %eax
	jl	.L316
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L316:
	movl	-360176(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-360208(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -360172(%rbp)
	jmp	.L317
.L300:
	movl	$0, %eax
	call	usage
.L317:
	addl	$1, -360176(%rbp)
.L299:
	movl	-360176(%rbp), %eax
	cmpl	-360196(%rbp), %eax
	jl	.L318
	cmpl	$1, -360168(%rbp)
	jne	.L319
	cmpl	$0, -360148(%rbp)
	jne	.L319
	movl	$1, -360148(%rbp)
.L319:
	cmpl	$2, -360148(%rbp)
	je	.L320
	cmpl	$2, -360148(%rbp)
	jg	.L321
	cmpl	$0, -360148(%rbp)
	je	.L322
	cmpl	$1, -360148(%rbp)
	je	.L323
	jmp	.L321
.L322:
	movl	-360172(%rbp), %ecx
	leaq	-360128(%rbp), %rax
	movl	$2, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	setup_brightness_lut
	movq	-360128(%rbp), %r8
	movl	-360184(%rbp), %ecx
	movl	-360188(%rbp), %edx
	pxor	%xmm1, %xmm1
	cvtss2sd	-360180(%rbp), %xmm1
	movq	%xmm1, %rdi
	movq	-360136(%rbp), %rsi
	movl	-360160(%rbp), %eax
	movq	%rdi, %xmm0
	movl	%eax, %edi
	movl	$1, %eax
	call	susan_smoothing
	jmp	.L321
.L323:
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%edx, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -360120(%rbp)
	movl	-360172(%rbp), %ecx
	leaq	-360128(%rbp), %rax
	movl	$6, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	setup_brightness_lut
	cmpl	$0, -360168(%rbp)
	je	.L324
	cmpl	$0, -360160(%rbp)
	je	.L325
	movl	-360184(%rbp), %r8d
	movl	-360188(%rbp), %edi
	movq	-360128(%rbp), %rdx
	movq	-360136(%rbp), %rax
	movl	-360140(%rbp), %ecx
	movq	-360120(%rbp), %rsi
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_principle_small
	jmp	.L326
.L325:
	movl	-360184(%rbp), %r8d
	movl	-360188(%rbp), %edi
	movq	-360128(%rbp), %rdx
	movq	-360136(%rbp), %rax
	movl	-360140(%rbp), %ecx
	movq	-360120(%rbp), %rsi
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_principle
.L326:
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%eax, %edx
	movq	-360136(%rbp), %rcx
	movq	-360120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	int_to_uchar
	jmp	.L321
.L324:
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%edx, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -360112(%rbp)
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%edx, %eax
	movslq	%eax, %rdx
	movq	-360112(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	memset@PLT
	cmpl	$0, -360160(%rbp)
	je	.L328
	movl	-360184(%rbp), %edi
	movl	-360188(%rbp), %r9d
	movq	-360128(%rbp), %rcx
	movq	-360136(%rbp), %rax
	movl	-360140(%rbp), %r8d
	movq	-360112(%rbp), %rdx
	movq	-360120(%rbp), %rsi
	subq	$8, %rsp
	pushq	%rdi
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_edges_small
	addq	$16, %rsp
	jmp	.L329
.L328:
	movl	-360184(%rbp), %edi
	movl	-360188(%rbp), %r9d
	movq	-360128(%rbp), %rcx
	movq	-360136(%rbp), %rax
	movl	-360140(%rbp), %r8d
	movq	-360112(%rbp), %rdx
	movq	-360120(%rbp), %rsi
	subq	$8, %rsp
	pushq	%rdi
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_edges
	addq	$16, %rsp
.L329:
	cmpl	$0, -360164(%rbp)
	je	.L330
	movl	-360184(%rbp), %ecx
	movl	-360188(%rbp), %edx
	movq	-360112(%rbp), %rsi
	movq	-360120(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_thin
.L330:
	movl	-360184(%rbp), %ecx
	movl	-360188(%rbp), %edx
	movq	-360136(%rbp), %rax
	movl	-360156(%rbp), %edi
	movq	-360112(%rbp), %rsi
	movl	%edi, %r8d
	movq	%rax, %rdi
	movl	$0, %eax
	call	edge_draw
	jmp	.L321
.L320:
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%edx, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -360120(%rbp)
	movl	-360172(%rbp), %ecx
	leaq	-360128(%rbp), %rax
	movl	$6, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	setup_brightness_lut
	cmpl	$0, -360168(%rbp)
	je	.L331
	movl	-360184(%rbp), %r8d
	movl	-360188(%rbp), %edi
	movq	-360128(%rbp), %rdx
	movq	-360136(%rbp), %rax
	movl	-360144(%rbp), %ecx
	movq	-360120(%rbp), %rsi
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_principle
	movl	-360188(%rbp), %edx
	movl	-360184(%rbp), %eax
	imull	%eax, %edx
	movq	-360136(%rbp), %rcx
	movq	-360120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	int_to_uchar
	jmp	.L338
.L331:
	cmpl	$0, -360152(%rbp)
	je	.L333
	movl	-360184(%rbp), %edi
	movl	-360188(%rbp), %r9d
	movq	-360128(%rbp), %rdx
	movq	-360136(%rbp), %rax
	leaq	-360096(%rbp), %r8
	movl	-360144(%rbp), %ecx
	movq	-360120(%rbp), %rsi
	subq	$8, %rsp
	pushq	%rdi
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_corners_quick
	addq	$16, %rsp
	jmp	.L334
.L333:
	movl	-360184(%rbp), %edi
	movl	-360188(%rbp), %r9d
	movq	-360128(%rbp), %rdx
	movq	-360136(%rbp), %rax
	leaq	-360096(%rbp), %r8
	movl	-360144(%rbp), %ecx
	movq	-360120(%rbp), %rsi
    subq    $56, %rsp
	pushq	%rdi
	movq	%rax, %rdi
	movl	$0, %eax
	call	susan_corners
    addq    $-32, %rsp
.L334:
	movl	-360188(%rbp), %edx
	movq	-360136(%rbp), %rax
	movl	-360156(%rbp), %ecx
	leaq	-360096(%rbp), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	corner_draw
.L338:
	nop
.L321:
	movl	-360184(%rbp), %ecx
	movl	-360188(%rbp), %edx
	movq	-360136(%rbp), %rsi
	movq	-360208(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	put_image
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L336
	call	__stack_chk_fail@PLT
.L336:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC25:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 8
.LC26:
	.long	0
	.long	1079574528
	.align 8
.LC27:
	.long	0
	.long	1073217536
	.align 4
.LC28:
	.long	1097859072
	.align 8
.LC33:
	.long	1717986918
	.long	1072064102
	.align 8
.LC34:
	.long	-858993459
	.long	1072483532
	.align 4
.LC35:
	.long	1232348160
	.align 4
.LC37:
	.long	1056964608
	.align 4
.LC38:
	.long	1073741824
	.align 8
.LC39:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC40:
	.long	0
	.long	1071644672
	.align 4
.LC41:
	.long	1077936128
	.align 4
.LC43:
	.long	1082130432
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

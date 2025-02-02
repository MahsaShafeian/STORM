	.file	"susan.c"
	.text
	.section	.rodata
	.align	8
.LC0:
	.string	"Usage:	susan	<in.pgm>	<out.pgm>	[options]\n"
.LC1:
	.string	"-s	:	Smoothing	mode	(default)"
.LC2:
	.string	"-e	:	Edges	mode"
.LC3:
	.string	"-c	:	Corners	mode\n"
	.align	8
.LC4:
	.string	"See	source	code	for	more	information	about	setting	the	thresholds"
	.align	8
.LC5:
	.string	"-t	<thresh>	:	Brightness	threshold,	all	modes	(default=20)"
	.align	8
.LC6:
	.string	"-d	<thresh>	:	Distance	threshold,	smoothing	mode,	(default=4)	(use	next	option	instead	for	flat	3x3	mask)"
	.align	8
.LC7:
	.string	"-3	:	Use	flat	3x3	mask,	edges	or	smoothing	mode"
	.align	8
.LC8:
	.string	"-n	:	No	post-processing	on	the	binary	edge	map	(runs	much	faster);	edges	mode"
	.align	8
.LC9:
	.string	"-q	:	Use	faster	(and	usually	stabler)	corner	mode;	edge-like	corner	suppression	not	carried	out;	corners	mode"
	.align	8
.LC10:
	.string	"-b	:	Mark	corners/edges	with	single	black	points	instead	of	black	with	white	border;	corners	or	edges	mode"
	.align	8
.LC11:
	.string	"-p	:	Output	initial	enhancement	image	only;	corners	or	edges	mode	(default	is	edges	mode)"
	.align	8
.LC12:
	.string	"\nSUSAN	Version	2l	(C)	1995-1997	Stephen	Smith,	DRA	UK.	steve@fmrib.ox.ac.uk"
	.text
	.globl	usage
	.type	usage,	@function
usage:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$48,	%rsp		#this_line_update!
	leaq	.LC0(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC1(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC2(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC3(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC4(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC5(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC6(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC7(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC8(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC9(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC10(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC11(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC12(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	%edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	usage,	.-usage
	.section	.rodata
.LC13:
	.string	"is"
.LC14:
	.string	"Image	%s	not	binary	PGM.\n"
	.text
	.globl	getint
	.type	getint,	@function
getint:
.LFB7:
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
				subq				$1904,	%rsp
	movq	%rdi,	-36(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movq	-36(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	getc@PLT
	movl	%eax,	-40(%rbp)		#this_line_update!
.L7:
	cmpl	$35,	-40(%rbp)		#this_line_update!
	jne	.L3
	movq	-36(%rbp),	%rdx		#this_line_update!
	leaq	-10056(%rbp),	%rax		#this_line_update!
	movl	$9000,	%esi
	movq	%rax,	%rdi
	call	fgets@PLT
.L3:
	cmpl	$-1,	-40(%rbp)		#this_line_update!
	jne	.L4
	movq	stderr(%rip),	%rax
	leaq	.LC13(%rip),	%rdx
	leaq	.LC14(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L4:
	cmpl	$47,	-40(%rbp)		#this_line_update!
	jle	.L5
	cmpl	$57,	-40(%rbp)		#this_line_update!
	jle	.L15
.L5:
	movq	-36(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	getc@PLT
	movl	%eax,	-40(%rbp)		#this_line_update!
	jmp	.L7
.L15:
	nop
	movl	$0,	-10096(%rbp)		#this_line_update!
.L11:
	movl	-10096(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$2,	%eax
	addl	%edx,	%eax
	addl	%eax,	%eax
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	subl	$48,	%eax
	addl	%edx,	%eax
	movl	%eax,	-10096(%rbp)		#this_line_update!
	movq	-36(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	getc@PLT
	movl	%eax,	-40(%rbp)		#this_line_update!
	cmpl	$-1,	-40(%rbp)		#this_line_update!
	jne	.L8
	movl	-10096(%rbp),	%eax		#this_line_update!
	jmp	.L12
.L8:
	cmpl	$47,	-40(%rbp)		#this_line_update!
	jle	.L10
	cmpl	$57,	-40(%rbp)		#this_line_update!
	jg	.L10
	jmp	.L11
.L10:
	movl	-10096(%rbp),	%eax		#this_line_update!
.L12:
	movq	-8(%rbp),	%rdx
	subq	$48,	%rsp		#this_line_update!
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE7:
	.size	getint,	.-getint
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"Can't	input	image	%s.\n"
	.align	8
.LC17:
	.string	"Image	%s	does	not	have	binary	PGM	header.\n"
.LC18:
	.string	"Image	%s	is	wrong	size.\n"
	.text
	.globl	get_image
	.type	get_image,	@function
get_image:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$176,	%rsp
	movq	%rdi,	-24(%rbp)		#this_line_update!
	movq	%rsi,	-168(%rbp)		#this_line_update!
	movq	%rdx,	-156(%rbp)		#this_line_update!
	movq	%rcx,	-176(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movq	-24(%rbp),	%rax		#this_line_update!
	leaq	.LC15(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	fopen@PLT
	movq	%rax,	-144(%rbp)		#this_line_update!
	cmpq	$0,	-144(%rbp)		#this_line_update!
	jne	.L17
	movq	stderr(%rip),	%rax
	movq	-24(%rbp),	%rdx		#this_line_update!
	leaq	.LC16(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L17:
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	fgetc@PLT
	movb	%al,	-136(%rbp)		#this_line_update!
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	fgetc@PLT
	movb	%al,	-132(%rbp)		#this_line_update!
	movzbl	-136(%rbp),	%eax		#this_line_update!
	cmpb	$80,	%al
	jne	.L18
	movzbl	-132(%rbp),	%eax		#this_line_update!
	cmpb	$53,	%al
	je	.L19
.L18:
	movq	stderr(%rip),	%rax
	movq	-24(%rbp),	%rdx		#this_line_update!
	leaq	.LC17(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L19:
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	getint
	movq	-156(%rbp),	%rdx		#this_line_update!
	movl	%eax,	(%rdx)
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	getint
	movq	-176(%rbp),	%rdx		#this_line_update!
	movl	%eax,	(%rdx)
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	getint
	movl	%eax,	-148(%rbp)		#this_line_update!
	movq	-156(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movq	-176(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	imull	%edx,	%eax
	cltq
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	%rdx
	movq	-168(%rbp),	%rax		#this_line_update!
	movq	%rdx,	(%rax)
	movq	-156(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movq	-176(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	imull	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-168(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	movq	-144(%rbp),	%rcx		#this_line_update!
	movl	$1,	%esi
	movq	%rax,	%rdi
	call	fread@PLT
	testq	%rax,	%rax
	jne	.L20
	movq	stderr(%rip),	%rax
	movq	-24(%rbp),	%rdx		#this_line_update!
	leaq	.LC18(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L20:
	movq	-144(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	fclose@PLT
	nop
	movq	-8(%rbp),	%rax
	subq	$48,	%rsp		#this_line_update!
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE8:
	.size	get_image,	.-get_image
	.section	.rodata
.LC19:
	.string	"w"
.LC20:
	.string	"Can't	output	image%s.\n"
.LC21:
	.string	"P5\n"
.LC22:
	.string	"%d	%d\n"
.LC23:
	.string	"255\n"
.LC24:
	.string	"Can't	write	image	%s.\n"
	.text
	.globl	put_image
	.type	put_image,	@function
put_image:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$48,	%rsp		#this_line_update!
	movq	%rdi,	-44(%rbp)		#this_line_update!
	movq	%rsi,	-20(%rbp)		#this_line_update!
	movl	%edx,	-28(%rbp)		#this_line_update!
	movl	%ecx,	-48(%rbp)		#this_line_update!
	movq	-44(%rbp),	%rax		#this_line_update!
	leaq	.LC19(%rip),	%rdx
	movq	%rdx,	%rsi
	movq	%rax,	%rdi
	call	fopen@PLT
	movq	%rax,	-8(%rbp)
	cmpq	$0,	-8(%rbp)
	jne	.L23
	movq	stderr(%rip),	%rax
	movq	-44(%rbp),	%rdx		#this_line_update!
	leaq	.LC20(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L23:
	movq	-8(%rbp),	%rax
	movq	%rax,	%rcx
	movl	$3,	%edx
	movl	$1,	%esi
	leaq	.LC21(%rip),	%rax
	movq	%rax,	%rdi
	call	fwrite@PLT
	movl	-48(%rbp),	%ecx		#this_line_update!
	movl	-28(%rbp),	%edx		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	.LC22(%rip),	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movq	-8(%rbp),	%rax
	movq	%rax,	%rcx
	movl	$4,	%edx
	movl	$1,	%esi
	leaq	.LC23(%rip),	%rax
	movq	%rax,	%rdi
	call	fwrite@PLT
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-48(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rsi
	movq	-8(%rbp),	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	movq	%rdx,	%rcx
	movl	$1,	%edx
	movq	%rax,	%rdi
	call	fwrite@PLT
	cmpq	$1,	%rax
	je	.L24
	movq	stderr(%rip),	%rax
	movq	-44(%rbp),	%rdx		#this_line_update!
	leaq	.LC24(%rip),	%rcx
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	fprintf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L24:
	movq	-8(%rbp),	%rax
	movq	%rax,	%rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE9:
	.size	put_image,	.-put_image
	.globl	int_to_uchar
	.type	int_to_uchar,	@function
int_to_uchar:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$48,	%rsp		#this_line_update!
	movq	%rdi,	-44(%rbp)		#this_line_update!
	movq	%rsi,	-20(%rbp)		#this_line_update!
	movl	%edx,	-28(%rbp)		#this_line_update!
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	movl	%eax,	-8(%rbp)
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	movl	%eax,	-32(%rbp)		#this_line_update!
	movl	$0,	-12(%rbp)		#this_line_update!
	jmp	.L26
.L29:
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-8(%rbp)
	jge	.L27
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-8(%rbp)
.L27:
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-32(%rbp)		#this_line_update!
	jle	.L28
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-32(%rbp)		#this_line_update!
.L28:
	addl	$1,	-12(%rbp)		#this_line_update!
.L26:
	movl	-12(%rbp),	%eax		#this_line_update!
	cmpl	-28(%rbp),	%eax		#this_line_update!
	jl	.L29
	movl	-32(%rbp),	%eax		#this_line_update!
	subl	%eax,	-8(%rbp)
	movl	$0,	-12(%rbp)		#this_line_update!
	jmp	.L30
.L31:
	movl	-12(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	subl	-32(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	%edx,	%eax
	sall	$8,	%eax
	subl	%edx,	%eax
	cltd
	idivl	-8(%rbp)
	movl	%eax,	%ecx
	movl	-12(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	-20(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	%ecx,	%edx
	movb	%dl,	(%rax)
	addl	$1,	-12(%rbp)		#this_line_update!
.L30:
	movl	-12(%rbp),	%eax		#this_line_update!
	cmpl	-28(%rbp),	%eax		#this_line_update!
	jl	.L31
	nop
				leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE10:
	.size	int_to_uchar,	.-int_to_uchar
	.globl	setup_brightness_lut
	.type	setup_brightness_lut,	@function
setup_brightness_lut:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$48,	%rsp		#this_line_update!
	movq	%rdi,	-48(%rbp)		#this_line_update!
	movl	%esi,	-28(%rbp)		#this_line_update!
	movl	%edx,	-20(%rbp)		#this_line_update!
	movl	$516,	%edi
	call	malloc@PLT
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	%rdx,	(%rax)
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rax
	leaq	258(%rax),	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	%rdx,	(%rax)
	movl	$-256,	-8(%rbp)
	jmp	.L33
.L35:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-8(%rbp),	%xmm0
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-28(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-52(%rbp)		#this_line_update!
	movss	-52(%rbp),	%xmm0		#this_line_update!
	mulss	%xmm0,	%xmm0
	movss	%xmm0,	-52(%rbp)		#this_line_update!
	cmpl	$6,	-20(%rbp)		#this_line_update!
	jne	.L34
	movss	-52(%rbp),	%xmm0		#this_line_update!
	mulss	%xmm0,	%xmm0
	movss	-52(%rbp),	%xmm1		#this_line_update!
	mulss	%xmm1,	%xmm0
	movss	%xmm0,	-52(%rbp)		#this_line_update!
.L34:
	movss	-52(%rbp),	%xmm0		#this_line_update!
	movss	.LC25(%rip),	%xmm1
	xorps	%xmm1,	%xmm0
	pxor	%xmm2,	%xmm2
	cvtss2sd	%xmm0,	%xmm2
	movq	%xmm2,	%rax
	movq	%rax,	%xmm0
	call	exp@PLT
	movsd	.LC26(%rip),	%xmm1
	mulsd	%xmm1,	%xmm0
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	-52(%rbp)		#this_line_update!
	movq	-48(%rbp),	%rax		#this_line_update!
	movq	(%rax),	%rdx
	movl	-8(%rbp),	%eax
	cltq
	addq	%rdx,	%rax
	cvttss2sil	-52(%rbp),	%edx		#this_line_update!
	movb	%dl,	(%rax)
	addl	$1,	-8(%rbp)
.L33:
	cmpl	$256,	-8(%rbp)
	jle	.L35
	nop
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE11:
	.size	setup_brightness_lut,	.-setup_brightness_lut
	.globl	susan_principle
	.type	susan_principle,	@function
susan_principle:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-36(%rbp)		#this_line_update!
	movq	%rsi,	-92(%rbp)		#this_line_update!
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movl	%ecx,	-40(%rbp)		#this_line_update!
	movl	%r8d,	-16(%rbp)		#this_line_update!
	movl	%r9d,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	imull	-104(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	$3,	-96(%rbp)		#this_line_update!
	jmp	.L37
.L41:
	movl	$3,	-68(%rbp)		#this_line_update!
	jmp	.L38
.L40:
	movl	$100,	-64(%rbp)		#this_line_update!
	movl	-96(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-68(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-84(%rbp)		#this_line_update!
	movl	-96(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-68(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-112(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	addq	$2,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rsp		#this_line_update!
	addq	%rax,	-84(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-84(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-84(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-40(%rbp),	%eax		#this_line_update!
	jg	.L39
	movl	-96(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-68(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-92(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-40(%rbp),	%eax		#this_line_update!
	subl	-64(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
.L39:
	addl	$1,	-68(%rbp)		#this_line_update!
.L38:
	movl	-16(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	cmpl	%eax,	-68(%rbp)		#this_line_update!
	jl	.L40
	addl	$1,	-96(%rbp)		#this_line_update!
.L37:
	movl	-104(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	cmpl	%eax,	-96(%rbp)		#this_line_update!
	jl	.L41
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE12:
	.size	susan_principle,	.-susan_principle
	.globl	susan_principle_small
	.type	susan_principle_small,	@function
susan_principle_small:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-92(%rbp)		#this_line_update!
	movq	%rsi,	-60(%rbp)		#this_line_update!
	movq	%rdx,	-28(%rbp)		#this_line_update!
	movl	%ecx,	-20(%rbp)		#this_line_update!
	movl	%r8d,	-32(%rbp)		#this_line_update!
	movl	%r9d,	-40(%rbp)		#this_line_update!
	movl	-32(%rbp),	%eax		#this_line_update!
	imull	-40(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	$730,	-20(%rbp)		#this_line_update!
	movl	$1,	-80(%rbp)		#this_line_update!
	jmp	.L43
.L47:
	movl	$1,	-16(%rbp)		#this_line_update!
	jmp	.L44
.L46:
	movl	$100,	-36(%rbp)		#this_line_update!
	movl	-80(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-32(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-92(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-52(%rbp)		#this_line_update!
	movl	-80(%rbp),	%eax		#this_line_update!
	imull	-32(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-16(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-92(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-28(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-52(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-52(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-52(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movl	-32(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-52(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	addq	$2,	-52(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movl	-32(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rsp		#this_line_update!
	addq	%rax,	-52(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-52(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-52(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movq	-52(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-36(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cmpl	-20(%rbp),	%eax		#this_line_update!
	jg	.L45
	movl	-80(%rbp),	%eax		#this_line_update!
	imull	-32(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-16(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-20(%rbp),	%eax		#this_line_update!
	subl	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
.L45:
	addl	$1,	-16(%rbp)		#this_line_update!
.L44:
	movl	-32(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	cmpl	%eax,	-16(%rbp)		#this_line_update!
	jl	.L46
	addl	$1,	-80(%rbp)		#this_line_update!
.L43:
	movl	-40(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	cmpl	%eax,	-80(%rbp)		#this_line_update!
	jl	.L47
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE13:
	.size	susan_principle_small,	.-susan_principle_small
	.globl	median
	.type	median,	@function
median:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-52(%rbp)		#this_line_update!
	movl	%esi,	-36(%rbp)		#this_line_update!
	movl	%edx,	-32(%rbp)		#this_line_update!
	movl	%ecx,	-28(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movl	-36(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-104(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-40(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-68(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-108(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-80(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	$0,	-112(%rbp)		#this_line_update!
	jmp	.L49
.L53:
	movl	$0,	-16(%rbp)		#this_line_update!
	jmp	.L50
.L52:
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	movl	-104(%rbp),	%edx		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	cltq
	movl	-104(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	%edx
	jle	.L51
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	movl	-104(%rbp),	%eax		#this_line_update!
	movl	%eax,	-72(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	cltq
	movl	-104(%rbp),	%edx		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	movl	%edx,	-104(%rbp),		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	cltq
	movl	-72(%rbp),	%edx		#this_line_update!
	movl	%edx,	-104(%rbp),		#this_line_update!
.L51:
	addl	$1,	-16(%rbp)		#this_line_update!
.L50:
	movl	$7,	%eax
	subl	-112(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-16(%rbp)		#this_line_update!
	jl	.L52
	addl	$1,	-112(%rbp)		#this_line_update!
.L49:
	cmpl	$6,	-112(%rbp)		#this_line_update!
	jle	.L53
	movl	-68(%rbp),	%edx		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movl	%eax,	%edx
	shrl	$31,	%edx
	addl	%edx,	%eax
	sarl	%eax
	movq	-8(%rbp),	%rdx
	subq	$2,	%rsp		#this_line_update!
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE14:
	.size	median,	.-median
	.globl	enlarge
	.type	enlarge,	@function
enlarge:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	subq	$112,	%rsp		#this_line_update!
	movq	%rdi,	-32(%rbp)		#this_line_update!
	movq	%rsi,	-108(%rbp)		#this_line_update!
	movq	%rdx,	-92(%rbp)		#this_line_update!
	movq	%rcx,	-60(%rbp)		#this_line_update!
	movl	%r8d,	-96(%rbp)		#this_line_update!
	movl	$0,	-8(%rbp)
	jmp	.L57
.L58:
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	cltq
	movq	-32(%rbp),	%rdx		#this_line_update!
	movq	(%rdx),	%rcx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edx
	imull	-8(%rbp),	%edx
	movslq	%edx,	%rdx
	leaq	(%rcx,%rdx),	%rsi
	movl	-8(%rbp),	%ecx
	movl	-96(%rbp),	%edx		#this_line_update!
	addl	%edx,	%ecx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edi
	movl	-96(%rbp),	%edx		#this_line_update!
	addl	%edx,	%edx
	addl	%edi,	%edx
	imull	%ecx,	%edx
	movslq	%edx,	%rcx
	movl	-96(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	%rdx,	%rcx
	movq	-108(%rbp),	%rdx		#this_line_update!
	addq	%rdx,	%rcx
	movq	%rax,	%rdx
	movq	%rcx,	%rdi
	call	memcpy@PLT
	addl	$1,	-8(%rbp)
.L57:
	movq	-60(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	cmpl	%eax,	-8(%rbp)
	jl	.L58
	movl	$0,	-8(%rbp)
	jmp	.L59
.L60:
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	cltq
	movq	-32(%rbp),	%rdx		#this_line_update!
	movq	(%rdx),	%rcx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edx
	imull	-8(%rbp),	%edx
	movslq	%edx,	%rdx
	leaq	(%rcx,%rdx),	%rsi
	movl	-96(%rbp),	%edx		#this_line_update!
	subl	$1,	%edx
	movl	%edx,	%ecx
	subl	-8(%rbp),	%ecx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edi
	movl	-96(%rbp),	%edx		#this_line_update!
	addl	%edx,	%edx
	addl	%edi,	%edx
	imull	%ecx,	%edx
	movslq	%edx,	%rcx
	movl	-96(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	%rdx,	%rcx
	movq	-108(%rbp),	%rdx		#this_line_update!
	addq	%rdx,	%rcx
	movq	%rax,	%rdx
	movq	%rcx,	%rdi
	call	memcpy@PLT
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	cltq
	movq	-32(%rbp),	%rdx		#this_line_update!
	movq	(%rdx),	%rsi
	movq	-60(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edx
	subl	-8(%rbp),	%edx
	leal	-1(%rdx),	%ecx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edx
	imull	%ecx,	%edx
	movslq	%edx,	%rdx
	addq	%rdx,	%rsi
	movq	-60(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%ecx
	movl	-96(%rbp),	%edx		#this_line_update!
	addl	%edx,	%ecx
	movl	-8(%rbp),	%edx
	addl	%edx,	%ecx
	movq	-92(%rbp),	%rdx		#this_line_update!
	movl	(%rdx),	%edi
	movl	-96(%rbp),	%edx		#this_line_update!
	addl	%edx,	%edx
	addl	%edi,	%edx
	imull	%ecx,	%edx
	movslq	%edx,	%rcx
	movl	-96(%rbp),	%edx		#this_line_update!
	movslq	%edx,	%rdx
	addq	%rdx,	%rcx
	movq	-108(%rbp),	%rdx		#this_line_update!
	addq	%rdx,	%rcx
	movq	%rax,	%rdx
	movq	%rcx,	%rdi
	call	memcpy@PLT
	addl	$1,	-8(%rbp)
.L59:
	movl	-8(%rbp),	%eax
	cmpl	-96(%rbp),	%eax		#this_line_update!
	jl	.L60
	movl	$0,	-8(%rbp)
	jmp	.L61
.L64:
	movl	$0,	-76(%rbp)		#this_line_update!
	jmp	.L62
.L63:
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	imull	-76(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-8(%rbp),	%eax
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	(%rdx,%rax),	%rcx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	imull	-76(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	$1,	%eax
	subl	-8(%rbp),	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movzbl	(%rcx),	%eax
	movb	%al,	(%rdx)
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	imull	-76(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	$1,	%eax
	subl	-8(%rbp),	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	(%rdx,%rax),	%rcx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	imull	-76(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%eax
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-8(%rbp),	%eax
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movzbl	(%rcx),	%eax
	movb	%al,	(%rdx)
	addl	$1,	-76(%rbp)		#this_line_update!
.L62:
	movq	-60(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	cmpl	%eax,	-76(%rbp)		#this_line_update!
	jl	.L63
	addl	$1,	-8(%rbp)
.L61:
	movl	-8(%rbp),	%eax
	cmpl	-96(%rbp),	%eax		#this_line_update!
	jl	.L64
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	%edx
	movq	-92(%rbp),	%rax		#this_line_update!
	movl	%edx,	(%rax)
	movq	-60(%rbp),	%rax		#this_line_update!
	movl	(%rax),	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	%edx
	movq	-60(%rbp),	%rax		#this_line_update!
	movl	%edx,	(%rax)
	movq	-32(%rbp),	%rax		#this_line_update!
	movq	-108(%rbp),	%rdx		#this_line_update!
	movq	%rdx,	(%rax)
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE15:
	.size	enlarge,	.-enlarge
	.section	.rodata
	.align	8
.LC29:
	.string	"Distance_thresh	(%f)	too	big	for	integer	arithmetic.\n"
	.align	8
.LC30:
	.string	"Either	reduce	it	to	<=15	or	recompile	with	variable	\"total\""
	.align	8
.LC31:
	.string	"as	a	float:	see	top	\"defines\"	section."
	.align	8
.LC32:
	.string	"Mask	size	(1.5*distance_thresh+1=%d)	too	big	for	image	(%dx%d).\n"
	.text
	.globl	susan_smoothing
	.type	susan_smoothing,	@function
susan_smoothing:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	pushq	%rbx
				subq				$176,	%rsp
	.cfi_offset	3,	-24
	movl	%edi,	-148(%rbp)		#this_line_update!
	movq	%rsi,	-16(%rbp)		#this_line_update!
	movl	%edx,	-128(%rbp)		#this_line_update!
	movl	%ecx,	-104(%rbp)		#this_line_update!
	movq	%r8,	-52(%rbp)		#this_line_update!
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	-36(%rbp)		#this_line_update!
	movq	-16(%rbp),	%rax		#this_line_update!
	movq	%rax,	-156(%rbp)		#this_line_update!
	cmpl	$0,	-148(%rbp)		#this_line_update!
	jne	.L66
	pxor	%xmm1,	%xmm1
	cvtss2sd	-36(%rbp),	%xmm1		#this_line_update!
	movsd	.LC27(%rip),	%xmm0
	mulsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	addl	$1,	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	jmp	.L67
.L66:
	movl	$1,	-60(%rbp)		#this_line_update!
.L67:
	movl	$0,	-32(%rbp)		#this_line_update!
	movss	-36(%rbp),	%xmm0		#this_line_update!
	comiss	.LC28(%rip),	%xmm0
	jbe	.L68
	cmpl	$0,	-32(%rbp)		#this_line_update!
	jne	.L68
	pxor	%xmm2,	%xmm2
	cvtss2sd	-36(%rbp),	%xmm2		#this_line_update!
	movq	%xmm2,	%rax
	movq	%rax,	%xmm0
	leaq	.LC29(%rip),	%rax
	movq	%rax,	%rdi
	movl	$1,	%eax
	call	printf@PLT
	leaq	.LC30(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	leaq	.LC31(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	%edi
	call	exit@PLT
.L68:
	movl	-60(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-128(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	%edx
	jge	.L70
	movl	-60(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-104(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	%edx
	jl	.L71
.L70:
	movl	-104(%rbp),	%ecx		#this_line_update!
	movl	-128(%rbp),	%edx		#this_line_update!
	movl	-60(%rbp),	%eax		#this_line_update!
	movl	%eax,	%esi
	leaq	.LC32(%rip),	%rax
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	printf@PLT
	movl	$0,	%edi
	call	exit@PLT
.L71:
	movl	-60(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-128(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-60(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%ecx
	movl	-104(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	imull	%edx,	%eax
	cltq
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-72(%rbp)		#this_line_update!
	movl	-60(%rbp),	%edi		#this_line_update!
	leaq	-104(%rbp),	%rcx		#this_line_update!
	leaq	-128(%rbp),	%rdx		#this_line_update!
	movq	-72(%rbp),	%rsi		#this_line_update!
	leaq	-16(%rbp),	%rax		#this_line_update!
	movl	%edi,	%r8d
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	enlarge
	cmpl	$0,	-148(%rbp)		#this_line_update!
	jne	.L72
	movl	-60(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	$1,	%eax
	movl	%eax,	-84(%rbp)		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	subl	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	-44(%rbp)		#this_line_update!
	movl	-84(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	cltq
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-176(%rbp)		#this_line_update!
	movq	-176(%rbp),	%rax		#this_line_update!
	movq	%rax,	-96(%rbp)		#this_line_update!
	movss	-36(%rbp),	%xmm0		#this_line_update!
	mulss	%xmm0,	%xmm0
	movss	.LC25(%rip),	%xmm1
	xorps	%xmm1,	%xmm0
	movss	%xmm0,	-100(%rbp)		#this_line_update!
	movl	-60(%rbp),	%eax		#this_line_update!
	negl	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	jmp	.L73
.L76:
	movl	-60(%rbp),	%eax		#this_line_update!
	negl	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	jmp	.L74
.L75:
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	%edx
	movl	-20(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	addl	%edx,	%eax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%eax,	%xmm0
	divss	-100(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm3,	%xmm3
	cvtss2sd	%xmm0,	%xmm3
	movq	%xmm3,	%rax
	movq	%rax,	%xmm0
	call	exp@PLT
	movsd	.LC26(%rip),	%xmm1
	mulsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	movl	%eax,	-80(%rbp)		#this_line_update!
	movq	-96(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-96(%rbp)		#this_line_update!
	movl	-80(%rbp),	%edx		#this_line_update!
	movb	%dl,	(%rax)
	addl	$1,	-20(%rbp)		#this_line_update!
.L74:
	movl	-20(%rbp),	%eax		#this_line_update!
	cmpl	-60(%rbp),	%eax		#this_line_update!
	jle	.L75
	addl	$1,	-88(%rbp)		#this_line_update!
.L73:
	movl	-88(%rbp),	%eax		#this_line_update!
	cmpl	-60(%rbp),	%eax		#this_line_update!
	jle	.L76
	movl	-60(%rbp),	%eax		#this_line_update!
	movl	%eax,	-88(%rbp)		#this_line_update!
	jmp	.L77
.L86:
	movl	-60(%rbp),	%eax		#this_line_update!
	movl	%eax,	-20(%rbp)		#this_line_update!
	jmp	.L78
.L85:
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	$0,	-32(%rbp)		#this_line_update!
	movq	-176(%rbp),	%rax		#this_line_update!
	movq	%rax,	-96(%rbp)		#this_line_update!
	movq	-16(%rbp),	%rcx		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	-60(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-128(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	movslq	%eax,	%rdx
	movl	-20(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rax,	%rdx
	movl	-60(%rbp),	%eax		#this_line_update!
	cltq
	subq	%rax,	%rdx
	leaq	(%rcx,%rdx),	%rax
	movq	%rax,	-112(%rbp)		#this_line_update!
	movq	-16(%rbp),	%rdx		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	imull	-88(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-20(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-24(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-124(%rbp)		#this_line_update!
	movl	-60(%rbp),	%eax		#this_line_update!
	negl	%eax
	movl	%eax,	-28(%rbp)		#this_line_update!
	jmp	.L79
.L82:
	movl	-60(%rbp),	%eax		#this_line_update!
	negl	%eax
	movl	%eax,	-80(%rbp)		#this_line_update!
	jmp	.L80
.L81:
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movq	-96(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-96(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rcx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	imull	%edx,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	addl	$1,	-80(%rbp)		#this_line_update!
.L80:
	movl	-80(%rbp),	%eax		#this_line_update!
	cmpl	-60(%rbp),	%eax		#this_line_update!
	jle	.L81
	movl	-44(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rax,	-112(%rbp)		#this_line_update!
	addl	$1,	-28(%rbp)		#this_line_update!
.L79:
	movl	-28(%rbp),	%eax		#this_line_update!
	cmpl	-60(%rbp),	%eax		#this_line_update!
	jle	.L82
	movl	-56(%rbp),	%eax		#this_line_update!
	subl	$10000,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	cmpl	$0,	-76(%rbp)		#this_line_update!
	jne	.L83
	movl	-128(%rbp),	%ecx		#this_line_update!
	movq	-16(%rbp),	%rax		#this_line_update!
	movq	-156(%rbp),	%rbx		#this_line_update!
	leaq	1(%rbx),	%rdx
	movq	%rdx,	-156(%rbp)		#this_line_update!
	movl	-20(%rbp),	%edx		#this_line_update!
	movl	-88(%rbp),	%esi		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	median
	movb	%al,	(%rbx)
	jmp	.L84
.L83:
	movl	-24(%rbp),	%eax		#this_line_update!
	imull	$-10000,	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltd
	idivl	-80(%rbp)
	movl	%eax,	%ecx
	movq	-156(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-156(%rbp)		#this_line_update!
	movl	%ecx,	%edx
	movb	%dl,	(%rax)
.L84:
	addl	$1,	-20(%rbp)		#this_line_update!
.L78:
	movl	-128(%rbp),	%eax		#this_line_update!
	subl	-60(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-20(%rbp)		#this_line_update!
	jl	.L85
	addl	$1,	-88(%rbp)		#this_line_update!
.L77:
	movl	-104(%rbp),	%eax		#this_line_update!
	subl	-60(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-88(%rbp)		#this_line_update!
	jl	.L86
	jmp	.L95
.L72:
	movl	$1,	-88(%rbp)		#this_line_update!
	jmp	.L88
.L93:
	movl	$1,	-20(%rbp)		#this_line_update!
	jmp	.L89
.L92:
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	$0,	-32(%rbp)		#this_line_update!
	movq	-16(%rbp),	%rcx		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	leal	-1(%rax),	%edx
	movl	-128(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	movslq	%eax,	%rdx
	movl	-20(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	subq	$1,	%rax
	addq	%rcx,	%rax
	movq	%rax,	-112(%rbp)		#this_line_update!
	movq	-16(%rbp),	%rdx		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	imull	-88(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-20(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-24(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-124(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-112(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rsp		#this_line_update!
	addq	%rax,	-112(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movq	-112(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-132(%rbp),	%eax		#this_line_update!
	cltq
	negq	%rax
	movq	%rax,	%rdx
	movq	-124(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	addl	%eax,	-56(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	-32(%rbp)		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	subl	$100,	%eax
	movl	%eax,	-76(%rbp)		#this_line_update!
	cmpl	$0,	-76(%rbp)		#this_line_update!
	jne	.L90
	movl	-128(%rbp),	%ecx		#this_line_update!
	movq	-16(%rbp),	%rax		#this_line_update!
	movq	-156(%rbp),	%rbx		#this_line_update!
	leaq	1(%rbx),	%rdx
	movq	%rdx,	-156(%rbp)		#this_line_update!
	movl	-20(%rbp),	%edx		#this_line_update!
	movl	-88(%rbp),	%esi		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	median
	movb	%al,	(%rbx)
	jmp	.L91
.L90:
	movl	-24(%rbp),	%eax		#this_line_update!
	imull	$-100,	%eax,	%edx
	movl	-32(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltd
	idivl	-80(%rbp)
	movl	%eax,	%ecx
	movq	-156(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-156(%rbp)		#this_line_update!
	movl	%ecx,	%edx
	movb	%dl,	(%rax)
.L91:
	addl	$1,	-20(%rbp)		#this_line_update!
.L89:
	movl	-128(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	cmpl	%eax,	-20(%rbp)		#this_line_update!
	jl	.L92
	addl	$1,	-88(%rbp)		#this_line_update!
.L88:
	movl	-104(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	cmpl	%eax,	-88(%rbp)		#this_line_update!
	jl	.L93
.L95:
	nop
	movq	-8(%rbp),	%rbx
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE16:
	.size	susan_smoothing,	.-susan_smoothing
	.globl	edge_draw
	.type	edge_draw,	@function
edge_draw:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-52(%rbp)		#this_line_update!
	movq	%rsi,	-108(%rbp)		#this_line_update!
	movl	%edx,	-56(%rbp)		#this_line_update!
	movl	%ecx,	-24(%rbp)		#this_line_update!
	movl	%r8d,	-12(%rbp)		#this_line_update!
	cmpl	$0,	-12(%rbp)		#this_line_update!
	jne	.L97
	movq	-108(%rbp),	%rax		#this_line_update!
	movq	%rax,	-92(%rbp)		#this_line_update!
	movl	$0,	-72(%rbp)		#this_line_update!
	jmp	.L98
.L100:
	movq	-92(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L99
	movq	-92(%rbp),	%rax		#this_line_update!
	subq	-108(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rcx
	movl	-56(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rcx,	%rax
	subq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
	movl	-56(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	addq	$1,	%rax
	movq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
	movl	-56(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
.L99:
	addq	$1,	-92(%rbp)		#this_line_update!
	addl	$1,	-72(%rbp)		#this_line_update!
.L98:
	movl	-56(%rbp),	%eax		#this_line_update!
	imull	-24(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-72(%rbp)		#this_line_update!
	jl	.L100
.L97:
	movq	-108(%rbp),	%rax		#this_line_update!
	movq	%rax,	-92(%rbp)		#this_line_update!
	movl	$0,	-72(%rbp)		#this_line_update!
	jmp	.L101
.L103:
	movq	-92(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L102
	movq	-92(%rbp),	%rax		#this_line_update!
	subq	$2,	%rsp		#this_line_update!
	movq	%rax,	%rdx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$0,	(%rax)
.L102:
	addq	$1,	-92(%rbp)		#this_line_update!
	addl	$1,	-72(%rbp)		#this_line_update!
.L101:
	movl	-56(%rbp),	%eax		#this_line_update!
	imull	-24(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-72(%rbp)		#this_line_update!
	jl	.L103
	nop
				leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE17:
	.size	edge_draw,	.-edge_draw
	.globl	susan_thin
	.type	susan_thin,	@function
susan_thin:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$176,	%rsp
	movq	%rdi,	-80(%rbp)		#this_line_update!
	movq	%rsi,	-108(%rbp)		#this_line_update!
	movl	%edx,	-152(%rbp)		#this_line_update!
	movl	%ecx,	-32(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movl	$4,	-172(%rbp)		#this_line_update!
	jmp	.L105
.L139:
	movl	$4,	-40(%rbp)		#this_line_update!
	jmp	.L106
.L138:
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L107
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-36(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-40(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-48(%rbp)		#this_line_update!
	movq	-48(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%edx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	$1,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	addl	%eax,	%edx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	$2,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movl	-152(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%edx
	movl	-152(%rbp),	%eax		#this_line_update!
	cltq
	leaq	2(%rax),	%rcx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	addl	%eax,	%edx
	movl	-152(%rbp),	%eax		#this_line_update!
	cltq
	leaq	(%rax,%rax),	%rcx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	addl	%eax,	%edx
	movl	-152(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rax,	%rax
	leaq	1(%rax),	%rcx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	addl	%eax,	%edx
	movl	-152(%rbp),	%eax		#this_line_update!
	cltq
	addq	$1,	%rax
	leaq	(%rax,%rax),	%rcx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	addl	%edx,	%eax
	movl	%eax,	-68(%rbp)		#this_line_update!
	cmpl	$0,	-68(%rbp)		#this_line_update!
	jne	.L108
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$100,	(%rax)
.L108:
	cmpl	$1,	-68(%rbp)		#this_line_update!
	jne	.L109
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$5,	%al
	ja	.L109
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	$0,	-116(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L110
	movl	$0,	-88(%rbp)		#this_line_update!
	movl	$0,	-24(%rbp)		#this_line_update!
	movl	$0,	-100(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-52(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	movl	-144(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	movl	-56(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	movl	-20(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	jmp	.L111
.L110:
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L112
	movl	$0,	-24(%rbp)		#this_line_update!
	movl	$0,	-88(%rbp)		#this_line_update!
	movl	$0,	-12(%rbp)		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	-144(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	movl	-52(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	movl	-20(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	jmp	.L111
.L112:
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L113
	movl	$0,	-12(%rbp)		#this_line_update!
	movl	$0,	-24(%rbp)		#this_line_update!
	movl	$0,	-144(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	movl	-20(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	movl	-100(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	-56(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	movl	-52(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	jmp	.L111
.L113:
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L114
	movl	$0,	-100(%rbp)		#this_line_update!
	movl	$0,	-88(%rbp)		#this_line_update!
	movl	$0,	-52(%rbp)		#this_line_update!
	movl	-24(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-20(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	movl	-144(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	jmp	.L111
.L114:
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L115
	movl	$0,	-144(%rbp)		#this_line_update!
	movl	$0,	-12(%rbp)		#this_line_update!
	movl	$0,	-20(%rbp)		#this_line_update!
	movl	-24(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-56(%rbp)		#this_line_update!
	movl	-88(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	movl	-52(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	jmp	.L111
.L115:
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L116
	movl	$0,	-52(%rbp)		#this_line_update!
	movl	$0,	-100(%rbp)		#this_line_update!
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	movl	-20(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-20(%rbp)		#this_line_update!
	movl	-24(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-144(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	jmp	.L111
.L116:
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L117
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	$0,	-52(%rbp)		#this_line_update!
	movl	$0,	-20(%rbp)		#this_line_update!
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	-144(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-144(%rbp)		#this_line_update!
	movl	-88(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-24(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	jmp	.L111
.L117:
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L111
	movl	$0,	-20(%rbp)		#this_line_update!
	movl	$0,	-144(%rbp)		#this_line_update!
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	-52(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-52(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	movl	%eax,	-12(%rbp)		#this_line_update!
	movl	-24(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-24(%rbp)		#this_line_update!
	movl	-100(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	movl	%eax,	-100(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	movl	%eax,	-88(%rbp)		#this_line_update!
.L111:
	movl	$0,	-160(%rbp)		#this_line_update!
	movl	$0,	-120(%rbp)		#this_line_update!
	jmp	.L118
.L122:
	movl	$0,	-112(%rbp)		#this_line_update!
	jmp	.L119
.L121:
	movl	-120(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	movl	-88(%rbp),	%eax		#this_line_update!
	cmpl	%eax,	-160(%rbp)		#this_line_update!
	jge	.L120
	movl	-120(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	movl	-88(%rbp),	%eax		#this_line_update!
	movl	%eax,	-160(%rbp)		#this_line_update!
	movl	-120(%rbp),	%eax		#this_line_update!
	movl	%eax,	-92(%rbp)		#this_line_update!
	movl	-112(%rbp),	%eax		#this_line_update!
	movl	%eax,	-176(%rbp)		#this_line_update!
.L120:
	addl	$1,	-112(%rbp)		#this_line_update!
.L119:
	cmpl	$2,	-112(%rbp)		#this_line_update!
	jle	.L121
	addl	$1,	-120(%rbp)		#this_line_update!
.L118:
	cmpl	$2,	-120(%rbp)		#this_line_update!
	jle	.L122
	cmpl	$0,	-160(%rbp)		#this_line_update!
	jle	.L109
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$3,	%al
	ja	.L123
	movl	-172(%rbp),	%edx		#this_line_update!
	movl	-92(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-176(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$4,	(%rax)
	jmp	.L124
.L123:
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%edx
	movl	-172(%rbp),	%ecx		#this_line_update!
	movl	-92(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movl	-176(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	addl	$1,	%edx
	movb	%dl,	(%rax)
.L124:
	movl	-92(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-176(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cmpl	$2,	%eax
	jg	.L109
	movl	-92(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	addl	%eax,	-172(%rbp)		#this_line_update!
	movl	-176(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	cmpl	$3,	-172(%rbp)		#this_line_update!
	jg	.L125
	movl	$4,	-172(%rbp)		#this_line_update!
.L125:
	cmpl	$3,	-40(%rbp)		#this_line_update!
	jg	.L109
	movl	$4,	-40(%rbp)		#this_line_update!
.L109:
	cmpl	$2,	-68(%rbp)		#this_line_update!
	jne	.L126
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-124(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-136(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-140(%rbp)		#this_line_update!
	movl	-124(%rbp),	%edx		#this_line_update!
	movl	-136(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-60(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-140(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cmpl	$2,	%eax
	jne	.L127
	movl	-124(%rbp),	%eax		#this_line_update!
	orl	-140(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-136(%rbp),	%eax		#this_line_update!
	orl	-60(%rbp),	%eax		#this_line_update!
	andl	%edx,	%eax
	testl	%eax,	%eax
	je	.L127
	cmpl	$0,	-124(%rbp)		#this_line_update!
	je	.L128
	cmpl	$0,	-136(%rbp)		#this_line_update!
	je	.L129
	movl	$0,	-112(%rbp)		#this_line_update!
	movl	$-1,	-120(%rbp)		#this_line_update!
	jmp	.L130
.L129:
	movl	$-1,	-112(%rbp)		#this_line_update!
	movl	$0,	-120(%rbp)		#this_line_update!
	jmp	.L130
.L128:
	cmpl	$0,	-136(%rbp)		#this_line_update!
	je	.L131
	movl	$1,	-112(%rbp)		#this_line_update!
	movl	$0,	-120(%rbp)		#this_line_update!
	jmp	.L130
.L131:
	movl	$0,	-112(%rbp)		#this_line_update!
	movl	$1,	-120(%rbp)		#this_line_update!
.L130:
	movl	-172(%rbp),	%edx		#this_line_update!
	movl	-120(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-80(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%eax,	%xmm0
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-36(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	comisd	.LC33(%rip),	%xmm0
	jbe	.L142
	cmpl	$0,	-112(%rbp)		#this_line_update!
	jne	.L134
	movl	-120(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	jbe	.L134
	movl	-120(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	jbe	.L134
	movl	-120(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	ja	.L135
.L134:
	cmpl	$0,	-120(%rbp)		#this_line_update!
	jne	.L142
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	jbe	.L142
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	jbe	.L142
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	jbe	.L142
.L135:
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$100,	(%rax)
	movl	-172(%rbp),	%edx		#this_line_update!
	movl	-120(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$3,	(%rax)
	jmp	.L142
.L127:
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-96(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-156(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-168(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-164(%rbp)		#this_line_update!
	movl	-96(%rbp),	%edx		#this_line_update!
	movl	-156(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-168(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-164(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cmpl	$2,	%eax
	jne	.L126
	movl	-164(%rbp),	%eax		#this_line_update!
	orl	-156(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	orl	-168(%rbp),	%eax		#this_line_update!
	andl	%edx,	%eax
	testl	%eax,	%eax
	je	.L126
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%cl
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	orl	%ecx,	%eax
	movzbl	%al,	%eax
	andl	-96(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%sil
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	orl	%esi,	%eax
	movzbl	%al,	%eax
	andl	-164(%rbp),	%eax		#this_line_update!
	movl	%edx,	%ecx
	orl	%eax,	%ecx
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%sil
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	orl	%esi,	%eax
	movzbl	%al,	%eax
	andl	-156(%rbp),	%eax		#this_line_update!
	orl	%eax,	%ecx
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%sil
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	orl	%esi,	%eax
	movzbl	%al,	%eax
	andl	-168(%rbp),	%eax		#this_line_update!
	orl	%ecx,	%eax
	testl	%eax,	%eax
	je	.L126
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$100,	(%rax)
	subl	$1,	-172(%rbp)		#this_line_update!
	subl	$2,	-40(%rbp)		#this_line_update!
	cmpl	$3,	-172(%rbp)		#this_line_update!
	jg	.L136
	movl	$4,	-172(%rbp)		#this_line_update!
.L136:
	cmpl	$3,	-40(%rbp)		#this_line_update!
	jg	.L126
	movl	$4,	-40(%rbp)		#this_line_update!
	jmp	.L126
.L142:
	nop
.L126:
	cmpl	$2,	-68(%rbp)		#this_line_update!
	jle	.L107
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-96(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-156(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-168(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-164(%rbp)		#this_line_update!
	movl	-96(%rbp),	%edx		#this_line_update!
	movl	-156(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-168(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-164(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cmpl	$1,	%eax
	jle	.L107
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-124(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-136(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	cmpb	$7,	%al
	setbe	%al
	movzbl	%al,	%eax
	movl	%eax,	-140(%rbp)		#this_line_update!
	movl	-124(%rbp),	%eax		#this_line_update!
	orl	-96(%rbp),	%eax		#this_line_update!
	movl	%eax,	-148(%rbp)		#this_line_update!
	movl	-136(%rbp),	%eax		#this_line_update!
	orl	-156(%rbp),	%eax		#this_line_update!
	movl	%eax,	-128(%rbp)		#this_line_update!
	movl	-140(%rbp),	%eax		#this_line_update!
	orl	-168(%rbp),	%eax		#this_line_update!
	movl	%eax,	-132(%rbp)		#this_line_update!
	movl	-60(%rbp),	%eax		#this_line_update!
	orl	-164(%rbp),	%eax		#this_line_update!
	movl	%eax,	-84(%rbp)		#this_line_update!
	movl	-148(%rbp),	%edx		#this_line_update!
	movl	-128(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-84(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	andl	-128(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-156(%rbp),	%eax		#this_line_update!
	andl	-132(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movl	-168(%rbp),	%eax		#this_line_update!
	andl	-84(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movl	-164(%rbp),	%eax		#this_line_update!
	andl	-148(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	cmpl	$1,	%eax
	jg	.L107
	movl	-172(%rbp),	%eax		#this_line_update!
	imull	-152(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-40(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$100,	(%rax)
	subl	$1,	-172(%rbp)		#this_line_update!
	subl	$2,	-40(%rbp)		#this_line_update!
	cmpl	$3,	-172(%rbp)		#this_line_update!
	jg	.L137
	movl	$4,	-172(%rbp)		#this_line_update!
.L137:
	cmpl	$3,	-40(%rbp)		#this_line_update!
	jg	.L107
	movl	$4,	-40(%rbp)		#this_line_update!
.L107:
	addl	$1,	-40(%rbp)		#this_line_update!
.L106:
	movl	-152(%rbp),	%eax		#this_line_update!
	subl	$4,	%eax
	cmpl	%eax,	-40(%rbp)		#this_line_update!
	jl	.L138
	addl	$1,	-172(%rbp)		#this_line_update!
.L105:
	movl	-32(%rbp),	%eax		#this_line_update!
	subl	$4,	%eax
	cmpl	%eax,	-172(%rbp)		#this_line_update!
	jl	.L139
	nop
	movq	-8(%rbp),	%rdx
	subq	$2,	%rsp		#this_line_update!
	je	.L140
	call	__stack_chk_fail@PLT
.L140:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE18:
	.size	susan_thin,	.-susan_thin
	.globl	susan_edges
	.type	susan_edges,	@function
susan_edges:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-72(%rbp)		#this_line_update!
	movq	%rsi,	-56(%rbp)		#this_line_update!
	movq	%rdx,	-36(%rbp)		#this_line_update!
	movq	%rcx,	-112(%rbp)		#this_line_update!
	movl	%r8d,	-92(%rbp)		#this_line_update!
	movl	%r9d,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	$3,	-12(%rbp)		#this_line_update!
	jmp	.L144
.L148:
	movl	$3,	-100(%rbp)		#this_line_update!
	jmp	.L145
.L147:
	movl	$100,	-40(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-100(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-72(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-72(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-112(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-84(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-40(%rbp)		#this_line_update!
	movl	-40(%rbp),	%eax		#this_line_update!
	cmpl	-92(%rbp),	%eax		#this_line_update!
	jg	.L146
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-92(%rbp),	%eax		#this_line_update!
	subl	-40(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
.L146:
	addl	$1,	-100(%rbp)		#this_line_update!
.L145:
	movl	-16(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	cmpl	%eax,	-100(%rbp)		#this_line_update!
	jl	.L147
	addl	$1,	-12(%rbp)		#this_line_update!
.L144:
	movl	16(%rbp),	%eax
	subl	$3,	%eax
	cmpl	%eax,	-12(%rbp)		#this_line_update!
	jl	.L148
	movl	$4,	-12(%rbp)		#this_line_update!
	jmp	.L149
.L176:
	movl	$4,	-100(%rbp)		#this_line_update!
	jmp	.L150
.L175:
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	testl	%eax,	%eax
	jle	.L151
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-44(%rbp)		#this_line_update!
	movl	-92(%rbp),	%eax		#this_line_update!
	subl	-44(%rbp),	%eax		#this_line_update!
	movl	%eax,	-40(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-72(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-112(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-84(%rbp)		#this_line_update!
	cmpl	$600,	-40(%rbp)		#this_line_update!
	jle	.L152
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-100(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-72(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	$0,	-76(%rbp)		#this_line_update!
	movl	$0,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	%edx
	movl	-60(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	addl	%edx,	%eax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%eax,	%xmm0
	pxor	%xmm3,	%xmm3
	cvtss2sd	%xmm0,	%xmm3
	movq	%xmm3,	%rax
	movq	%rax,	%xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
	pxor	%xmm0,	%xmm0
	cvtss2sd	-88(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-40(%rbp),	%xmm1		#this_line_update!
	pxor	%xmm2,	%xmm2
	cvtss2sd	%xmm1,	%xmm2
	movsd	.LC34(%rip),	%xmm1
	mulsd	%xmm2,	%xmm1
	comisd	%xmm1,	%xmm0
	jbe	.L183
	movl	$0,	-20(%rbp)		#this_line_update!
	cmpl	$0,	-76(%rbp)		#this_line_update!
	jne	.L155
	movss	.LC35(%rip),	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
	jmp	.L156
.L155:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-60(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-76(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
.L156:
	pxor	%xmm0,	%xmm0
	comiss	-88(%rbp),	%xmm0		#this_line_update!
	jbe	.L184
	movss	-88(%rbp),	%xmm0		#this_line_update!
	movss	.LC25(%rip),	%xmm1
	xorps	%xmm1,	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
	movl	$-1,	-104(%rbp)		#this_line_update!
	jmp	.L159
.L184:
	movl	$1,	-104(%rbp)		#this_line_update!
.L159:
	movss	.LC37(%rip),	%xmm0
	comiss	-88(%rbp),	%xmm0		#this_line_update!
	jbe	.L185
	movl	$0,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
	jmp	.L162
.L185:
	movss	-88(%rbp),	%xmm0		#this_line_update!
	comiss	.LC38(%rip),	%xmm0
	jbe	.L186
	movl	$1,	-28(%rbp)		#this_line_update!
	movl	$0,	-96(%rbp)		#this_line_update!
	jmp	.L162
.L186:
	cmpl	$0,	-104(%rbp)		#this_line_update!
	jle	.L165
	movl	$1,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
	jmp	.L162
.L165:
	movl	$-1,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
.L162:
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jle	.L166
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	-28(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	-96(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jl	.L166
	movl	-28(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jle	.L166
	movl	-28(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jl	.L166
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$1,	(%rax)
	jmp	.L166
.L183:
	movl	$1,	-20(%rbp)		#this_line_update!
	jmp	.L166
.L152:
	movl	$1,	-20(%rbp)		#this_line_update!
.L166:
	cmpl	$1,	-20(%rbp)		#this_line_update!
	jne	.L151
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-100(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-72(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	$0,	-76(%rbp)		#this_line_update!
	movl	$0,	-60(%rbp)		#this_line_update!
	movl	$0,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	sall	$2,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rsp		#this_line_update!
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-48(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%eax		#this_line_update!
	addl	%eax,	-76(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	sall	$3,	%eax
	addl	%edx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-48(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-104(%rbp)		#this_line_update!
	cmpl	$0,	-60(%rbp)		#this_line_update!
	jne	.L167
	movss	.LC35(%rip),	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
	jmp	.L168
.L167:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-76(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-60(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-88(%rbp)		#this_line_update!
.L168:
	movss	.LC37(%rip),	%xmm0
	comiss	-88(%rbp),	%xmm0		#this_line_update!
	jbe	.L187
	movl	$0,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
	jmp	.L171
.L187:
	movss	-88(%rbp),	%xmm0		#this_line_update!
	comiss	.LC38(%rip),	%xmm0
	jbe	.L188
	movl	$1,	-28(%rbp)		#this_line_update!
	movl	$0,	-96(%rbp)		#this_line_update!
	jmp	.L171
.L188:
	cmpl	$0,	-104(%rbp)		#this_line_update!
	jle	.L174
	movl	$-1,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
	jmp	.L171
.L174:
	movl	$1,	-28(%rbp)		#this_line_update!
	movl	$1,	-96(%rbp)		#this_line_update!
.L171:
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jle	.L151
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	-28(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	-96(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jl	.L151
	movl	-28(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-12(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jle	.L151
	movl	-28(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%edx
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	%edx,	%eax
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-96(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-56(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-44(%rbp)		#this_line_update!
	jl	.L151
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-100(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$2,	(%rax)
.L151:
	addl	$1,	-100(%rbp)		#this_line_update!
.L150:
	movl	-16(%rbp),	%eax		#this_line_update!
	subl	$4,	%eax
	cmpl	%eax,	-100(%rbp)		#this_line_update!
	jl	.L175
	addl	$1,	-12(%rbp)		#this_line_update!
.L149:
	movl	16(%rbp),	%eax
	subl	$4,	%eax
	cmpl	%eax,	-12(%rbp)		#this_line_update!
	jl	.L176
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE19:
	.size	susan_edges,	.-susan_edges
	.globl	susan_edges_small
	.type	susan_edges_small,	@function
susan_edges_small:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-104(%rbp)		#this_line_update!
	movq	%rsi,	-44(%rbp)		#this_line_update!
	movq	%rdx,	-112(%rbp)		#this_line_update!
	movq	%rcx,	-92(%rbp)		#this_line_update!
	movl	%r8d,	-52(%rbp)		#this_line_update!
	movl	%r9d,	-36(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	$730,	-52(%rbp)		#this_line_update!
	movl	$1,	-12(%rbp)		#this_line_update!
	jmp	.L190
.L194:
	movl	$1,	-64(%rbp)		#this_line_update!
	jmp	.L191
.L193:
	movl	$100,	-76(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-64(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-104(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-104(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-92(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-84(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-76(%rbp)		#this_line_update!
	movl	-76(%rbp),	%eax		#this_line_update!
	cmpl	-52(%rbp),	%eax		#this_line_update!
	jg	.L192
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-52(%rbp),	%eax		#this_line_update!
	subl	-76(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
.L192:
	addl	$1,	-64(%rbp)		#this_line_update!
.L191:
	movl	-36(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	cmpl	%eax,	-64(%rbp)		#this_line_update!
	jl	.L193
	addl	$1,	-12(%rbp)		#this_line_update!
.L190:
	movl	16(%rbp),	%eax
	subl	$1,	%eax
	cmpl	%eax,	-12(%rbp)		#this_line_update!
	jl	.L194
	movl	$2,	-12(%rbp)		#this_line_update!
	jmp	.L195
.L222:
	movl	$2,	-64(%rbp)		#this_line_update!
	jmp	.L196
.L221:
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	testl	%eax,	%eax
	jle	.L197
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-48(%rbp)		#this_line_update!
	movl	-52(%rbp),	%eax		#this_line_update!
	subl	-48(%rbp),	%eax		#this_line_update!
	movl	%eax,	-76(%rbp)		#this_line_update!
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-104(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-92(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-84(%rbp)		#this_line_update!
	cmpl	$250,	-76(%rbp)		#this_line_update!
	jle	.L198
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-64(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-104(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	$0,	-20(%rbp)		#this_line_update!
	movl	$0,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-60(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-20(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-20(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	%edx
	movl	-60(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	addl	%edx,	%eax
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	%eax,	%xmm0
	pxor	%xmm3,	%xmm3
	cvtss2sd	%xmm0,	%xmm3
	movq	%xmm3,	%rax
	movq	%rax,	%xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
	pxor	%xmm0,	%xmm0
	cvtss2sd	-16(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-76(%rbp),	%xmm1		#this_line_update!
	pxor	%xmm2,	%xmm2
	cvtss2sd	%xmm1,	%xmm2
	movsd	.LC39(%rip),	%xmm1
	mulsd	%xmm2,	%xmm1
	comisd	%xmm1,	%xmm0
	jbe	.L229
	movl	$0,	-24(%rbp)		#this_line_update!
	cmpl	$0,	-20(%rbp)		#this_line_update!
	jne	.L201
	movss	.LC35(%rip),	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
	jmp	.L202
.L201:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-60(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-20(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
.L202:
	pxor	%xmm0,	%xmm0
	comiss	-16(%rbp),	%xmm0		#this_line_update!
	jbe	.L230
	movss	-16(%rbp),	%xmm0		#this_line_update!
	movss	.LC25(%rip),	%xmm1
	xorps	%xmm1,	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
	movl	$-1,	-28(%rbp)		#this_line_update!
	jmp	.L205
.L230:
	movl	$1,	-28(%rbp)		#this_line_update!
.L205:
	movss	.LC37(%rip),	%xmm0
	comiss	-16(%rbp),	%xmm0		#this_line_update!
	jbe	.L231
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
	jmp	.L208
.L231:
	movss	-16(%rbp),	%xmm0		#this_line_update!
	comiss	.LC38(%rip),	%xmm0
	jbe	.L232
	movl	$1,	-56(%rbp)		#this_line_update!
	movl	$0,	-72(%rbp)		#this_line_update!
	jmp	.L208
.L232:
	cmpl	$0,	-28(%rbp)		#this_line_update!
	jle	.L211
	movl	$1,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
	jmp	.L208
.L211:
	movl	$-1,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
.L208:
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-72(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-48(%rbp)		#this_line_update!
	jle	.L212
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	-56(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	-72(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-48(%rbp)		#this_line_update!
	jl	.L212
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-112(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$1,	(%rax)
	jmp	.L212
.L229:
	movl	$1,	-24(%rbp)		#this_line_update!
	jmp	.L212
.L198:
	movl	$1,	-24(%rbp)		#this_line_update!
.L212:
	cmpl	$1,	-24(%rbp)		#this_line_update!
	jne	.L197
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-64(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-104(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movl	$0,	-20(%rbp)		#this_line_update!
	movl	$0,	-60(%rbp)		#this_line_update!
	movl	$0,	-28(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-28(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-28(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	addq	$2,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rsp		#this_line_update!
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	subl	%eax,	-28(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movq	-8(%rbp),	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-84(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-68(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-20(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-60(%rbp)		#this_line_update!
	movzbl	-68(%rbp),	%eax		#this_line_update!
	addl	%eax,	-28(%rbp)		#this_line_update!
	cmpl	$0,	-60(%rbp)		#this_line_update!
	jne	.L213
	movss	.LC35(%rip),	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
	jmp	.L214
.L213:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-20(%rbp),	%xmm0		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	-60(%rbp),	%xmm1		#this_line_update!
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-16(%rbp)		#this_line_update!
.L214:
	movss	.LC37(%rip),	%xmm0
	comiss	-16(%rbp),	%xmm0		#this_line_update!
	jbe	.L233
	movl	$0,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
	jmp	.L217
.L233:
	movss	-16(%rbp),	%xmm0		#this_line_update!
	comiss	.LC38(%rip),	%xmm0
	jbe	.L234
	movl	$1,	-56(%rbp)		#this_line_update!
	movl	$0,	-72(%rbp)		#this_line_update!
	jmp	.L217
.L234:
	cmpl	$0,	-28(%rbp)		#this_line_update!
	jle	.L220
	movl	$-1,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
	jmp	.L217
.L220:
	movl	$1,	-56(%rbp)		#this_line_update!
	movl	$1,	-72(%rbp)		#this_line_update!
.L217:
	movl	-12(%rbp),	%edx		#this_line_update!
	movl	-56(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-72(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-48(%rbp)		#this_line_update!
	jle	.L197
	movl	-12(%rbp),	%eax		#this_line_update!
	subl	-56(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	subl	-72(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-48(%rbp)		#this_line_update!
	jl	.L197
	movl	-12(%rbp),	%eax		#this_line_update!
	imull	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-64(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-112(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movb	$2,	(%rax)
.L197:
	addl	$1,	-64(%rbp)		#this_line_update!
.L196:
	movl	-36(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	cmpl	%eax,	-64(%rbp)		#this_line_update!
	jl	.L221
	addl	$1,	-12(%rbp)		#this_line_update!
.L195:
	movl	16(%rbp),	%eax
	subl	$2,	%eax
	cmpl	%eax,	-12(%rbp)		#this_line_update!
	jl	.L222
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE20:
	.size	susan_edges_small,	.-susan_edges_small
	.globl	corner_draw
	.type	corner_draw,	@function
corner_draw:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$48,	%rsp
	movq	%rdi,	-24(%rbp)		#this_line_update!
	movq	%rsi,	-48(%rbp)		#this_line_update!
	movl	%edx,	-36(%rbp)		#this_line_update!
	movl	%ecx,	-12(%rbp)		#this_line_update!
	movl	$0,	-28(%rbp)		#this_line_update!
	jmp	.L236
.L238:
	cmpl	$0,	-12(%rbp)		#this_line_update!
	jne	.L237
	movl	-28(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	4(%rax),	%eax
	subl	$1,	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rcx
	movl	-28(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cltq
	addq	%rcx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rax
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$0,	(%rax)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	subq	$2,	%rsp		#this_line_update!
	addq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	leaq	1(%rax),	%rdx
	movq	%rdx,	-8(%rbp)
	movb	$-1,	(%rax)
	movq	-8(%rbp),	%rax
	movb	$-1,	(%rax)
	addl	$1,	-28(%rbp)		#this_line_update!
	jmp	.L236
.L237:
	movl	-28(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	4(%rax),	%eax
	imull	-36(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rcx
	movl	-28(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cltq
	leaq	(%rcx,%rax),	%rdx
	movq	-24(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-8(%rbp),	%rax
	movb	$0,	(%rax)
	addl	$1,	-28(%rbp)		#this_line_update!
.L236:
	movl	-28(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-48(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	8(%rax),	%eax
	cmpl	$7,	%eax
	jne	.L238
	nop
				leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE21:
	.size	corner_draw,	.-corner_draw
	.section	.rodata
.LC42:
	.string	"Too	many	corners.\n"
	.text
	.globl	susan_corners
	.type	susan_corners,	@function
susan_corners:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				addq				$-176,	%rsp
	movq	%rdi,	-148(%rbp)		#this_line_update!
	movq	%rsi,	-120(%rbp)		#this_line_update!
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movl	%ecx,	-164(%rbp)		#this_line_update!
	movq	%r8,	-60(%rbp)		#this_line_update!
	movl	%r9d,	-160(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	-160(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-88(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-128(%rbp)		#this_line_update!
	movl	$5,	-28(%rbp)		#this_line_update!
	jmp	.L240
.L268:
	movl	$5,	-36(%rbp)		#this_line_update!
	jmp	.L241
.L267:
	movl	$100,	-64(%rbp)		#this_line_update!
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-80(%rbp)		#this_line_update!
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-108(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	addq	$2,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-64(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	cmpl	-164(%rbp),	%eax		#this_line_update!
	jge	.L242
	movl	$0,	-92(%rbp)		#this_line_update!
	movl	$0,	-44(%rbp)		#this_line_update!
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-36(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-44(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-44(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-92(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	addq	$2,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	leal	0(,%rax,4),	%edx
	movl	%ecx,	%eax
	subl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-44(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movl	-160(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rsp		#this_line_update!
	addq	%rax,	-80(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	subl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-80(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movq	-80(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movb	%al,	-176(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%eax		#this_line_update!
	addl	%eax,	-92(%rbp)		#this_line_update!
	movzbl	-176(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%eax,	-44(%rbp)		#this_line_update!
	movl	-92(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	-112(%rbp)		#this_line_update!
	movl	-44(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	-172(%rbp)		#this_line_update!
	movl	-112(%rbp),	%edx		#this_line_update!
	movl	-172(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movl	%eax,	-156(%rbp)		#this_line_update!
	movl	-64(%rbp),	%eax		#this_line_update!
	imull	%eax,	%eax
	movl	%eax,	%edx
	shrl	$31,	%edx
	addl	%edx,	%eax
	sarl	%eax
	cmpl	%eax,	-156(%rbp)		#this_line_update!
	jle	.L242
	movl	-172(%rbp),	%eax		#this_line_update!
	cmpl	-112(%rbp),	%eax		#this_line_update!
	jge	.L243
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-44(%rbp),	%xmm0		#this_line_update!
	movl	-92(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	negl	%edx
	cmovns	%edx,	%eax
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	%eax,	%xmm1
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-96(%rbp)		#this_line_update!
	cmpl	$0,	-92(%rbp)		#this_line_update!
	jns	.L244
	movl	$-1,	%eax
	jmp	.L245
.L244:
	movl	$1,	%eax
.L245:
	movl	%eax,	-156(%rbp)		#this_line_update!
	pxor	%xmm0,	%xmm0
	comiss	-96(%rbp),	%xmm0		#this_line_update!
	jbe	.L280
	pxor	%xmm0,	%xmm0
	cvtss2sd	-96(%rbp),	%xmm0		#this_line_update!
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L248
.L280:
	pxor	%xmm1,	%xmm1
	cvtss2sd	-96(%rbp),	%xmm1		#this_line_update!
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L248:
	movl	-28(%rbp),	%edx		#this_line_update!
	addl	%edx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movl	-156(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movss	-96(%rbp),	%xmm0		#this_line_update!
	movaps	%xmm0,	%xmm1
	addss	%xmm0,	%xmm1
	pxor	%xmm0,	%xmm0
	comiss	%xmm1,	%xmm0
	jbe	.L281
	movss	-96(%rbp),	%xmm0		#this_line_update!
	addss	%xmm0,	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L251
.L281:
	movss	-96(%rbp),	%xmm0		#this_line_update!
	addss	%xmm0,	%xmm0
	pxor	%xmm1,	%xmm1
	cvtss2sd	%xmm0,	%xmm1
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L251:
	movl	-28(%rbp),	%ecx		#this_line_update!
	addl	%ecx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movl	-156(%rbp),	%eax		#this_line_update!
	addl	%eax,	%eax
	addl	%ecx,	%eax
	movslq	%eax,	%rcx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rcx
	movq	-8(%rbp),	%rax
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm0,	%xmm1
	pxor	%xmm0,	%xmm0
	comiss	%xmm1,	%xmm0
	jbe	.L282
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm1,	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L254
.L282:
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm1,	%xmm0
	pxor	%xmm1,	%xmm1
	cvtss2sd	%xmm0,	%xmm1
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L254:
	movl	-28(%rbp),	%edx		#this_line_update!
	addl	%edx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	leal	(%rdx,%rax),	%esi
	movl	-156(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%edx,	%eax
	addl	%esi,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%ecx,	%eax
	movl	%eax,	-156(%rbp)		#this_line_update!
	jmp	.L255
.L243:
	pxor	%xmm0,	%xmm0
	cvtsi2ssl	-92(%rbp),	%xmm0		#this_line_update!
	movl	-44(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	negl	%edx
	cmovns	%edx,	%eax
	pxor	%xmm1,	%xmm1
	cvtsi2ssl	%eax,	%xmm1
	divss	%xmm1,	%xmm0
	movss	%xmm0,	-96(%rbp)		#this_line_update!
	cmpl	$0,	-44(%rbp)		#this_line_update!
	jns	.L256
	movl	$-1,	%eax
	jmp	.L257
.L256:
	movl	$1,	%eax
.L257:
	movl	%eax,	-156(%rbp)		#this_line_update!
	movl	-28(%rbp),	%edx		#this_line_update!
	movl	-156(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	pxor	%xmm0,	%xmm0
	comiss	-96(%rbp),	%xmm0		#this_line_update!
	jbe	.L283
	pxor	%xmm0,	%xmm0
	cvtss2sd	-96(%rbp),	%xmm0		#this_line_update!
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L260
.L283:
	pxor	%xmm1,	%xmm1
	cvtss2sd	-96(%rbp),	%xmm1		#this_line_update!
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L260:
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-156(%rbp),	%eax		#this_line_update!
	leal	(%rax,%rax),	%ecx
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%eax,	%ecx
	movss	-96(%rbp),	%xmm0		#this_line_update!
	movaps	%xmm0,	%xmm1
	addss	%xmm0,	%xmm1
	pxor	%xmm0,	%xmm0
	comiss	%xmm1,	%xmm0
	jbe	.L284
	movss	-96(%rbp),	%xmm0		#this_line_update!
	addss	%xmm0,	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L263
.L284:
	movss	-96(%rbp),	%xmm0		#this_line_update!
	addss	%xmm0,	%xmm0
	pxor	%xmm1,	%xmm1
	cvtss2sd	%xmm0,	%xmm1
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L263:
	addl	%ecx,	%eax
	movslq	%eax,	%rcx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rcx
	movq	-8(%rbp),	%rax
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movl	-156(%rbp),	%edx		#this_line_update!
	movl	%edx,	%eax
	addl	%eax,	%eax
	addl	%eax,	%edx
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%eax,	%edx
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm0,	%xmm1
	pxor	%xmm0,	%xmm0
	comiss	%xmm1,	%xmm0
	jbe	.L285
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm1,	%xmm0
	cvtss2sd	%xmm0,	%xmm0
	movsd	.LC40(%rip),	%xmm1
	subsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
	jmp	.L266
.L285:
	movss	-96(%rbp),	%xmm1		#this_line_update!
	movss	.LC41(%rip),	%xmm0
	mulss	%xmm1,	%xmm0
	pxor	%xmm1,	%xmm1
	cvtss2sd	%xmm0,	%xmm1
	movsd	.LC40(%rip),	%xmm0
	addsd	%xmm1,	%xmm0
	cvttsd2sil	%xmm0,	%eax
.L266:
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%ecx,	%eax
	movl	%eax,	-156(%rbp)		#this_line_update!
.L255:
	cmpl	$290,	-156(%rbp)		#this_line_update!
	jle	.L242
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-164(%rbp),	%eax		#this_line_update!
	subl	-64(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
	movl	-92(%rbp),	%eax		#this_line_update!
	imull	$51,	%eax,	%eax
	movl	-28(%rbp),	%edx		#this_line_update!
	movl	%edx,	%ecx
	imull	-160(%rbp),	%ecx		#this_line_update!
	movl	-36(%rbp),	%edx		#this_line_update!
	addl	%ecx,	%edx
	movslq	%edx,	%rdx
	leaq	0(,%rdx,4),	%rcx
	movq	-88(%rbp),	%rdx		#this_line_update!
	addq	%rdx,	%rcx
	cltd
	idivl	-68(%rbp)
	movl	%eax,	(%rcx)
	movl	-44(%rbp),	%eax		#this_line_update!
	imull	$51,	%eax,	%eax
	movl	-28(%rbp),	%edx		#this_line_update!
	movl	%edx,	%ecx
	imull	-160(%rbp),	%ecx		#this_line_update!
	movl	-36(%rbp),	%edx		#this_line_update!
	addl	%ecx,	%edx
	movslq	%edx,	%rdx
	leaq	0(,%rdx,4),	%rcx
	movq	-128(%rbp),	%rdx		#this_line_update!
	addq	%rdx,	%rcx
	cltd
	idivl	-68(%rbp)
	movl	%eax,	(%rcx)
.L242:
	addl	$1,	-36(%rbp)		#this_line_update!
.L241:
	movl	-160(%rbp),	%eax		#this_line_update!
	subl	$5,	%eax
	cmpl	%eax,	-36(%rbp)		#this_line_update!
	jl	.L267
	addl	$1,	-28(%rbp)		#this_line_update!
.L240:
	movl	16(%rbp),	%eax
	subl	$5,	%eax
	cmpl	%eax,	-28(%rbp)		#this_line_update!
	jl	.L268
	movl	$0,	-64(%rbp)		#this_line_update!
	movl	$5,	-28(%rbp)		#this_line_update!
	jmp	.L269
.L273:
	movl	$5,	-36(%rbp)		#this_line_update!
	jmp	.L270
.L272:
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-92(%rbp)		#this_line_update!
	cmpl	$0,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jle	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-28(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-120(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-92(%rbp)		#this_line_update!
	jl	.L271
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	$0,	8(%rax)
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-36(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-28(%rbp),	%eax		#this_line_update!
	movl	%eax,	4(%rdx)
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-88(%rbp),	%rax		#this_line_update!
	leaq	(%rdx,%rax),	%rcx
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	(%rcx),	%eax
	movl	%eax,	12(%rdx)
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-128(%rbp),	%rax		#this_line_update!
	leaq	(%rdx,%rax),	%rcx
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	(%rcx),	%eax
	movl	%eax,	16(%rdx)
	movl	-28(%rbp),	%eax		#this_line_update!
	imull	-160(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-36(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-148(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%ecx
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movzbl	%cl,	%eax
	movl	%eax,	20(%rdx)
	addl	$1,	-64(%rbp)		#this_line_update!
	cmpl	$15000,	-64(%rbp)		#this_line_update!
	jne	.L271
	movq	stderr(%rip),	%rax
	movq	%rax,	%rcx
	movl	$18,	%edx
	movl	$1,	%esi
	leaq	.LC42(%rip),	%rax
	movq	%rax,	%rdi
	call	fwrite@PLT
	movl	$1,	%edi
	call	exit@PLT
.L271:
	addl	$1,	-36(%rbp)		#this_line_update!
.L270:
	movl	-160(%rbp),	%eax		#this_line_update!
	subl	$5,	%eax
	cmpl	%eax,	-36(%rbp)		#this_line_update!
	jl	.L272
	addl	$1,	-28(%rbp)		#this_line_update!
.L269:
	movl	16(%rbp),	%eax
	subl	$5,	%eax
	cmpl	%eax,	-28(%rbp)		#this_line_update!
	jl	.L273
	movl	-64(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-60(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	$7,	8(%rax)
	movq	-88(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	movq	-128(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE22:
	.size	susan_corners,	.-susan_corners
	.globl	susan_corners_quick
	.type	susan_corners_quick,	@function
susan_corners_quick:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
				subq				$112,	%rsp
	movq	%rdi,	-36(%rbp)		#this_line_update!
	movq	%rsi,	-76(%rbp)		#this_line_update!
	movq	%rdx,	-52(%rbp)		#this_line_update!
	movl	%ecx,	-68(%rbp)		#this_line_update!
	movq	%r8,	-44(%rbp)		#this_line_update!
	movl	%r9d,	-84(%rbp)		#this_line_update!
	movl	-84(%rbp),	%eax		#this_line_update!
	imull	16(%rbp),	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	movl	$0,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	movl	$7,	-88(%rbp)		#this_line_update!
	jmp	.L287
.L291:
	movl	$7,	-80(%rbp)		#this_line_update!
	jmp	.L288
.L290:
	movl	$100,	-16(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movl	-80(%rbp),	%eax		#this_line_update!
	cltq
	addq	%rdx,	%rax
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-108(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movq	-52(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	%rax,	-8(%rbp)
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rax
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	addq	$2,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$6,	%rax
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$5,	%rax
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movl	-84(%rbp),	%eax		#this_line_update!
	cltq
	subq	$3,	%rsp		#this_line_update!
	addq	%rax,	-108(%rbp)		#this_line_update!
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	leaq	1(%rax),	%rdx
	movq	%rdx,	-108(%rbp)		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movq	-108(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	negq	%rax
	movq	%rax,	%rdx
	movq	-8(%rbp),	%rax
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-68(%rbp),	%eax		#this_line_update!
	jge	.L289
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-68(%rbp),	%eax		#this_line_update!
	subl	-16(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
.L289:
	addl	$1,	-80(%rbp)		#this_line_update!
.L288:
	movl	-84(%rbp),	%eax		#this_line_update!
	subl	$7,	%eax
	cmpl	%eax,	-80(%rbp)		#this_line_update!
	jl	.L290
	addl	$1,	-88(%rbp)		#this_line_update!
.L287:
	movl	16(%rbp),	%eax
	subl	$7,	%eax
	cmpl	%eax,	-88(%rbp)		#this_line_update!
	jl	.L291
	movl	$0,	-16(%rbp)		#this_line_update!
	movl	$7,	-88(%rbp)		#this_line_update!
	jmp	.L292
.L296:
	movl	$7,	-80(%rbp)		#this_line_update!
	jmp	.L293
.L295:
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	cmpl	$0,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jle	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-12(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-8(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	salq	$2,	%rax
	leaq	-4(%rax),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$1,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$2,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$3,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	addq	$3,	%rax
	leaq	0(,%rax,4),	%rdx
	movq	-76(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	(%rax),	%eax
	cmpl	%eax,	-60(%rbp)		#this_line_update!
	jl	.L294
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	$0,	8(%rax)
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-80(%rbp),	%eax		#this_line_update!
	movl	%eax,	(%rdx)
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-88(%rbp),	%eax		#this_line_update!
	movl	%eax,	4(%rdx)
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%ecx,	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-60(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rcx
	imulq	$1374389535,	%rcx,	%rcx
	shrq	$32,	%rcx
	sarl	$3,	%ecx
	sarl	$31,	%eax
	movl	%eax,	%esi
	movl	%ecx,	%eax
	subl	%esi,	%eax
	movl	%eax,	20(%rdx)
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%esi
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%esi,	%eax
	cltq
	leaq	-2(%rax),	%rsi
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rsi,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rsi,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	movl	%eax,	-60(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-60(%rbp),	%eax		#this_line_update!
	leal	(%rdx,%rax),	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%esi
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%esi,	%eax
	cltq
	leaq	-1(%rax),	%rsi
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rsi,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rsi,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	addl	%eax,	-60(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rdx,%rax),	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%esi
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%esi,	%eax
	cltq
	leaq	-1(%rax),	%rsi
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rsi,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	movslq	%eax,	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$2,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rsi,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	movl	%eax,	-112(%rbp)		#this_line_update!
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%edx
	movl	-112(%rbp),	%eax		#this_line_update!
	leal	(%rdx,%rax),	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	-1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	1(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	addl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%edx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%edx,	%eax
	cltq
	leaq	2(%rax),	%rdx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%edx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	-2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%ecx
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%esi
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%esi,	%eax
	cltq
	leaq	-1(%rax),	%rsi
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rsi,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rcx,%rax),	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	movslq	%eax,	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	1(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	addl	%eax,	%esi
	movl	-88(%rbp),	%eax		#this_line_update!
	subl	$1,	%eax
	imull	-84(%rbp),	%eax		#this_line_update!
	movl	%eax,	%ecx
	movl	-80(%rbp),	%eax		#this_line_update!
	addl	%ecx,	%eax
	cltq
	leaq	2(%rax),	%rcx
	movq	-36(%rbp),	%rax		#this_line_update!
	addq	%rcx,	%rax
	movzbl	(%rax),	%eax
	movzbl	%al,	%eax
	leal	(%rsi,%rax),	%ecx
	movl	%edx,	%eax
	subl	%ecx,	%eax
	addl	%eax,	-112(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-60(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rcx
	imulq	$-2004318071,	%rcx,	%rcx
	shrq	$32,	%rcx
	addl	%eax,	%ecx
	sarl	$3,	%ecx
	sarl	$31,	%eax
	movl	%eax,	%esi
	movl	%ecx,	%eax
	subl	%esi,	%eax
	movl	%eax,	12(%rdx)
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rax,	%rdx
	movl	-112(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rcx
	imulq	$-2004318071,	%rcx,	%rcx
	shrq	$32,	%rcx
	addl	%eax,	%ecx
	sarl	$3,	%ecx
	sarl	$31,	%eax
	movl	%eax,	%esi
	movl	%ecx,	%eax
	subl	%esi,	%eax
	movl	%eax,	16(%rdx)
	addl	$1,	-16(%rbp)		#this_line_update!
	cmpl	$15000,	-16(%rbp)		#this_line_update!
	jne	.L294
	movq	stderr(%rip),	%rax
	movq	%rax,	%rcx
	movl	$18,	%edx
	movl	$1,	%esi
	leaq	.LC42(%rip),	%rax
	movq	%rax,	%rdi
	call	fwrite@PLT
	movl	$1,	%edi
	call	exit@PLT
.L294:
	addl	$1,	-80(%rbp)		#this_line_update!
.L293:
	movl	-84(%rbp),	%eax		#this_line_update!
	subl	$7,	%eax
	cmpl	%eax,	-80(%rbp)		#this_line_update!
	jl	.L295
	addl	$1,	-88(%rbp)		#this_line_update!
.L292:
	movl	16(%rbp),	%eax
	subl	$7,	%eax
	cmpl	%eax,	-88(%rbp)		#this_line_update!
	jl	.L296
	movl	-16(%rbp),	%eax		#this_line_update!
	movslq	%eax,	%rdx
	movq	%rdx,	%rax
	addq	%rax,	%rax
	addq	%rdx,	%rax
	salq	$3,	%rax
	movq	%rax,	%rdx
	movq	-44(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movl	$7,	8(%rax)
	nop
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE23:
	.size	susan_corners_quick,	.-susan_corners_quick
	.section	.rodata
.LC44:
	.string	"No	argument	following	-d"
.LC45:
	.string	"No	argument	following	-t"
	.text
	.globl	main
	.type	main,	@function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset	16
	.cfi_offset	6,	-16
	movq	%rsp,	%rbp
	.cfi_def_cfa_register	6
	leaq	-356352(%rsp),	%r11		#this_line_update!
				subq				$360208,	%rsp
				orq					$0,	(%rsp)
	subq	$3856,	%rsp
	movl	%edi,	-3856(%rbp)		#this_line_update!
	movq	%rsi,	-3868(%rbp)		#this_line_update!
	movq	%fs:40,	%rax
	movq	%rax,	-8(%rbp)
	xorl	%eax,	%eax
	movss	.LC43(%rip),	%xmm0
	movss	%xmm0,	-3844(%rbp)		#this_line_update!
	movl	$3,	-16(%rbp)		#this_line_update!
	movl	$20,	-360236(%rbp)		#this_line_update!
	movl	$0,	-3836(%rbp)		#this_line_update!
	movl	$1,	-3840(%rbp)		#this_line_update!
	movl	$0,	-3832(%rbp)		#this_line_update!
	movl	$0,	-3848(%rbp)		#this_line_update!
	movl	$0,	-24(%rbp)		#this_line_update!
	movl	$1850,	-3800(%rbp)		#this_line_update!
	movl	$2650,	-20(%rbp)		#this_line_update!
	movl	$0,	-3888(%rbp)		#this_line_update!
	cmpl	$2,	-3856(%rbp)		#this_line_update!
	jg	.L298
	movl	$0,	%eax
	call	usage
.L298:
	movq	-3868(%rbp),	%rax		#this_line_update!
	addq	$8,	%rax
	movq	(%rax),	%rax
	leaq	-3820(%rbp),	%rcx		#this_line_update!
	leaq	-32(%rbp),	%rdx		#this_line_update!
	leaq	-3880(%rbp),	%rsi		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	get_image
	jmp	.L299
.L318:
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,8),	%rdx
	movq	-3868(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	(%rax),	%rax
	movq	%rax,	-3808(%rbp)		#this_line_update!
	movq	-3808(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	cmpb	$45,	%al
	jne	.L300
	addq	$1,	-3808(%rbp)		#this_line_update!
	movq	-3808(%rbp),	%rax		#this_line_update!
	movzbl	(%rax),	%eax
	movsbl	%al,	%eax
	subl	$51,	%eax
	cmpl	$65,	%eax
	ja	.L317
	movl	%eax,	%eax
	leaq	0(,%rax,4),	%rdx
	leaq	.L303(%rip),	%rax
	movl	(%rdx,%rax),	%eax
	cltq
	leaq	.L303(%rip),	%rdx
	addq	%rdx,	%rax
	notrack	jmp	*%rax
	.section	.rodata
	.align	4
	.align	4
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
	movl	$0,	-3888(%rbp)		#this_line_update!
	jmp	.L317
.L308:
	movl	$1,	-3888(%rbp)		#this_line_update!
	jmp	.L317
.L310:
	movl	$2,	-3888(%rbp)		#this_line_update!
	jmp	.L317
.L306:
	movl	$1,	-3836(%rbp)		#this_line_update!
	jmp	.L317
.L307:
	movl	$0,	-3840(%rbp)		#this_line_update!
	jmp	.L317
.L311:
	movl	$1,	-3848(%rbp)		#this_line_update!
	jmp	.L317
.L312:
	movl	$1,	-3832(%rbp)		#this_line_update!
	jmp	.L317
.L305:
	movl	$1,	-24(%rbp)		#this_line_update!
	jmp	.L317
.L309:
	addl	$1,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-3856(%rbp),	%eax		#this_line_update!
	jl	.L313
	leaq	.LC44(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	%edi
	call	exit@PLT
.L313:
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,8),	%rdx
	movq	-3868(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	(%rax),	%rax
	movq	%rax,	%rdi
	call	atof@PLT
	cvtsd2ss	%xmm0,	%xmm0
	movss	%xmm0,	-3844(%rbp)		#this_line_update!
	pxor	%xmm0,	%xmm0
	comiss	-3844(%rbp),	%xmm0		#this_line_update!
	ja	.L337
	jmp	.L317
.L337:
	movl	$1,	-3832(%rbp)		#this_line_update!
	jmp	.L317
.L302:
	addl	$1,	-16(%rbp)		#this_line_update!
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-3856(%rbp),	%eax		#this_line_update!
	jl	.L316
	leaq	.LC45(%rip),	%rax
	movq	%rax,	%rdi
	call	puts@PLT
	movl	$0,	%edi
	call	exit@PLT
.L316:
	movl	-16(%rbp),	%eax		#this_line_update!
	cltq
	leaq	0(,%rax,8),	%rdx
	movq	-3868(%rbp),	%rax		#this_line_update!
	addq	%rdx,	%rax
	movq	(%rax),	%rax
	movq	%rax,	%rdi
	call	atoi@PLT
	movl	%eax,	-360236(%rbp)		#this_line_update!
	jmp	.L317
.L300:
	movl	$0,	%eax
	call	usage
.L317:
	addl	$1,	-16(%rbp)		#this_line_update!
.L299:
	movl	-16(%rbp),	%eax		#this_line_update!
	cmpl	-3856(%rbp),	%eax		#this_line_update!
	jl	.L318
	cmpl	$1,	-3836(%rbp)		#this_line_update!
	jne	.L319
	cmpl	$0,	-3888(%rbp)		#this_line_update!
	jne	.L319
	movl	$1,	-3888(%rbp)		#this_line_update!
.L319:
	cmpl	$2,	-3888(%rbp)		#this_line_update!
	je	.L320
	cmpl	$2,	-3888(%rbp)		#this_line_update!
	jg	.L321
	cmpl	$0,	-3888(%rbp)		#this_line_update!
	je	.L322
	cmpl	$1,	-3888(%rbp)		#this_line_update!
	je	.L323
	jmp	.L321
.L322:
	movl	-360236(%rbp),	%ecx		#this_line_update!
	leaq	-3784(%rbp),	%rax		#this_line_update!
	movl	$2,	%edx
	movl	%ecx,	%esi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	setup_brightness_lut
	movq	-3784(%rbp),	%r8		#this_line_update!
	movl	-3820(%rbp),	%ecx		#this_line_update!
	movl	-32(%rbp),	%edx		#this_line_update!
	pxor	%xmm1,	%xmm1
	cvtss2sd	-3844(%rbp),	%xmm1		#this_line_update!
	movq	%xmm1,	%rdi
	movq	-3880(%rbp),	%rsi		#this_line_update!
	movl	-3832(%rbp),	%eax		#this_line_update!
	movq	%rdi,	%xmm0
	movl	%eax,	%edi
	movl	$1,	%eax
	call	susan_smoothing
	jmp	.L321
.L323:
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	cltq
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-3828(%rbp)		#this_line_update!
	movl	-360236(%rbp),	%ecx		#this_line_update!
	leaq	-3784(%rbp),	%rax		#this_line_update!
	movl	$6,	%edx
	movl	%ecx,	%esi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	setup_brightness_lut
	cmpl	$0,	-3836(%rbp)		#this_line_update!
	je	.L324
	cmpl	$0,	-3832(%rbp)		#this_line_update!
	je	.L325
	movl	-3820(%rbp),	%r8d		#this_line_update!
	movl	-32(%rbp),	%edi		#this_line_update!
	movq	-3784(%rbp),	%rdx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-20(%rbp),	%ecx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	movl	%r8d,	%r9d
	movl	%edi,	%r8d
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_principle_small
	jmp	.L326
.L325:
	movl	-3820(%rbp),	%r8d		#this_line_update!
	movl	-32(%rbp),	%edi		#this_line_update!
	movq	-3784(%rbp),	%rdx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-20(%rbp),	%ecx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	movl	%r8d,	%r9d
	movl	%edi,	%r8d
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_principle
.L326:
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%eax,	%edx
	movq	-3880(%rbp),	%rcx		#this_line_update!
	movq	-3828(%rbp),	%rax		#this_line_update!
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	int_to_uchar
	jmp	.L321
.L324:
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	cltq
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-3796(%rbp)		#this_line_update!
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	movslq	%eax,	%rdx
	movq	-3796(%rbp),	%rax		#this_line_update!
	movl	$100,	%esi
	movq	%rax,	%rdi
	call	memset@PLT
	cmpl	$0,	-3832(%rbp)		#this_line_update!
	je	.L328
	movl	-3820(%rbp),	%edi		#this_line_update!
	movl	-32(%rbp),	%r9d		#this_line_update!
	movq	-3784(%rbp),	%rcx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-20(%rbp),	%r8d		#this_line_update!
	movq	-3796(%rbp),	%rdx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	subq	$8,	%rsp
	pushq	%rdi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_edges_small
	addq	$16,	%rsp
	jmp	.L329
.L328:
	movl	-3820(%rbp),	%edi		#this_line_update!
	movl	-32(%rbp),	%r9d		#this_line_update!
	movq	-3784(%rbp),	%rcx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-20(%rbp),	%r8d		#this_line_update!
	movq	-3796(%rbp),	%rdx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	subq	$8,	%rsp
	pushq	%rdi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_edges
	addq	$16,	%rsp
.L329:
	cmpl	$0,	-3840(%rbp)		#this_line_update!
	je	.L330
	movl	-3820(%rbp),	%ecx		#this_line_update!
	movl	-32(%rbp),	%edx		#this_line_update!
	movq	-3796(%rbp),	%rsi		#this_line_update!
	movq	-3828(%rbp),	%rax		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_thin
.L330:
	movl	-3820(%rbp),	%ecx		#this_line_update!
	movl	-32(%rbp),	%edx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-3848(%rbp),	%edi		#this_line_update!
	movq	-3796(%rbp),	%rsi		#this_line_update!
	movl	%edi,	%r8d
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	edge_draw
	jmp	.L321
.L320:
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%edx,	%eax
	cltq
	salq	$2,	%rax
	movq	%rax,	%rdi
	call	malloc@PLT
	movq	%rax,	-3828(%rbp)		#this_line_update!
	movl	-360236(%rbp),	%ecx		#this_line_update!
	leaq	-3784(%rbp),	%rax		#this_line_update!
	movl	$6,	%edx
	movl	%ecx,	%esi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	setup_brightness_lut
	cmpl	$0,	-3836(%rbp)		#this_line_update!
	je	.L331
	movl	-3820(%rbp),	%r8d		#this_line_update!
	movl	-32(%rbp),	%edi		#this_line_update!
	movq	-3784(%rbp),	%rdx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-3800(%rbp),	%ecx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	movl	%r8d,	%r9d
	movl	%edi,	%r8d
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_principle
	movl	-32(%rbp),	%edx		#this_line_update!
	movl	-3820(%rbp),	%eax		#this_line_update!
	imull	%eax,	%edx
	movq	-3880(%rbp),	%rcx		#this_line_update!
	movq	-3828(%rbp),	%rax		#this_line_update!
	movq	%rcx,	%rsi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	int_to_uchar
	jmp	.L338
.L331:
	cmpl	$0,	-24(%rbp)		#this_line_update!
	je	.L333
	movl	-3820(%rbp),	%edi		#this_line_update!
	movl	-32(%rbp),	%r9d		#this_line_update!
	movq	-3784(%rbp),	%rdx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	leaq	-3776(%rbp),	%r8		#this_line_update!
	movl	-3800(%rbp),	%ecx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
	subq	$8,	%rsp
	pushq	%rdi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_corners_quick
	addq	$16,	%rsp
	jmp	.L334
.L333:
	movl	-3820(%rbp),	%edi		#this_line_update!
	movl	-32(%rbp),	%r9d		#this_line_update!
	movq	-3784(%rbp),	%rdx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	leaq	-3776(%rbp),	%r8		#this_line_update!
	movl	-3800(%rbp),	%ecx		#this_line_update!
	movq	-3828(%rbp),	%rsi		#this_line_update!
				subq				$56,	%rsp
	pushq	%rdi
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	susan_corners
				addq				$-32,	%rsp
.L334:
	movl	-32(%rbp),	%edx		#this_line_update!
	movq	-3880(%rbp),	%rax		#this_line_update!
	movl	-3848(%rbp),	%ecx		#this_line_update!
	leaq	-3776(%rbp),	%rsi		#this_line_update!
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	corner_draw
.L338:
	nop
.L321:
	movl	-3820(%rbp),	%ecx		#this_line_update!
	movl	-32(%rbp),	%edx		#this_line_update!
	movq	-3880(%rbp),	%rsi		#this_line_update!
	movq	-3868(%rbp),	%rax		#this_line_update!
	addq	$16,	%rax
	movq	(%rax),	%rax
	movq	%rax,	%rdi
	movl	$0,	%eax
	call	put_image
	movl	$0,	%eax
	movq	-8(%rbp),	%rdx
	subq	$-3885,	%rsp		#this_line_update!
	je	.L336
	call	__stack_chk_fail@PLT
.L336:
	leave
	.cfi_def_cfa	7,	8
	ret
	.cfi_endproc
.LFE24:
	.size	main,	.-main
	.section	.rodata
	.align	16
.LC25:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align	8
.LC26:
	.long	0
	.long	1079574528
	.align	8
.LC27:
	.long	0
	.long	1073217536
	.align	4
.LC28:
	.long	1097859072
	.align	8
.LC33:
	.long	1717986918
	.long	1072064102
	.align	8
.LC34:
	.long	-858993459
	.long	1072483532
	.align	4
.LC35:
	.long	1232348160
	.align	4
.LC37:
	.long	1056964608
	.align	4
.LC38:
	.long	1073741824
	.align	8
.LC39:
	.long	-1717986918
	.long	1071225241
	.align	8
.LC40:
	.long	0
	.long	1071644672
	.align	4
.LC41:
	.long	1077936128
	.align	4
.LC43:
	.long	1082130432
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

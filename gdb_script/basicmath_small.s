	.file	"basicmath_small.c"
	.text
.Ltext0:
	.file 0 "/home/mahsa/Documents/MiBench/automotive/basicmath" "basicmath_small.c"
	.section	.rodata
	.align 8
.LC11:
	.string	"********* CUBIC FUNCTIONS ***********"
.LC12:
	.string	"Solutions:"
.LC13:
	.string	" %f"
	.align 8
.LC21:
	.string	"********* INTEGER SQR ROOTS ***********"
.LC22:
	.string	"sqrt(%3d) = %2d\n"
.LC23:
	.string	"\nsqrt(%lX) = %X\n"
	.align 8
.LC24:
	.string	"********* ANGLE CONVERSION ***********"
	.align 8
.LC27:
	.string	"%3.0f degrees = %.12f radians\n"
.LC29:
	.string	""
	.align 8
.LC30:
	.string	"%.12f radians = %3.0f degrees\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 1 "basicmath_small.c"
	.loc 1 7 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	.loc 1 7 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 8 11
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -192(%rbp)
	.loc 1 8 21
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -184(%rbp)
	.loc 1 8 33
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -176(%rbp)
	.loc 1 8 44
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -168(%rbp)
	.loc 1 9 11
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 9 21
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -144(%rbp)
	.loc 1 9 32
	movsd	.LC5(%rip), %xmm0
	movsd	%xmm0, -136(%rbp)
	.loc 1 9 43
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -128(%rbp)
	.loc 1 10 11
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -120(%rbp)
	.loc 1 10 21
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc 1 10 32
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 1 10 43
	movsd	.LC8(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 11 11
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 11 21
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 11 33
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 11 43
	movsd	.LC10(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 16 17
	movq	$1072497001, -56(%rbp)
	.loc 1 18 8
	movq	$0, -48(%rbp)
	.loc 1 21 3
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 23 3
	leaq	-32(%rbp), %rcx
	leaq	-200(%rbp), %rdx
	movsd	-168(%rbp), %xmm2
	movsd	-176(%rbp), %xmm1
	movsd	-184(%rbp), %xmm0
	movq	-192(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	SolveCubic@PLT
	.loc 1 24 3
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 25 8
	movl	$0, -196(%rbp)
	.loc 1 25 3
	jmp	.L2
.L3:
	.loc 1 26 5 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 25 24 discriminator 3
	addl	$1, -196(%rbp)
.L2:
	.loc 1 25 12 discriminator 1
	movl	-200(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jl	.L3
	.loc 1 27 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 29 3
	leaq	-32(%rbp), %rcx
	leaq	-200(%rbp), %rdx
	movsd	-128(%rbp), %xmm2
	movsd	-136(%rbp), %xmm1
	movsd	-144(%rbp), %xmm0
	movq	-152(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	SolveCubic@PLT
	.loc 1 30 3
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 31 8
	movl	$0, -196(%rbp)
	.loc 1 31 3
	jmp	.L4
.L5:
	.loc 1 32 5 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 31 24 discriminator 3
	addl	$1, -196(%rbp)
.L4:
	.loc 1 31 12 discriminator 1
	movl	-200(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jl	.L5
	.loc 1 33 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 34 3
	leaq	-32(%rbp), %rcx
	leaq	-200(%rbp), %rdx
	movsd	-96(%rbp), %xmm2
	movsd	-104(%rbp), %xmm1
	movsd	-112(%rbp), %xmm0
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	SolveCubic@PLT
	.loc 1 35 3
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 36 8
	movl	$0, -196(%rbp)
	.loc 1 36 3
	jmp	.L6
.L7:
	.loc 1 37 5 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 36 24 discriminator 3
	addl	$1, -196(%rbp)
.L6:
	.loc 1 36 12 discriminator 1
	movl	-200(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jl	.L7
	.loc 1 38 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 39 3
	leaq	-32(%rbp), %rcx
	leaq	-200(%rbp), %rdx
	movsd	-64(%rbp), %xmm2
	movsd	-72(%rbp), %xmm1
	movsd	-80(%rbp), %xmm0
	movq	-88(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	SolveCubic@PLT
	.loc 1 40 3
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 41 8
	movl	$0, -196(%rbp)
	.loc 1 41 3
	jmp	.L8
.L9:
	.loc 1 42 5 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 41 24 discriminator 3
	addl	$1, -196(%rbp)
.L8:
	.loc 1 41 12 discriminator 1
	movl	-200(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jl	.L9
	.loc 1 43 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 45 9
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -192(%rbp)
	.loc 1 45 3
	jmp	.L10
.L19:
	.loc 1 46 11
	movsd	.LC14(%rip), %xmm0
	movsd	%xmm0, -184(%rbp)
	.loc 1 46 5
	jmp	.L11
.L18:
	.loc 1 47 13
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -176(%rbp)
	.loc 1 47 7
	jmp	.L12
.L17:
	.loc 1 48 8
	movsd	.LC16(%rip), %xmm0
	movsd	%xmm0, -168(%rbp)
	.loc 1 48 2
	jmp	.L13
.L16:
	.loc 1 49 4
	leaq	-32(%rbp), %rcx
	leaq	-200(%rbp), %rdx
	movsd	-168(%rbp), %xmm2
	movsd	-176(%rbp), %xmm1
	movsd	-184(%rbp), %xmm0
	movq	-192(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	SolveCubic@PLT
	.loc 1 50 4
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 51 9
	movl	$0, -196(%rbp)
	.loc 1 51 4
	jmp	.L14
.L15:
	.loc 1 52 6 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 51 25 discriminator 3
	addl	$1, -196(%rbp)
.L14:
	.loc 1 51 13 discriminator 1
	movl	-200(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jl	.L15
	.loc 1 53 4 discriminator 2
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 48 21 discriminator 2
	movsd	-168(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -168(%rbp)
.L13:
	.loc 1 48 14 discriminator 1
	movsd	-168(%rbp), %xmm0
	comisd	.LC17(%rip), %xmm0
	ja	.L16
	.loc 1 47 24 discriminator 2
	movsd	-176(%rbp), %xmm1
	movsd	.LC18(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -176(%rbp)
.L12:
	.loc 1 47 18 discriminator 1
	movsd	.LC19(%rip), %xmm0
	comisd	-176(%rbp), %xmm0
	ja	.L17
	.loc 1 46 22 discriminator 2
	movsd	-184(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -184(%rbp)
.L11:
	.loc 1 46 17 discriminator 1
	movsd	-184(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	ja	.L18
	.loc 1 45 20 discriminator 2
	movsd	-192(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -192(%rbp)
.L10:
	.loc 1 45 14 discriminator 1
	movsd	.LC14(%rip), %xmm0
	comisd	-192(%rbp), %xmm0
	ja	.L19
	.loc 1 59 3
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 61 10
	movl	$0, -196(%rbp)
	.loc 1 61 3
	jmp	.L20
.L21:
	.loc 1 63 7 discriminator 3
	movl	-196(%rbp), %eax
	cltq
	leaq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	usqrt@PLT
	.loc 1 66 6 discriminator 3
	movl	-40(%rbp), %edx
	movl	-196(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 61 25 discriminator 3
	addl	$1, -196(%rbp)
.L20:
	.loc 1 61 17 discriminator 1
	cmpl	$1000, -196(%rbp)
	jle	.L21
	.loc 1 69 3
	leaq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	usqrt@PLT
	.loc 1 71 3
	movl	-40(%rbp), %edx
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 74 3
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 76 10
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -160(%rbp)
	.loc 1 76 3
	jmp	.L22
.L23:
	.loc 1 77 50 discriminator 3
	movsd	-160(%rbp), %xmm1
	movsd	.LC25(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 77 5 discriminator 3
	movsd	.LC26(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	-160(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 76 31 discriminator 3
	movsd	-160(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160(%rbp)
.L22:
	.loc 1 76 19 discriminator 1
	movsd	.LC28(%rip), %xmm0
	comisd	-160(%rbp), %xmm0
	jnb	.L23
	.loc 1 78 3
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 79 10
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -160(%rbp)
	.loc 1 79 3
	jmp	.L24
.L25:
	.loc 1 80 50 discriminator 3
	movsd	-160(%rbp), %xmm1
	movsd	.LC26(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 80 5 discriminator 3
	movsd	.LC25(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	-160(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 79 41 discriminator 3
	movsd	-160(%rbp), %xmm1
	movsd	.LC31(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160(%rbp)
.L24:
	.loc 1 79 19 discriminator 1
	movsd	.LC32(%rip), %xmm0
	comisd	-160(%rbp), %xmm0
	jnb	.L25
	.loc 1 83 10
	movl	$0, %eax
	.loc 1 84 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	-1071316992
	.align 8
.LC2:
	.long	0
	.long	1077936128
	.align 8
.LC3:
	.long	0
	.long	-1069678592
	.align 8
.LC4:
	.long	0
	.long	-1072562176
	.align 8
.LC5:
	.long	0
	.long	1076953088
	.align 8
.LC6:
	.long	0
	.long	-1072955392
	.align 8
.LC7:
	.long	0
	.long	1077280768
	.align 8
.LC8:
	.long	0
	.long	-1069613056
	.align 8
.LC9:
	.long	1717986918
	.long	-1070897562
	.align 8
.LC10:
	.long	0
	.long	-1069449216
	.align 8
.LC14:
	.long	0
	.long	1076101120
	.align 8
.LC15:
	.long	0
	.long	1075052544
	.align 8
.LC16:
	.long	0
	.long	-1074790400
	.align 8
.LC17:
	.long	0
	.long	-1071251456
	.align 8
.LC18:
	.long	0
	.long	1071644672
	.align 8
.LC19:
	.long	0
	.long	1076756480
	.align 8
.LC25:
	.long	1413754136
	.long	1074340347
	.align 8
.LC26:
	.long	0
	.long	1080459264
	.align 8
.LC28:
	.long	0
	.long	1081507840
	.align 8
.LC31:
	.long	-1571644103
	.long	1066524486
	.align 8
.LC32:
	.long	-1755313253
	.long	1075388923
	.text
.Letext0:
	.file 2 "snipmath.h"
	.file 3 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x290
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x8
	.long	.LASF20
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0xa
	.long	0x66
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x4
	.long	0x6d
	.uleb128 0xb
	.long	.LASF21
	.byte	0x8
	.byte	0x2
	.byte	0x43
	.byte	0x8
	.long	0xb7
	.uleb128 0x5
	.long	.LASF14
	.byte	0x44
	.long	0x3c
	.byte	0
	.uleb128 0x5
	.long	.LASF15
	.byte	0x45
	.long	0x3c
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.long	.LASF16
	.byte	0x48
	.byte	0x6
	.long	0xcd
	.uleb128 0x3
	.long	0x43
	.uleb128 0x3
	.long	0xcd
	.byte	0
	.uleb128 0x4
	.long	0x93
	.uleb128 0x6
	.long	.LASF17
	.byte	0x1b
	.byte	0x9
	.long	0xfc
	.uleb128 0x3
	.long	0x79
	.uleb128 0x3
	.long	0x79
	.uleb128 0x3
	.long	0x79
	.uleb128 0x3
	.long	0x79
	.uleb128 0x3
	.long	0xfc
	.uleb128 0x3
	.long	0x101
	.byte	0
	.uleb128 0x4
	.long	0x58
	.uleb128 0x4
	.long	0x79
	.uleb128 0xc
	.long	.LASF22
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.long	0x58
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x287
	.uleb128 0x1
	.string	"a1"
	.byte	0x8
	.byte	0xb
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1
	.string	"b1"
	.byte	0x8
	.byte	0x15
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1
	.string	"c1"
	.byte	0x8
	.byte	0x21
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1
	.string	"d1"
	.byte	0x8
	.byte	0x2c
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1
	.string	"a2"
	.byte	0x9
	.byte	0xb
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.string	"b2"
	.byte	0x9
	.byte	0x15
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1
	.string	"c2"
	.byte	0x9
	.byte	0x20
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.string	"d2"
	.byte	0x9
	.byte	0x2b
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.string	"a3"
	.byte	0xa
	.byte	0xb
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.string	"b3"
	.byte	0xa
	.byte	0x15
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.string	"c3"
	.byte	0xa
	.byte	0x20
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.string	"d3"
	.byte	0xa
	.byte	0x2b
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.string	"a4"
	.byte	0xb
	.byte	0xb
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.string	"b4"
	.byte	0xb
	.byte	0x15
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.string	"c4"
	.byte	0xb
	.byte	0x21
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.string	"d4"
	.byte	0xb
	.byte	0x2b
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.string	"x"
	.byte	0xc
	.byte	0xb
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.string	"X"
	.byte	0xd
	.byte	0xa
	.long	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0xe
	.byte	0xb
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1
	.string	"i"
	.byte	0xf
	.byte	0x7
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.uleb128 0x1
	.string	"l"
	.byte	0x10
	.byte	0x11
	.long	0x43
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.string	"q"
	.byte	0x11
	.byte	0x13
	.long	0x93
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.string	"n"
	.byte	0x12
	.byte	0x8
	.long	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.long	.LASF19
	.byte	0x3
	.byte	0
	.long	0x58
	.long	0x279
	.uleb128 0x3
	.long	0x8e
	.uleb128 0x7
	.byte	0
	.uleb128 0xf
	.long	.LASF23
	.byte	0x3
	.byte	0
	.long	0x58
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x79
	.uleb128 0x11
	.long	0x43
	.byte	0x2
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF17:
	.string	"SolveCubic"
.LASF20:
	.string	"GNU C17 11.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF10:
	.string	"float"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF11:
	.string	"double"
.LASF22:
	.string	"main"
.LASF4:
	.string	"unsigned int"
.LASF15:
	.string	"frac"
.LASF21:
	.string	"int_sqrt"
.LASF13:
	.string	"long long unsigned int"
.LASF12:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF19:
	.string	"printf"
.LASF7:
	.string	"short int"
.LASF18:
	.string	"solutions"
.LASF8:
	.string	"long int"
.LASF23:
	.string	"puts"
.LASF6:
	.string	"signed char"
.LASF16:
	.string	"usqrt"
.LASF14:
	.string	"sqrt"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"basicmath_small.c"
.LASF1:
	.string	"/home/mahsa/Documents/MiBench/automotive/basicmath"
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

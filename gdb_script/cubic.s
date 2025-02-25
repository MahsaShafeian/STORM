	.file	"cubic.c"
	.text
.Ltext0:
	.file 0 "/home/mahsa/Documents/MiBench/automotive/basicmath" "cubic.c"
	.globl	SolveCubic
	.type	SolveCubic, @function
SolveCubic:
.LFB6:
	.file 1 "cubic.c"
	.loc 1 18 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movsd	%xmm0, -104(%rbp)
	movsd	%xmm1, -112(%rbp)
	movsd	%xmm2, -120(%rbp)
	movsd	%xmm3, -128(%rbp)
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	.loc 1 19 28
	movsd	-112(%rbp), %xmm0
	divsd	-104(%rbp), %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 19 22
	fldl	-152(%rbp)
	fstpt	-80(%rbp)
	.loc 1 19 38
	movsd	-120(%rbp), %xmm0
	divsd	-104(%rbp), %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 19 32
	fldl	-152(%rbp)
	fstpt	-64(%rbp)
	.loc 1 19 48
	movsd	-128(%rbp), %xmm0
	divsd	-104(%rbp), %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 19 42
	fldl	-152(%rbp)
	fstpt	-48(%rbp)
	.loc 1 20 29
	fldt	-80(%rbp)
	fld	%st(0)
	fmulp	%st, %st(1)
	.loc 1 20 38
	fldt	-64(%rbp)
	fldt	.LC0(%rip)
	fmulp	%st, %st(1)
	.loc 1 20 33
	fsubrp	%st, %st(1)
	.loc 1 20 22
	fldt	.LC1(%rip)
	fdivrp	%st, %st(1)
	fstpt	-32(%rbp)
	.loc 1 21 27
	fldt	-80(%rbp)
	fld	%st(0)
	faddp	%st, %st(1)
	.loc 1 21 30
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	.loc 1 21 33
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	.loc 1 21 42
	fldt	-80(%rbp)
	fldt	.LC1(%rip)
	fmulp	%st, %st(1)
	.loc 1 21 45
	fldt	-64(%rbp)
	fmulp	%st, %st(1)
	.loc 1 21 37
	fsubrp	%st, %st(1)
	.loc 1 21 55
	fldt	-48(%rbp)
	fldt	.LC2(%rip)
	fmulp	%st, %st(1)
	.loc 1 21 49
	faddp	%st, %st(1)
	.loc 1 21 19
	fldt	.LC3(%rip)
	fdivrp	%st, %st(1)
	fstpt	-16(%rbp)
	.loc 1 22 26
	fldt	-16(%rbp)
	fld	%st(0)
	fmulp	%st, %st(1)
	.loc 1 22 32
	fldt	-32(%rbp)
	fld	%st(0)
	fmulp	%st, %st(1)
	.loc 1 22 34
	fldt	-32(%rbp)
	fmulp	%st, %st(1)
	.loc 1 22 29
	fsubrp	%st, %st(1)
	.loc 1 22 17
	fstpl	-96(%rbp)
	.loc 1 26 10
	pxor	%xmm0, %xmm0
	comisd	-96(%rbp), %xmm0
	jb	.L10
	.loc 1 28 24
	movq	-136(%rbp), %rax
	movl	$3, (%rax)
	.loc 1 29 34
	fldt	-32(%rbp)
	fld	%st(0)
	fmulp	%st, %st(1)
	.loc 1 29 36
	fldt	-32(%rbp)
	fmulp	%st, %st(1)
	.loc 1 29 28
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	sqrt@PLT
	movsd	%xmm0, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 29 27
	fldt	-16(%rbp)
	fdivp	%st, %st(1)
	.loc 1 29 21
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	acos@PLT
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	.loc 1 30 25
	fldt	-32(%rbp)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	sqrt@PLT
	.loc 1 30 24
	movsd	.LC5(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 30 33
	movsd	-88(%rbp), %xmm0
	movsd	.LC6(%rip), %xmm1
	movapd	%xmm0, %xmm5
	divsd	%xmm1, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	.loc 1 30 32
	movapd	%xmm0, %xmm6
	mulsd	-152(%rbp), %xmm6
	movsd	%xmm6, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 30 52
	fldt	-80(%rbp)
	fldt	.LC0(%rip)
	fdivrp	%st, %st(1)
	.loc 1 30 48
	fsubrp	%st, %st(1)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	.loc 1 30 18
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 31 25
	fldt	-32(%rbp)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	sqrt@PLT
	.loc 1 31 24
	movsd	.LC5(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 31 43
	movsd	-88(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	.loc 1 31 33
	movsd	.LC6(%rip), %xmm1
	movapd	%xmm0, %xmm3
	divsd	%xmm1, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	.loc 1 31 32
	movapd	%xmm0, %xmm4
	mulsd	-152(%rbp), %xmm4
	movsd	%xmm4, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 31 61
	fldt	-80(%rbp)
	fldt	.LC0(%rip)
	fdivrp	%st, %st(1)
	.loc 1 31 57
	fsubrp	%st, %st(1)
	.loc 1 31 14
	movq	-144(%rbp), %rax
	addq	$8, %rax
	.loc 1 31 57
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	.loc 1 31 18
	movsd	%xmm0, (%rax)
	.loc 1 32 25
	fldt	-32(%rbp)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	sqrt@PLT
	.loc 1 32 24
	movsd	.LC5(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 32 43
	movsd	-88(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	addsd	%xmm1, %xmm0
	.loc 1 32 33
	movsd	.LC6(%rip), %xmm1
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	cos@PLT
	.loc 1 32 32
	movapd	%xmm0, %xmm5
	mulsd	-152(%rbp), %xmm5
	movsd	%xmm5, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 32 61
	fldt	-80(%rbp)
	fldt	.LC0(%rip)
	fdivrp	%st, %st(1)
	.loc 1 32 57
	fsubrp	%st, %st(1)
	.loc 1 32 14
	movq	-144(%rbp), %rax
	addq	$16, %rax
	.loc 1 32 57
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	.loc 1 32 18
	movsd	%xmm0, (%rax)
	.loc 1 42 1
	jmp	.L12
.L10:
	.loc 1 36 24
	movq	-136(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 37 24
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	.loc 1 37 36
	fldt	-16(%rbp)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm2
	movq	.LC9(%rip), %xmm1
	andpd	%xmm2, %xmm1
	.loc 1 37 20
	addsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movsd	.LC10(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	.loc 1 37 18
	movq	-144(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 38 18
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm6
	movsd	%xmm6, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 38 24
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm3
	movsd	%xmm3, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 38 22
	fldt	-32(%rbp)
	fdivp	%st, %st(1)
	.loc 1 38 18
	faddp	%st, %st(1)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 39 18
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm1
	fldt	-16(%rbp)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L11
	.loc 1 39 18 is_stmt 0 discriminator 1
	movsd	.LC12(%rip), %xmm0
	jmp	.L7
.L11:
	.loc 1 39 18 discriminator 2
	movsd	.LC13(%rip), %xmm0
.L7:
	.loc 1 39 18 discriminator 4
	mulsd	%xmm1, %xmm0
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 40 18 is_stmt 1 discriminator 4
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm7
	movsd	%xmm7, -152(%rbp)
	fldl	-152(%rbp)
	.loc 1 40 23 discriminator 4
	fldt	-80(%rbp)
	fldt	.LC0(%rip)
	fdivrp	%st, %st(1)
	.loc 1 40 18 discriminator 4
	fsubrp	%st, %st(1)
	fstpl	-152(%rbp)
	movsd	-152(%rbp), %xmm0
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax)
.L12:
	.loc 1 42 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	SolveCubic, .-SolveCubic
	.section	.rodata
	.align 16
.LC0:
	.long	0
	.long	-1073741824
	.long	16384
	.long	0
	.align 16
.LC1:
	.long	0
	.long	-1879048192
	.long	16386
	.long	0
	.align 16
.LC2:
	.long	0
	.long	-671088640
	.long	16387
	.long	0
	.align 16
.LC3:
	.long	0
	.long	-671088640
	.long	16388
	.long	0
	.align 8
.LC5:
	.long	0
	.long	-1073741824
	.align 8
.LC6:
	.long	0
	.long	1074266112
	.align 8
.LC7:
	.long	1413754136
	.long	1075388923
	.align 8
.LC8:
	.long	1413754136
	.long	1076437499
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC10:
	.long	1431655765
	.long	1070945621
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.align 8
.LC13:
	.long	0
	.long	-1074790400
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1b4
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.long	.LASF10
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.string	"pow"
	.byte	0x8c
	.long	0x74
	.long	0xa2
	.uleb128 0x2
	.long	0x74
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0x5
	.string	"cos"
	.byte	0x3e
	.long	0x74
	.long	0xb6
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0x6
	.long	.LASF14
	.byte	0x35
	.long	0x74
	.long	0xca
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0x6
	.long	.LASF15
	.byte	0x8f
	.long	0x74
	.long	0xde
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0xb
	.long	.LASF21
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a6
	.uleb128 0x3
	.string	"a"
	.byte	0xc
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x3
	.string	"b"
	.byte	0xd
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x3
	.string	"c"
	.byte	0xe
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x3
	.string	"d"
	.byte	0xf
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xc
	.long	.LASF16
	.byte	0x1
	.byte	0x10
	.byte	0x19
	.long	0x1a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x3
	.string	"x"
	.byte	0x11
	.long	0x1ab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x4
	.string	"a1"
	.byte	0x13
	.byte	0x16
	.long	0x1b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x4
	.string	"a2"
	.byte	0x13
	.byte	0x20
	.long	0x1b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.string	"a3"
	.byte	0x13
	.byte	0x2a
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.string	"Q"
	.byte	0x14
	.byte	0x16
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.string	"R"
	.byte	0x15
	.byte	0x13
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.long	.LASF17
	.byte	0x16
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x7
	.long	.LASF18
	.byte	0x18
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x8
	.long	0x58
	.uleb128 0x8
	.long	0x74
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF19
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 25
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x5
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
.LASF18:
	.string	"theta"
.LASF21:
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
.LASF17:
	.string	"R2_Q3"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF14:
	.string	"acos"
.LASF12:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF7:
	.string	"short int"
.LASF16:
	.string	"solutions"
.LASF8:
	.string	"long int"
.LASF19:
	.string	"long double"
.LASF6:
	.string	"signed char"
.LASF15:
	.string	"sqrt"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"cubic.c"
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

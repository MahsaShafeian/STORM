	.file	"isqrt.c"
	.text
.Ltext0:
	.file 0 "/home/mahsa/Documents/MiBench/automotive/basicmath" "isqrt.c"
	.globl	usqrt
	.type	usqrt, @function
usqrt:
.LFB6:
	.file 1 "isqrt.c"
	.loc 1 46 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 1 46 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 47 21
	movq	$0, -32(%rbp)
	.loc 1 48 21
	movq	$0, -24(%rbp)
	.loc 1 49 21
	movq	$0, -16(%rbp)
	.loc 1 53 14
	movl	$0, -36(%rbp)
	.loc 1 53 7
	jmp	.L2
.L4:
	.loc 1 55 20
	movq	-24(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	.loc 1 55 28
	movq	-56(%rbp), %rax
	shrq	$30, %rax
	andl	$3, %eax
	.loc 1 55 15
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 55 43
	salq	$2, -56(%rbp)
	.loc 1 56 15
	movq	-32(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, -32(%rbp)
	.loc 1 57 20
	movq	-32(%rbp), %rax
	addq	%rax, %rax
	.loc 1 57 15
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	.loc 1 58 16
	movq	-24(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.L3
	.loc 1 60 21
	movq	-16(%rbp), %rax
	subq	%rax, -24(%rbp)
	.loc 1 61 20
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
.L3:
	.loc 1 53 37 discriminator 2
	addl	$1, -36(%rbp)
.L2:
	.loc 1 53 21 discriminator 1
	cmpl	$31, -36(%rbp)
	jle	.L4
	movq	-32(%rbp), %rdx
	.loc 1 64 7
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 65 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	usqrt, .-usqrt
.Letext0:
	.file 2 "snipmath.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x117
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x5
	.long	.LASF16
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
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
	.uleb128 0x7
	.long	.LASF17
	.byte	0x8
	.byte	0x2
	.byte	0x43
	.byte	0x8
	.long	0xad
	.uleb128 0x3
	.long	.LASF14
	.byte	0x44
	.long	0x51
	.byte	0
	.uleb128 0x3
	.long	.LASF15
	.byte	0x45
	.long	0x51
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.long	.LASF18
	.byte	0x1
	.byte	0x2d
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x114
	.uleb128 0x4
	.string	"x"
	.byte	0x1a
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.string	"q"
	.byte	0x2e
	.long	0x114
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.string	"a"
	.byte	0x2f
	.byte	0x15
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"r"
	.byte	0x30
	.byte	0x15
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"e"
	.byte	0x31
	.byte	0x15
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"i"
	.byte	0x33
	.byte	0xb
	.long	0x3c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.long	0x89
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 45
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
.LASF6:
	.string	"unsigned int"
.LASF18:
	.string	"usqrt"
.LASF14:
	.string	"sqrt"
.LASF2:
	.string	"long unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF10:
	.string	"float"
.LASF17:
	.string	"int_sqrt"
.LASF5:
	.string	"unsigned char"
.LASF4:
	.string	"char"
.LASF9:
	.string	"long int"
.LASF11:
	.string	"double"
.LASF12:
	.string	"long long int"
.LASF3:
	.string	"short unsigned int"
.LASF7:
	.string	"signed char"
.LASF15:
	.string	"frac"
.LASF16:
	.string	"GNU C17 11.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF8:
	.string	"short int"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"isqrt.c"
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

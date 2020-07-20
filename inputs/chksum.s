	.arch armv6
	.text
.Ltext0:
	.global	N
	.data
	.align	2
	.type	N, %object
	.size	N, 256
N:
	.ascii	"Y\3508\354)\004\336\272\026\264:#\0200_\264\022;\031"
	.ascii	"\370\012N\302\3557\036\015\012T\266\331\346\235\020"
	.ascii	"\322\307\025\260G++\272N;\353\347\357\375!\010\365,"
	.ascii	"V\266\031\306\325'\320(\335\251\015A\271\340\007\316"
	.ascii	"VN\371\272\010G\365\363.\344\360P\354\344\265Aa\317"
	.ascii	"\0075\366\330^\323G\245\023\000K\033\316\332\242\307"
	.ascii	"Z\253\016O\236<2U\305\0358A_\323\020\237\010\006=\237"
	.ascii	"\331\276\013\355\275V\007R/\252\030\303\033&\021\272"
	.ascii	"cC\016(aF\243\372\031\263`!\271\327\301Y[\314E\030!"
	.ascii	"L\243Q\366\273\023\021\342%\313E\242\331\246\002\037"
	.ascii	"\017\3758\303\\ZB2\033\325\306\347\031\336\010\236H"
	.ascii	"Z[\002\247\245\345\3146)4\017\3207.\3373\240\241\310"
	.ascii	"\373\344\373\025\270\300\375\322\236\0046\346_\313\351"
	.ascii	"\0056\316\321\246\367\005\266\306<\345\245\251L\015"
	.ascii	"7F\3621\\\252\362XBW]\262<\365C"
	.text
	.align	1
	.global	calc_checksum
	.syntax unified
	.code	16
	.thumb_func
	.type	calc_checksum, %function
calc_checksum:
.LFB0:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7]
	subs	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	pop	{r7, pc}
.LFE0:
	.size	calc_checksum, .-calc_checksum
	.align	1
	.global	main
	.syntax unified
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB1:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #128
	lsls	r3, r3, #1
	ldr	r2, .L7
.LPIC0:
	add	r2, pc
	movs	r1, r3
	movs	r0, r2
	bl	calc_checksum
	movs	r3, r0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	N-(.LPIC0+4)
.LFE1:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xd6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0xc
	.4byte	.LASF8
	.4byte	.LASF9
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	0x3c
	.4byte	0x35
	.uleb128 0x3
	.4byte	0x35
	.byte	0xff
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.ascii	"N\000"
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	0x25
	.uleb128 0x5
	.byte	0x3
	.4byte	N
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x21
	.byte	0x5
	.4byte	0x7d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x23
	.byte	0xf
	.4byte	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x9
	.4byte	.LASF3
	.byte	0x1
	.byte	0x13
	.byte	0xf
	.4byte	0xcc
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcc
	.uleb128 0xa
	.4byte	.LASF4
	.byte	0x1
	.byte	0x14
	.byte	0x9
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.ascii	"len\000"
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.4byte	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x17
	.byte	0xf
	.4byte	0x35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF0:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"start_addr\000"
.LASF9:
.LASF7:
.LASF8:
.LASF6:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"checksum\000"
.LASF2:
	.ascii	"main\000"
.LASF3:
	.ascii	"calc_checksum\000"
.LASF1:
	.ascii	"char\000"

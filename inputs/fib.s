	.arch armv6
	.fpu softvfp
	.code	16
	.file	"fib.c"
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, #0
	str	r3, [r7, #12]
	mov	r3, #1
	str	r3, [r7, #8]
	mov	r3, #0
	str	r3, [r7, #4]
	mov	r3, #0
	str	r3, [r7]
	b	.L2
.L3:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	str	r3, [r7, #8]
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #9
	ble	.L3
	ldr	r3, [r7, #4]
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main

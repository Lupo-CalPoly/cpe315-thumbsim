	.arch armv6
	.fpu softvfp
	.code	16
	.file	"shang.c"
	.text
	.align	2
	.global	initGame
	.code	16
	.thumb_func
	.type	initGame, %function
initGame:
	push	{r4, r5, r6, r7, lr}
	mov	r7, #210
	mov	r6, #0
	lsl	r7, r7, #2
.L2:
	mov	r3, #0
	add	r5, r0, r6
	add	r4, r1, r6
.L5:
	ldrb	r2, [r5, r3]
	strb	r2, [r4, r3]
	add	r3, r3, #1
	cmp	r3, #21
	bne	.L5
	add	r6, r6, #21
	cmp	r6, r7
	bne	.L2
	mov	r3, #210
	lsl	r3, r3, #2
	add	r4, r0, r3
	add	r2, r1, r3
	mov	r3, #20
.L7:
	ldmia	r4!, {r5}
	sub	r3, r3, #1
	stmia	r2!, {r5}
	cmp	r3, #0
	bne	.L7
	mov	r3, #230
	lsl	r3, r3, #2
	add	r0, r0, r3
	add	r2, r1, r3
	mov	r3, #40
.L9:
	ldmia	r0!, {r1}
	sub	r3, r3, #1
	stmia	r2!, {r1}
	cmp	r3, #0
	bne	.L9
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.code	16
	.thumb_func
	.type	my_strncmp, %function
my_strncmp:
	push	{r4, r5, lr}
	cmp	r2, #0
	ble	.L15
	ldrb	r4, [r0]
	ldrb	r3, [r1]
	cmp	r4, r3
	bcc	.L18
	bhi	.L19
	mov	r3, #0
	b	.L13
.L14:
	ldrb	r5, [r0, r3]
	ldrb	r4, [r1, r3]
	cmp	r5, r4
	bcc	.L18
	bhi	.L19
.L13:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L14
.L15:
	mov	r0, #0
.L12:
	@ sp needed
	pop	{r4, r5, pc}
.L18:
	mov	r0, #1
	neg	r0, r0
	b	.L12
.L19:
	mov	r0, #1
	b	.L12
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.code	16
	.thumb_func
	.type	my_strcpy, %function
my_strcpy:
	ldrb	r2, [r1]
	mov	r3, #0
	push	{lr}
.L22:
	strb	r2, [r0, r3]
	add	r3, r3, #1
	ldrb	r2, [r1, r3]
	cmp	r2, #0
	bne	.L22
	@ sp needed
	pop	{pc}
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.code	16
	.thumb_func
	.type	CheckConstraint, %function
CheckConstraint:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	ldr	r4, .L43
	push	{r6, r7}
	add	sp, sp, r4
	add	r2, sp, #168
	mov	r8, r0
	mov	r7, r0
	mov	ip, r2
	add	r0, r0, #20
	mov	r5, r2
.L24:
	mov	r3, #210
	lsl	r3, r3, #1
	add	r6, r7, r3
	mov	r2, r5
	mov	r3, r7
.L27:
	ldrb	r4, [r3]
	add	r3, r3, #21
	strb	r4, [r2]
	add	r2, r2, #1
	cmp	r3, r6
	bne	.L27
	add	r7, r7, #1
	add	r5, r5, #20
	cmp	r7, r0
	bne	.L24
	mov	r3, #230
	lsl	r3, r3, #2
	mov	r2, r3
	add	r2, r2, r8
	add	r3, sp, #8
.L29:
	ldmia	r2!, {r0}
	stmia	r3!, {r0}
	cmp	ip, r3
	bne	.L29
	mov	r3, #200
	lsl	r3, r3, #1
	ldr	r2, .L43+4
	mov	r8, r3
	mov	r3, #0
	add	r8, r8, ip
	mov	r5, ip
	mov	r9, r2
	mov	ip, r3
.L37:
	mov	r4, r9
	mov	r6, #0
.L36:
	lsl	r7, r6, #2
	add	r2, sp, #8
	ldr	r2, [r2, r7]
	cmp	r2, #0
	beq	.L30
	cmp	r1, #0
	blt	.L31
	ldrb	r2, [r4]
	ldrb	r3, [r5]
	cmp	r2, r3
	bne	.L30
	mov	r3, #0
	b	.L32
.L33:
	ldrb	r0, [r4, r3]
	ldrb	r2, [r5, r3]
	cmp	r0, r2
	bne	.L30
.L32:
	add	r3, r3, #1
	cmp	r1, r3
	bge	.L33
.L31:
	add	r2, sp, #8
	mov	r3, ip
	add	r5, r5, #20
	str	r3, [r2, r7]
	cmp	r5, r8
	bne	.L37
	mov	r0, #1
.L42:
	mov	r3, #143
	lsl	r3, r3, #2
	add	sp, sp, r3
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r4, r5, r6, r7, pc}
.L30:
	add	r6, r6, #1
	add	r4, r4, #21
	cmp	r6, #40
	bne	.L36
	mov	r0, #0
	b	.L42
.L44:
	.align	2
.L43:
	.word	-572
	.word	.LANCHOR0
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.code	16
	.thumb_func
	.type	SolveGame, %function
SolveGame:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r10
	mov	r5, r8
	mov	r6, r9
	ldr	r4, .L62
	push	{r5, r6, r7}
	mov	r8, r0
	add	sp, sp, r4
	sub	r7, r1, #0
	cmp	r7, #20
	beq	.L53
	mov	r2, #230
	lsl	r3, r1, #1
	add	r3, r3, r1
	lsl	r2, r2, #2
	mov	r6, r2
	mov	r9, r3
	lsl	r3, r3, #3
	add	r6, r6, r8
	ldr	r4, .L62+4
	mov	r5, #0
	mov	r10, r3
	b	.L52
.L47:
	add	r5, r5, #1
	add	r6, r6, #4
	add	r4, r4, #21
	cmp	r5, #40
	beq	.L61
.L52:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L47
	mov	r1, sp
	mov	r0, r8
	bl	initGame
	mov	r3, r7
	add	r3, r3, #210
	lsl	r3, r3, #2
	mov	r2, sp
	str	r5, [r2, r3]
	add	r2, sp, #0
	lsl	r3, r5, #2
	add	r3, r2, r3
	mov	r2, #230
	lsl	r2, r2, #2
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3]
	mov	r3, r10
	mov	r2, r9
	sub	r1, r3, r2
	ldrb	r2, [r4]
	add	r3, sp, #0
	add	r1, r3, r1
	mov	r3, #0
.L49:
	strb	r2, [r1, r3]
	add	r3, r3, #1
	ldrb	r2, [r4, r3]
	cmp	r2, #0
	bne	.L49
	mov	r0, sp
	mov	r1, r7
	bl	CheckConstraint
	cmp	r0, #0
	beq	.L47
	add	r1, r7, #1
	mov	r0, sp
	bl	SolveGame
	cmp	r0, #0
	beq	.L47
.L53:
	mov	r0, #1
	b	.L46
.L61:
	mov	r0, #0
.L46:
	mov	r3, #135
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L63:
	.align	2
.L62:
	.word	-1080
	.word	.LANCHOR0
	.size	SolveGame, .-SolveGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
	push	{r7, lr}
	mov	r2, #1
	ldr	r7, .L67
	add	sp, sp, r7
	add	r1, sp, #1020
	add	r3, sp, #920
	add	r1, r1, #60
.L66:
	stmia	r3!, {r2}
	cmp	r3, r1
	bne	.L66
	mov	r0, sp
	mov	r1, #0
	bl	SolveGame
	mov	r3, #135
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r7, pc}
.L68:
	.align	2
.L67:
	.word	-1080
	.size	main, .-main
	.global	g_mainSetting
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	g_mainSetting, %object
	.size	g_mainSetting, 840
g_mainSetting:
	.ascii	"                   *\000"
	.ascii	"                  **\000"
	.ascii	"       *     *  *   \000"
	.ascii	"           *   ***  \000"
	.ascii	"*   *          *  * \000"
	.ascii	"           **    * *\000"
	.ascii	"  * **  *     *     \000"
	.ascii	"            *****   \000"
	.ascii	"   **    *   * *    \000"
	.ascii	"          * *   *** \000"
	.ascii	" * *   *   *  *     \000"
	.ascii	"      **    * *  *  \000"
	.ascii	"  *  *  *     * *   \000"
	.ascii	"          *  *  ** *\000"
	.ascii	" ***   *         *  \000"
	.ascii	" *  * * *   * *     \000"
	.ascii	"   **  * *    * *   \000"
	.ascii	"  *****           * \000"
	.ascii	"  *  *   * **  *    \000"
	.ascii	"    *  *  * * * *   \000"
	.ascii	"         * ***   ** \000"
	.ascii	"     ** *  *   * *  \000"
	.ascii	"        *** * *   * \000"
	.ascii	"  ***   *  *  *     \000"
	.ascii	"       *  ** * *  * \000"
	.ascii	"   ** * * *  * *    \000"
	.ascii	"    *  *  * *** *   \000"
	.ascii	"*****         *    *\000"
	.ascii	"   **    * * ***    \000"
	.ascii	"*  * * ***    *     \000"
	.ascii	"         ***  ** * *\000"
	.ascii	"     ** *   ** * *  \000"
	.ascii	"***   * *      ***  \000"
	.ascii	"      **   ** *** * \000"
	.ascii	" * * **  *** *      \000"
	.ascii	"* *** ***   **      \000"
	.ascii	"        *** * ** ***\000"
	.ascii	" **** **       ***  \000"
	.ascii	"**   *** *   **  ** \000"
	.ascii	"*   * * *****  **  *\000"

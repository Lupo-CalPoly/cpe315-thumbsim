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
	mov	r2, #0
	mov	r7, #0
	mov	r6, #210
	lsl	r6, r6, #2
	b	.L2
.L5:
	add	r4, r0, r2
	ldrb	r5, [r4, r3]
	add	r4, r1, r2
	strb	r5, [r4, r3]
	add	r3, r3, #1
	cmp	r3, #21
	bne	.L5
	add	r2, r2, #21
	cmp	r2, r6
	beq	.L4
.L2:
	mov	r3, r7
	b	.L5
.L4:
	mov	r3, #210
	lsl	r3, r3, #2
	add	r4, r0, r3
	add	r2, r1, r3
	mov	r3, #20
.L7:
	ldmia	r4!, {r5}
	stmia	r2!, {r5}
	sub	r3, r3, #1
	cmp	r3, #0
	bne	.L7
	mov	r3, #230
	lsl	r3, r3, #2
	add	r0, r0, r3
	add	r1, r1, r3
	mov	r3, #0
.L9:
	ldmia	r0!, {r2}
	stmia	r1!, {r2}
	add	r3, r3, #1
	cmp	r3, #40
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
	ble	.L14
	ldrb	r4, [r0]
	ldrb	r3, [r1]
	cmp	r4, r3
	bcc	.L15
	bhi	.L16
	mov	r3, #0
	b	.L12
.L13:
	ldrb	r5, [r0, r3]
	ldrb	r4, [r1, r3]
	cmp	r5, r4
	bcc	.L17
	bhi	.L18
.L12:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L13
	mov	r0, #0
	b	.L11
.L14:
	mov	r0, #0
	b	.L11
.L15:
	mov	r0, #1
	neg	r0, r0
	b	.L11
.L16:
	mov	r0, #1
	b	.L11
.L17:
	mov	r0, #1
	neg	r0, r0
	b	.L11
.L18:
	mov	r0, #1
.L11:
	@ sp needed
	pop	{r4, r5, pc}
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.code	16
	.thumb_func
	.type	my_strcpy, %function
my_strcpy:
	push	{lr}
	mov	r3, #0
.L21:
	ldrb	r2, [r1, r3]
	strb	r2, [r0, r3]
	add	r3, r3, #1
	ldrb	r2, [r1, r3]
	cmp	r2, #0
	bne	.L21
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
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r4, .L37
	add	sp, sp, r4
	mov	ip, r0
	mov	r6, r0
	add	r0, r0, #20
	add	r7, sp, #160
	b	.L23
.L26:
	ldrb	r4, [r3]
	strb	r4, [r2]
	add	r3, r3, #21
	add	r2, r2, #1
	cmp	r3, r5
	bne	.L26
	add	r6, r6, #1
	add	r7, r7, #20
	cmp	r6, r0
	beq	.L25
.L23:
	mov	r2, #210
	lsl	r2, r2, #1
	add	r5, r6, r2
	mov	r2, r7
	mov	r3, r6
	b	.L26
.L25:
	mov	r3, #230
	lsl	r3, r3, #2
	mov	r2, r3
	add	r2, r2, ip
	mov	r3, sp
	add	r4, sp, #160
.L29:
	ldmia	r2!, {r0}
	stmia	r3!, {r0}
	cmp	r3, r4
	bne	.L29
	add	r2, sp, #160
	mov	r10, r2
	mov	r2, #200
	lsl	r2, r2, #1
	add	r10, r10, r2
	add	r6, sp, #160
	ldr	r3, .L37+4
	mov	r9, r3
	mov	r2, #0
	mov	r8, r2
	add	r7, r1, #1
	b	.L28
.L34:
	lsl	r3, r4, #2
	mov	r1, sp
	ldr	r3, [r3, r1]
	cmp	r3, #0
	beq	.L30
	mov	r0, r5
	mov	r1, r6
	mov	r2, r7
	bl	my_strncmp
	cmp	r0, #0
	bne	.L30
	lsl	r3, r4, #2
	mov	r1, r8
	mov	r2, sp
	str	r1, [r3, r2]
	cmp	r4, #39
	ble	.L36
	b	.L31
.L30:
	add	r4, r4, #1
	add	r5, r5, #21
	cmp	r4, #40
	bne	.L34
	mov	r0, #0
	b	.L31
.L36:
	add	r6, r6, #20
	cmp	r6, r10
	beq	.L35
.L28:
	mov	r5, r9
	mov	r4, r8
	b	.L34
.L35:
	mov	r0, #1
.L31:
	mov	r3, #140
	lsl	r3, r3, #2
	add	sp, sp, r3
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L38:
	.align	2
.L37:
	.word	-560
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
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r4, .L47
	add	sp, sp, r4
	mov	r8, r0
	sub	r7, r1, #0
	cmp	r7, #20
	beq	.L45
	mov	r2, #230
	lsl	r2, r2, #2
	mov	r5, r2
	add	r5, r5, r8
	ldr	r6, .L47+4
	mov	r4, #0
	lsl	r3, r1, #1
	add	r3, r3, r1
	mov	r9, r3
	lsl	r3, r3, #3
	mov	r10, r3
.L44:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L41
	mov	r0, r8
	mov	r1, sp
	bl	initGame
	mov	r3, r7
	add	r3, r3, #210
	lsl	r3, r3, #2
	mov	r2, sp
	str	r4, [r3, r2]
	lsl	r3, r4, #2
	add	r2, sp, #0
	add	r3, r2, r3
	mov	r2, #230
	lsl	r2, r2, #2
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3]
	mov	r3, r10
	mov	r2, r9
	sub	r0, r3, r2
	add	r3, sp, #0
	add	r0, r3, r0
	mov	r1, r6
	bl	my_strcpy
	mov	r0, sp
	mov	r1, r7
	bl	CheckConstraint
	cmp	r0, #0
	beq	.L41
	add	r1, r7, #1
	mov	r0, sp
	bl	SolveGame
	cmp	r0, #0
	beq	.L41
	mov	r0, #1
	b	.L40
.L41:
	add	r4, r4, #1
	add	r5, r5, #4
	add	r6, r6, #21
	cmp	r4, #40
	bne	.L44
	b	.L46
.L45:
	mov	r0, #1
	b	.L40
.L46:
	mov	r0, #0
.L40:
	mov	r3, #135
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L48:
	.align	2
.L47:
	.word	-1080
	.word	.LANCHOR0
	.size	SolveGame, .-SolveGame
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
	push	{r7, lr}
	ldr	r7, .L52
	add	sp, sp, r7
	add	r3, sp, #920
	add	r1, sp, #1020
	add	r1, r1, #60
	mov	r2, #1
.L51:
	stmia	r3!, {r2}
	cmp	r3, r1
	bne	.L51
	mov	r0, sp
	mov	r1, #0
	bl	SolveGame
	mov	r3, #135
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r7, pc}
.L53:
	.align	2
.L52:
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

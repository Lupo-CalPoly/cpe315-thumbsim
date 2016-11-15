	.arch armv6
	.fpu softvfp
	.code	16
	.file	"shang.c"
	.global	g_mainSetting
	.data
	.align	2
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
	.text
	.align	2
	.global	initGame
	.code	16
	.thumb_func
	.type	initGame, %function
initGame:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L3
.L4:
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	ldrb	r0, [r3, r1]
	ldr	r1, [r7]
	ldr	r2, [r7, #12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	add	r2, r0, #0
	strb	r2, [r3, r1]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L3:
	ldr	r3, [r7, #8]
	cmp	r3, #20
	ble	.L4
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #39
	ble	.L5
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L6
.L7:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r2, #210
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	add	r2, r2, #210
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L6:
	ldr	r3, [r7, #12]
	cmp	r3, #19
	ble	.L7
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L8
.L9:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	add	r2, r2, #230
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	add	r2, r2, #230
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L8:
	ldr	r3, [r7, #12]
	cmp	r3, #39
	ble	.L9
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.code	16
	.thumb_func
	.type	my_strncmp, %function
my_strncmp:
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	mov	r3, #0
	str	r3, [r7, #16]
	mov	r3, #0
	str	r3, [r7, #20]
	b	.L11
.L15:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r1, [r7, #8]
	add	r3, r1, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	bcs	.L12
	mov	r3, #1
	neg	r3, r3
	str	r3, [r7, #16]
	b	.L13
.L12:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r1, [r7, #8]
	add	r3, r1, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	bls	.L14
	mov	r3, #1
	str	r3, [r7, #16]
	b	.L13
.L14:
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L11:
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L15
.L13:
	ldr	r3, [r7, #16]
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.code	16
	.thumb_func
	.type	my_strcpy, %function
my_strcpy:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	mov	r3, #0
	str	r3, [r7, #12]
.L18:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r2, r3
	ldr	r2, [r7, #12]
	ldr	r1, [r7]
	add	r2, r1, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	add	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L18
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.code	16
	.thumb_func
	.type	CheckConstraint, %function
CheckConstraint:
	push	{r4, r7, lr}
	ldr	r4, .L36
	add	sp, sp, r4
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	mov	r3, #0
	mov	r0, #143
	lsl	r0, r0, #2
	add	r0, r0, r7
	str	r3, [r0]
	b	.L20
.L23:
	mov	r3, #0
	mov	r1, #142
	lsl	r1, r1, #2
	add	r1, r1, r7
	str	r3, [r1]
	b	.L21
.L22:
	ldr	r1, [r7, #4]
	mov	r3, #142
	lsl	r3, r3, #2
	add	r3, r3, r7
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r2, r3
	ldrb	r0, [r3, r1]
	ldr	r3, .L36+4
	mov	r2, #144
	lsl	r2, r2, #2
	add	r2, r2, r7
	add	r1, r2, r3
	mov	r3, #143
	lsl	r3, r3, #2
	add	r3, r3, r7
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r4, #142
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r2, [r4]
	add	r3, r3, r2
	add	r2, r0, #0
	strb	r2, [r3, r1]
	mov	r0, #142
	lsl	r0, r0, #2
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #142
	lsl	r1, r1, #2
	add	r1, r1, r7
	str	r3, [r1]
.L21:
	mov	r2, #142
	lsl	r2, r2, #2
	add	r2, r2, r7
	ldr	r3, [r2]
	cmp	r3, #19
	ble	.L22
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #143
	lsl	r0, r0, #2
	add	r0, r0, r7
	str	r3, [r0]
.L20:
	mov	r1, #143
	lsl	r1, r1, #2
	add	r1, r1, r7
	ldr	r3, [r1]
	cmp	r3, #19
	ble	.L23
	mov	r3, #0
	mov	r2, #143
	lsl	r2, r2, #2
	add	r2, r2, r7
	str	r3, [r2]
	b	.L24
.L25:
	ldr	r3, [r7, #4]
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r2, [r4]
	add	r2, r2, #230
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	ldr	r3, .L36+8
	mov	r0, #144
	lsl	r0, r0, #2
	add	r0, r0, r7
	add	r3, r0, r3
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r2, [r4]
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	mov	r0, #143
	lsl	r0, r0, #2
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #143
	lsl	r1, r1, #2
	add	r1, r1, r7
	str	r3, [r1]
.L24:
	mov	r2, #143
	lsl	r2, r2, #2
	add	r2, r2, r7
	ldr	r3, [r2]
	cmp	r3, #39
	ble	.L25
	mov	r3, #0
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	str	r3, [r4]
	b	.L26
.L34:
	mov	r3, #0
	mov	r0, #142
	lsl	r0, r0, #2
	add	r0, r0, r7
	str	r3, [r0]
	b	.L27
.L31:
	ldr	r3, .L36+8
	mov	r1, #144
	lsl	r1, r1, #2
	add	r1, r1, r7
	add	r3, r1, r3
	mov	r4, #142
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r2, [r4]
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L28
	b	.L29
.L28:
	mov	r0, #142
	lsl	r0, r0, #2
	add	r0, r0, r7
	ldr	r2, [r0]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	ldr	r3, .L36+12
	add	r1, r2, r3
	mov	r0, r7
	add	r0, r0, #168
	mov	r3, #143
	lsl	r3, r3, #2
	add	r3, r3, r7
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r2, r0, r3
	ldr	r3, [r7]
	add	r3, r3, #1
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	my_strncmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L29
	ldr	r3, .L36+8
	mov	r4, #144
	lsl	r4, r4, #2
	add	r4, r4, r7
	add	r3, r4, r3
	mov	r0, #142
	lsl	r0, r0, #2
	add	r0, r0, r7
	ldr	r2, [r0]
	lsl	r2, r2, #2
	mov	r1, #0
	str	r1, [r2, r3]
	b	.L30
.L29:
	mov	r1, #142
	lsl	r1, r1, #2
	add	r1, r1, r7
	ldr	r3, [r1]
	add	r3, r3, #1
	mov	r2, #142
	lsl	r2, r2, #2
	add	r2, r2, r7
	str	r3, [r2]
.L27:
	mov	r4, #142
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r3, [r4]
	cmp	r3, #39
	ble	.L31
.L30:
	mov	r0, #142
	lsl	r0, r0, #2
	add	r0, r0, r7
	ldr	r3, [r0]
	cmp	r3, #39
	ble	.L32
	mov	r3, #0
	b	.L35
.L32:
	mov	r1, #143
	lsl	r1, r1, #2
	add	r1, r1, r7
	ldr	r3, [r1]
	add	r3, r3, #1
	mov	r2, #143
	lsl	r2, r2, #2
	add	r2, r2, r7
	str	r3, [r2]
.L26:
	mov	r4, #143
	lsl	r4, r4, #2
	add	r4, r4, r7
	ldr	r3, [r4]
	cmp	r3, #19
	ble	.L34
	mov	r3, #1
.L35:
	mov	r0, r3
	mov	sp, r7
	mov	r3, #145
	lsl	r3, r3, #2
	add	sp, sp, r3
	@ sp needed
	pop	{r4, r7, pc}
.L37:
	.align	2
.L36:
	.word	-580
	.word	-408
	.word	-568
	.word	g_mainSetting
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.code	16
	.thumb_func
	.type	SolveGame, %function
SolveGame:
	push	{r7, lr}
	ldr	r7, .L46
	add	sp, sp, r7
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #20
	bne	.L39
	mov	r3, #1
	b	.L40
.L39:
	mov	r3, #0
	ldr	r0, .L46+4
	add	r0, r0, r7
	str	r3, [r0]
	b	.L41
.L45:
	ldr	r3, [r7, #4]
	ldr	r1, .L46+4
	add	r1, r1, r7
	ldr	r2, [r1]
	add	r2, r2, #230
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L42
	ldr	r2, [r7, #4]
	mov	r3, r7
	add	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	bl	initGame
	ldr	r3, .L46+8
	mov	r2, #137
	lsl	r2, r2, #3
	add	r2, r2, r7
	add	r3, r2, r3
	ldr	r2, [r7]
	add	r2, r2, #210
	lsl	r2, r2, #2
	ldr	r0, .L46+4
	add	r0, r0, r7
	ldr	r1, [r0]
	str	r1, [r2, r3]
	ldr	r3, .L46+8
	mov	r1, #137
	lsl	r1, r1, #3
	add	r1, r1, r7
	add	r3, r1, r3
	ldr	r0, .L46+4
	add	r0, r0, r7
	ldr	r2, [r0]
	add	r2, r2, #230
	lsl	r2, r2, #2
	mov	r1, #0
	str	r1, [r2, r3]
	mov	r1, r7
	add	r1, r1, #12
	ldr	r2, [r7]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	add	r1, r1, r2
	ldr	r3, .L46+4
	add	r3, r3, r7
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	ldr	r3, .L46+12
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	my_strcpy
	mov	r2, r7
	add	r2, r2, #12
	ldr	r3, [r7]
	mov	r0, r2
	mov	r1, r3
	bl	CheckConstraint
	mov	r3, r0
	cmp	r3, #0
	beq	.L42
	ldr	r3, [r7]
	add	r3, r3, #1
	mov	r2, r7
	add	r2, r2, #12
	mov	r0, r2
	mov	r1, r3
	bl	SolveGame
	mov	r3, r0
	cmp	r3, #0
	beq	.L42
	mov	r3, #1
	b	.L40
.L42:
	ldr	r0, .L46+4
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	ldr	r1, .L46+4
	add	r1, r1, r7
	str	r3, [r1]
.L41:
	ldr	r2, .L46+4
	add	r2, r2, r7
	ldr	r3, [r2]
	cmp	r3, #39
	ble	.L45
	mov	r3, #0
.L40:
	mov	r0, r3
	mov	sp, r7
	mov	r3, #137
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r7, pc}
.L47:
	.align	2
.L46:
	.word	-1096
	.word	1092
	.word	-1084
	.word	g_mainSetting
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
	add	r7, sp, #0
	mov	r3, #0
	ldr	r1, .L52+4
	add	r1, r1, r7
	str	r3, [r1]
	b	.L49
.L50:
	ldr	r3, .L52
	mov	r2, #136
	lsl	r2, r2, #3
	add	r2, r2, r7
	add	r3, r2, r3
	ldr	r1, .L52+4
	add	r1, r1, r7
	ldr	r2, [r1]
	add	r2, r2, #230
	lsl	r2, r2, #2
	mov	r1, #1
	str	r1, [r2, r3]
	ldr	r2, .L52+4
	add	r2, r2, r7
	ldr	r3, [r2]
	add	r3, r3, #1
	ldr	r1, .L52+4
	add	r1, r1, r7
	str	r3, [r1]
.L49:
	ldr	r2, .L52+4
	add	r2, r2, r7
	ldr	r3, [r2]
	cmp	r3, #39
	ble	.L50
	mov	r3, r7
	mov	r0, r3
	mov	r1, #0
	bl	SolveGame
	mov	r3, r0
	mov	r1, #135
	lsl	r1, r1, #3
	add	r1, r1, r7
	str	r3, [r1]
	mov	r2, #135
	lsl	r2, r2, #3
	add	r2, r2, r7
	ldr	r3, [r2]
	mov	r0, r3
	mov	sp, r7
	mov	r3, #136
	lsl	r3, r3, #3
	add	sp, sp, r3
	@ sp needed
	pop	{r7, pc}
.L53:
	.align	2
.L52:
	.word	-1088
	.word	1084
	.size	main, .-main

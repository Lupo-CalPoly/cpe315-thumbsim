	.arch armv6
	.fpu softvfp
	.code	16
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
	push	{r7, lr}
    bl bytetest
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main

    .global bytetest
bytetest:
    push {r7, lr}
    mov r7, sp
    mov r0, #65 @ 'A'
    strb r0, [r7]
    sub r7, r7, #1
    mov r0, #66 @ 'B'
    strb r0, [r7]
    sub r7, r7, #1
    mov r0, #67 @ 'C'
    strb r0, [r7]
    sub r7, r7, #1
    mov r0, #68 @ 'D'
    strb r0, [r7]
    sub r7, r7, #1
    sub sp, sp, #4

    add r7, #3
    ldrb r0, [r7] @ should be 'B' 
    add sp, sp, #4
    pop {r7, pc}

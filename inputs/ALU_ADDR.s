@dep ALU_MOV
	.global	main
main:
	push {lr}
	mov r1, #15
	mov r2, #155
	add r0, r1, r2
	pop {pc}


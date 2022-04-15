	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r1, #0
	mov	r0, #7296
	mov	r4, #256
	ldr	r3, .L4
	str	r1, [r3]
	strh	r0, [r2, #8]	@ movhi
	ldr	r3, .L4+4
	strh	r4, [r2]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L4+8
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	startPal
	.word	startTiles
	.word	100720640
	.word	startMap
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r3, #48]
	ldr	r3, .L7+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	ip, #2
	mov	r3, #0
	mov	r0, #7296
	mov	r4, #256
	ldr	r1, .L11
	str	ip, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L11+4
	strh	r4, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L11+8
	mov	r0, #3
	ldr	r1, .L11+12
	mov	lr, pc
	bx	r4
	mov	r3, #7040
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L11+20
	ldr	r1, .L11+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r2, .L29+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L27
.L14:
	tst	r3, #4
	beq	.L16
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L28
.L16:
	ldr	r2, .L29+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L27:
	ldr	r2, .L29+8
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L29+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r0, .L29+20
	ldr	r3, .L29+24
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	b	goToInstructions
.L30:
	.align	2
.L29:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.word	state
	.word	showGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L32
	ldr	r2, .L52+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L51
.L32:
	tst	r3, #1
	beq	.L33
	ldr	r2, .L52+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L33
.L34:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L52+8
	ldr	r3, .L52+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L33:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	.L34
.L51:
	b	goToStart
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	showGame
	.size	instructions, .-instructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L56
	ldr	r3, .L56+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	state
	.word	showGame
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r4, #3
	mov	r3, #0
	mov	r0, #7296
	mov	r5, #256
	ldr	r1, .L60
	str	r4, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L60+4
	strh	r5, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r5
	mov	r0, r4
	ldr	r5, .L60+8
	mov	r2, #83886080
	ldr	r1, .L60+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L60+16
	ldr	r1, .L60+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L60+24
	ldr	r1, .L60+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	7840
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r3, #0
	mov	r0, #4
	mov	r4, #256
	ldr	r1, .L64
	str	r0, [r1]
	strh	r4, [r2]	@ movhi
	ldr	r1, .L64+4
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L64+8
	mov	r0, #3
	ldr	r1, .L64+12
	mov	lr, pc
	bx	r4
	mov	r3, #7616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L64+20
	ldr	r1, .L64+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100720640
	.word	winMap
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L84
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r2, .L84+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L82
.L67:
	tst	r3, #4
	beq	.L68
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L83
.L68:
	push	{r4, lr}
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	beq	.L69
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L82:
	b	goToWin
.L69:
	pop	{r4, lr}
	b	goToWin
.L83:
	b	goToPause
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	drawGame
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L111
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L87
	ldr	r2, .L111+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L87
.L88:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L111+8
	ldr	r3, .L111+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L87:
	tst	r3, #2
	beq	.L89
	ldr	r2, .L111+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L88
.L89:
	tst	r3, #4
	bne	.L110
.L91:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L111+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L110:
	ldr	r2, .L111+4
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L91
	b	goToWin
.L112:
	.align	2
.L111:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	showGame
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L133
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L114
	ldr	r2, .L133+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L114
.L115:
	b	goToStart
.L114:
	tst	r3, #2
	beq	.L116
	ldr	r2, .L133+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L115
.L116:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L133+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L134:
	.align	2
.L133:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	r4, .L147
	ldr	r7, .L147+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L147+8
	ldr	r3, .L147+12
	strh	r0, [r7]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L147+16
	ldr	fp, .L147+20
	ldr	r10, .L147+24
	ldr	r9, .L147+28
	ldr	r8, .L147+32
.L136:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L137:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L137
.L139:
	.word	.L143
	.word	.L142
	.word	.L141
	.word	.L140
	.word	.L138
.L138:
	ldr	r3, .L147+36
	mov	lr, pc
	bx	r3
	b	.L136
.L140:
	mov	lr, pc
	bx	r8
	b	.L136
.L141:
	mov	lr, pc
	bx	r9
	b	.L136
.L142:
	mov	lr, pc
	bx	r10
	b	.L136
.L143:
	mov	lr, pc
	bx	fp
	b	.L136
.L148:
	.align	2
.L147:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	instructions
	.word	pause
	.word	win
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

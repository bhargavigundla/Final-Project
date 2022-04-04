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
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
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
	.word	22080
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
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r2, .L27+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L26
.L14:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToInstructions
.L26:
	push	{r4, lr}
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r0, .L27+12
	ldr	r3, .L27+16
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L30
	ldr	r2, .L50+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L49
.L30:
	tst	r3, #1
	beq	.L31
	ldr	r2, .L50+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L31
.L32:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L50+8
	ldr	r3, .L50+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L50+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	.L32
.L49:
	b	goToStart
.L51:
	.align	2
.L50:
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
	ldr	r0, .L54
	ldr	r3, .L54+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
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
	ldr	r1, .L58
	str	r4, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L58+4
	strh	r5, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r5
	mov	r0, r4
	ldr	r5, .L58+8
	mov	r2, #83886080
	ldr	r1, .L58+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L58+16
	ldr	r1, .L58+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L58+24
	ldr	r1, .L58+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	.align	2
.L58:
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
	ldr	r1, .L62
	str	r0, [r1]
	strh	r4, [r2]	@ movhi
	ldr	r1, .L62+4
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L62+8
	mov	r0, #3
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r4
	mov	r3, #7616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L62+20
	ldr	r1, .L62+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	r3, .L77
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
	ldr	r2, .L77+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L75
.L65:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L76
.L66:
	push	{r4, lr}
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L76:
	b	goToPause
.L75:
	b	goToWin
.L78:
	.align	2
.L77:
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
	ldr	r3, .L104
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L80
	ldr	r2, .L104+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L80
.L81:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L104+8
	ldr	r3, .L104+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	tst	r3, #2
	beq	.L82
	ldr	r2, .L104+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L81
.L82:
	tst	r3, #4
	bne	.L103
.L84:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L104+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L103:
	ldr	r2, .L104+4
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L84
	b	goToWin
.L105:
	.align	2
.L104:
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
	ldr	r3, .L126
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L107
	ldr	r2, .L126+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L107
.L108:
	b	goToStart
.L107:
	tst	r3, #2
	beq	.L109
	ldr	r2, .L126+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L108
.L109:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L126+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L127:
	.align	2
.L126:
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
	ldr	r4, .L140
	ldr	r7, .L140+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L140+8
	ldr	r3, .L140+12
	strh	r0, [r7]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L140+16
	ldr	fp, .L140+20
	ldr	r10, .L140+24
	ldr	r9, .L140+28
	ldr	r8, .L140+32
.L129:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L130:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L130
.L132:
	.word	.L136
	.word	.L135
	.word	.L134
	.word	.L133
	.word	.L131
.L131:
	ldr	r3, .L140+36
	mov	lr, pc
	bx	r3
	b	.L129
.L133:
	mov	lr, pc
	bx	r8
	b	.L129
.L134:
	mov	lr, pc
	bx	r9
	b	.L129
.L135:
	mov	lr, pc
	bx	r10
	b	.L129
.L136:
	mov	lr, pc
	bx	fp
	b	.L129
.L141:
	.align	2
.L140:
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
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

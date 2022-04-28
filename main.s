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
	ldr	r3, .L4
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r4, #256
	mov	r2, #67108864
	mov	r1, #0
	mov	r0, #7296
	ldr	r3, .L4+12
	str	r1, [r3]
	strh	r0, [r2, #8]	@ movhi
	ldr	r3, .L4+16
	strh	r4, [r2]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L4+20
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	town_length
	.word	town_data
	.word	playSoundA
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+8
	ldr	r1, .L8+12
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+16
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
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
	mov	r0, #7168
	mov	r4, #256
	ldr	r1, .L12
	str	ip, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L12+4
	strh	r4, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L12+8
	mov	r0, #3
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #3056
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r3, .L23
	ldrh	r2, [r3]
	ldr	r3, .L23+4
	tst	r2, #8
	ldr	r0, [r3]
	beq	.L15
	ldr	r2, .L23+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L22
.L15:
	add	r0, r0, #1
	str	r0, [r3]
	bx	lr
.L22:
	push	{r4, lr}
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToInstructions
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	srand
	.word	initGame
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
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L26
	ldr	r2, .L46+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L45
.L26:
	tst	r3, #1
	beq	.L27
	ldr	r2, .L46+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L27
.L28:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L46+8
	ldr	r3, .L46+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	.L28
.L45:
	b	goToStart
.L47:
	.align	2
.L46:
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
	ldr	r0, .L50
	ldr	r3, .L50+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r1, .L54
	str	r4, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L54+4
	strh	r5, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r5
	mov	r0, r4
	ldr	r5, .L54+8
	mov	r2, #83886080
	ldr	r1, .L54+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L54+16
	ldr	r1, .L54+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L54+24
	ldr	r1, .L54+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
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
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r2, .L75+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L73
.L57:
	tst	r3, #4
	beq	.L59
	ldr	r2, .L75+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L74
.L59:
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L75+4
	ldrh	r3, [r3]
	tst	r3, #2
	bxne	lr
	b	goToStart
.L73:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L75+8
	ldr	r3, .L75+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L74:
	b	goToInstructions
.L76:
	.align	2
.L75:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	showGame
	.size	pause, .-pause
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
	ldr	r1, .L79
	str	r0, [r1]
	strh	r4, [r2]	@ movhi
	ldr	r1, .L79+4
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L79+8
	mov	r0, #3
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r4
	mov	r3, #7616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L79+20
	ldr	r1, .L79+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
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
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L82
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L89
.L82:
	push	{r4, lr}
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	beq	.L90
	ldr	r3, .L91+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L89:
	b	goToPause
.L90:
	pop	{r4, lr}
	b	goToWin
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	drawGame
	.size	game, .-game
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
	ldr	r3, .L113
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L94
	ldr	r2, .L113+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L94
.L95:
	b	goToStart
.L94:
	tst	r3, #2
	beq	.L96
	ldr	r2, .L113+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L95
.L96:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L113+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L114:
	.align	2
.L113:
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L127
	mov	lr, pc
	bx	r3
	ldr	r6, .L127+4
	ldr	r7, .L127+8
	ldr	r5, .L127+12
	ldr	fp, .L127+16
	ldr	r10, .L127+20
	ldr	r9, .L127+24
	ldr	r8, .L127+28
	ldr	r4, .L127+32
.L116:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L117:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L117
.L119:
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L118
.L118:
	ldr	r3, .L127+36
	mov	lr, pc
	bx	r3
	b	.L116
.L120:
	mov	lr, pc
	bx	r8
	b	.L116
.L121:
	mov	lr, pc
	bx	r9
	b	.L116
.L122:
	mov	lr, pc
	bx	r10
	b	.L116
.L123:
	mov	lr, pc
	bx	fp
	b	.L116
.L128:
	.align	2
.L127:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	instructions
	.word	pause
	.word	67109120
	.word	win
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

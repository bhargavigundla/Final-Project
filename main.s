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
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
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
	.word	19168
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
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+24
	ldr	r1, .L12+28
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
	.word	6288
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
	ldr	r3, .L23+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L23+24
	ldr	r3, .L23+28
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
	.word	idleSong_length
	.word	idleSong_data
	.word	playSoundA
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
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L34+8
	ldr	r3, .L34+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
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
	ldr	r0, .L38
	ldr	r3, .L38+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
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
	mov	r0, #7168
	mov	r5, #256
	ldr	r1, .L42
	str	r4, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L42+4
	strh	r5, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r5
	mov	r0, r4
	ldr	r5, .L42+8
	mov	r2, #83886080
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #3280
	mov	r2, #100663296
	ldr	r1, .L42+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L42+20
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
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
	ldr	r3, .L63
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L63+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L61
.L45:
	tst	r3, #4
	beq	.L47
	ldr	r2, .L63+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L62
.L47:
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	tst	r3, #2
	bxne	lr
	b	goToStart
.L61:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L63+8
	ldr	r3, .L63+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L62:
	b	goToInstructions
.L64:
	.align	2
.L63:
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
	ldr	r3, .L67
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L67+4
	ldr	r3, .L67+8
	mov	lr, pc
	bx	r3
	mov	r4, #256
	mov	r3, #67108864
	mov	r0, #4
	mov	r1, #7168
	ldr	r2, .L67+12
	str	r0, [r2]
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L67+16
	strh	r4, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L67+20
	mov	r0, #3
	ldr	r1, .L67+24
	mov	lr, pc
	bx	r4
	mov	r3, #1392
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L67+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L67+32
	ldr	r1, .L67+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
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
	ldr	r3, .L78
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L70
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L76
.L70:
	ldr	r3, .L78+8
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	beq	.L77
	ldr	r3, .L78+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L76:
	ldr	r3, .L78+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L78+20
	ldr	r3, .L78+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L77:
	pop	{r4, lr}
	b	goToWin
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	drawGame
	.word	idleSong_length
	.word	idleSong_data
	.word	playSoundA
	.size	game, .-game
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
	ldr	r6, .L95
	ldr	fp, .L95+4
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L95+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L95+16
	ldr	r9, .L95+20
	ldr	r8, .L95+24
	ldr	r7, .L95+28
	ldr	r4, .L95+32
.L82:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L90
.L84:
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L83
.L83:
	tst	r0, #8
	beq	.L90
	tst	r3, #8
	beq	.L94
.L90:
	mov	r0, r3
	b	.L82
.L85:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L82
.L86:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L82
.L88:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L82
.L87:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L82
.L94:
	ldr	r3, .L95+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L82
.L96:
	.align	2
.L95:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	instructions
	.word	pause
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
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
	ldr	r3, .L102
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L102+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L103:
	.align	2
.L102:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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

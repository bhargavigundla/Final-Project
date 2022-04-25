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
	.word	gameSong_length
	.word	gameSong_data
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
	mov	r0, #7296
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
	mov	r3, #7040
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
	ldr	r3, .L30
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L15:
	tst	r3, #4
	beq	.L17
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
.L17:
	ldr	r2, .L30+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L28:
	ldr	r2, .L30+8
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r0, .L30+20
	ldr	r3, .L30+24
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L29:
	b	goToInstructions
.L31:
	.align	2
.L30:
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
	ldr	r3, .L53
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L33
	ldr	r2, .L53+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L52
.L33:
	tst	r3, #1
	beq	.L34
	ldr	r2, .L53+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L34
.L35:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L53+8
	ldr	r3, .L53+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	.L35
.L52:
	b	goToStart
.L54:
	.align	2
.L53:
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
	ldr	r0, .L57
	ldr	r3, .L57+4
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r1, .L61
	str	r4, [r1]
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L61+4
	strh	r5, [r2]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r5
	mov	r0, r4
	ldr	r5, .L61+8
	mov	r2, #83886080
	ldr	r1, .L61+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L61+16
	ldr	r1, .L61+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L61+24
	ldr	r1, .L61+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	r1, .L65
	str	r0, [r1]
	strh	r4, [r2]	@ movhi
	ldr	r1, .L65+4
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L65+8
	mov	r0, #3
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	mov	r3, #7616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L65+20
	ldr	r1, .L65+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
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
	ldr	r3, .L85
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L83
.L68:
	tst	r3, #4
	beq	.L69
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L84
.L69:
	push	{r4, lr}
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	beq	.L70
	ldr	r3, .L85+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L83:
	b	goToWin
.L70:
	pop	{r4, lr}
	b	goToWin
.L84:
	b	goToPause
.L86:
	.align	2
.L85:
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
	ldr	r3, .L112
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L88
	ldr	r2, .L112+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L88
.L89:
	mov	ip, #1
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r0, .L112+8
	ldr	r3, .L112+12
	str	ip, [r0]
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L88:
	tst	r3, #2
	beq	.L90
	ldr	r2, .L112+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L89
.L90:
	tst	r3, #4
	bne	.L111
.L92:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L111:
	ldr	r2, .L112+4
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L92
	b	goToWin
.L113:
	.align	2
.L112:
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
	ldr	r3, .L134
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L115
	ldr	r2, .L134+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L115
.L116:
	b	goToStart
.L115:
	tst	r3, #2
	beq	.L117
	ldr	r2, .L134+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L116
.L117:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L134+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L135:
	.align	2
.L134:
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
	ldr	r3, .L148
	mov	lr, pc
	bx	r3
	ldr	r6, .L148+4
	ldr	r7, .L148+8
	ldr	r5, .L148+12
	ldr	fp, .L148+16
	ldr	r10, .L148+20
	ldr	r9, .L148+24
	ldr	r8, .L148+28
	ldr	r4, .L148+32
.L137:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L138:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L138
.L140:
	.word	.L144
	.word	.L143
	.word	.L142
	.word	.L141
	.word	.L139
.L139:
	ldr	r3, .L148+36
	mov	lr, pc
	bx	r3
	b	.L137
.L141:
	mov	lr, pc
	bx	r8
	b	.L137
.L142:
	mov	lr, pc
	bx	r9
	b	.L137
.L143:
	mov	lr, pc
	bx	r10
	b	.L137
.L144:
	mov	lr, pc
	bx	fp
	b	.L137
.L149:
	.align	2
.L148:
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

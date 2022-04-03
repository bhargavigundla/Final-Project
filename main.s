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
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L4
	ldr	r3, .L4+4
	ldr	r4, .L4+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
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
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #7296
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r0, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r0, #48]
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
	mov	r1, #2
	push	{r4, lr}
	ldr	r2, .L11
	ldr	r3, .L11+4
	ldr	r4, .L11+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
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
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L15
	ldr	r3, .L15+4
	ldr	r4, .L15+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L15+16
	ldr	r1, .L15+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L15+24
	ldr	r1, .L15+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	outsidePal
	.word	19808
	.word	outsideTiles
	.word	100720640
	.word	outsideMap
	.size	goToGame, .-goToGame
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
	@ link register save eliminated.
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
	ldr	r2, .L27+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L26
.L18:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToInstructions
.L26:
	b	goToGame
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	buttons
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
	@ link register save eliminated.
	ldr	r3, .L47
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L30
	ldr	r2, .L47+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L46
.L30:
	tst	r3, #1
	beq	.L31
	ldr	r2, .L47+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	goToGame
.L31:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L46:
	b	goToStart
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
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
	mov	r4, #3
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldr	r5, .L51+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L51+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L51+16
	ldr	r1, .L51+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L51+24
	ldr	r1, .L51+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
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
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L55
	ldr	r3, .L55+4
	ldr	r4, .L55+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L55+12
	mov	lr, pc
	bx	r4
	mov	r3, #7616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L55+20
	ldr	r1, .L55+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
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
	@ link register save eliminated.
	ldr	r3, .L67
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r2, .L67+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L66
.L58:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToPause
.L66:
	b	goToWin
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	buttons
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
	@ link register save eliminated.
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L70
	ldr	r2, .L91+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L70
.L71:
	b	goToGame
.L70:
	tst	r3, #2
	beq	.L72
	ldr	r2, .L91+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L71
.L72:
	tst	r3, #4
	bne	.L90
.L73:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L90:
	ldr	r2, .L91+4
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L73
	b	goToWin
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
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
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #7296
	mov	r2, #0
	push	{r4, r7, fp, lr}
	strh	r0, [r3]	@ movhi
	ldr	r4, .L126
	strh	r1, [r3, #8]	@ movhi
	ldr	fp, .L126+4
	ldrh	r1, [r4, #48]
	ldr	r5, .L126+8
	ldr	r3, .L126+12
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L126+16
	ldr	r10, .L126+20
	ldr	r9, .L126+24
	ldr	r8, .L126+28
	ldr	r7, .L126+32
.L116:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L117:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L117
.L119:
	.word	.L122
	.word	.L121
	.word	.L117
	.word	.L120
	.word	.L118
.L118:
	mov	lr, pc
	bx	r7
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
.L127:
	.align	2
.L126:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	stage,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L7+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L7+12
	ldr	r4, .L7+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L7+20
	ldr	r3, .L7+24
	strh	r7, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	ldr	r3, .L7+28
	str	r6, [r4]
	str	r8, [r4, #16]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+32
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+36
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L11+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L11+12
	ldr	r4, .L11+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L11+20
	ldr	r3, .L11+24
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	ldr	r3, .L11+28
	str	r6, [r4]
	str	r8, [r4, #16]
	mov	lr, pc
	bx	r3
	ldr	r5, .L11+32
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L11+36
	ldr	r3, .L11+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L11+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r2, .L38
	ldrh	r1, [r2, #2]
	tst	r1, #32
	push	{r4, lr}
	strh	r3, [r2, #8]	@ movhi
	beq	.L15
	ldr	r1, .L38+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #99
	movle	r3, r2
	str	r3, [r1]
.L15:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #64
	beq	.L18
	ldr	r0, .L38+8
	ldr	r3, [r0]
	ldr	r1, .L38+12
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L18:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L19
	ldr	r3, .L38+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L21
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L21
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L35
	ldr	r0, .L38+20
	ldr	r1, .L38+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L21:
	ldr	r3, .L38+28
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L36
.L25:
	mov	r2, #1
	ldr	r3, .L38
	strh	r2, [r3, #2]	@ movhi
.L19:
	mov	r1, #1
	ldr	r3, .L38
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L36:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L25
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L37
	ldr	r0, .L38+20
	ldr	r1, .L38+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L25
.L35:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L21
.L37:
	ldm	r3, {r0, r1}
	bl	playSoundB
	b	.L25
.L39:
	.align	2
.L38:
	.word	67109376
	.word	cseconds
	.word	seconds
	.word	-2004318071
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, lr}
	mov	lr, #67108864
	mov	ip, #0
	mvn	r5, #163
	mov	r0, #195
	mov	r4, #49152
	ldr	r2, .L42
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [lr, #4]
	ldr	r3, .L42+4
	orr	r1, r1, #8
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [lr, #4]	@ movhi
	ldrh	r1, [r2]
	orr	r1, r1, #97
	strh	r5, [r3, #8]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	r2, .L42+8
	ldr	r1, .L42+12
	strh	r0, [r3, #10]	@ movhi
	str	r1, [r2, #4092]
	strh	ip, [r3, #14]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	67109376
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	mvn	r4, #163
	mov	r1, #195
	mov	lr, #49152
	ldr	ip, .L46
	ldrh	r2, [ip]
	ldr	r3, .L46+4
	orr	r2, r2, #96
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	67109376
	.word	67109120
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L49
	ldr	r0, .L49+4
	ldr	r1, .L49+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L52
	ldr	ip, .L52+4
	ldr	r0, .L52+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L53:
	.align	2
.L52:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L55
	ldr	ip, .L55+4
	strh	r3, [r2, #2]	@ movhi
	ldr	r0, .L55+8
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, .L55+12
	ldr	r2, [ip]
	str	r3, [r0, #12]
	str	r3, [r2, #20]
	str	r3, [r1, #12]
	str	r3, [r2, #32]
	bx	lr
.L56:
	.align	2
.L55:
	.word	67109120
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.comm	collisionMap,4,4
	.comm	stage,4,4
	.comm	cseconds,4,4
	.comm	seconds,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

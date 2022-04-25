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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L4
	ldr	r2, .L4+4
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L4+8
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #36]
	ldr	lr, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	lsl	r3, r3, #23
	ldr	r0, .L4+12
	sub	r1, r1, lr
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	and	r1, r1, #255
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.global	__aeabi_idivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNonPlayers.part.0, %function
updateNonPlayers.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L10+4
	ldr	r5, [r3]
	ldr	r7, .L10+8
	sub	r5, r5, #16
	add	r6, r4, #240
.L7:
	ldr	r0, [r4, #-8]
	ldr	r3, [r4]
	mov	r1, r5
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	add	r4, r4, #48
	str	r1, [r4, #-56]
	cmp	r4, r6
	bne	.L7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	mapHeight
	.word	lavaBlobs+8
	.word	__aeabi_idivmod
	.size	updateNonPlayers.part.0, .-updateNonPlayers.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNonPlayers.part.0, %function
drawNonPlayers.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #192
	ldr	r3, .L18
	ldr	r2, .L18+4
	ldr	ip, [r3]
	ldr	r3, .L18+8
	ldrh	r7, [r2]
	lsl	r4, ip, #16
	ldr	r2, .L18+12
	ldr	r6, .L18+16
	lsr	r4, r4, #16
	add	r5, ip, #239
	add	lr, r3, #40
.L15:
	ldr	r1, [r2, #4]
	cmp	r1, ip
	ble	.L13
	sub	r0, r1, r4
	and	r0, r0, r6
	cmp	r1, r5
	orr	r0, r0, #16384
	bgt	.L13
	ldr	r1, [r2]
	sub	r1, r1, r7
	and	r1, r1, #255
	strh	r0, [r3, #10]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	strh	r1, [r3, #8]	@ movhi
.L14:
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #48
	bne	.L15
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	ldrh	r1, [r3, #8]
	orr	r1, r1, #512
	strh	r1, [r3, #8]	@ movhi
	b	.L14
.L19:
	.align	2
.L18:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	lavaBlobs
	.word	511
	.size	drawNonPlayers.part.0, .-drawNonPlayers.part.0
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, lr}
	bleq	drawNonPlayers.part.0
.L21:
	ldr	r3, .L25+4
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L22
	ldr	r2, .L25+8
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L23:
	ldr	r3, .L25+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L25+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L25+20
	ldrh	r1, [r2]
	ldr	r2, .L25+24
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L22:
	bl	drawPlayer.part.0
	b	.L23
.L26:
	.align	2
.L25:
	.word	stage
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	lr, #16
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L29
	ldr	r3, .L29+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L29+8
	add	r0, r0, #72
	add	r1, r1, #112
	str	r4, [r3, #40]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	stm	r3, {r0, r1}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	vOff
	.word	hOff
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L44
	ldr	r5, [r4, #24]
	add	r3, r5, r5, lsl r1
	ldr	r2, .L44+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	ldr	r3, .L44+8
	ldr	r6, [r4, #28]
	cmp	r2, r3
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bcs	.L32
	ldr	r0, [r4, #36]
	ldr	r3, .L44+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L32:
	ldr	r3, .L44+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L44+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L44+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L35
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L37
.L38:
	mov	r3, #2
	str	r3, [r4, #28]
.L37:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L38
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L37
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L82
	ldrh	r1, [r3, #48]
	ldr	r2, .L82+4
	tst	r1, #64
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r2]
	bne	.L47
	cmp	r1, #4
	beq	.L48
	ldr	ip, .L82+8
	ldr	r3, .L82+12
	ldr	r4, [ip, #8]
	ldr	r7, [ip]
	ldr	r6, [r3]
	ldr	r2, [ip, #20]
	sub	r7, r7, r4
	mul	r0, r7, r6
	add	r8, r2, r7
	sub	r8, r8, #1
	mul	r8, r6, r8
	ldr	r5, .L82+16
	ldr	lr, [ip, #4]
	ldr	r3, [ip, #16]
	ldr	r9, [r5]
	add	r3, lr, r3
	add	r5, r9, r0
	sub	r3, r3, #1
	add	lr, r9, lr
	ldrb	r10, [r5, r3]	@ zero_extendqisi2
	ldrb	r5, [lr, r0]	@ zero_extendqisi2
	add	r3, r9, r3
	ldrb	r0, [lr, r8]	@ zero_extendqisi2
	ldrb	r8, [r3, r8]	@ zero_extendqisi2
	cmp	r5, r10
	movcs	r5, r10
	cmp	r0, r8
	movge	r0, r8
	cmp	r0, r5
	movge	r0, r5
	cmp	r0, #0
	beq	.L49
	ldr	r5, .L82+20
	ldr	r0, .L82+24
	ldr	r8, [r5]
	ldr	r0, [r0]
	subs	r0, r8, r0
	movmi	r0, r8
	str	r7, [ip]
	str	r0, [r5]
.L49:
	ldr	r0, .L82
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L61
.L52:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L55
	ldr	r0, .L82+8
	ldr	r3, .L82+12
	ldr	r2, [r0]
	ldr	ip, [r3]
	ldr	r3, [r0, #20]
	mul	r5, r2, ip
	add	r3, r2, r3
	sub	r3, r3, #1
	mul	r3, ip, r3
	ldr	r4, [r0, #4]
	ldr	lr, [r0, #12]
	ldr	ip, .L82+16
	ldr	r2, [r0, #16]
	ldr	ip, [ip]
	sub	lr, r4, lr
	add	r2, lr, r2
	sub	r2, r2, #1
	add	r6, ip, lr
	add	r4, ip, r5
	ldrb	r4, [r4, r2]	@ zero_extendqisi2
	add	ip, ip, r2
	ldrb	r2, [r6, r5]	@ zero_extendqisi2
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	ldrb	r3, [r6, r3]	@ zero_extendqisi2
	cmp	r2, r4
	movcs	r2, r4
	cmp	r3, ip
	movge	r3, ip
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	beq	.L55
	ldr	r5, .L82+28
	ldr	r3, .L82+24
	ldr	r2, [r5]
	ldr	r3, [r3]
	subs	r3, r2, r3
	movmi	r3, r2
	str	lr, [r0, #4]
	str	r3, [r5]
.L55:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L57
	ldr	r0, .L82+8
	ldr	lr, .L82+16
	ldr	ip, .L82+12
	ldr	r3, [r0]
	ldr	r2, [r0, #20]
	ldr	r5, [lr]
	ldr	r4, [ip]
	add	r2, r3, r2
	mla	lr, r3, r4, r5
	sub	r2, r2, #1
	mul	r2, r4, r2
	ldr	r6, [r0, #4]
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #16]
	add	ip, r6, ip
	add	r3, ip, r3
	sub	r3, r3, #1
	ldrb	r7, [lr, r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	lr, [lr, ip]	@ zero_extendqisi2
	add	r5, r5, ip
	ldrb	r6, [r3, r2]	@ zero_extendqisi2
	ldrb	r3, [r5, r2]	@ zero_extendqisi2
	cmp	lr, r7
	movcc	r2, lr
	movcs	r2, r7
	cmp	r3, r6
	movge	r3, r6
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	beq	.L57
	ldr	r5, .L82+28
	ldr	r3, .L82+24
	ldr	r2, [r3]
	ldr	r3, [r5]
	add	r2, r3, r2
	add	lr, r2, #239
	cmp	r4, lr
	movgt	r3, r2
	str	ip, [r0, #4]
	str	r3, [r5]
.L57:
	cmp	r1, #3
	beq	.L81
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L47:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L52
	cmp	r1, #4
	beq	.L52
	ldr	ip, .L82+8
	ldr	r2, .L82+16
	ldr	lr, [ip, #4]
	ldr	r3, [ip, #16]
	ldr	r0, .L82+12
	ldr	r9, [r2]
	add	r3, lr, r3
	sub	r3, r3, #1
	ldr	r2, [ip, #20]
	ldr	r6, [r0]
	ldr	r4, [ip, #8]
	add	r3, r9, r3
	add	lr, r9, lr
.L61:
	ldr	r0, [ip]
	add	r4, r4, r0
	add	r2, r4, r2
	mul	r0, r6, r4
	sub	r2, r2, #1
	mul	r2, r6, r2
	ldrb	r5, [lr, r0]	@ zero_extendqisi2
	ldrb	r6, [r3, r0]	@ zero_extendqisi2
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldrb	r0, [lr, r2]	@ zero_extendqisi2
	cmp	r5, r6
	movcc	r2, r5
	movcs	r2, r6
	cmp	r0, r3
	movlt	r3, r0
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	beq	.L52
	ldr	r5, .L82+20
	ldr	r2, .L82+24
	ldr	r3, [r5]
	ldr	r2, [r2]
	ldr	r0, .L82+32
	add	r2, r3, r2
	ldr	r0, [r0]
	add	lr, r2, #159
	cmp	lr, r0
	movlt	r3, r2
	str	r4, [ip]
	str	r3, [r5]
	b	.L52
.L81:
	ldr	r1, .L82+28
	ldr	r2, .L82+24
	ldr	r3, [r1]
	ldr	r2, [r2]
	ldr	r0, .L82+12
	add	r2, r3, r2
	ldr	r0, [r0]
	add	r2, r2, #239
	cmp	r2, r0
	bge	.L60
	ldr	r2, .L82+36
	add	r3, r3, #1
	and	ip, r3, r2
	rsbs	r0, r3, #0
	mov	r3, ip
	ldr	lr, .L82+40
	and	r0, r0, r2
	ldr	r2, [lr]
	rsbpl	ip, r0, #0
	cmp	r3, #0
	movne	r3, r2
	addeq	r3, r2, #1
	ldr	r2, .L82+8
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #12]
	str	r3, [lr]
	add	r0, r0, r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	ip, [r1]
	str	r0, [r2, #4]
	b	animatePlayer
.L60:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r3, .L82+8
	ldreq	r2, [r3, #4]
	ldreq	r1, [r3, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	subeq	r2, r2, r1
	streq	r2, [r3, #4]
	b	animatePlayer
.L48:
	ldrh	r3, [r3, #48]
	b	.L52
.L83:
	.align	2
.L82:
	.word	67109120
	.word	stage
	.word	player
	.word	mapWidth
	.word	collisionMap
	.word	vOff
	.word	scroll
	.word	hOff
	.word	mapHeight
	.word	511
	.word	loopCount
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L88
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L85
	ldr	r2, .L88+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L85:
	b	drawPlayer.part.0
.L89:
	.align	2
.L88:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	collisionCheck
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionCheck, %function
collisionCheck:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #16]
	ldr	ip, [sp, #8]
	add	r3, r3, lr
	add	ip, r3, ip
	sub	ip, ip, #1
	mla	r3, r1, r3, r0
	mul	r1, ip, r1
	ldr	lr, [sp, #12]
	ldr	ip, [sp, #4]
	add	r2, r2, lr
	add	ip, r2, ip
	sub	ip, ip, #1
	ldrb	lr, [r3, ip]	@ zero_extendqisi2
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	add	ip, r0, ip
	add	r0, r0, r2
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	ldrb	r2, [ip, r1]	@ zero_extendqisi2
	cmp	r3, lr
	movcs	r3, lr
	cmp	r0, r2
	movge	r0, r2
	cmp	r0, r3
	movge	r0, r3
	ldr	lr, [sp], #4
	bx	lr
	.size	collisionCheck, .-collisionCheck
	.align	2
	.global	setOutsideBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setOutsideBackground, %function
setOutsideBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L94
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L94+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L94+8
	ldr	r1, .L94+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	DMANow
	.word	outsidePal
	.word	26592
	.word	outsideTiles
	.word	100720640
	.word	outsideMap
	.size	setOutsideBackground, .-setOutsideBackground
	.align	2
	.global	setHouseBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setHouseBackground, %function
setHouseBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L98
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L98+4
	mov	lr, pc
	bx	r4
	mov	r3, #13120
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L98+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L98+12
	ldr	r1, .L98+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	DMANow
	.word	housePal
	.word	houseTiles
	.word	100720640
	.word	houseMap
	.size	setHouseBackground, .-setHouseBackground
	.align	2
	.global	setVolcanoBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setVolcanoBackground, %function
setVolcanoBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L102
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L102+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L102+8
	ldr	r1, .L102+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L102+16
	ldr	r1, .L102+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	DMANow
	.word	volcanoPal
	.word	5856
	.word	volcanoTiles
	.word	100712448
	.word	volcanoMap
	.size	setVolcanoBackground, .-setVolcanoBackground
	.align	2
	.global	setFireCaveBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setFireCaveBackground, %function
setFireCaveBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L108
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L105
	ldr	r4, .L108+4
	mov	r0, #3
	ldr	r1, .L108+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L108+12
	ldr	r1, .L108+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L108+20
	ldr	r1, .L108+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L105:
	ldr	r4, .L108+4
	mov	r0, #3
	ldr	r1, .L108+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L108+12
	ldr	r1, .L108+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L108+20
	ldr	r1, .L108+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	hasFireStone
	.word	DMANow
	.word	fireStoneCaveNoStonePal
	.word	9008
	.word	fireStoneCaveNoStoneTiles
	.word	100720640
	.word	fireStoneCaveNoStoneMap
	.word	fireStoneCavePal
	.word	fireStoneCaveTiles
	.word	fireStoneCaveMap
	.size	setFireCaveBackground, .-setFireCaveBackground
	.align	2
	.global	setOceanBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setOceanBackground, %function
setOceanBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L114
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L111
	ldr	r4, .L114+4
	mov	r0, #3
	ldr	r1, .L114+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L114+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L114+16
	ldr	r1, .L114+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L111:
	ldr	r4, .L114+4
	mov	r0, #3
	ldr	r1, .L114+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L114+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L114+16
	ldr	r1, .L114+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	hasWaterStone
	.word	DMANow
	.word	oceanNoStonePal
	.word	oceanNoStoneTiles
	.word	100712448
	.word	oceanNoStoneMap
	.word	oceanPal
	.word	oceanTiles
	.word	oceanMap
	.size	setOceanBackground, .-setOceanBackground
	.align	2
	.global	setForestBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setForestBackground, %function
setForestBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L120
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L117
	ldr	r4, .L120+4
	mov	r0, #3
	ldr	r1, .L120+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L120+12
	ldr	r1, .L120+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L120+20
	ldr	r1, .L120+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L117:
	ldr	r4, .L120+4
	mov	r0, #3
	ldr	r1, .L120+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L120+12
	ldr	r1, .L120+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L120+20
	ldr	r1, .L120+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	hasLeafStone
	.word	DMANow
	.word	forestNoStonePal
	.word	14736
	.word	forestNoStoneTiles
	.word	100712448
	.word	forestNoStoneMap
	.word	forestPal
	.word	forestTiles
	.word	forestMap
	.size	setForestBackground, .-setForestBackground
	.align	2
	.global	setStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	setStage, %function
setStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L132
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L122
.L125:
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L126
	.word	.L124
.L124:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L132+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L132+8
	ldr	r2, .L132+12
	ldr	r3, .L132+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L130:
	mov	r2, #67108864
	mov	ip, #4352
	mov	r3, #512
	ldr	lr, .L132+20
	ldr	r0, .L132+8
	ldr	r1, .L132+12
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L132+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L129:
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L132+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L132+8
	ldr	r2, .L132+12
	ldr	r3, .L132+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L128:
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L132+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L132+8
	ldr	r1, .L132+12
	ldr	r2, .L132+16
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L127:
	mov	r3, #67108864
	mov	r0, #55296
	mov	r2, #4352
	mov	r4, #1
	mov	ip, #512
	mov	r1, #240
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L132+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L132+8
	ldr	r2, .L132+12
	ldr	r3, .L132+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setOceanBackground
.L126:
	mov	r3, #67108864
	mov	r0, #55296
	mov	r2, #4352
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L132+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L132+8
	ldr	r2, .L132+12
	ldr	r3, .L132+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L122:
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	stage
	.word	scroll
	.word	mapWidth
	.word	mapHeight
	.word	waitForVBlank
	.word	-9088
	.size	setStage, .-setStage
	.align	2
	.global	showGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	showGame, %function
showGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	setStage
	mov	r3, #67108864
	ldr	r2, .L136
	ldrh	r1, [r2]
	ldr	r2, .L136+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L137:
	.align	2
.L136:
	.word	vOff
	.word	hOff
	.size	showGame, .-showGame
	.align	2
	.global	initSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSprites, %function
initSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16384
	ldr	r4, .L140
	mov	r0, #3
	ldr	r2, .L140+4
	ldr	r1, .L140+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L140+12
	ldr	r1, .L140+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L140+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L140+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L141:
	.align	2
.L140:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.size	initSprites, .-initSprites
	.align	2
	.global	initNonPlayers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initNonPlayers, %function
initNonPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L150
	add	r1, r3, #1016
.L143:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L143
	ldr	r3, .L150+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L150+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L149
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L149:
	mov	r7, #16
	mov	fp, #1
	mov	r10, #0
	ldr	r4, .L150+12
	ldr	r6, .L150+16
	ldr	r9, .L150+20
	ldr	r5, .L150+24
	ldr	r8, .L150+28
.L145:
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	str	fp, [r4, #8]
	str	r10, [r4, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [r9]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r5
	str	r1, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r1, [r8]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r5
	ldr	r3, .L150+32
	str	r1, [r4], #48
	cmp	r4, r3
	bne	.L145
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	shadowOAM
	.word	hideSprites
	.word	stage
	.word	lavaBlobs
	.word	rand
	.word	mapWidth
	.word	__aeabi_idivmod
	.word	mapHeight
	.word	lavaBlobs+240
	.size	initNonPlayers, .-initNonPlayers
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r5, #1
	ldr	ip, .L154
	ldr	r0, .L154+4
	ldr	r2, .L154+8
	ldr	r1, .L154+12
	ldr	r3, .L154+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r1, #144
	ldr	r7, .L154+20
	ldr	r6, .L154+24
	ldrh	r0, [r7]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r6]
	strh	r0, [r3, #16]	@ movhi
	ldr	r3, .L154+28
	str	r2, [r7]
	str	r4, [r3]
	ldr	r2, .L154+32
	ldr	r3, .L154+36
	str	r1, [r6]
	str	r4, [r2]
	str	r4, [r3]
	bl	initNonPlayers
	bl	initSprites
	mov	r0, #16
	mov	ip, #3
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, .L154+40
	add	r1, r1, #72
	add	r2, r2, #112
	stm	r3, {r1, r2, r5}
	str	r5, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	str	ip, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	scroll
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	hasFireStone
	.word	hasLeafStone
	.word	hasWaterStone
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	returnToOutside
	.syntax unified
	.arm
	.fpu softvfp
	.type	returnToOutside, %function
returnToOutside:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	mov	lr, #1
	ldr	ip, .L158
	ldr	r1, .L158+4
	ldr	r3, .L158+8
	ldr	r2, .L158+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L158+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L158+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L158+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L159:
	.align	2
.L158:
	.word	scroll
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	player
	.word	vOff
	.word	hOff
	.size	returnToOutside, .-returnToOutside
	.align	2
	.global	updateStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStage, %function
updateStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L205
	ldr	r3, [r4]
	sub	sp, sp, #16
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L160
.L163:
	.word	.L168
	.word	.L167
	.word	.L181
	.word	.L165
	.word	.L164
	.word	.L162
.L168:
	ldr	r5, .L205+4
	ldr	r1, [r5]
	cmp	r1, #256
	ldr	r0, [r5, #4]
	beq	.L201
.L169:
	ldr	r3, [r5, #20]
	ldr	r2, .L205+8
	add	ip, r1, r3
	cmp	ip, r2
	bne	.L170
	cmp	r0, #254
	beq	.L202
.L170:
	mov	ip, #17
	mov	r2, #60
	mov	r6, #3
	ldr	r7, .L205+12
	str	ip, [sp, #12]
	stm	sp, {r2, r7}
	str	r6, [sp, #8]
	ldr	r2, [r5, #16]
	ldr	r9, .L205+16
	mov	lr, pc
	bx	r9
	subs	r8, r0, #0
	beq	.L171
	mov	r0, #1
	mov	r1, #240
	mov	ip, #512
	ldr	r2, .L205+20
	ldr	r3, .L205+24
	str	r0, [r2]
	str	r1, [r3]
	ldr	r0, .L205+28
	ldr	r2, .L205+32
	ldr	r1, .L205+36
	ldr	r3, .L205+40
	str	r1, [r2]
	str	ip, [r0]
	str	r6, [r4]
	mov	lr, pc
	bx	r3
	mov	r4, #0
	bl	setStage
	mov	r2, #67108864
	mov	r1, #10
	ldr	r3, [r5, #16]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r3, r3, #80
	str	r3, [r5]
	ldr	r0, .L205+44
	ldr	r3, .L205+48
	str	r4, [r0]
	str	r4, [r3]
	str	r1, [r5, #4]
	strh	r4, [r2, #18]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	bl	initNonPlayers
.L199:
	ldr	r3, .L205+52
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L205+56
	ldr	r3, .L205+60
	mov	lr, pc
	bx	r3
.L160:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L181:
	mov	r2, #83886080
	ldr	r1, .L205+64
.L166:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L166
	mov	r2, #22
	mov	r3, #237
	mov	r8, #5
	ldr	r5, .L205+4
	str	r2, [sp, #8]
	ldr	ip, .L205+68
	str	r8, [sp, #12]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	ip, [sp, #4]
	ldr	r6, .L205+16
	mov	lr, pc
	bx	r6
	ldr	r3, .L205+52
	cmp	r0, #0
	ldr	r7, [r3]
	bne	.L203
	ldr	r3, .L205+28
	ldr	r1, [r5]
	ldr	r10, [r3]
	mul	r3, r1, r10
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #16]
	add	ip, r0, r2
	ldr	r8, .L205+72
	sub	ip, ip, #1
	add	lr, r3, r0
	add	r3, r3, ip
	ldrb	r4, [lr, r8]	@ zero_extendqisi2
	ldrb	r3, [r3, r8]	@ zero_extendqisi2
	cmp	r4, r3
	movcc	r9, r4
	movcs	r9, r3
	ldr	r3, [r5, #20]
	add	lr, r1, r3
	sub	lr, lr, #1
	mul	lr, r10, lr
	add	r4, lr, r0
	ldrb	r4, [r4, r8]	@ zero_extendqisi2
	cmp	r4, r9
	movge	r4, r9
	add	ip, ip, lr
	ldrb	ip, [ip, r8]	@ zero_extendqisi2
	cmp	ip, r4
	movlt	r4, ip
	cmp	r4, #0
	beq	.L196
	ldr	r8, .L205+60
.L175:
	ldr	r4, .L205+76
	ldr	r10, .L205+56
	add	r9, r4, #240
.L177:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #48
	bne	.L204
.L176:
	mov	r2, #0
	mov	r1, r7
	mov	r0, r10
	mov	lr, pc
	bx	r8
	cmp	r4, r9
	beq	.L160
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L177
.L165:
	mov	r3, #16
	mov	r1, #224
	mov	r2, #496
	stmib	sp, {r1, r3}
	ldr	r0, .L205+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L205+16
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L160
	ldr	r3, .L205+80
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L180
.L200:
	mov	r2, #1
	str	r2, [r3]
.L180:
	bl	returnToOutside
	b	.L199
.L164:
	mov	r3, #16
	mov	r1, #112
	mov	r2, #496
	stmib	sp, {r1, r3}
	ldr	r0, .L205+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L205+16
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L160
	ldr	r3, .L205+84
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L180
	b	.L200
.L162:
	mov	r3, #16
	ldr	r2, .L205+4
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L205+16
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #56
	mov	r2, r3
	mov	r0, #110
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L160
	ldr	r3, .L205+88
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L180
	b	.L200
.L167:
	ldr	r3, .L205+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L160
	ldr	r3, .L205+92
	ldrh	r2, [r3, #48]
	ands	r4, r2, #128
	bne	.L160
	b	.L180
.L204:
	bl	returnToOutside
	b	.L176
.L171:
	mov	r2, #19
	ldr	r3, .L205+96
	str	r2, [sp, #12]
	str	r6, [sp, #8]
	str	r7, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L160
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L205+20
	str	r2, [r3]
	ldr	r2, .L205+24
	ldr	r3, .L205+28
	str	r1, [r2]
	ldr	r2, .L205+32
	ldr	r1, .L205+100
	str	r0, [r3]
	ldr	r3, .L205+40
	str	r1, [r2]
	str	ip, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r0, #112
	ldr	r1, .L205+44
	ldr	r2, .L205+48
	stm	r5, {r0, r8}
	str	r8, [r1]
	str	r8, [r2]
	strh	r8, [r3, #18]	@ movhi
	strh	r8, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L199
.L201:
	cmp	r0, #256
	bne	.L169
	mov	r1, #1
	ldr	r3, .L205+32
	ldr	r2, .L205+104
	str	r1, [r4]
	str	r2, [r3]
	bl	setStage
	mov	r3, #142
	mov	r4, #0
	mov	r2, #112
	ldr	r7, .L205+44
	ldr	r6, .L205+48
	str	r3, [r5]
	ldr	r3, .L205+108
	str	r2, [r5, #4]
	str	r4, [r7]
	str	r4, [r6]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r7]
	str	r4, [r5, #44]
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r6]
	strh	r2, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L199
.L203:
	mov	r9, #0
	mov	r1, #160
	mov	ip, #240
	ldr	r2, .L205+20
	ldr	r3, .L205+24
	ldr	r0, .L205+28
	str	r9, [r2]
	str	r1, [r3]
	ldr	r2, .L205+32
	ldr	r1, .L205+112
	ldr	r3, .L205+40
	str	ip, [r0]
	str	r1, [r2]
	str	r8, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #127
	mov	r3, #67108864
	mov	r1, #110
	ldr	ip, .L205+44
	ldr	r0, .L205+48
	str	r2, [r5]
	str	r9, [ip]
	str	r9, [r0]
	str	r1, [r5, #4]
	strh	r9, [r3, #18]	@ movhi
	strh	r9, [r3, #16]	@ movhi
	bl	initNonPlayers
	mov	r2, r9
.L198:
	mov	r1, r7
	ldr	r0, .L205+56
	ldr	r8, .L205+60
	mov	lr, pc
	bx	r8
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L175
.L196:
	bl	returnToOutside
	mov	r2, r4
	b	.L198
.L202:
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L205+20
	str	r2, [r4]
	ldr	r2, .L205+24
	ldr	ip, .L205+28
	str	r0, [r1]
	mov	r4, #0
	ldr	r1, .L205+32
	ldr	r0, .L205+116
	str	r3, [r2]
	ldr	r2, .L205+40
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	setStage
	mov	r2, #130
	mov	r3, #67108864
	mov	ip, #33
	mov	r0, #240
	ldr	r1, .L205+44
	str	r4, [r1]
	ldr	r1, .L205+48
	str	ip, [r5]
	str	r0, [r5, #4]
	str	r2, [r1]
	strh	r4, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L199
.L206:
	.align	2
.L205:
	.word	stage
	.word	player
	.word	431
	.word	382
	.word	collision
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	collisionMap
	.word	oceanCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	rowClearSound_length
	.word	rowClearSound_data
	.word	playSoundB
	.word	83886112
	.word	498
	.word	lavaPoolCMBitmap
	.word	lavaBlobs
	.word	hasWaterStone
	.word	hasLeafStone
	.word	hasFireStone
	.word	67109120
	.word	449
	.word	forestCMBitmap
	.word	houseCMBitmap
	.word	hideSprites
	.word	fireStoneCaveCMBitmap
	.word	volcanoCMBitmap
	.size	updateStage, .-updateStage
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateStage
	ldr	r3, .L217
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	updateNonPlayers.part.0
.L208:
	bl	updatePlayer
	ldr	r3, .L217+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L207
	ldr	r3, .L217+8
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L207
	ldr	r3, .L217+12
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L207:
	pop	{r4, lr}
	bx	lr
.L218:
	.align	2
.L217:
	.word	stage
	.word	hasFireStone
	.word	hasLeafStone
	.word	hasWaterStone
	.size	updateGame, .-updateGame
	.align	2
	.global	updateNonPlayers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNonPlayers, %function
updateNonPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L221
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	updateNonPlayers.part.0
.L222:
	.align	2
.L221:
	.word	stage
	.size	updateNonPlayers, .-updateNonPlayers
	.align	2
	.global	drawNonPlayers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNonPlayers, %function
drawNonPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L225
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	drawNonPlayers.part.0
.L226:
	.align	2
.L225:
	.word	stage
	.size	drawNonPlayers, .-drawNonPlayers
	.comm	lavaBlobs,240,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	scroll,4,4
	.comm	loopCount,4,4
	.comm	hasLeafStone,4,4
	.comm	hasWaterStone,4,4
	.comm	hasFireStone,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

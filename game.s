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
	push	{r4, r5, r6, lr}
	mov	r6, #192
	ldr	r1, .L16
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	ldrh	r5, [r1]
	ldrh	r4, [r3]
	ldr	r0, .L16+12
	ldr	lr, .L16+16
	add	ip, r2, #40
.L13:
	ldm	r0, {r1, r3}
	sub	r3, r3, r4
	and	r3, r3, lr
	sub	r1, r1, r5
	orr	r3, r3, #16384
	and	r1, r1, #255
	strh	r6, [r2, #12]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	add	r2, r2, #8
	cmp	ip, r2
	add	r0, r0, #48
	bne	.L13
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	vOff
	.word	hOff
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
	ldr	r3, .L23
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, lr}
	bleq	drawNonPlayers.part.0
.L19:
	ldr	r3, .L23+4
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L20
	ldr	r2, .L23+8
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L21:
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L23+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L23+20
	ldrh	r1, [r2]
	ldr	r2, .L23+24
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L20:
	bl	drawPlayer.part.0
	b	.L21
.L24:
	.align	2
.L23:
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
	ldr	r1, .L27
	ldr	r3, .L27+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L27+8
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
.L28:
	.align	2
.L27:
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
	ldr	r4, .L42
	ldr	r5, [r4, #24]
	add	r3, r5, r5, lsl r1
	ldr	r2, .L42+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	ldr	r3, .L42+8
	ldr	r6, [r4, #28]
	cmp	r2, r3
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bcs	.L30
	ldr	r0, [r4, #36]
	ldr	r3, .L42+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L30:
	ldr	r3, .L42+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L42+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L42+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L33
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L35
.L36:
	mov	r3, #2
	str	r3, [r4, #28]
.L35:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L36
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L35
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	r3, .L80
	ldrh	r1, [r3, #48]
	ldr	r2, .L80+4
	tst	r1, #64
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r2]
	bne	.L45
	cmp	r1, #4
	beq	.L46
	ldr	ip, .L80+8
	ldr	r3, .L80+12
	ldr	r4, [ip, #8]
	ldr	r7, [ip]
	ldr	r6, [r3]
	ldr	r2, [ip, #20]
	sub	r7, r7, r4
	mul	r0, r7, r6
	add	r8, r2, r7
	sub	r8, r8, #1
	mul	r8, r6, r8
	ldr	r5, .L80+16
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
	beq	.L47
	ldr	r5, .L80+20
	ldr	r0, .L80+24
	ldr	r8, [r5]
	ldr	r0, [r0]
	subs	r0, r8, r0
	movmi	r0, r8
	str	r7, [ip]
	str	r0, [r5]
.L47:
	ldr	r0, .L80
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L59
.L50:
	ldr	r3, .L80
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L53
	ldr	r0, .L80+8
	ldr	r3, .L80+12
	ldr	r2, [r0]
	ldr	ip, [r3]
	ldr	r3, [r0, #20]
	mul	r5, r2, ip
	add	r3, r2, r3
	sub	r3, r3, #1
	mul	r3, ip, r3
	ldr	r4, [r0, #4]
	ldr	lr, [r0, #12]
	ldr	ip, .L80+16
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
	beq	.L53
	ldr	r5, .L80+28
	ldr	r3, .L80+24
	ldr	r2, [r5]
	ldr	r3, [r3]
	subs	r3, r2, r3
	movmi	r3, r2
	str	lr, [r0, #4]
	str	r3, [r5]
.L53:
	ldr	r3, .L80
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L55
	ldr	r0, .L80+8
	ldr	lr, .L80+16
	ldr	ip, .L80+12
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
	beq	.L55
	ldr	r5, .L80+28
	ldr	r3, .L80+24
	ldr	r2, [r3]
	ldr	r3, [r5]
	add	r2, r3, r2
	add	lr, r2, #239
	cmp	r4, lr
	movgt	r3, r2
	str	ip, [r0, #4]
	str	r3, [r5]
.L55:
	cmp	r1, #3
	beq	.L79
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L45:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L50
	cmp	r1, #4
	beq	.L50
	ldr	ip, .L80+8
	ldr	r2, .L80+16
	ldr	lr, [ip, #4]
	ldr	r3, [ip, #16]
	ldr	r0, .L80+12
	ldr	r9, [r2]
	add	r3, lr, r3
	sub	r3, r3, #1
	ldr	r2, [ip, #20]
	ldr	r6, [r0]
	ldr	r4, [ip, #8]
	add	r3, r9, r3
	add	lr, r9, lr
.L59:
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
	beq	.L50
	ldr	r5, .L80+20
	ldr	r2, .L80+24
	ldr	r3, [r5]
	ldr	r2, [r2]
	ldr	r0, .L80+32
	add	r2, r3, r2
	ldr	r0, [r0]
	add	lr, r2, #159
	cmp	lr, r0
	movlt	r3, r2
	str	r4, [ip]
	str	r3, [r5]
	b	.L50
.L79:
	ldr	r1, .L80+28
	ldr	r2, .L80+24
	ldr	r3, [r1]
	ldr	r2, [r2]
	ldr	r0, .L80+12
	add	r2, r3, r2
	ldr	r0, [r0]
	add	r2, r2, #239
	cmp	r2, r0
	bge	.L58
	ldr	r2, .L80+36
	add	r3, r3, #1
	and	ip, r3, r2
	rsbs	r0, r3, #0
	mov	r3, ip
	ldr	lr, .L80+40
	and	r0, r0, r2
	ldr	r2, [lr]
	rsbpl	ip, r0, #0
	cmp	r3, #0
	movne	r3, r2
	addeq	r3, r2, #1
	ldr	r2, .L80+8
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #12]
	str	r3, [lr]
	add	r0, r0, r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	ip, [r1]
	str	r0, [r2, #4]
	b	animatePlayer
.L58:
	ldr	r3, .L80
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r3, .L80+8
	ldreq	r2, [r3, #4]
	ldreq	r1, [r3, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	subeq	r2, r2, r1
	streq	r2, [r3, #4]
	b	animatePlayer
.L46:
	ldrh	r3, [r3, #48]
	b	.L50
.L81:
	.align	2
.L80:
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
	ldr	r3, .L86
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L83
	ldr	r2, .L86+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L83:
	b	drawPlayer.part.0
.L87:
	.align	2
.L86:
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
	ldr	r4, .L92
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+8
	ldr	r1, .L92+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L92+16
	ldr	r1, .L92+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
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
	ldr	r4, .L96
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L96+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L96+8
	ldr	r1, .L96+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L96+16
	ldr	r1, .L96+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	DMANow
	.word	housePal
	.word	13472
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
	ldr	r3, .L102
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L99
	ldr	r4, .L102+4
	mov	r0, #3
	ldr	r1, .L102+8
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
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
.L99:
	ldr	r4, .L102+4
	mov	r0, #3
	ldr	r1, .L102+24
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L102+28
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L102+16
	ldr	r1, .L102+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	hasFireStone
	.word	DMANow
	.word	volcanoNoStonePal
	.word	volcanoNoStoneTiles
	.word	100712448
	.word	volcanoNoStoneMap
	.word	volcanoPal
	.word	volcanoTiles
	.word	volcanoMap
	.size	setVolcanoBackground, .-setVolcanoBackground
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
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L108+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L108+16
	ldr	r1, .L108+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L105:
	ldr	r4, .L108+4
	mov	r0, #3
	ldr	r1, .L108+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L108+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L108+16
	ldr	r1, .L108+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
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
	mov	r3, #64
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
	mov	r3, #64
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
	.word	hasLeafStone
	.word	DMANow
	.word	forestNoStonePal
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
	ldr	r3, .L125
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L116
.L119:
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L118
.L118:
	mov	r3, #67108864
	mov	r0, #55296
	mov	r2, #4352
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L125+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L125+8
	ldr	r2, .L125+12
	ldr	r3, .L125+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L123:
	mov	r2, #67108864
	mov	ip, #4352
	mov	r3, #512
	ldr	lr, .L125+20
	ldr	r0, .L125+8
	ldr	r1, .L125+12
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L125+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L122:
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L125+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L125+8
	ldr	r2, .L125+12
	ldr	r3, .L125+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L121:
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L125+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L125+8
	ldr	r1, .L125+12
	ldr	r2, .L125+16
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L120:
	mov	r3, #67108864
	mov	r0, #55296
	mov	r2, #4352
	mov	r4, #1
	mov	ip, #512
	mov	r1, #240
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L125+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L125+8
	ldr	r2, .L125+12
	ldr	r3, .L125+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setOceanBackground
.L116:
	pop	{r4, lr}
	bx	lr
.L126:
	.align	2
.L125:
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
	ldr	r2, .L129
	ldrh	r1, [r2]
	ldr	r2, .L129+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L130:
	.align	2
.L129:
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
	ldr	r4, .L133
	mov	r0, #3
	ldr	r2, .L133+4
	ldr	r1, .L133+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L133+12
	ldr	r1, .L133+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L133+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L134:
	.align	2
.L133:
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
	ldr	r3, .L143
	add	r1, r3, #1016
.L136:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L136
	ldr	r3, .L143+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L142
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L142:
	mov	r5, #16
	mov	fp, #1
	mov	r10, #0
	ldr	r4, .L143+12
	ldr	r9, .L143+16
	ldr	r8, .L143+20
	ldr	r7, .L143+24
	add	r6, r4, #240
.L138:
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	fp, [r4, #8]
	str	r10, [r4, #12]
	mov	lr, pc
	bx	r9
	ldr	r1, [r8]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r7
	add	r4, r4, #48
	str	r1, [r4, #-44]
	cmp	r4, r6
	bne	.L138
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	shadowOAM
	.word	hideSprites
	.word	stage
	.word	lavaBlobs
	.word	rand
	.word	mapWidth
	.word	__aeabi_idivmod
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
	ldr	ip, .L147
	ldr	r0, .L147+4
	ldr	r2, .L147+8
	ldr	r1, .L147+12
	ldr	r3, .L147+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r1, #220
	mov	r2, #144
	ldr	r7, .L147+20
	ldr	r6, .L147+24
	ldrh	r0, [r7]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r6]
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r7]
	str	r2, [r6]
	bl	initNonPlayers
	bl	initSprites
	mov	r0, #16
	mov	ip, #3
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, .L147+28
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
.L148:
	.align	2
.L147:
	.word	scroll
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
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
	ldr	ip, .L151
	ldr	r1, .L151+4
	ldr	r3, .L151+8
	ldr	r2, .L151+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L151+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L151+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L151+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L152:
	.align	2
.L151:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L192
	ldr	r3, [r4]
	sub	sp, sp, #20
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L153
.L156:
	.word	.L160
	.word	.L159
	.word	.L158
	.word	.L157
	.word	.L155
.L159:
	ldr	r3, .L192+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L153
	ldr	r3, .L192+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L171
.L153:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L155:
	mov	r3, #16
	mov	r1, #112
	mov	r2, #496
	stmib	sp, {r1, r3}
	ldr	r0, .L192+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L192+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L153
	ldr	r3, .L192+16
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L171
.L187:
	mov	r2, #1
	str	r2, [r3]
.L171:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	returnToOutside
.L160:
	ldr	r5, .L192+4
	ldr	r1, [r5]
	cmp	r1, #256
	ldr	r0, [r5, #4]
	beq	.L189
.L161:
	ldr	r3, [r5, #20]
	ldr	r2, .L192+20
	add	ip, r1, r3
	cmp	ip, r2
	bne	.L162
	cmp	r0, #254
	beq	.L190
.L162:
	mov	ip, #17
	mov	r2, #60
	mov	r6, #3
	ldr	r7, .L192+24
	str	ip, [sp, #12]
	stm	sp, {r2, r7}
	str	r6, [sp, #8]
	ldr	r2, [r5, #16]
	ldr	r9, .L192+12
	mov	lr, pc
	bx	r9
	subs	r8, r0, #0
	beq	.L163
	mov	r0, #1
	mov	r1, #240
	mov	ip, #512
	ldr	r2, .L192+28
	ldr	r3, .L192+32
	str	r0, [r2]
	str	r1, [r3]
	ldr	r0, .L192+36
	ldr	r2, .L192+40
	ldr	r1, .L192+44
	ldr	r3, .L192+48
	str	ip, [r0]
	str	r1, [r2]
	str	r6, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #0
	mov	r1, #67108864
	mov	r0, #10
	ldr	r3, [r5, #16]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r3, r3, #80
	str	r3, [r5]
	ldr	ip, .L192+52
	ldr	r3, .L192+56
	str	r2, [ip]
	str	r2, [r3]
	str	r0, [r5, #4]
	strh	r2, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
.L188:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	initNonPlayers
.L158:
	mov	r3, #16
	mov	r1, #32
	mov	r2, #464
	stmib	sp, {r1, r3}
	ldr	r5, .L192+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L192+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L166
	ldr	r3, .L192+60
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3]
	bl	returnToOutside
.L166:
	ldr	r4, .L192+64
	add	r7, r4, #240
.L169:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #48
	bne	.L191
.L168:
	cmp	r7, r4
	bne	.L169
	b	.L153
.L157:
	mov	r3, #16
	mov	r1, #224
	mov	r2, #496
	stmib	sp, {r1, r3}
	ldr	r0, .L192+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L192+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L153
	ldr	r3, .L192+68
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L171
	b	.L187
.L191:
	bl	returnToOutside
	b	.L168
.L163:
	mov	r2, #19
	ldr	r3, .L192+72
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
	beq	.L153
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L192+28
	str	r2, [r3]
	ldr	r2, .L192+32
	ldr	r3, .L192+36
	str	r1, [r2]
	ldr	r2, .L192+40
	ldr	r1, .L192+76
	str	r0, [r3]
	ldr	r3, .L192+48
	str	r1, [r2]
	str	ip, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r0, #112
	ldr	r1, .L192+52
	ldr	r2, .L192+56
	stm	r5, {r0, r8}
	str	r8, [r1]
	str	r8, [r2]
	strh	r8, [r3, #18]	@ movhi
	strh	r8, [r3, #16]	@ movhi
	b	.L188
.L189:
	cmp	r0, #256
	bne	.L161
	mov	r1, #1
	ldr	r3, .L192+40
	ldr	r2, .L192+80
	str	r1, [r4]
	str	r2, [r3]
	bl	setStage
	mov	r3, #142
	mov	r4, #0
	mov	r2, #112
	ldr	r7, .L192+52
	ldr	r6, .L192+56
	str	r3, [r5]
	ldr	r3, .L192+84
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
	b	.L188
.L190:
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L192+28
	str	r2, [r4]
	ldr	r2, .L192+32
	ldr	ip, .L192+36
	str	r0, [r1]
	ldr	r1, .L192+40
	ldr	r0, .L192+88
	str	r3, [r2]
	ldr	r2, .L192+48
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	setStage
	mov	r1, #0
	mov	r0, #67108864
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #80
	add	r3, r3, r3, lsr #31
	str	r2, [r5]
	ldr	ip, .L192+52
	ldr	r2, .L192+56
	asr	r3, r3, #1
	rsb	r3, r3, #120
	str	r3, [r5, #4]
	str	r1, [ip]
	str	r1, [r2]
	strh	r1, [r0, #18]	@ movhi
	strh	r1, [r0, #16]	@ movhi
	b	.L188
.L193:
	.align	2
.L192:
	.word	stage
	.word	player
	.word	67109120
	.word	collision
	.word	hasLeafStone
	.word	431
	.word	382
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	collisionMap
	.word	oceanCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	hasFireStone
	.word	lavaBlobs
	.word	hasWaterStone
	.word	449
	.word	forestCMBitmap
	.word	houseCMBitmap
	.word	hideSprites
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
	ldr	r3, .L204
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	updateNonPlayers.part.0
.L195:
	bl	updatePlayer
	ldr	r3, .L204+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L194
	ldr	r3, .L204+8
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L194
	ldr	r3, .L204+12
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L194:
	pop	{r4, lr}
	bx	lr
.L205:
	.align	2
.L204:
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
	ldr	r3, .L208
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	updateNonPlayers.part.0
.L209:
	.align	2
.L208:
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
	ldr	r3, .L212
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	drawNonPlayers.part.0
.L213:
	.align	2
.L212:
	.word	stage
	.size	drawNonPlayers, .-drawNonPlayers
	.comm	lavaBlobs,240,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	scroll,4,4
	.comm	loopCount,4,4
	.comm	win,4,4
	.comm	hasLeafStone,4,4
	.comm	hasWaterStone,4,4
	.comm	hasFireStone,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

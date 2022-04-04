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
	ldr	r3, .L10
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L7
	ldr	r2, .L10+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L8:
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L10+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L10+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L10+16
	ldrh	r1, [r2]
	ldr	r2, .L10+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L7:
	bl	drawPlayer.part.0
	b	.L8
.L11:
	.align	2
.L10:
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
	ldr	r1, .L14
	ldr	r3, .L14+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L14+8
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
.L15:
	.align	2
.L14:
	.word	vOff
	.word	hOff
	.word	player
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
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
	ldr	r4, .L29
	ldr	r5, [r4, #24]
	add	r3, r5, r5, lsl r1
	ldr	r2, .L29+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	ldr	r3, .L29+8
	ldr	r6, [r4, #28]
	cmp	r2, r3
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bcs	.L17
	ldr	r0, [r4, #36]
	ldr	r3, .L29+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L17:
	ldr	r3, .L29+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L29+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L29+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L20
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L22
.L23:
	mov	r3, #2
	str	r3, [r4, #28]
.L22:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L23
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L22
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
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
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	tst	r3, #64
	push	{r4, r5, lr}
	bne	.L32
	ldr	r1, .L49+4
	ldr	r3, .L49+8
	ldr	lr, [r1]
	ldr	r0, [r1, #8]
	ldr	r2, [r3]
	ldr	r3, [r1, #20]
	sub	lr, lr, r0
	mul	r4, lr, r2
	add	r3, lr, r3
	sub	r3, r3, #1
	mul	r3, r2, r3
	ldr	ip, .L49+12
	ldr	r0, [r1, #4]
	ldr	r2, [r1, #16]
	ldr	ip, [ip]
	add	r2, r0, r2
	sub	r2, r2, #1
	add	r0, ip, r0
	add	r5, ip, r4
	ldrb	r5, [r5, r2]	@ zero_extendqisi2
	add	ip, ip, r2
	ldrb	r2, [r0, r4]	@ zero_extendqisi2
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	cmp	r2, r5
	movcs	r2, r5
	cmp	r3, ip
	movge	r3, ip
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	ldrne	r2, .L49+16
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	lr, [r1]
	strne	r3, [r2]
.L32:
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L33
	ldr	r1, .L49+4
	ldr	r3, .L49+8
	ldr	lr, [r1]
	ldr	r0, [r1, #8]
	ldr	r2, [r3]
	ldr	r3, [r1, #20]
	add	lr, lr, r0
	mul	r4, lr, r2
	add	r3, lr, r3
	sub	r3, r3, #1
	mul	r3, r2, r3
	ldr	ip, .L49+12
	ldr	r0, [r1, #4]
	ldr	r2, [r1, #16]
	ldr	ip, [ip]
	add	r2, r0, r2
	sub	r2, r2, #1
	add	r0, ip, r0
	add	r5, ip, r4
	ldrb	r5, [r5, r2]	@ zero_extendqisi2
	add	ip, ip, r2
	ldrb	r2, [r0, r4]	@ zero_extendqisi2
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	cmp	r2, r5
	movcs	r2, r5
	cmp	r3, ip
	movge	r3, ip
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	ldrne	r2, .L49+16
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	lr, [r1]
	strne	r3, [r2]
.L33:
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L34
	ldr	r1, .L49+4
	ldr	r3, .L49+8
	ldr	r2, [r1]
	ldr	r0, [r3]
	ldr	r3, [r1, #20]
	mul	r5, r2, r0
	add	r3, r2, r3
	sub	r3, r3, #1
	mul	r3, r0, r3
	ldr	lr, [r1, #4]
	ldr	ip, [r1, #12]
	ldr	r0, .L49+12
	ldr	r2, [r1, #16]
	sub	ip, lr, ip
	ldr	r0, [r0]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r4, r0, ip
	add	lr, r0, r5
	ldrb	lr, [lr, r2]	@ zero_extendqisi2
	add	r0, r0, r2
	ldrb	r2, [r4, r5]	@ zero_extendqisi2
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cmp	r2, lr
	movcs	r2, lr
	cmp	r3, r0
	movge	r3, r0
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	ldrne	r2, .L49+20
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	ip, [r1, #4]
	strne	r3, [r2]
.L34:
	ldr	r3, .L49
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L35
	ldr	ip, .L49+4
	ldr	r0, .L49+12
	ldr	r3, .L49+8
	ldr	r1, [ip]
	ldr	r2, [ip, #20]
	ldr	r0, [r0]
	ldr	r3, [r3]
	add	r2, r1, r2
	sub	r2, r2, #1
	mla	r1, r3, r1, r0
	mul	r2, r3, r2
	ldr	r4, [ip, #4]
	ldr	lr, [ip, #12]
	ldr	r3, [ip, #16]
	add	lr, r4, lr
	add	r3, lr, r3
	sub	r3, r3, #1
	ldrb	r5, [r1, r3]	@ zero_extendqisi2
	ldrb	r1, [r1, lr]	@ zero_extendqisi2
	add	r3, r0, r3
	add	r0, r0, lr
	ldrb	r4, [r3, r2]	@ zero_extendqisi2
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	cmp	r1, r5
	movcc	r2, r1
	movcs	r2, r5
	cmp	r3, r4
	movge	r3, r4
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	ldrne	r2, .L49+20
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	lr, [ip, #4]
	strne	r3, [r2]
.L35:
	pop	{r4, r5, lr}
	b	animatePlayer
.L50:
	.align	2
.L49:
	.word	67109120
	.word	player
	.word	mapWidth
	.word	.LANCHOR0
	.word	vOff
	.word	hOff
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
	ldr	r3, .L55
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L52
	ldr	r2, .L55+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L52:
	b	drawPlayer.part.0
.L56:
	.align	2
.L55:
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
	ldr	r4, .L61
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L61+8
	ldr	r1, .L61+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L61+16
	ldr	r1, .L61+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	r4, .L65
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L65+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L65+8
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L65+16
	ldr	r1, .L65+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	DMANow
	.word	housePal
	.word	44928
	.word	houseTiles
	.word	100720640
	.word	houseMap
	.size	setHouseBackground, .-setHouseBackground
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
	ldr	r3, .L73
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L68
	cmp	r3, #1
	beq	.L69
	pop	{r4, lr}
	bx	lr
.L68:
	mov	r3, #67108864
	mov	r1, #512
	ldr	r0, .L73+4
	ldr	r2, .L73+8
	strh	r0, [r3, #8]	@ movhi
	ldr	r3, .L73+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setOutsideBackground
.L69:
	mov	r3, #67108864
	mov	r1, #512
	ldr	r0, .L73+4
	ldr	r2, .L73+8
	strh	r0, [r3, #8]	@ movhi
	ldr	r3, .L73+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L74:
	.align	2
.L73:
	.word	stage
	.word	-9088
	.word	mapWidth
	.word	waitForVBlank
	.size	setStage, .-setStage
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
	ldr	r3, .L80
	ldr	r2, [r3]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L80+4
	ldr	r1, [r2]
	cmp	r1, #256
	bxne	lr
	ldr	r1, [r2, #4]
	cmp	r1, #256
	bxne	lr
	mov	ip, #1
	push	{r4, lr}
	mov	r4, #137
	mov	r1, #114
	ldr	r0, .L80+8
	str	ip, [r3]
	ldr	lr, .L80+12
	ldr	ip, .L80+16
	str	r4, [r0]
	ldr	r3, .L80+20
	ldr	r0, .L80+24
	str	lr, [ip]
	pop	{r4, lr}
	str	r1, [r2, #4]
	str	r1, [r2]
	str	r0, [r3]
	b	setStage
.L81:
	.align	2
.L80:
	.word	stage
	.word	player
	.word	vOff
	.word	houseCMBitmap
	.word	.LANCHOR0
	.word	hOff
	.word	275
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
	pop	{r4, lr}
	b	updatePlayer
	.size	updateGame, .-updateGame
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
	ldr	r4, .L86
	mov	r0, #3
	ldr	r2, .L86+4
	ldr	r1, .L86+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L86+12
	ldr	r1, .L86+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L86+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L86+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.size	initSprites, .-initSprites
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r1, #137
	mov	r2, #83
	ldr	r5, .L90+4
	ldr	r4, .L90+8
	ldrh	r0, [r5]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r4]
	strh	r0, [r3, #16]	@ movhi
	mov	r6, #3
	str	r1, [r5]
	str	r2, [r4]
	bl	initSprites
	mov	lr, #16
	mov	r2, #0
	mov	ip, #1
	ldr	r0, [r5]
	ldr	r1, [r4]
	ldr	r3, .L90+12
	add	r0, r0, #72
	add	r1, r1, #112
	str	r6, [r3, #40]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	stm	r3, {r0, r1}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	player
	.size	initGame, .-initGame
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
	ldr	r2, .L94
	ldrh	r1, [r2]
	ldr	r2, .L94+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	b	initSprites
.L95:
	.align	2
.L94:
	.word	vOff
	.word	hOff
	.size	showGame, .-showGame
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.global	collisionMap
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	outsideCMBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"

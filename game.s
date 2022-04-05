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
	ldr	r0, [r4]
	mov	r1, r5
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r4], #48
	cmp	r4, r6
	bne	.L7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	mapHeight
	.word	lavaBlobs
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
	push	{r4, lr}
	mov	r4, #192
	ldr	r3, .L16
	ldr	r1, .L16+4
	ldr	lr, .L16+8
	add	ip, r3, #40
.L13:
	ldr	r2, [r1, #52]
	ldrb	r0, [r1, #48]	@ zero_extendqisi2
	and	r2, r2, lr
	orr	r2, r2, #16384
	strh	r4, [r3, #12]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r1, r1, #48
	bne	.L13
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #64
	push	{r4, r5, lr}
	bne	.L45
	ldr	r1, .L62+4
	ldr	r3, .L62+8
	ldr	lr, [r1]
	ldr	r0, [r1, #8]
	ldr	r2, [r3]
	ldr	r3, [r1, #20]
	sub	lr, lr, r0
	mul	r4, lr, r2
	add	r3, lr, r3
	sub	r3, r3, #1
	mul	r3, r2, r3
	ldr	ip, .L62+12
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
	ldrne	r2, .L62+16
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	lr, [r1]
	strne	r3, [r2]
.L45:
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L46
	ldr	r1, .L62+4
	ldr	r3, .L62+8
	ldr	lr, [r1]
	ldr	r0, [r1, #8]
	ldr	r2, [r3]
	ldr	r3, [r1, #20]
	add	lr, lr, r0
	mul	r4, lr, r2
	add	r3, lr, r3
	sub	r3, r3, #1
	mul	r3, r2, r3
	ldr	ip, .L62+12
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
	ldrne	r2, .L62+16
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	lr, [r1]
	strne	r3, [r2]
.L46:
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L47
	ldr	r1, .L62+4
	ldr	r3, .L62+8
	ldr	r2, [r1]
	ldr	r0, [r3]
	ldr	r3, [r1, #20]
	mul	r5, r2, r0
	add	r3, r2, r3
	sub	r3, r3, #1
	mul	r3, r0, r3
	ldr	lr, [r1, #4]
	ldr	ip, [r1, #12]
	ldr	r0, .L62+12
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
	ldrne	r2, .L62+20
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	ip, [r1, #4]
	strne	r3, [r2]
.L47:
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L48
	ldr	ip, .L62+4
	ldr	r0, .L62+12
	ldr	r3, .L62+8
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
	ldrne	r2, .L62+20
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	lr, [ip, #4]
	strne	r3, [r2]
.L48:
	pop	{r4, r5, lr}
	b	animatePlayer
.L63:
	.align	2
.L62:
	.word	67109120
	.word	player
	.word	mapWidth
	.word	collisionMap
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
	ldr	r3, .L68
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L65
	ldr	r2, .L68+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L65:
	b	drawPlayer.part.0
.L69:
	.align	2
.L68:
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
	ldr	r4, .L74
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L74+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L74+8
	ldr	r1, .L74+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L74+16
	ldr	r1, .L74+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L75:
	.align	2
.L74:
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
	ldr	r4, .L78
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L78+8
	ldr	r1, .L78+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L78+16
	ldr	r1, .L78+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	DMANow
	.word	housePal
	.word	45600
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
	ldr	r3, .L84
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L81
	ldr	r4, .L84+4
	mov	r0, #3
	ldr	r1, .L84+8
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L84+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L84+16
	ldr	r1, .L84+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L81:
	ldr	r4, .L84+4
	mov	r0, #3
	ldr	r1, .L84+24
	mov	lr, pc
	bx	r4
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L84+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L84+16
	ldr	r1, .L84+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	hasFireStone
	.word	DMANow
	.word	volcanoNoStonePal
	.word	volcanoNoStoneTiles
	.word	100720640
	.word	volcanoNoStoneMap
	.word	volcanoPal
	.word	volcanoTiles
	.word	volcanoMap
	.size	setVolcanoBackground, .-setVolcanoBackground
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
	ldr	r3, .L92
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L87
	cmp	r3, #2
	beq	.L88
	cmp	r3, #0
	beq	.L91
	pop	{r4, lr}
	bx	lr
.L87:
	mov	r3, #67108864
	mov	ip, #4352
	mov	r0, #512
	ldr	r2, .L92+4
	ldr	r1, .L92+8
	strh	r2, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	r2, .L92+12
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setHouseBackground
.L91:
	mov	r3, #67108864
	mov	ip, #4352
	mov	r0, #512
	ldr	r2, .L92+4
	ldr	r1, .L92+8
	strh	r2, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	r2, .L92+12
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L88:
	mov	r3, #67108864
	mov	r2, #7296
	mov	ip, #4352
	mov	r0, #256
	ldr	r1, .L92+8
	strh	r2, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	r2, .L92+12
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L93:
	.align	2
.L92:
	.word	stage
	.word	-9088
	.word	mapWidth
	.word	waitForVBlank
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
	ldr	r2, .L96
	ldrh	r1, [r2]
	ldr	r2, .L96+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L97:
	.align	2
.L96:
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
	ldr	r4, .L100
	mov	r0, #3
	ldr	r2, .L100+4
	ldr	r1, .L100+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L100+12
	ldr	r1, .L100+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L100+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L100+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.size	initSprites, .-initSprites
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
	mov	r4, #0
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L104
	ldr	r3, [r1, #16]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L104+4
	str	r4, [r2]
	ldr	r2, .L104+8
	ldr	r3, [r1, #20]
	str	lr, [r2]
	ldr	r2, .L104+12
	ldr	r4, .L104+16
	str	ip, [r2]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L104+20
	asr	r3, r3, #1
	str	r4, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L105:
	.align	2
.L104:
	.word	player
	.word	stage
	.word	vOff
	.word	hOff
	.word	outsideCMBitmap
	.word	collisionMap
	.size	returnToOutside, .-returnToOutside
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
	ldr	r3, .L114
	add	r1, r3, #1016
.L107:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L107
	ldr	r3, .L114+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L113
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L113:
	mov	r5, #16
	mov	fp, #1
	mov	r10, #0
	ldr	r4, .L114+12
	ldr	r9, .L114+16
	ldr	r8, .L114+20
	ldr	r7, .L114+24
	add	r6, r4, #240
.L109:
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
	bne	.L109
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L115:
	.align	2
.L114:
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
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r0, .L118
	ldr	r2, .L118+4
	ldr	r1, .L118+8
	ldr	r3, .L118+12
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r1, #220
	mov	r2, #144
	ldr	r6, .L118+16
	ldr	r5, .L118+20
	ldrh	r0, [r6]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r5]
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r6]
	str	r2, [r5]
	bl	initNonPlayers
	bl	initSprites
	mov	lr, #3
	mov	ip, #16
	mov	r0, #1
	ldr	r1, [r6]
	ldr	r2, [r5]
	ldr	r3, .L118+24
	add	r1, r1, #72
	add	r2, r2, #112
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	str	lr, [r3, #40]
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	.align	2
.L118:
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	player
	.size	initGame, .-initGame
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L136
	ldr	r4, [r5]
	cmp	r4, #1
	sub	sp, sp, #16
	beq	.L121
	cmp	r4, #2
	beq	.L122
	cmp	r4, #0
	beq	.L134
.L120:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L121:
	mov	r0, #21
	mov	r1, #17
	mov	r2, #212
	mov	r3, #179
	ldr	r4, .L136+4
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L136+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L120
	mov	r6, #0
	ldr	r2, .L136+12
	ldr	r1, .L136+16
	ldr	r3, .L136+20
	str	r1, [r2]
	str	r6, [r5]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	lr, #220
	mov	ip, #144
	mov	r1, #67108864
	mov	r0, r6
	ldr	r3, [r4, #16]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	ldr	r3, [r4, #20]
	rsb	r2, r2, #300
	str	r2, [r4]
	ldr	r2, .L136+24
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	asr	r3, r3, #1
	ldr	r2, .L136+28
	rsb	r3, r3, #264
	str	ip, [r2]
	strh	lr, [r1, #18]	@ movhi
	strh	ip, [r1, #16]	@ movhi
	str	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	initNonPlayers
.L134:
	ldr	r6, .L136+4
	ldr	r3, [r6]
	cmp	r3, #256
	ldr	r2, [r6, #20]
	beq	.L135
.L124:
	ldr	r1, .L136+32
	add	r3, r3, r2
	cmp	r3, r1
	bne	.L120
	ldr	r3, [r6, #4]
	cmp	r3, #254
	bne	.L120
	mov	r1, #256
	mov	r0, #2
	ldr	r3, .L136+36
	ldr	r2, .L136+12
	str	r1, [r3]
	ldr	r1, .L136+40
	ldr	r3, .L136+20
	str	r0, [r5]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #0
	mov	r0, #67108864
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #80
	add	r3, r3, r3, lsr #31
	str	r2, [r6]
	ldr	ip, .L136+24
	ldr	r2, .L136+28
	asr	r3, r3, #1
	rsb	r3, r3, #120
	str	r1, [ip]
	str	r1, [r2]
	strh	r1, [r0, #18]	@ movhi
	strh	r1, [r0, #16]	@ movhi
	str	r3, [r6, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	initNonPlayers
.L122:
	mov	r3, #16
	mov	r2, #224
	ldr	r0, .L136+4
	stm	sp, {r2, r3}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L136+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L120
	mov	r2, #1
	ldr	r3, .L136+44
	str	r2, [r3]
	bl	initNonPlayers
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	returnToOutside
.L135:
	ldr	r1, [r6, #4]
	cmp	r1, #256
	bne	.L124
	mov	r0, #1
	mov	ip, #137
	ldr	r1, [r6, #16]
	add	r3, r2, r2, lsr #31
	add	r2, r1, r1, lsr #31
	asr	r3, r3, r0
	asr	r2, r2, r0
	rsb	r3, r3, #256
	rsb	r2, r2, #352
	add	r3, r3, r0
	add	r2, r2, #3
	str	r3, [r6, #4]
	str	r2, [r6]
	ldr	r3, .L136+12
	ldr	r2, .L136+48
	ldr	r7, .L136+28
	str	r2, [r3]
	ldr	r8, .L136+24
	ldr	r2, .L136+52
	ldr	r3, .L136+56
	str	ip, [r7]
	str	r0, [r5]
	str	r2, [r8]
	mov	lr, pc
	bx	r3
	str	r4, [r6, #44]
	bl	setHouseBackground
	mov	r3, #67108864
	ldrh	r2, [r8]
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r7]
	strh	r2, [r3, #16]	@ movhi
	bl	initNonPlayers
	ldr	r3, [r6]
	ldr	r2, [r6, #20]
	b	.L124
.L137:
	.align	2
.L136:
	.word	stage
	.word	player
	.word	collision
	.word	collisionMap
	.word	outsideCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	431
	.word	mapHeight
	.word	volcanoCMBitmap
	.word	hasFireStone
	.word	houseCMBitmap
	.word	275
	.word	hideSprites
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
	ldr	r3, .L141
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	updateNonPlayers.part.0
.L139:
	pop	{r4, lr}
	b	updatePlayer
.L142:
	.align	2
.L141:
	.word	stage
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
	ldr	r3, .L145
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	updateNonPlayers.part.0
.L146:
	.align	2
.L145:
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
	ldr	r3, .L149
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	drawNonPlayers.part.0
.L150:
	.align	2
.L149:
	.word	stage
	.size	drawNonPlayers, .-drawNonPlayers
	.comm	lavaBlobs,240,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	hasLeafStone,4,4
	.comm	hasWaterStone,4,4
	.comm	hasFireStone,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

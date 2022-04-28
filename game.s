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
	add	r6, r4, #480
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
	.word	lavaRocks+8
	.word	__aeabi_idivmod
	.size	updateNonPlayers.part.0, .-updateNonPlayers.part.0
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
	ldr	r3, .L67
	ldrh	r1, [r3, #48]
	ldr	r2, .L67+4
	tst	r1, #64
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r2]
	bne	.L32
	cmp	r1, #4
	beq	.L33
	ldr	ip, .L67+8
	ldr	r3, .L67+12
	ldr	r4, [ip, #8]
	ldr	r7, [ip]
	ldr	r6, [r3]
	ldr	r2, [ip, #20]
	sub	r7, r7, r4
	mul	r0, r7, r6
	add	r8, r2, r7
	sub	r8, r8, #1
	mul	r8, r6, r8
	ldr	r5, .L67+16
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
	beq	.L34
	ldr	r5, .L67+20
	ldr	r0, .L67+24
	ldr	r8, [r5]
	ldr	r0, [r0]
	subs	r0, r8, r0
	movmi	r0, r8
	str	r7, [ip]
	str	r0, [r5]
.L34:
	ldr	r0, .L67
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L46
.L37:
	ldr	r3, .L67
	ldrh	r3, [r3, #48]
	ldr	r0, .L67+28
	tst	r3, #32
	ldr	r3, [r0]
	bne	.L40
	ldr	lr, .L67+8
	ldr	r2, .L67+12
	ldr	ip, [lr]
	ldr	r4, [r2]
	ldr	r2, [lr, #20]
	mul	r6, ip, r4
	add	r2, ip, r2
	sub	r2, r2, #1
	mul	r2, r4, r2
	ldr	r7, [lr, #4]
	ldr	r4, [lr, #12]
	ldr	r5, .L67+16
	ldr	ip, [lr, #16]
	ldr	r5, [r5]
	sub	r4, r7, r4
	add	ip, r4, ip
	sub	ip, ip, #1
	add	r8, r5, r4
	add	r7, r5, r6
	ldrb	r7, [r7, ip]	@ zero_extendqisi2
	add	r5, r5, ip
	ldrb	ip, [r8, r6]	@ zero_extendqisi2
	ldrb	r5, [r5, r2]	@ zero_extendqisi2
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	ip, r7
	movcs	ip, r7
	cmp	r2, r5
	movge	r2, r5
	cmp	r2, ip
	movge	r2, ip
	cmp	r2, #0
	beq	.L40
	ldr	ip, .L67+32
	ldr	r2, .L67+24
	ldr	r5, [ip]
	ldr	r2, [r2]
	subs	r2, r5, r2
	movmi	r2, r5
	add	r3, r3, #1
	str	r3, [r0]
	str	r4, [lr, #4]
	str	r2, [ip]
.L40:
	ldr	r2, .L67
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L42
	ldr	lr, .L67+8
	ldr	r4, .L67+16
	ldr	r2, .L67+12
	ldr	r6, [lr]
	ldr	ip, [lr, #20]
	ldr	r7, [r4]
	ldr	r5, [r2]
	add	ip, r6, ip
	sub	ip, ip, #1
	mla	r6, r5, r6, r7
	mul	ip, r5, ip
	ldr	r8, [lr, #4]
	ldr	r4, [lr, #12]
	ldr	r2, [lr, #16]
	add	r4, r8, r4
	add	r2, r4, r2
	sub	r2, r2, #1
	ldrb	r8, [r6, r2]	@ zero_extendqisi2
	add	r2, r7, r2
	ldrb	r6, [r6, r4]	@ zero_extendqisi2
	add	r7, r7, r4
	ldrb	r9, [r2, ip]	@ zero_extendqisi2
	ldrb	r2, [r7, ip]	@ zero_extendqisi2
	cmp	r6, r8
	movcc	ip, r6
	movcs	ip, r8
	cmp	r2, r9
	movge	r2, r9
	cmp	r2, ip
	movge	r2, ip
	cmp	r2, #0
	beq	.L42
	ldr	ip, .L67+32
	ldr	r2, .L67+24
	ldr	r6, [r2]
	ldr	r2, [ip]
	add	r6, r2, r6
	add	r7, r6, #239
	cmp	r5, r7
	movgt	r2, r6
	sub	r3, r3, #1
	str	r3, [r0]
	str	r4, [lr, #4]
	str	r2, [ip]
.L42:
	cmp	r1, #3
	beq	.L66
.L44:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #20]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L32:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L37
	cmp	r1, #4
	beq	.L37
	ldr	ip, .L67+8
	ldr	r2, .L67+16
	ldr	lr, [ip, #4]
	ldr	r3, [ip, #16]
	ldr	r0, .L67+12
	ldr	r9, [r2]
	add	r3, lr, r3
	sub	r3, r3, #1
	ldr	r2, [ip, #20]
	ldr	r6, [r0]
	ldr	r4, [ip, #8]
	add	r3, r9, r3
	add	lr, r9, lr
.L46:
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
	beq	.L37
	ldr	r5, .L67+20
	ldr	r2, .L67+24
	ldr	r3, [r5]
	ldr	r2, [r2]
	ldr	r0, .L67+36
	add	r2, r3, r2
	ldr	r0, [r0]
	add	lr, r2, #159
	cmp	lr, r0
	movlt	r3, r2
	str	r4, [ip]
	str	r3, [r5]
	b	.L37
.L66:
	ldr	r0, .L67+32
	ldr	r1, .L67+24
	ldr	r2, [r0]
	ldr	r1, [r1]
	ldr	ip, .L67+12
	add	r1, r2, r1
	ldr	ip, [ip]
	add	r1, r1, #239
	cmp	r1, ip
	bge	.L45
	ldr	r1, .L67+40
	add	r2, r2, #1
	and	lr, r2, r1
	rsbs	ip, r2, #0
	mov	r2, lr
	ldr	r4, .L67+44
	and	ip, ip, r1
	ldr	r1, [r4]
	rsbpl	lr, ip, #0
	cmp	r2, #0
	movne	r2, r1
	addeq	r2, r1, #1
	ldr	r1, .L67+8
	ldr	ip, [r1, #4]
	ldr	r5, [r1, #12]
	add	ip, ip, r5
	str	lr, [r0]
	str	r2, [r4]
	str	ip, [r1, #4]
	b	.L44
.L45:
	ldr	r2, .L67
	ldrh	r2, [r2, #48]
	tst	r2, #32
	ldreq	r2, .L67+8
	ldreq	r1, [r2, #4]
	ldreq	r0, [r2, #12]
	subeq	r1, r1, r0
	streq	r1, [r2, #4]
	b	.L44
.L33:
	ldrh	r3, [r3, #48]
	b	.L37
.L68:
	.align	2
.L67:
	.word	67109120
	.word	stage
	.word	player
	.word	mapWidth
	.word	collisionMap
	.word	vOff
	.word	scroll
	.word	skyShift
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
	ldr	r3, .L73
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L70
	ldr	r2, .L73+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L70:
	b	drawPlayer.part.0
.L74:
	.align	2
.L73:
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
	ldr	r4, .L79
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L79+8
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L79+16
	ldr	r1, .L79+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
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
	ldr	r4, .L83
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L83+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L83+8
	ldr	r1, .L83+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L83+16
	ldr	r1, .L83+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L87
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L87+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L87+8
	ldr	r1, .L87+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L87+16
	ldr	r1, .L87+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
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
	ldr	r3, .L93
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L90
	ldr	r4, .L93+4
	mov	r0, #3
	ldr	r1, .L93+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L93+12
	ldr	r1, .L93+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L93+20
	ldr	r1, .L93+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L90:
	ldr	r4, .L93+4
	mov	r0, #3
	ldr	r1, .L93+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L93+12
	ldr	r1, .L93+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L93+20
	ldr	r1, .L93+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
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
	ldr	r3, .L99
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L96
	ldr	r4, .L99+4
	mov	r0, #3
	ldr	r1, .L99+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L99+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L99+16
	ldr	r1, .L99+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L96:
	ldr	r4, .L99+4
	mov	r0, #3
	ldr	r1, .L99+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L99+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L99+16
	ldr	r1, .L99+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L103
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L103+4
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L103+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L103+12
	ldr	r1, .L103+16
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r0, #3
	ldr	r2, .L103+20
	ldr	r1, .L103+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L103+28
	ldr	r1, .L103+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	DMANow
	.word	forestForegroundPal
	.word	forestForegroundTiles
	.word	100704256
	.word	forestForegroundMap
	.word	100679680
	.word	skyTiles
	.word	100724736
	.word	skyMap
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
	ldr	r3, .L115
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L105
.L108:
	.word	.L113
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L107
.L107:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L115+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L115+8
	ldr	r2, .L115+12
	ldr	r3, .L115+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L113:
	mov	r2, #67108864
	mov	ip, #4352
	mov	r3, #512
	ldr	lr, .L115+20
	ldr	r0, .L115+8
	ldr	r1, .L115+12
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L115+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L112:
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L115+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L115+8
	ldr	r2, .L115+12
	ldr	r3, .L115+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L111:
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L115+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L115+8
	ldr	r1, .L115+12
	ldr	r2, .L115+16
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L110:
	mov	r3, #67108864
	mov	r0, #55296
	mov	r2, #4352
	mov	r4, #1
	mov	ip, #512
	mov	r1, #240
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L115+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L115+8
	ldr	r2, .L115+12
	ldr	r3, .L115+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setOceanBackground
.L109:
	mov	r3, #67108864
	mov	r0, #54272
	mov	r2, #4864
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	r0, .L115+24
	ldr	lr, .L115+4
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L115+8
	ldr	r2, .L115+12
	ldr	r3, .L115+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L105:
	pop	{r4, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	stage
	.word	scroll
	.word	mapWidth
	.word	mapHeight
	.word	waitForVBlank
	.word	-9088
	.word	-8700
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
	ldr	r2, .L119
	ldrh	r1, [r2]
	ldr	r2, .L119+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L120:
	.align	2
.L119:
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
	ldr	r4, .L123
	mov	r0, #3
	ldr	r2, .L123+4
	ldr	r1, .L123+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L123+12
	ldr	r1, .L123+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L123+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L123+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L124:
	.align	2
.L123:
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
	ldr	r3, .L133
	add	r1, r3, #1016
.L126:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L126
	ldr	r3, .L133+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L133+8
	ldr	r7, [r3]
	cmp	r7, #2
	beq	.L132
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L132:
	mov	r8, #16
	mov	fp, #0
	ldr	r4, .L133+12
	ldr	r6, .L133+16
	ldr	r10, .L133+20
	ldr	r5, .L133+24
	ldr	r9, .L133+28
.L128:
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	str	r7, [r4, #8]
	str	fp, [r4, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [r10]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r5
	str	r1, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r1, [r9]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r5
	ldr	r3, .L133+32
	str	r1, [r4], #48
	cmp	r4, r3
	bne	.L128
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	shadowOAM
	.word	hideSprites
	.word	stage
	.word	lavaRocks
	.word	rand
	.word	mapWidth
	.word	__aeabi_idivmod
	.word	mapHeight
	.word	lavaRocks+480
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
	ldr	ip, .L137
	ldr	r0, .L137+4
	ldr	r2, .L137+8
	ldr	r1, .L137+12
	ldr	r3, .L137+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r1, #144
	ldr	r7, .L137+20
	ldr	r6, .L137+24
	ldrh	r0, [r7]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r6]
	strh	r0, [r3, #16]	@ movhi
	ldr	r3, .L137+28
	str	r2, [r7]
	str	r4, [r3]
	ldr	r2, .L137+32
	ldr	r3, .L137+36
	str	r1, [r6]
	str	r4, [r2]
	str	r4, [r3]
	bl	initNonPlayers
	bl	initSprites
	mov	r0, #16
	mov	ip, #3
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, .L137+40
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
.L138:
	.align	2
.L137:
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
	ldr	ip, .L141
	ldr	r1, .L141+4
	ldr	r3, .L141+8
	ldr	r2, .L141+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L141+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L141+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L141+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L142:
	.align	2
.L141:
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
	ldr	r4, .L188
	ldr	r3, [r4]
	sub	sp, sp, #16
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L143
.L146:
	.word	.L151
	.word	.L150
	.word	.L149
	.word	.L148
	.word	.L147
	.word	.L145
.L151:
	ldr	r5, .L188+4
	ldr	r1, [r5]
	cmp	r1, #256
	ldr	r0, [r5, #4]
	beq	.L185
.L152:
	ldr	r3, [r5, #20]
	ldr	r2, .L188+8
	add	ip, r1, r3
	cmp	ip, r2
	bne	.L153
	cmp	r0, #254
	beq	.L186
.L153:
	mov	ip, #17
	mov	r2, #60
	mov	r6, #3
	ldr	r7, .L188+12
	str	ip, [sp, #12]
	stm	sp, {r2, r7}
	str	r6, [sp, #8]
	ldr	r2, [r5, #16]
	ldr	r9, .L188+16
	mov	lr, pc
	bx	r9
	subs	r8, r0, #0
	beq	.L154
	mov	r0, #1
	mov	r1, #240
	mov	ip, #512
	ldr	r2, .L188+20
	ldr	r3, .L188+24
	str	r0, [r2]
	str	r1, [r3]
	ldr	r0, .L188+28
	ldr	r2, .L188+32
	ldr	r1, .L188+36
	ldr	r3, .L188+40
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
	ldr	r0, .L188+44
	ldr	r3, .L188+48
	str	r4, [r0]
	str	r4, [r3]
	str	r1, [r5, #4]
	strh	r4, [r2, #18]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	bl	initNonPlayers
.L183:
	ldr	r3, .L188+52
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L188+56
	ldr	r3, .L188+60
	mov	lr, pc
	bx	r3
.L143:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L145:
	mov	r3, #16
	ldr	r2, .L188+4
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L188+16
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
	beq	.L143
	ldr	r3, .L188+64
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L166
.L184:
	mov	r2, #1
	str	r2, [r3]
.L166:
	bl	returnToOutside
	b	.L183
.L150:
	ldr	r3, .L188+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L143
	ldr	r3, .L188+68
	ldrh	r2, [r3, #48]
	ands	r4, r2, #128
	bne	.L143
	b	.L166
.L148:
	mov	r3, #16
	mov	r1, #224
	mov	r2, #496
	stmib	sp, {r1, r3}
	ldr	r0, .L188+4
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L188+16
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L143
	ldr	r3, .L188+72
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L166
	b	.L184
.L147:
	ldr	r2, .L188+4
	ldr	r3, .L188+28
	ldr	r1, [r2, #16]
	ldr	r3, [r3]
	ldr	r2, [r2, #4]
	sub	r3, r3, r1
	sub	r3, r3, #5
	cmp	r2, r3
	bne	.L143
	ldr	r3, .L188+76
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L166
	b	.L184
.L149:
	ldr	r3, .L188+80
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	movne	r2, #0
	str	r2, [r3]
	beq	.L167
.L160:
	mov	r2, #22
	mov	r3, #237
	mov	r9, #5
	ldr	r5, .L188+4
	str	r2, [sp, #8]
	ldr	ip, .L188+84
	str	r9, [sp, #12]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	ip, [sp, #4]
	ldr	r6, .L188+16
	mov	lr, pc
	bx	r6
	ldr	r3, .L188+52
	cmp	r0, #0
	ldr	r7, [r3]
	bne	.L187
	ldr	r3, .L188+28
	ldr	r1, [r5]
	ldr	r10, [r3]
	mul	r3, r1, r10
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #16]
	add	ip, r0, r2
	ldr	r8, .L188+88
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
	beq	.L180
	ldr	r8, .L188+60
.L161:
	ldr	r4, .L188+92
	ldr	r10, .L188+56
	add	r9, r4, #480
	b	.L163
.L162:
	mov	r2, #0
	mov	r1, r7
	mov	r0, r10
	mov	lr, pc
	bx	r8
	cmp	r4, r9
	beq	.L143
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
.L163:
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
	beq	.L162
	bl	returnToOutside
	b	.L162
.L154:
	mov	r2, #19
	ldr	r3, .L188+96
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
	beq	.L143
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L188+20
	str	r2, [r3]
	ldr	r2, .L188+24
	ldr	r3, .L188+28
	str	r1, [r2]
	ldr	r2, .L188+32
	ldr	r1, .L188+100
	str	r0, [r3]
	ldr	r3, .L188+40
	str	r1, [r2]
	str	ip, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r0, #112
	ldr	r1, .L188+44
	ldr	r2, .L188+48
	stm	r5, {r0, r8}
	str	r8, [r1]
	str	r8, [r2]
	strh	r8, [r3, #18]	@ movhi
	strh	r8, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L183
.L185:
	cmp	r0, #256
	bne	.L152
	mov	r1, #1
	ldr	r3, .L188+32
	ldr	r2, .L188+104
	str	r1, [r4]
	str	r2, [r3]
	bl	setStage
	mov	r3, #142
	mov	r4, #0
	mov	r2, #112
	ldr	r7, .L188+44
	ldr	r6, .L188+48
	str	r3, [r5]
	ldr	r3, .L188+108
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
	b	.L183
.L167:
	mov	r2, #83886080
	ldr	r1, .L188+112
.L157:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L157
	b	.L160
.L187:
	mov	r8, #0
	mov	r1, #160
	mov	ip, #240
	ldr	r2, .L188+20
	ldr	r3, .L188+24
	ldr	r0, .L188+28
	str	r8, [r2]
	str	r1, [r3]
	ldr	r2, .L188+32
	ldr	r1, .L188+116
	ldr	r3, .L188+40
	str	ip, [r0]
	str	r1, [r2]
	str	r9, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #127
	mov	r3, #67108864
	mov	r1, #110
	ldr	ip, .L188+44
	ldr	r0, .L188+48
	str	r2, [r5]
	str	r8, [ip]
	str	r8, [r0]
	str	r1, [r5, #4]
	strh	r8, [r3, #18]	@ movhi
	strh	r8, [r3, #16]	@ movhi
	bl	initNonPlayers
	mov	r2, r8
.L182:
	mov	r1, r7
	ldr	r0, .L188+56
	ldr	r8, .L188+60
	mov	lr, pc
	bx	r8
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L161
.L180:
	bl	returnToOutside
	mov	r2, r4
	b	.L182
.L186:
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L188+20
	str	r2, [r4]
	ldr	r2, .L188+24
	ldr	ip, .L188+28
	str	r0, [r1]
	mov	r4, #0
	ldr	r1, .L188+32
	ldr	r0, .L188+120
	str	r3, [r2]
	ldr	r2, .L188+40
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	setStage
	mov	r2, #130
	mov	r3, #67108864
	mov	ip, #33
	mov	r0, #240
	ldr	r1, .L188+44
	str	r4, [r1]
	ldr	r1, .L188+48
	str	ip, [r5]
	str	r0, [r5, #4]
	str	r2, [r1]
	strh	r4, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L183
.L189:
	.align	2
.L188:
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
	.word	soundB_length
	.word	soundB_data
	.word	playSoundB
	.word	hasFireStone
	.word	67109120
	.word	hasWaterStone
	.word	hasLeafStone
	.word	wait
	.word	498
	.word	lavaPoolCMBitmap
	.word	lavaRocks
	.word	449
	.word	forestCMBitmap
	.word	houseCMBitmap
	.word	hideSprites
	.word	83886112
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
	ldr	r3, .L197
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	updateNonPlayers.part.0
.L191:
	bl	updatePlayer
	ldr	r3, .L197+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L190
	ldr	r3, .L197+8
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L190:
	pop	{r4, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	stage
	.word	hasFireStone
	.word	hasLeafStone
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
	ldr	r3, .L201
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	updateNonPlayers.part.0
.L202:
	.align	2
.L201:
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
	ldr	r3, .L217
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L204
	cmp	r3, #2
	bne	.L203
	ldr	r2, .L217+4
	ldr	r3, .L217+8
	ldrh	r7, [r2]
	ldr	r2, .L217+12
	ldr	ip, [r3]
	ldr	r1, [r2, #4]
	ldr	r3, .L217+16
	lsl	r4, ip, #16
	cmp	r1, ip
	mov	r8, #192
	ldr	r6, .L217+20
	lsr	r4, r4, #16
	add	r5, ip, #239
	add	lr, r3, #80
	ble	.L211
.L216:
	sub	r0, r1, r4
	and	r0, r0, r6
	cmp	r1, r5
	orr	r0, r0, #16384
	bgt	.L211
	ldr	r1, [r2]
	sub	r1, r1, r7
	and	r1, r1, #255
	strh	r0, [r3, #10]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #48
	beq	.L203
.L213:
	ldr	r1, [r2, #4]
	cmp	r1, ip
	bgt	.L216
.L211:
	ldrh	r1, [r3, #8]
	orr	r1, r1, #512
	strh	r1, [r3, #8]	@ movhi
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #48
	bne	.L213
.L203:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L204:
	ldr	r0, .L217+24
	ldr	r2, [r0]
	ldr	r1, .L217+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r4, .L217+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	r1, [r4]
	bne	.L207
	ldr	r2, .L217+36
	add	r3, r1, #1
	smull	r0, r1, r2, r3
	sub	r1, r1, r3, asr #31
	add	r1, r1, r1, lsl #1
	sub	r1, r3, r1
.L207:
	ldr	r3, .L217+8
	ldr	ip, .L217+40
	ldrh	r3, [r3]
	ldr	ip, [ip]
	rsb	r2, r3, #108
	lsl	r2, r2, #23
	str	r1, [r4]
	cmp	ip, #0
	lsr	r2, r2, #23
	lsl	ip, r1, #23
	ldr	r1, .L217+16
	orr	r2, r2, #32768
	ldr	r0, .L217+4
	strh	r2, [r1, #10]	@ movhi
	ldr	r2, .L217+44
	ldrh	r0, [r0]
	ldr	r2, [r2]
	rsb	r3, r3, #158
	lsr	ip, ip, #16
	lsl	r3, r3, #23
	addne	r4, ip, #16
	addeq	r4, ip, #8
	rsb	lr, r0, #57
	cmp	r2, #0
	lsr	r3, r3, #23
	rsb	r0, r0, #59
	and	lr, lr, #255
	orr	r3, r3, #32768
	and	r0, r0, #255
	addne	ip, ip, #20
	addeq	ip, ip, #12
	strh	lr, [r1, #8]	@ movhi
	strh	r4, [r1, #12]	@ movhi
	strhne	ip, [r1, #20]	@ movhi
	strhne	r0, [r1, #16]	@ movhi
	strhne	r3, [r1, #18]	@ movhi
	strheq	ip, [r1, #28]	@ movhi
	strheq	r0, [r1, #24]	@ movhi
	strheq	r3, [r1, #26]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L218:
	.align	2
.L217:
	.word	stage
	.word	vOff
	.word	hOff
	.word	lavaRocks
	.word	shadowOAM
	.word	511
	.word	eeveeTimer
	.word	-2004318071
	.word	currEeveeFrame
	.word	1431655766
	.word	hasFireStone
	.word	hasLeafStone
	.size	drawNonPlayers, .-drawNonPlayers
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
	push	{r4, lr}
	bl	drawNonPlayers
	ldr	r3, .L223
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L220
	ldr	r2, .L223+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L221:
	ldr	r3, .L223+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L223+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L223+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L223+16
	ldrh	r1, [r2]
	ldr	r2, .L223+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L220:
	bl	drawPlayer.part.0
	b	.L221
.L224:
	.align	2
.L223:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	lavaRocks,480,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	scroll,4,4
	.comm	eeveeTimer,4,4
	.comm	currEeveeFrame,4,4
	.comm	loopCount,4,4
	.comm	wait,4,4
	.comm	hasLeafStone,4,4
	.comm	hasWaterStone,4,4
	.comm	hasFireStone,4,4
	.comm	skyShift,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	collisionMap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

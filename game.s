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
	add	r6, r4, #192
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
	ldr	r3, .L64
	ldrh	r2, [r3, #48]
	tst	r2, #64
	push	{r4, r5, r6, r7, r8, r9, lr}
	bne	.L32
	ldr	r2, .L64+4
	ldr	r2, [r2]
	cmp	r2, #4
	beq	.L33
	ldr	r1, .L64+8
	ldr	r3, .L64+12
	ldr	r6, [r1, #8]
	ldr	r5, [r1]
	ldr	r4, [r3]
	ldr	r2, [r1, #20]
	sub	r5, r5, r6
	mul	r8, r5, r4
	add	lr, r2, r5
	sub	lr, lr, #1
	mul	lr, r4, lr
	ldr	r0, .L64+16
	ldr	ip, [r1, #4]
	ldr	r3, [r1, #16]
	ldr	r7, [r0]
	add	r3, ip, r3
	add	r0, r7, r8
	sub	r3, r3, #1
	add	ip, r7, ip
	ldrb	r9, [r0, r3]	@ zero_extendqisi2
	add	r3, r7, r3
	ldrb	r7, [ip, r8]	@ zero_extendqisi2
	ldrb	r0, [ip, lr]	@ zero_extendqisi2
	ldrb	r8, [r3, lr]	@ zero_extendqisi2
	cmp	r7, r9
	movcc	lr, r7
	movcs	lr, r9
	cmp	r0, r8
	movge	r0, r8
	cmp	r0, lr
	movge	r0, lr
	cmp	r0, #0
	beq	.L34
	ldr	lr, .L64+20
	ldr	r0, .L64+24
	ldr	r7, [lr]
	ldr	r0, [r0]
	subs	r0, r7, r0
	movmi	r0, r7
	str	r5, [r1]
	str	r0, [lr]
.L34:
	ldr	r0, .L64
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L44
.L37:
	ldr	r3, .L64
	ldrh	r3, [r3, #48]
	ldr	r0, .L64+28
	tst	r3, #32
	ldr	r3, [r0]
	bne	.L40
	ldr	ip, .L64+8
	ldr	r2, .L64+12
	ldr	r1, [ip]
	ldr	lr, [r2]
	ldr	r2, [ip, #20]
	mul	r5, r1, lr
	add	r2, r1, r2
	sub	r2, r2, #1
	mul	r2, lr, r2
	ldr	r6, [ip, #4]
	ldr	r4, [ip, #12]
	ldr	lr, .L64+16
	ldr	r1, [ip, #16]
	ldr	lr, [lr]
	sub	r4, r6, r4
	add	r1, r4, r1
	sub	r1, r1, #1
	add	r7, lr, r4
	add	r6, lr, r5
	ldrb	r6, [r6, r1]	@ zero_extendqisi2
	add	lr, lr, r1
	ldrb	r1, [r7, r5]	@ zero_extendqisi2
	ldrb	lr, [lr, r2]	@ zero_extendqisi2
	ldrb	r2, [r7, r2]	@ zero_extendqisi2
	cmp	r1, r6
	movcs	r1, r6
	cmp	r2, lr
	movge	r2, lr
	cmp	r2, r1
	movge	r2, r1
	cmp	r2, #0
	beq	.L40
	ldr	r1, .L64+32
	ldr	lr, .L64+36
	ldr	r2, .L64+24
	ldr	r5, [lr]
	ldr	r2, [r2]
	ldr	lr, [r1]
	subs	r2, lr, r2
	movmi	r2, lr
	cmp	r5, #0
	subeq	r3, r3, #1
	str	r4, [ip, #4]
	str	r2, [r1]
	str	r3, [r0]
.L40:
	ldr	r2, .L64
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L42
	ldr	ip, .L64+8
	ldr	lr, .L64+16
	ldr	r2, .L64+12
	ldr	r5, [ip]
	ldr	r1, [ip, #20]
	ldr	r6, [lr]
	ldr	r4, [r2]
	add	r1, r5, r1
	sub	r1, r1, #1
	mla	r5, r4, r5, r6
	mul	r1, r4, r1
	ldr	r7, [ip, #4]
	ldr	lr, [ip, #12]
	ldr	r2, [ip, #16]
	add	lr, r7, lr
	add	r2, lr, r2
	sub	r2, r2, #1
	ldrb	r7, [r5, r2]	@ zero_extendqisi2
	add	r2, r6, r2
	ldrb	r5, [r5, lr]	@ zero_extendqisi2
	add	r6, r6, lr
	ldrb	r8, [r2, r1]	@ zero_extendqisi2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	cmp	r5, r7
	movcc	r1, r5
	movcs	r1, r7
	cmp	r2, r8
	movge	r2, r8
	cmp	r2, r1
	movge	r2, r1
	cmp	r2, #0
	beq	.L42
	ldr	r1, .L64+32
	ldr	r2, .L64+24
	ldr	r6, .L64+36
	ldr	r5, [r2]
	ldr	r2, [r1]
	ldr	r6, [r6]
	add	r5, r2, r5
	cmp	r6, #0
	addeq	r3, r3, #1
	add	r6, r5, #239
	cmp	r4, r6
	movgt	r2, r5
	str	lr, [ip, #4]
	str	r2, [r1]
	str	r3, [r0]
.L42:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #20]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	animatePlayer
.L32:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L37
	ldr	r3, .L64+4
	ldr	r3, [r3]
	cmp	r3, #4
	beq	.L37
	ldr	r1, .L64+8
	ldr	r2, .L64+16
	ldr	ip, [r1, #4]
	ldr	r3, [r1, #16]
	ldr	r0, .L64+12
	ldr	r7, [r2]
	add	r3, ip, r3
	sub	r3, r3, #1
	ldr	r2, [r1, #20]
	ldr	r4, [r0]
	ldr	r6, [r1, #8]
	add	r3, r7, r3
	add	ip, r7, ip
.L44:
	ldr	r0, [r1]
	add	r6, r6, r0
	add	r2, r6, r2
	mul	r0, r4, r6
	sub	r2, r2, #1
	mul	r2, r4, r2
	ldrb	lr, [ip, r0]	@ zero_extendqisi2
	ldrb	r4, [r3, r0]	@ zero_extendqisi2
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldrb	r0, [ip, r2]	@ zero_extendqisi2
	cmp	lr, r4
	movcc	r2, lr
	movcs	r2, r4
	cmp	r0, r3
	movlt	r3, r0
	cmp	r3, r2
	movge	r3, r2
	cmp	r3, #0
	beq	.L37
	ldr	lr, .L64+20
	ldr	r2, .L64+24
	ldr	r3, [lr]
	ldr	r2, [r2]
	ldr	r0, .L64+40
	add	r2, r3, r2
	ldr	r0, [r0]
	add	ip, r2, #159
	cmp	ip, r0
	movlt	r3, r2
	str	r6, [r1]
	str	r3, [lr]
	b	.L37
.L33:
	ldrh	r3, [r3, #48]
	b	.L37
.L65:
	.align	2
.L64:
	.word	67109120
	.word	stage
	.word	player
	.word	mapWidth
	.word	collisionMap
	.word	vOff
	.word	scroll
	.word	skyShift
	.word	hOff
	.word	wait
	.word	mapHeight
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
	ldr	r3, .L70
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L67
	ldr	r2, .L70+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L67:
	b	drawPlayer.part.0
.L71:
	.align	2
.L70:
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
	ldr	r4, .L76
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L76+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L76+8
	ldr	r1, .L76+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L76+16
	ldr	r1, .L76+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r4, .L80
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L80+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L80+8
	ldr	r1, .L80+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L80+16
	ldr	r1, .L80+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r4, .L84
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L84+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L84+8
	ldr	r1, .L84+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L84+16
	ldr	r1, .L84+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	DMANow
	.word	volcanoPal
	.word	5856
	.word	volcanoTiles
	.word	100712448
	.word	volcanoMap
	.size	setVolcanoBackground, .-setVolcanoBackground
	.align	2
	.global	setLavaHitBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setLavaHitBackground, %function
setLavaHitBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #67108864
	mov	r3, #0
	mov	r4, #256
	mov	r1, #7168
	strh	r1, [r2, #8]	@ movhi
	strh	r4, [r2]	@ movhi
	ldr	r1, .L88
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L88+4
	mov	r0, #3
	ldr	r1, .L88+8
	mov	lr, pc
	bx	r4
	mov	r3, #5952
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L88+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+16
	ldr	r1, .L88+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	waitForVBlank
	.word	DMANow
	.word	LavaLosePal
	.word	LavaLoseTiles
	.word	100712448
	.word	LavaLoseMap
	.size	setLavaHitBackground, .-setLavaHitBackground
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
	ldr	r3, .L94
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L91
	ldr	r4, .L94+4
	mov	r0, #3
	ldr	r1, .L94+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L94+12
	ldr	r1, .L94+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L94+20
	ldr	r1, .L94+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L91:
	ldr	r4, .L94+4
	mov	r0, #3
	ldr	r1, .L94+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L94+12
	ldr	r1, .L94+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L94+20
	ldr	r1, .L94+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L95:
	.align	2
.L94:
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
	ldr	r3, .L100
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L97
	ldr	r4, .L100+4
	mov	r0, #3
	ldr	r1, .L100+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L100+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L100+16
	ldr	r1, .L100+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L97:
	ldr	r4, .L100+4
	mov	r0, #3
	ldr	r1, .L100+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L100+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L100+16
	ldr	r1, .L100+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
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
	ldr	r4, .L104
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L104+4
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L104+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L104+12
	ldr	r1, .L104+16
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r0, #3
	ldr	r2, .L104+20
	ldr	r1, .L104+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L104+28
	ldr	r1, .L104+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L105:
	.align	2
.L104:
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
	.global	setLeafStoneClearingBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setLeafStoneClearingBackground, %function
setLeafStoneClearingBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L110
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L107
	ldr	r4, .L110+4
	mov	r0, #3
	ldr	r1, .L110+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r1, .L110+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L110+20
	ldr	r1, .L110+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L107:
	ldr	r4, .L110+4
	mov	r0, #3
	ldr	r1, .L110+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r1, .L110+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L110+20
	ldr	r1, .L110+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	hasLeafStone
	.word	DMANow
	.word	forestClearingNoStonePal
	.word	9056
	.word	forestClearingNoStoneTiles
	.word	100720640
	.word	forestClearingNoStoneMap
	.word	forestClearingPal
	.word	forestClearingTiles
	.word	forestClearingMap
	.size	setLeafStoneClearingBackground, .-setLeafStoneClearingBackground
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
	ldr	r3, .L122
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L112
.L115:
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L112
	.word	.L117
	.word	.L116
	.word	.L114
.L114:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L122+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L122+8
	ldr	r2, .L122+12
	ldr	r3, .L122+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setLeafStoneClearingBackground
.L120:
	mov	r2, #67108864
	mov	ip, #4352
	mov	r3, #512
	ldr	lr, .L122+20
	ldr	r0, .L122+8
	ldr	r1, .L122+12
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L122+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L119:
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L122+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L122+8
	ldr	r2, .L122+12
	ldr	r3, .L122+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L118:
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L122+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L122+8
	ldr	r1, .L122+12
	ldr	r2, .L122+16
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L117:
	mov	r3, #67108864
	mov	r0, #54272
	mov	r2, #4864
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	r0, .L122+24
	ldr	lr, .L122+4
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L122+8
	ldr	r2, .L122+12
	ldr	r3, .L122+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L116:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L122+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L122+8
	ldr	r2, .L122+12
	ldr	r3, .L122+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L112:
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
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
	ldr	r2, .L126
	ldrh	r1, [r2]
	ldr	r2, .L126+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L127:
	.align	2
.L126:
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
	ldr	r4, .L130
	mov	r0, #3
	ldr	r2, .L130+4
	ldr	r1, .L130+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L130+12
	ldr	r1, .L130+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L130+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L131:
	.align	2
.L130:
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
	ldr	r3, .L142
	add	r1, r3, #1016
.L133:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L133
	ldr	r3, .L142+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L141
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L141:
	mov	r5, #0
	mov	r8, #16
	mov	fp, r5
	ldr	r4, .L142+12
	ldr	r7, .L142+16
	ldr	r10, .L142+20
	ldr	r6, .L142+24
	ldr	r9, .L142+28
.L136:
	tst	r5, #1
	moveq	r3, #2
	movne	r3, #4
	str	r8, [r4, #16]
	str	r3, [r4, #8]
	str	r8, [r4, #20]
	str	fp, [r4, #12]
	mov	lr, pc
	bx	r7
	ldr	r1, [r10]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r6
	str	r1, [r4, #4]
	mov	lr, pc
	bx	r7
	ldr	r1, [r9]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r6
	add	r5, r5, #1
	cmp	r5, #4
	str	r1, [r4], #48
	bne	.L136
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	shadowOAM
	.word	hideSprites
	.word	stage
	.word	lavaRocks
	.word	rand
	.word	mapWidth
	.word	__aeabi_idivmod
	.word	mapHeight
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
	ldr	ip, .L146
	ldr	r0, .L146+4
	ldr	r2, .L146+8
	ldr	r1, .L146+12
	ldr	r3, .L146+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r1, #144
	ldr	r7, .L146+20
	ldr	r6, .L146+24
	ldrh	r0, [r7]
	strh	r0, [r3, #18]	@ movhi
	ldrh	r0, [r6]
	strh	r0, [r3, #16]	@ movhi
	ldr	r3, .L146+28
	str	r2, [r7]
	str	r4, [r3]
	ldr	r2, .L146+32
	ldr	r3, .L146+36
	str	r1, [r6]
	str	r4, [r2]
	str	r4, [r3]
	bl	initNonPlayers
	bl	initSprites
	mov	r0, #16
	mov	ip, #3
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, .L146+40
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
.L147:
	.align	2
.L146:
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
	ldr	ip, .L150
	ldr	r1, .L150+4
	ldr	r3, .L150+8
	ldr	r2, .L150+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L150+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L150+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L150+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L151:
	.align	2
.L150:
	.word	scroll
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	player
	.word	vOff
	.word	hOff
	.size	returnToOutside, .-returnToOutside
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
	ldr	r3, .L154
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	updateNonPlayers.part.0
.L155:
	.align	2
.L154:
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
	ldr	r3, .L170
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	beq	.L157
	cmp	r3, #2
	bne	.L156
	mov	r8, #192
	ldr	r3, .L170+4
	ldr	r2, .L170+8
	ldr	r4, [r3]
	ldr	ip, [r2]
	ldr	r3, .L170+12
	lsl	r6, ip, #16
	lsl	r5, r4, #16
	ldr	r1, .L170+16
	ldr	r7, .L170+20
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	add	lr, r3, r8
.L166:
	ldr	r0, [r3]
	ldr	r2, [r3, #20]
	add	r2, r0, r2
	sub	r2, r2, ip
	cmp	r2, #0
	sub	r9, r0, ip
	blt	.L164
	cmp	r9, #160
	bgt	.L164
	ldr	r2, [r3, #4]
	ldr	r10, [r3, #16]
	add	r10, r2, r10
	sub	r10, r10, r4
	cmp	r10, #0
	sub	r9, r2, r4
	blt	.L164
	sub	r2, r2, r5
	sub	r0, r0, r6
	and	r2, r2, r7
	cmp	r9, #240
	and	r0, r0, #255
	orr	r2, r2, #16384
	ble	.L169
.L164:
	ldrh	r2, [r1, #8]
	orr	r2, r2, #512
	strh	r2, [r1, #8]	@ movhi
.L165:
	add	r3, r3, #48
	cmp	lr, r3
	add	r1, r1, #8
	bne	.L166
.L156:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L157:
	ldr	r0, .L170+24
	ldr	r2, [r0]
	ldr	r1, .L170+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r4, .L170+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	r1, [r4]
	bne	.L160
	ldr	r2, .L170+36
	add	r3, r1, #1
	smull	r0, r1, r2, r3
	sub	r1, r1, r3, asr #31
	add	r1, r1, r1, lsl #1
	sub	r1, r3, r1
.L160:
	ldr	r3, .L170+4
	ldr	ip, .L170+40
	ldrh	r3, [r3]
	ldr	ip, [ip]
	rsb	r2, r3, #108
	lsl	r2, r2, #23
	str	r1, [r4]
	cmp	ip, #0
	lsr	r2, r2, #23
	lsl	ip, r1, #23
	ldr	r1, .L170+16
	orr	r2, r2, #32768
	ldr	r0, .L170+8
	strh	r2, [r1, #10]	@ movhi
	ldr	r2, .L170+44
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
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L169:
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	strh	r8, [r1, #12]	@ movhi
	b	.L165
.L171:
	.align	2
.L170:
	.word	stage
	.word	hOff
	.word	vOff
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
	ldr	r3, .L176
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L173
	ldr	r2, .L176+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L174:
	ldr	r3, .L176+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L176+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L176+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L176+16
	ldrh	r1, [r2]
	ldr	r2, .L176+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L173:
	bl	drawPlayer.part.0
	b	.L174
.L177:
	.align	2
.L176:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	returnToHouse
	.syntax unified
	.arm
	.fpu softvfp
	.type	returnToHouse, %function
returnToHouse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	ldr	r1, .L180
	ldr	r3, .L180+4
	ldr	r2, .L180+8
	push	{r4, r5, r6, r7, r8, lr}
	str	r0, [r1]
	str	r2, [r3]
	bl	setStage
	mov	r3, #142
	mov	r4, #0
	mov	r2, #112
	ldr	r5, .L180+12
	ldr	r7, .L180+16
	ldr	r6, .L180+20
	str	r3, [r5]
	ldr	r3, .L180+24
	str	r2, [r5, #4]
	str	r4, [r7]
	str	r4, [r6]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r7]
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r6]
	strh	r2, [r3, #16]	@ movhi
	str	r4, [r5, #44]
	bl	initNonPlayers
	ldr	r3, .L180+28
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L180+32
	ldr	r3, .L180+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	stage
	.word	collisionMap
	.word	houseCMBitmap
	.word	player
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	soundB_length
	.word	soundB_data
	.word	playSoundB
	.size	returnToHouse, .-returnToHouse
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
	ldr	r4, .L224
	ldr	r3, [r4]
	sub	sp, sp, #16
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L182
.L185:
	.word	.L190
	.word	.L189
	.word	.L188
	.word	.L182
	.word	.L187
	.word	.L186
	.word	.L184
.L186:
	mov	r3, #16
	ldr	r2, .L224+4
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L224+8
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
	beq	.L182
	ldr	r3, .L224+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3]
	bl	returnToHouse
.L219:
	ldr	r3, .L224+16
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L224+20
	ldr	r3, .L224+24
	mov	lr, pc
	bx	r3
.L182:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L184:
	mov	ip, #23
	mov	r1, #21
	mov	r2, #107
	mov	r3, #80
	ldr	r0, .L224+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L224+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L182
	ldr	r3, .L224+28
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3]
.L203:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	returnToHouse
.L190:
	ldr	r5, .L224+4
	ldr	r1, [r5]
	cmp	r1, #256
	ldr	r0, [r5, #4]
	beq	.L220
.L191:
	ldr	r3, [r5, #20]
	ldr	r2, .L224+32
	add	ip, r1, r3
	cmp	ip, r2
	bne	.L192
	cmp	r0, #254
	beq	.L221
.L192:
	mov	r2, #19
	mov	lr, #3
	ldr	ip, .L224+36
	str	r2, [sp, #12]
	ldr	r2, .L224+40
	ldr	r6, .L224+8
	stm	sp, {r2, ip, lr}
	ldr	r2, [r5, #16]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L182
	mov	r3, #4
	mov	r0, #1
	mov	r1, #160
	mov	ip, #512
	str	r3, [r4]
	ldr	r2, .L224+44
	ldr	r3, .L224+48
	str	r0, [r2]
	str	r1, [r3]
	ldr	r0, .L224+52
	ldr	r2, .L224+56
	ldr	r1, .L224+60
	ldr	r3, .L224+64
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #112
	mov	r4, #0
	mov	r3, #67108864
	mov	r2, #50
	str	r1, [r5]
	ldr	r0, .L224+68
	ldr	r1, .L224+72
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r5, #4]
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L219
.L189:
	ldr	r3, .L224+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L182
	ldr	r3, .L224+76
	ldrh	r2, [r3, #48]
	ands	r4, r2, #128
	bne	.L182
	bl	returnToOutside
	b	.L219
.L188:
	ldr	r3, .L224+80
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L204
.L198:
	mov	r2, #22
	mov	r3, #237
	mov	r8, #5
	ldr	r5, .L224+4
	str	r2, [sp, #8]
	ldr	ip, .L224+84
	str	r8, [sp, #12]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	ip, [sp, #4]
	ldr	r6, .L224+8
	mov	lr, pc
	bx	r6
	ldr	r3, .L224+16
	cmp	r0, #0
	ldr	r7, [r3]
	bne	.L222
	ldr	r3, .L224+52
	ldr	r1, [r5]
	ldr	r10, [r3]
	mul	r3, r1, r10
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #16]
	add	ip, r0, r2
	ldr	r8, .L224+88
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
	beq	.L217
	ldr	r8, .L224+24
.L199:
	ldr	r4, .L224+92
	ldr	r10, .L224+20
	add	r9, r4, #192
.L201:
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
	bne	.L223
.L200:
	mov	r2, #0
	mov	r1, r7
	mov	r0, r10
	mov	lr, pc
	bx	r8
	cmp	r9, r4
	beq	.L182
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L201
.L187:
	ldr	r5, .L224+4
	ldr	r1, .L224+52
	ldr	r2, [r5, #16]
	ldr	r3, [r1]
	sub	r3, r3, r2
	ldr	r2, [r5, #4]
	sub	r3, r3, #5
	cmp	r2, r3
	bne	.L182
	mov	r3, #240
	mov	r6, #0
	mov	ip, #160
	mov	r0, #6
	ldr	r2, .L224+44
	str	r3, [r1]
	ldr	r3, .L224+48
	str	r6, [r2]
	ldr	r1, .L224+96
	ldr	r2, .L224+56
	str	ip, [r3]
	ldr	r3, .L224+64
	str	r0, [r4]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r1, #143
	mov	r2, #152
	ldr	ip, .L224+68
	ldr	r0, .L224+72
	str	r6, [ip]
	str	r6, [r0]
	str	r1, [r5]
	strh	r6, [r3, #18]	@ movhi
	strh	r6, [r3, #16]	@ movhi
	str	r2, [r5, #4]
	bl	initNonPlayers
	b	.L219
.L223:
	bl	returnToHouse
	b	.L200
.L204:
	mov	r2, #83886080
	ldr	r1, .L224+100
.L195:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L195
	b	.L198
.L220:
	cmp	r0, #256
	bne	.L191
	b	.L203
.L222:
	mov	r9, #0
	mov	r1, #160
	mov	ip, #240
	ldr	r2, .L224+44
	ldr	r3, .L224+48
	ldr	r0, .L224+52
	str	r9, [r2]
	str	r1, [r3]
	ldr	r2, .L224+56
	ldr	r1, .L224+104
	ldr	r3, .L224+64
	str	ip, [r0]
	str	r1, [r2]
	str	r8, [r4]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r1, #110
	mov	r2, #127
	ldr	ip, .L224+68
	ldr	r0, .L224+72
	str	r9, [ip]
	str	r9, [r0]
	str	r1, [r5, #4]
	str	r2, [r5]
	strh	r9, [r3, #18]	@ movhi
	strh	r9, [r3, #16]	@ movhi
	bl	initNonPlayers
	ldr	r8, .L224+24
	mov	r2, r9
	mov	r1, r7
	ldr	r0, .L224+20
	mov	lr, pc
	bx	r8
	add	r2, r5, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L199
.L217:
	bl	returnToHouse
	add	r2, r5, #16
	ldr	r8, .L224+24
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	b	.L199
.L221:
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L224+44
	str	r2, [r4]
	ldr	r2, .L224+48
	ldr	ip, .L224+52
	str	r0, [r1]
	mov	r4, #0
	ldr	r1, .L224+56
	ldr	r0, .L224+108
	str	r3, [r2]
	ldr	r2, .L224+64
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	setStage
	mov	r2, #130
	mov	r3, #67108864
	mov	ip, #33
	mov	r0, #240
	ldr	r1, .L224+68
	str	r4, [r1]
	ldr	r1, .L224+72
	str	ip, [r5]
	str	r0, [r5, #4]
	str	r2, [r1]
	strh	r4, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	bl	initNonPlayers
	b	.L219
.L225:
	.align	2
.L224:
	.word	stage
	.word	player
	.word	collision
	.word	hasFireStone
	.word	soundB_length
	.word	soundB_data
	.word	playSoundB
	.word	hasLeafStone
	.word	431
	.word	382
	.word	449
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	collisionMap
	.word	forestCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	67109120
	.word	wait
	.word	498
	.word	lavaPoolCMBitmap
	.word	lavaRocks
	.word	forestClearingCMBitmap
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
	ldr	r2, .L233
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	push	{r4, lr}
	str	r3, [r2]
	bl	updateStage
	ldr	r3, .L233+4
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	updateNonPlayers.part.0
.L227:
	bl	updatePlayer
	ldr	r3, .L233+8
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L226
	ldr	r3, .L233+12
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L226:
	pop	{r4, lr}
	bx	lr
.L234:
	.align	2
.L233:
	.word	wait
	.word	stage
	.word	hasFireStone
	.word	hasLeafStone
	.size	updateGame, .-updateGame
	.comm	lavaRocks,192,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	scroll,4,4
	.comm	eeveeTimer,4,4
	.comm	currEeveeFrame,4,4
	.comm	loopCount,4,4
	.comm	infoScreen,4,4
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

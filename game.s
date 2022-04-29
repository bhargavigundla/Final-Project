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
	ldr	r1, .L8
	ldr	r3, .L8+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L8+8
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
.L9:
	.align	2
.L8:
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
	ldr	r4, .L23
	ldr	r5, [r4, #24]
	add	r3, r5, r5, lsl r1
	ldr	r2, .L23+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	ldr	r3, .L23+8
	ldr	r6, [r4, #28]
	cmp	r2, r3
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bcs	.L11
	ldr	r0, [r4, #36]
	ldr	r3, .L23+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L11:
	ldr	r3, .L23+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L23+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L23+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L14
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L16
.L17:
	mov	r3, #2
	str	r3, [r4, #28]
.L16:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L17
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L16
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
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
	ldr	r3, .L66
	ldrh	r1, [r3, #48]
	ldr	r2, .L66+4
	tst	r1, #64
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, [r2]
	bne	.L26
	cmp	ip, #4
	beq	.L27
	ldr	r3, .L66+8
	ldr	r2, .L66+12
	ldr	r4, [r3, #8]
	ldr	r7, [r3]
	ldr	r6, [r2]
	ldr	r1, [r3, #20]
	sub	r7, r7, r4
	mul	r0, r7, r6
	add	r8, r1, r7
	sub	r8, r8, #1
	mul	r8, r6, r8
	ldr	r5, .L66+16
	ldr	lr, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r9, [r5]
	add	r2, lr, r2
	add	r5, r9, r0
	sub	r2, r2, #1
	add	lr, r9, lr
	ldrb	r10, [r5, r2]	@ zero_extendqisi2
	ldrb	r5, [lr, r0]	@ zero_extendqisi2
	add	r2, r9, r2
	ldrb	r0, [lr, r8]	@ zero_extendqisi2
	ldrb	r8, [r2, r8]	@ zero_extendqisi2
	cmp	r5, r10
	movcs	r5, r10
	cmp	r0, r8
	movge	r0, r8
	cmp	r0, r5
	movge	r0, r5
	cmp	r0, #0
	beq	.L28
	ldr	r5, .L66+20
	ldr	r0, .L66+24
	ldr	r8, [r5]
	ldr	r0, [r0]
	subs	r0, r8, r0
	movmi	r0, r8
	str	r7, [r3]
	str	r0, [r5]
.L28:
	ldr	r0, .L66
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L41
.L31:
	ldr	r4, .L66
	ldrh	r3, [r4, #48]
	ldr	lr, .L66+28
	tst	r3, #32
	ldr	r2, [lr]
	bne	.L34
	ldr	r3, .L66+8
	ldr	r1, .L66+12
	ldr	r0, [r3]
	ldr	r5, [r1]
	ldr	r1, [r3, #20]
	mul	r7, r0, r5
	add	r1, r0, r1
	sub	r1, r1, #1
	mul	r1, r5, r1
	ldr	r6, [r3, #12]
	ldr	r5, [r3, #4]
	ldr	r8, .L66+16
	ldr	r0, [r3, #16]
	ldr	r8, [r8]
	sub	r5, r5, r6
	add	r0, r5, r0
	sub	r0, r0, #1
	add	r9, r8, r7
	add	r10, r8, r5
	ldrb	r9, [r9, r0]	@ zero_extendqisi2
	add	r8, r8, r0
	ldrb	r0, [r10, r7]	@ zero_extendqisi2
	ldrb	r7, [r8, r1]	@ zero_extendqisi2
	ldrb	r1, [r10, r1]	@ zero_extendqisi2
	cmp	r0, r9
	movcs	r0, r9
	cmp	r1, r7
	movge	r1, r7
	cmp	r1, r0
	movge	r1, r0
	cmp	r1, #0
	beq	.L34
	ldr	r1, .L66+32
	ldr	r8, .L66+24
	ldr	r7, .L66+36
	ldr	r0, [r1]
	ldr	r8, [r8]
	ldr	r9, [r7]
	subs	r7, r0, r8
	movmi	r7, r0
	cmp	r9, #0
	subeq	r2, r2, #1
	ldrh	r0, [r4, #48]
	tst	r0, #2
	str	r2, [lr]
	str	r5, [r3, #4]
	str	r7, [r1]
	beq	.L64
.L34:
	ldr	r6, .L66
	ldrh	r3, [r6, #48]
	tst	r3, #16
	bne	.L37
	ldr	r3, .L66+8
	ldr	r4, .L66+12
	ldr	r1, .L66+16
	ldr	r5, [r3]
	ldr	r0, [r3, #20]
	ldr	r1, [r1]
	ldr	r7, [r4]
	add	r0, r5, r0
	sub	r0, r0, #1
	mla	r5, r7, r5, r1
	mul	r0, r7, r0
	ldr	r9, [r3, #12]
	ldr	r4, [r3, #4]
	ldr	r8, [r3, #16]
	add	r4, r9, r4
	add	r10, r8, r4
	sub	r10, r10, #1
	ldrb	fp, [r5, r10]	@ zero_extendqisi2
	ldrb	r5, [r5, r4]	@ zero_extendqisi2
	add	r10, r1, r10
	add	r1, r1, r4
	ldrb	r1, [r1, r0]	@ zero_extendqisi2
	ldrb	r10, [r10, r0]	@ zero_extendqisi2
	cmp	r5, fp
	movcs	r5, fp
	cmp	r1, r10
	movge	r1, r10
	cmp	r1, r5
	movge	r1, r5
	cmp	r1, #0
	beq	.L37
	ldr	r1, .L66+36
	ldr	r5, .L66+24
	ldr	r0, [r1]
	ldr	r1, .L66+32
	cmp	r0, #0
	addeq	r2, r2, #1
	ldr	r5, [r5]
	ldr	r0, [r1]
	add	r10, r0, r5
	add	fp, r10, #239
	cmp	r7, fp
	movgt	r0, r10
	str	r2, [lr]
	ldrh	lr, [r6, #48]
	tst	lr, #2
	str	r4, [r3, #4]
	str	r0, [r1]
	bne	.L37
	add	r4, r9, r4
	add	r8, r8, r4
	add	r8, r8, #99
	cmp	r7, r8
	str	r4, [r3, #4]
	bgt	.L37
	add	r5, r5, r0
	add	r3, r5, #239
	cmp	r7, r3
	movgt	r0, r5
	str	r0, [r1]
.L37:
	mov	r1, #67108864
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	cmp	ip, #4
	strh	r3, [r1, #20]	@ movhi
	beq	.L65
.L40:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L26:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L31
	cmp	ip, #4
	beq	.L31
	ldr	r3, .L66+8
	ldr	r1, .L66+16
	ldr	lr, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r0, .L66+12
	ldr	r9, [r1]
	add	r2, lr, r2
	sub	r2, r2, #1
	ldr	r1, [r3, #20]
	ldr	r6, [r0]
	ldr	r4, [r3, #8]
	add	r2, r9, r2
	add	lr, r9, lr
.L41:
	ldr	r0, [r3]
	add	r4, r4, r0
	add	r1, r4, r1
	mul	r0, r6, r4
	sub	r1, r1, #1
	mul	r1, r6, r1
	ldrb	r5, [lr, r0]	@ zero_extendqisi2
	ldrb	r6, [r2, r0]	@ zero_extendqisi2
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	ldrb	r0, [lr, r1]	@ zero_extendqisi2
	cmp	r5, r6
	movcc	r1, r5
	movcs	r1, r6
	cmp	r0, r2
	movlt	r2, r0
	cmp	r2, r1
	movge	r2, r1
	cmp	r2, #0
	beq	.L31
	ldr	r5, .L66+20
	ldr	r1, .L66+24
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, .L66+40
	add	r1, r2, r1
	ldr	r0, [r0]
	add	lr, r1, #159
	cmp	lr, r0
	movlt	r2, r1
	str	r4, [r3]
	str	r2, [r5]
	b	.L31
.L65:
	ldr	r3, .L66+44
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L40
	ldr	r3, .L66+48
	ldrh	r3, [r3]
	tst	r3, #2
	moveq	r2, #1
	ldreq	r3, .L66+52
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	streq	r2, [r3]
	b	animatePlayer
.L27:
	ldrh	r3, [r3, #48]
	b	.L31
.L64:
	sub	r5, r5, r6
	cmp	r5, #100
	str	r5, [r3, #4]
	ble	.L34
	subs	r3, r7, r8
	movmi	r3, r7
	str	r3, [r1]
	b	.L34
.L67:
	.align	2
.L66:
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
	.word	oldButtons
	.word	buttons
	.word	cheat
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
	ldr	r3, .L72
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L69
	ldr	r2, .L72+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L69:
	b	drawPlayer.part.0
.L73:
	.align	2
.L72:
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
	ldr	r4, .L78
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+4
	mov	lr, pc
	bx	r4
	mov	r3, #12608
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L78+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L78+12
	ldr	r1, .L78+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	DMANow
	.word	outsidePal
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
	ldr	r4, .L82
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L82+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L82+8
	ldr	r1, .L82+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L82+16
	ldr	r1, .L82+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L83:
	.align	2
.L82:
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
	ldr	r4, .L86
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L86+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L86+8
	ldr	r1, .L86+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L86+16
	ldr	r1, .L86+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L87:
	.align	2
.L86:
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
	mov	r2, #67108864
	mov	ip, #500
	mov	r3, #7680
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	lr, #160
	mov	r6, #256
	mov	r0, #240
	ldr	r4, .L95
	ldr	r5, .L95+4
	str	ip, [r4]
	strh	r3, [r2, #8]	@ movhi
	ldr	ip, .L95+8
	ldr	r3, .L95+12
	strh	r6, [r2]	@ movhi
	str	lr, [ip]
	str	r1, [r5]
	str	r0, [r3]
	ldr	r5, .L95+16
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	ldr	r6, .L95+20
	mov	r0, #3
	ldr	r1, .L95+24
	mov	lr, pc
	bx	r6
	mov	r3, #5952
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L95+28
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L95+32
	ldr	r1, .L95+36
	mov	lr, pc
	bx	r6
	b	.L93
.L94:
	mov	lr, pc
	bx	r5
.L93:
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	bgt	.L94
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	infoScreen
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	LavaLosePal
	.word	LavaLoseTiles
	.word	100724736
	.word	LavaLoseMap
	.size	setLavaHitBackground, .-setLavaHitBackground
	.align	2
	.global	setObtainedFlareonBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setObtainedFlareonBackground, %function
setObtainedFlareonBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L104
	push	{r4, r5, r6, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L104+4
	ldr	r3, .L104+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	ip, #1000
	mov	r3, #7680
	mov	r1, #0
	mov	lr, #160
	mov	r6, #256
	mov	r0, #240
	ldr	r4, .L104+12
	ldr	r5, .L104+16
	str	ip, [r4]
	strh	r3, [r2, #8]	@ movhi
	ldr	ip, .L104+20
	ldr	r3, .L104+24
	strh	r6, [r2]	@ movhi
	str	lr, [ip]
	str	r1, [r5]
	str	r0, [r3]
	ldr	r5, .L104+28
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	ldr	r6, .L104+32
	mov	r0, #3
	ldr	r1, .L104+36
	mov	lr, pc
	bx	r6
	mov	r3, #3024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L104+40
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L104+44
	ldr	r1, .L104+48
	mov	lr, pc
	bx	r6
	b	.L102
.L103:
	mov	lr, pc
	bx	r5
.L102:
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	bgt	.L103
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	infoScreen
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotFirePal
	.word	gotFireTiles
	.word	100724736
	.word	gotFireMap
	.size	setObtainedFlareonBackground, .-setObtainedFlareonBackground
	.align	2
	.global	setPoopHitBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPoopHitBackground, %function
setPoopHitBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	ip, #500
	mov	r3, #7680
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	lr, #160
	mov	r6, #256
	mov	r0, #240
	ldr	r4, .L113
	ldr	r5, .L113+4
	str	ip, [r4]
	strh	r3, [r2, #8]	@ movhi
	ldr	ip, .L113+8
	ldr	r3, .L113+12
	strh	r6, [r2]	@ movhi
	str	lr, [ip]
	str	r1, [r5]
	str	r0, [r3]
	ldr	r5, .L113+16
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	ldr	r6, .L113+20
	mov	r0, #3
	ldr	r1, .L113+24
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L113+28
	ldr	r1, .L113+32
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L113+36
	ldr	r1, .L113+40
	mov	lr, pc
	bx	r6
	b	.L111
.L112:
	mov	lr, pc
	bx	r5
.L111:
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	bgt	.L112
	pop	{r4, r5, r6, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	infoScreen
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	PoopHitPal
	.word	5968
	.word	PoopHitTiles
	.word	100724736
	.word	PoopHitMap
	.size	setPoopHitBackground, .-setPoopHitBackground
	.align	2
	.global	setObtainedLeafeonBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setObtainedLeafeonBackground, %function
setObtainedLeafeonBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L122
	push	{r4, r5, r6, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L122+4
	ldr	r3, .L122+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #7680
	mov	r1, #0
	mov	lr, #160
	mov	r6, #256
	mov	r0, #240
	ldr	r4, .L122+12
	ldr	ip, .L122+16
	ldr	r5, .L122+20
	str	ip, [r4]
	strh	r3, [r2, #8]	@ movhi
	ldr	ip, .L122+24
	ldr	r3, .L122+28
	strh	r6, [r2]	@ movhi
	str	lr, [ip]
	str	r1, [r5]
	str	r0, [r3]
	ldr	r5, .L122+32
	strh	r1, [r2, #18]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	ldr	r6, .L122+36
	mov	r0, #3
	ldr	r1, .L122+40
	mov	lr, pc
	bx	r6
	mov	r3, #2176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L122+44
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L122+48
	ldr	r1, .L122+52
	mov	lr, pc
	bx	r6
	b	.L120
.L121:
	mov	lr, pc
	bx	r5
.L120:
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	bgt	.L121
	pop	{r4, r5, r6, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	infoScreen
	.word	1400
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotLeafPal
	.word	gotLeafTiles
	.word	100724736
	.word	gotLeafMap
	.size	setObtainedLeafeonBackground, .-setObtainedLeafeonBackground
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
	ldr	r3, .L128
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L125
	ldr	r4, .L128+4
	mov	r0, #3
	ldr	r1, .L128+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L128+12
	ldr	r1, .L128+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L128+20
	ldr	r1, .L128+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L125:
	ldr	r4, .L128+4
	mov	r0, #3
	ldr	r1, .L128+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L128+12
	ldr	r1, .L128+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L128+20
	ldr	r1, .L128+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L129:
	.align	2
.L128:
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
	ldr	r3, .L134
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L131
	ldr	r4, .L134+4
	mov	r0, #3
	ldr	r1, .L134+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L134+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L134+16
	ldr	r1, .L134+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L131:
	ldr	r4, .L134+4
	mov	r0, #3
	ldr	r1, .L134+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L134+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L134+16
	ldr	r1, .L134+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L135:
	.align	2
.L134:
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
	ldr	r4, .L138
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L138+4
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L138+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L138+12
	ldr	r1, .L138+16
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r0, #3
	ldr	r2, .L138+20
	ldr	r1, .L138+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L138+28
	ldr	r1, .L138+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L139:
	.align	2
.L138:
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
	ldr	r3, .L144
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L141
	ldr	r4, .L144+4
	mov	r0, #3
	ldr	r1, .L144+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L144+12
	ldr	r1, .L144+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L144+20
	ldr	r1, .L144+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L141:
	ldr	r4, .L144+4
	mov	r0, #3
	ldr	r1, .L144+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L144+12
	ldr	r1, .L144+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L144+20
	ldr	r1, .L144+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L145:
	.align	2
.L144:
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
	ldr	r3, .L156
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L146
.L149:
	.word	.L154
	.word	.L153
	.word	.L152
	.word	.L146
	.word	.L151
	.word	.L150
	.word	.L148
.L148:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L156+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L156+8
	ldr	r2, .L156+12
	ldr	r3, .L156+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setLeafStoneClearingBackground
.L154:
	mov	r2, #67108864
	mov	lr, #56320
	mov	ip, #4352
	mov	r3, #512
	ldr	r0, .L156+8
	ldr	r1, .L156+12
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L156+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L153:
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L156+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L156+8
	ldr	r2, .L156+12
	ldr	r3, .L156+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L152:
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L156+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L156+8
	ldr	r1, .L156+12
	ldr	r2, .L156+16
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L151:
	mov	r3, #67108864
	mov	r0, #54272
	mov	r2, #4864
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	r0, .L156+20
	ldr	lr, .L156+4
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L156+8
	ldr	r2, .L156+12
	ldr	r3, .L156+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L150:
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L156+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L156+8
	ldr	r2, .L156+12
	ldr	r3, .L156+16
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L146:
	pop	{r4, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	stage
	.word	scroll
	.word	mapWidth
	.word	mapHeight
	.word	waitForVBlank
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
	ldr	r2, .L160
	ldrh	r1, [r2]
	ldr	r2, .L160+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L161:
	.align	2
.L160:
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
	ldr	r4, .L164
	mov	r0, #3
	ldr	r2, .L164+4
	ldr	r1, .L164+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L164+12
	ldr	r1, .L164+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L164+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L164+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L165:
	.align	2
.L164:
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
	ldr	r3, .L181
	add	r1, r3, #1016
.L167:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L167
	ldr	r3, .L181+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L181+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L168
	cmp	r3, #4
	bne	.L166
	mov	r2, #8
	mov	r5, #2
	mov	r1, #0
	mov	r4, #161
	mov	lr, #1
	ldr	r0, .L181+12
	ldr	r3, .L181+16
	ldr	r0, [r0, #4]
	add	ip, r3, #480
	add	r0, r0, #20
.L174:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #4]
	str	r4, [r3]
	str	lr, [r3, #44]
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L174
	mov	r0, #27
	mov	r2, #23
	ldr	r3, .L181+20
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #20]
.L166:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L168:
	mov	fp, #0
	mov	r5, #16
	ldr	r10, .L181+24
	ldr	r4, .L181+28
	ldr	r7, .L181+32
	ldr	r6, .L181+36
	ldr	r9, .L181+40
	ldr	r8, .L181+44
	b	.L173
.L171:
	mov	r2, #2
	str	r3, [r10, #12]
	str	r2, [r10, #8]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #2
.L175:
	str	r3, [r10, #4]
	mov	lr, pc
	bx	r4
	ldr	r1, [r7]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r6
	add	fp, fp, #1
	cmp	fp, #12
	str	r1, [r10], #48
	beq	.L166
.L173:
	ands	r3, fp, #1
	str	r5, [r10, #16]
	str	r5, [r10, #20]
	beq	.L171
	mov	r3, #0
	mov	r2, #3
	str	r3, [r10, #12]
	str	r2, [r10, #8]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #5
	add	r3, r3, #264
	add	r3, r3, #1
	b	.L175
.L182:
	.align	2
.L181:
	.word	shadowOAM
	.word	hideSprites
	.word	stage
	.word	player
	.word	poops
	.word	togekiss
	.word	lavaRocks
	.word	rand
	.word	mapHeight
	.word	__aeabi_idivmod
	.word	-1840700269
	.word	-1883757585
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
	ldr	ip, .L185
	ldr	r0, .L185+4
	ldr	r2, .L185+8
	ldr	r1, .L185+12
	ldr	r3, .L185+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r0, #144
	ldr	r7, .L185+20
	ldr	r6, .L185+24
	ldrh	r1, [r7]
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r6]
	strh	r1, [r3, #16]	@ movhi
	ldr	r3, .L185+28
	ldr	r1, .L185+32
	str	r4, [r3]
	str	r2, [r7]
	ldr	r3, .L185+36
	ldr	r2, .L185+40
	str	r0, [r6]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	bl	initNonPlayers
	bl	initSprites
	mov	r0, #16
	mov	ip, #3
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, .L185+44
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
.L186:
	.align	2
.L185:
	.word	scroll
	.word	stage
	.word	collisionMap
	.word	outsideCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	hasFireStone
	.word	hasLeafStone
	.word	cheat
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
	ldr	ip, .L189
	ldr	r1, .L189+4
	ldr	r3, .L189+8
	ldr	r2, .L189+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L189+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L189+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L189+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L190:
	.align	2
.L189:
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L207
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L192
	cmp	r3, #4
	bne	.L191
	ldr	r5, .L207+4
	ldr	r3, [r5]
	ldr	r2, .L207+8
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	asr	ip, r3, #31
	add	r2, r2, r3
	rsb	ip, ip, r2, asr #4
	rsb	ip, ip, ip, lsl #4
	sub	ip, r3, ip, lsl #1
	ldr	r3, .L207+12
	str	ip, [r5]
	sub	r10, r3, #8
	add	r0, r3, #480
.L197:
	ldr	r2, [r3, #-8]
	cmp	r2, #160
	ldrle	r1, [r3]
	addle	r2, r1, r2
	strle	r2, [r3, #-8]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L197
	cmp	ip, #0
	bne	.L191
	mov	r9, #10
	ldr	r4, .L207+16
	ldr	fp, .L207+20
	ldr	r8, .L207+24
	ldr	r7, .L207+28
	add	r10, r10, #436
	b	.L200
.L199:
	cmp	r4, r10
	beq	.L191
.L206:
	ldr	r3, [r5]
	cmp	r3, #0
	add	r4, r4, #48
	bne	.L191
.L200:
	ldr	r3, [r4, #-4]
	cmp	r3, #160
	ble	.L199
	ldr	r1, [fp, #4]
	str	r9, [r4, #-4]
	add	r6, r1, #20
	mov	lr, pc
	bx	r8
	ldr	r3, .L207+32
	ldr	r1, [r7, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r1, r1, r6
	add	r3, r3, #1
	cmp	r4, r10
	str	r1, [r4]
	str	r3, [r5]
	bne	.L206
.L191:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L192:
	ldr	r3, .L207+36
	ldr	r4, .L207+40
	ldr	r5, [r3]
	ldr	r7, .L207+32
	sub	r5, r5, #16
	add	r6, r4, #576
.L195:
	ldr	r0, [r4, #-8]
	ldr	r3, [r4]
	mov	r1, r5
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	add	r4, r4, #48
	str	r1, [r4, #-56]
	cmp	r6, r4
	bne	.L195
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	stage
	.word	poopCount
	.word	-2004318071
	.word	poops+8
	.word	poops+4
	.word	player
	.word	rand
	.word	togekiss
	.word	__aeabi_idivmod
	.word	mapHeight
	.word	lavaRocks+8
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
	ldr	r3, .L240
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	beq	.L210
	cmp	r3, #4
	beq	.L211
	cmp	r3, #1
	beq	.L236
.L209:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L210:
	ldr	r2, .L240+4
	ldr	r3, .L240+8
	ldr	ip, [r2]
	ldr	r4, [r3]
	ldr	r2, .L240+12
	lsl	r6, ip, #16
	lsl	r5, r4, #16
	mov	r8, #192
	ldr	r1, .L240+16
	ldr	r7, .L240+20
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	add	lr, r2, #576
	b	.L219
.L237:
	cmp	r9, #160
	bgt	.L217
	ldr	r3, [r2, #4]
	ldr	r10, [r2, #16]
	add	r10, r3, r10
	sub	r10, r10, r4
	cmp	r10, #0
	sub	r9, r3, r4
	blt	.L217
	sub	r3, r3, r5
	sub	r0, r0, r6
	and	r3, r3, r7
	cmp	r9, #240
	and	r0, r0, #255
	orr	r3, r3, #16384
	bgt	.L217
	strh	r0, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r8, [r1, #12]	@ movhi
.L218:
	add	r2, r2, #48
	cmp	lr, r2
	add	r1, r1, #8
	beq	.L209
.L219:
	ldr	r0, [r2]
	ldr	r3, [r2, #20]
	add	r3, r0, r3
	sub	r3, r3, ip
	cmp	r3, #0
	sub	r9, r0, ip
	bge	.L237
.L217:
	ldrh	r3, [r1, #8]
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	b	.L218
.L236:
	ldr	r0, .L240+24
	ldr	r2, [r0]
	ldr	r1, .L240+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L240+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	ip, [r7]
	bne	.L213
	ldr	r2, .L240+36
	add	r3, ip, #1
	smull	r1, ip, r2, r3
	sub	ip, ip, r3, asr #31
	add	ip, ip, ip, lsl #1
	sub	ip, r3, ip
.L213:
	ldr	r3, .L240+8
	ldr	r1, .L240+4
	ldrh	r3, [r3]
	ldr	r0, .L240+40
	ldrh	r1, [r1]
	ldr	r0, [r0]
	rsb	r2, r3, #108
	rsb	lr, r1, #57
	lsl	r2, r2, #23
	cmp	r0, #0
	str	ip, [r7]
	lsl	r0, ip, #23
	lsr	r2, r2, #23
	and	ip, lr, #255
	ldr	lr, .L240+16
	orr	r2, r2, #32768
	strh	r2, [lr, #10]	@ movhi
	ldr	r2, .L240+44
	rsb	r3, r3, #158
	ldr	r2, [r2]
	lsr	r0, r0, #16
	lsl	r3, r3, #23
	addne	r4, r0, #16
	addeq	r4, r0, #8
	lsr	r3, r3, #23
	cmp	r2, #0
	rsb	r1, r1, #59
	orr	r3, r3, #32768
	and	r1, r1, #255
	addne	r0, r0, #20
	addeq	r0, r0, #12
	strh	ip, [lr, #8]	@ movhi
	strh	r4, [lr, #12]	@ movhi
	strhne	r0, [lr, #20]	@ movhi
	strhne	r1, [lr, #16]	@ movhi
	strhne	r3, [lr, #18]	@ movhi
	strheq	r0, [lr, #28]	@ movhi
	strheq	r1, [lr, #24]	@ movhi
	strheq	r3, [lr, #26]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L211:
	ldr	r0, .L240+24
	ldr	r2, [r0]
	ldr	r1, .L240+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L240+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	r1, [r7]
	beq	.L238
.L220:
	ldr	lr, .L240+16
	mov	r2, lr
	ldr	r3, .L240+4
	ldr	fp, .L240+8
	ldr	r0, [r3]
	ldr	r6, [fp]
	ldr	r3, .L240+48
	lsl	r10, r0, #16
	lsl	r9, r6, #16
	str	r1, [r7]
	lsr	r10, r10, #16
	lsr	r9, r9, #16
	add	r4, r3, #480
.L223:
	ldr	ip, [r3]
	ldr	r1, [r3, #20]
	add	r1, ip, r1
	sub	r1, r1, r0
	cmp	r1, #0
	sub	r5, ip, r0
	blt	.L221
	cmp	r5, #160
	bgt	.L221
	ldr	r5, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, r5, r1
	sub	r1, r1, r6
	cmp	r1, #0
	sub	r8, r5, r6
	blt	.L221
	cmp	r8, #240
	cmple	ip, #159
	ble	.L239
.L221:
	ldrh	r1, [r2, #8]
	orr	r1, r1, #512
	strh	r1, [r2, #8]	@ movhi
.L222:
	add	r3, r3, #48
	cmp	r4, r3
	add	r2, r2, #8
	bne	.L223
	ldr	r1, .L240+52
	ldr	r3, [fp]
	ldr	r2, [r1, #4]
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	r3, .L240+4
	ldrh	r0, [r3]
	rsb	r3, r0, #10
	and	r3, r3, #255
	strh	ip, [lr, #98]	@ movhi
	strh	r3, [lr, #96]	@ movhi
	ldr	ip, .L240+56
	ldr	r3, [r7]
	ldrh	ip, [ip, #48]
	lsl	r3, r3, #23
	tst	ip, #32
	ldr	ip, .L240+60
	lsr	r3, r3, #16
	addeq	r3, r3, #28
	addne	r3, r3, #24
	ldr	ip, [ip]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	ip, #0
	strh	r3, [lr, #100]	@ movhi
	beq	.L209
	mov	ip, #320
	ldr	r3, [r1]
	sub	r3, r3, #5
	sub	r3, r3, r0
	and	r3, r3, #255
	orr	r2, r2, #16384
	strh	r3, [lr, #104]	@ movhi
	strh	r2, [lr, #106]	@ movhi
	strh	ip, [lr, #108]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L238:
	ldr	r2, .L240+36
	add	r3, r1, #1
	smull	r0, r1, r2, r3
	sub	r1, r1, r3, asr #31
	add	r1, r1, r1, lsl #1
	sub	r1, r3, r1
	b	.L220
.L239:
	mov	r1, #256	@ movhi
	sub	r5, r5, r9
	sub	ip, ip, r10
	lsl	r5, r5, #23
	and	ip, ip, #255
	lsr	r5, r5, #23
	strh	ip, [r2, #8]	@ movhi
	strh	r5, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	b	.L222
.L241:
	.align	2
.L240:
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
	.word	poops
	.word	player
	.word	67109120
	.word	cheat
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
	ldr	r3, .L246
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L243
	ldr	r2, .L246+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L244:
	ldr	r3, .L246+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L246+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L246+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L246+16
	ldrh	r1, [r2]
	ldr	r2, .L246+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L243:
	bl	drawPlayer.part.0
	b	.L244
.L247:
	.align	2
.L246:
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
	ldr	r1, .L250
	ldr	r3, .L250+4
	ldr	r2, .L250+8
	push	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	str	r0, [r1]
	bl	setStage
	mov	r3, #142
	mov	r5, #0
	mov	r2, #112
	ldr	r4, .L250+12
	ldr	r7, .L250+16
	ldr	r6, .L250+20
	str	r3, [r4]
	ldr	r3, .L250+24
	str	r2, [r4, #4]
	str	r5, [r7]
	str	r5, [r6]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r7]
	strh	r2, [r3, #18]	@ movhi
	ldrh	r2, [r6]
	strh	r2, [r3, #16]	@ movhi
	str	r5, [r4, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	b	initNonPlayers
.L251:
	.align	2
.L250:
	.word	stage
	.word	collisionMap
	.word	houseCMBitmap
	.word	player
	.word	vOff
	.word	hOff
	.word	hideSprites
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L309
	ldr	r3, [r6]
	sub	sp, sp, #20
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L252
.L255:
	.word	.L260
	.word	.L259
	.word	.L258
	.word	.L252
	.word	.L257
	.word	.L256
	.word	.L254
.L308:
	ldr	r5, .L309+4
	ldr	r3, [r5]
	sub	r3, r3, r2
	sub	r3, r3, #5
	cmp	r3, r0
	beq	.L304
.L252:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L254:
	mov	ip, #23
	mov	r1, #21
	mov	r2, #107
	mov	r3, #80
	ldr	r0, .L309+8
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L309+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L252
	ldr	r3, .L309+16
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L305
.L275:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToHouse
.L260:
	ldr	r4, .L309+8
	ldr	r1, [r4]
	cmp	r1, #256
	ldr	r0, [r4, #4]
	bne	.L261
	cmp	r0, #256
	beq	.L275
.L261:
	mov	r3, #60
	mov	r8, #3
	mov	r2, #17
	ldr	r7, .L309+20
	stm	sp, {r3, r7, r8}
	str	r2, [sp, #12]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r9, .L309+12
	mov	lr, pc
	bx	r9
	subs	r5, r0, #0
	beq	.L262
	ldr	r3, .L309+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L309+28
	ldr	r3, .L309+32
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r3, #512
	mov	r0, #2
	ldr	r2, .L309+36
	ldr	r1, .L309+40
	str	ip, [r2]
	ldr	ip, .L309+4
	ldr	r2, .L309+44
	str	r3, [r1]
	ldr	r1, .L309+48
	str	r3, [ip]
	ldr	r3, .L309+52
	str	r1, [r2]
	str	r0, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	ip, #33
	mov	r1, #0
	mov	r2, #130
	mov	r3, #67108864
	mov	r0, #240
	str	ip, [r4]
	ldr	lr, .L309+56
	ldr	ip, .L309+60
	str	r1, [lr]
	str	r2, [ip]
	str	r0, [r4, #4]
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
.L303:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initNonPlayers
.L258:
	ldr	r3, .L309+64
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L282
.L268:
	mov	r2, #22
	mov	r3, #237
	mov	r5, #5
	ldr	r4, .L309+8
	str	r2, [sp, #8]
	str	r5, [sp, #12]
	str	r3, [sp]
	ldr	ip, .L309+68
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r8, .L309+12
	str	ip, [sp, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L306
	ldr	r3, .L309+4
	ldr	r1, [r4]
	ldr	r9, [r3]
	mul	r3, r1, r9
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	add	ip, r0, r2
	ldr	r6, .L309+72
	sub	ip, ip, #1
	add	lr, r3, r0
	add	r3, r3, ip
	ldrb	r5, [lr, r6]	@ zero_extendqisi2
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	cmp	r5, r3
	movcc	r7, r5
	movcs	r7, r3
	ldr	r3, [r4, #20]
	add	lr, r1, r3
	sub	lr, lr, #1
	mul	lr, r9, lr
	add	r5, lr, r0
	ldrb	r5, [r5, r6]	@ zero_extendqisi2
	cmp	r5, r7
	movge	r5, r7
	add	ip, ip, lr
	ldrb	ip, [ip, r6]	@ zero_extendqisi2
	cmp	ip, r5
	movlt	r5, ip
	cmp	r5, #0
	beq	.L307
.L269:
	ldr	r5, .L309+76
	ldr	r6, .L309+80
	ldr	r7, .L309+52
	add	r9, r5, #576
	b	.L273
.L270:
	add	r5, r5, #48
	cmp	r9, r5
	beq	.L252
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L273:
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L270
	bl	setLavaHitBackground
	b	.L301
.L271:
	mov	lr, pc
	bx	r7
.L301:
	ldr	r3, [r6]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6]
	bgt	.L271
	bl	returnToHouse
	b	.L270
.L259:
	ldr	r3, .L309+8
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L252
	ldr	r3, .L309+84
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L252
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToOutside
.L256:
	mov	r3, #16
	ldr	r2, .L309+8
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L309+12
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
	beq	.L252
	ldr	r3, .L309+88
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L275
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedFlareonBackground
	b	.L275
.L257:
	ldr	r4, .L309+8
	ldr	r5, .L309+92
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r9, .L309+96
	ldr	r8, .L309+12
	add	r7, r5, #480
	b	.L280
.L277:
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L279
.L302:
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
.L276:
	add	r5, r5, #48
	cmp	r5, r7
	beq	.L308
.L280:
	ldr	ip, [r5]
	ldr	r1, [r4]
	cmp	ip, r1
	ble	.L276
	ldr	r3, [r9]
	add	r10, r5, #16
	cmp	r3, #0
	ldr	lr, [r5, #4]
	ldr	r3, [r4, #20]
	ldm	r10, {r10, fp}
	beq	.L277
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	sub	r1, r1, #5
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L278
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldm	r5, {ip, lr}
	ldm	r10, {r10, fp}
	b	.L277
.L279:
	bl	setPoopHitBackground
	bl	returnToHouse
	b	.L302
.L278:
	mov	ip, #320
	str	ip, [r5]
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	lr, [r5, #4]
	ldm	r10, {r10, fp}
	b	.L277
.L262:
	mov	r2, #19
	ldr	r3, .L309+100
	stmib	sp, {r7, r8}
	str	r2, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L252
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L309+36
	str	r2, [r3]
	ldr	r2, .L309+40
	ldr	r3, .L309+4
	str	r1, [r2]
	ldr	r2, .L309+44
	ldr	r1, .L309+104
	str	r0, [r3]
	ldr	r3, .L309+52
	str	r1, [r2]
	str	ip, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #112
	mov	r3, #67108864
	mov	r0, #50
	str	r2, [r4]
	ldr	r1, .L309+56
	ldr	r2, .L309+60
	str	r0, [r4, #4]
	str	r5, [r1]
	str	r5, [r2]
	strh	r5, [r3, #18]	@ movhi
	strh	r5, [r3, #16]	@ movhi
	b	.L303
.L304:
	ldr	r3, .L309+108
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L309+112
	ldr	r3, .L309+32
	mov	lr, pc
	bx	r3
	mov	r3, #240
	mov	r7, #0
	mov	ip, #160
	mov	r0, #6
	ldr	r1, .L309+36
	str	r3, [r5]
	ldr	r3, .L309+40
	ldr	r2, .L309+44
	str	r7, [r1]
	ldr	r1, .L309+116
	str	ip, [r3]
	ldr	r3, .L309+52
	str	r1, [r2]
	str	r0, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r1, #152
	mov	r2, #143
	ldr	ip, .L309+56
	ldr	r0, .L309+60
	str	r7, [ip]
	str	r7, [r0]
	str	r1, [r4, #4]
	str	r2, [r4]
	strh	r7, [r3, #18]	@ movhi
	strh	r7, [r3, #16]	@ movhi
	b	.L303
.L305:
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedLeafeonBackground
	b	.L275
.L282:
	mov	r2, #83886080
	ldr	r1, .L309+120
.L265:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L265
	b	.L268
.L306:
	ldr	r3, .L309+108
	mov	r7, #0
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L309+112
	ldr	r3, .L309+32
	mov	lr, pc
	bx	r3
	mov	lr, #160
	mov	ip, #240
	ldr	r1, .L309+36
	ldr	r3, .L309+40
	ldr	r0, .L309+4
	ldr	r2, .L309+44
	str	r7, [r1]
	ldr	r1, .L309+124
	str	lr, [r3]
	ldr	r3, .L309+52
	str	ip, [r0]
	str	r1, [r2]
	str	r5, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r3, #67108864
	mov	r1, #110
	mov	r2, #127
	ldr	r0, .L309+60
	ldr	ip, .L309+56
	str	r7, [r0]
	str	r1, [r4, #4]
	str	r2, [r4]
	str	r7, [ip]
	strh	r7, [r3, #18]	@ movhi
	strh	r7, [r3, #16]	@ movhi
	bl	initNonPlayers
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L269
.L307:
	bl	setLavaHitBackground
	bl	returnToHouse
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L269
.L310:
	.align	2
.L309:
	.word	stage
	.word	mapWidth
	.word	player
	.word	collision
	.word	hasLeafStone
	.word	382
	.word	volcanoSong_length
	.word	volcanoSong_data
	.word	playSoundA
	.word	scroll
	.word	mapHeight
	.word	collisionMap
	.word	volcanoCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	wait
	.word	498
	.word	lavaPoolCMBitmap
	.word	lavaRocks
	.word	infoScreen
	.word	67109120
	.word	hasFireStone
	.word	poops
	.word	cheat
	.word	449
	.word	forestCMBitmap
	.word	caveMusic_length
	.word	caveMusic_data
	.word	forestClearingCMBitmap
	.word	83886112
	.word	fireStoneCaveCMBitmap
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
	ldr	r2, .L317
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	push	{r4, lr}
	str	r3, [r2]
	bl	updateStage
	bl	updateNonPlayers
	bl	updatePlayer
	ldr	r3, .L317+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L311
	ldr	r3, .L317+8
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L311:
	pop	{r4, lr}
	bx	lr
.L318:
	.align	2
.L317:
	.word	wait
	.word	hasFireStone
	.word	hasLeafStone
	.size	updateGame, .-updateGame
	.comm	poops,480,4
	.comm	lavaRocks,576,4
	.comm	togekiss,48,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
	.comm	stage,4,4
	.comm	scroll,4,4
	.comm	cheat,4,4
	.comm	eeveeTimer,4,4
	.comm	currPokeFrame,4,4
	.comm	currEeveeFrame,4,4
	.comm	numPoops,4,4
	.comm	poopCount,4,4
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

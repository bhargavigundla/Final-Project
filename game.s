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
	ldr	r3, .L63
	ldrh	r1, [r3, #48]
	ldr	r2, .L63+4
	tst	r1, #64
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r2]
	bne	.L26
	cmp	r1, #4
	beq	.L27
	ldr	ip, .L63+8
	ldr	r3, .L63+12
	ldr	r4, [ip, #8]
	ldr	r7, [ip]
	ldr	r6, [r3]
	ldr	r2, [ip, #20]
	sub	r7, r7, r4
	mul	r0, r7, r6
	add	r8, r2, r7
	sub	r8, r8, #1
	mul	r8, r6, r8
	ldr	r5, .L63+16
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
	beq	.L28
	ldr	r5, .L63+20
	ldr	r0, .L63+24
	ldr	r8, [r5]
	ldr	r0, [r0]
	subs	r0, r8, r0
	movmi	r0, r8
	str	r7, [ip]
	str	r0, [r5]
.L28:
	ldr	r0, .L63
	ldrh	r0, [r0, #48]
	tst	r0, #128
	beq	.L39
.L31:
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	ldr	r0, .L63+28
	tst	r3, #32
	ldr	r3, [r0]
	bne	.L34
	ldr	lr, .L63+8
	ldr	r2, .L63+12
	ldr	ip, [lr]
	ldr	r4, [r2]
	ldr	r2, [lr, #20]
	mul	r6, ip, r4
	add	r2, ip, r2
	sub	r2, r2, #1
	mul	r2, r4, r2
	ldr	r7, [lr, #4]
	ldr	r4, [lr, #12]
	ldr	r5, .L63+16
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
	beq	.L34
	ldr	ip, .L63+32
	ldr	r5, .L63+36
	ldr	r2, .L63+24
	ldr	r6, [r5]
	ldr	r2, [r2]
	ldr	r5, [ip]
	subs	r2, r5, r2
	movmi	r2, r5
	cmp	r6, #0
	subeq	r3, r3, #1
	str	r4, [lr, #4]
	str	r2, [ip]
	str	r3, [r0]
.L34:
	ldr	r2, .L63
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L36
	ldr	lr, .L63+8
	ldr	r4, .L63+16
	ldr	r2, .L63+12
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
	beq	.L36
	ldr	ip, .L63+32
	ldr	r2, .L63+24
	ldr	r7, .L63+36
	ldr	r6, [r2]
	ldr	r2, [ip]
	ldr	r7, [r7]
	add	r6, r2, r6
	cmp	r7, #0
	addeq	r3, r3, #1
	add	r7, r6, #239
	cmp	r5, r7
	movgt	r2, r6
	str	r4, [lr, #4]
	str	r2, [ip]
	str	r3, [r0]
.L36:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r1, #4
	strh	r3, [r2, #20]	@ movhi
	beq	.L62
.L38:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L26:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L31
	cmp	r1, #4
	beq	.L31
	ldr	ip, .L63+8
	ldr	r2, .L63+16
	ldr	lr, [ip, #4]
	ldr	r3, [ip, #16]
	ldr	r0, .L63+12
	ldr	r9, [r2]
	add	r3, lr, r3
	sub	r3, r3, #1
	ldr	r2, [ip, #20]
	ldr	r6, [r0]
	ldr	r4, [ip, #8]
	add	r3, r9, r3
	add	lr, r9, lr
.L39:
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
	beq	.L31
	ldr	r5, .L63+20
	ldr	r2, .L63+24
	ldr	r3, [r5]
	ldr	r2, [r2]
	ldr	r0, .L63+40
	add	r2, r3, r2
	ldr	r0, [r0]
	add	lr, r2, #159
	cmp	lr, r0
	movlt	r3, r2
	str	r4, [ip]
	str	r3, [r5]
	b	.L31
.L62:
	ldr	r3, .L63+44
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L38
	ldr	r3, .L63+48
	ldrh	r3, [r3]
	tst	r3, #2
	moveq	r2, #1
	ldreq	r3, .L63+52
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	streq	r2, [r3]
	b	animatePlayer
.L27:
	ldrh	r3, [r3, #48]
	b	.L31
.L64:
	.align	2
.L63:
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
	ldr	r3, .L69
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L66
	ldr	r2, .L69+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L66:
	b	drawPlayer.part.0
.L70:
	.align	2
.L69:
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
	ldr	r4, .L75
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L75+4
	mov	lr, pc
	bx	r4
	mov	r3, #12608
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L75+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L75+12
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L76:
	.align	2
.L75:
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
	mov	r3, #1024
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
	mov	r3, #4096
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
	.word	volcanoPal
	.word	5856
	.word	volcanoTiles
	.word	100712448
	.word	volcanoMap
	.size	setVolcanoBackground, .-setVolcanoBackground
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"seconds before wait: (%d)\000"
	.text
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
	mov	r3, #7680
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L89
	strh	r4, [r2]	@ movhi
	ldr	lr, .L89+4
	str	ip, [r3]
	ldr	r3, .L89+8
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L89+12
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L89+16
	mov	r3, r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L89+20
	mov	lr, pc
	bx	r5
	ldr	r4, .L89+24
	mov	r3, #5952
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+28
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L89+32
	ldr	r1, .L89+36
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r5, .L89+40
	ldr	r0, .L89+44
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r7, .L89+44
	add	r6, r1, #3
.L86:
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	cmp	r1, r6
	ble	.L86
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	LavaLosePal
	.word	seconds
	.word	LavaLoseTiles
	.word	100724736
	.word	LavaLoseMap
	.word	mgba_printf
	.word	.LC0
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
	ldr	r3, .L95
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L95+4
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #7680
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L95+12
	strh	r4, [r2]	@ movhi
	ldr	lr, .L95+16
	str	ip, [r3]
	ldr	r3, .L95+20
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L95+24
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L95+28
	mov	r3, r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L95+32
	mov	lr, pc
	bx	r5
	ldr	r4, .L95+36
	mov	r3, #3024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L95+40
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L95+44
	ldr	r1, .L95+48
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r5, .L95+52
	ldr	r0, .L95+56
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r7, .L95+56
	add	r6, r1, #3
.L92:
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	cmp	r1, r6
	ble	.L92
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotFirePal
	.word	seconds
	.word	gotFireTiles
	.word	100724736
	.word	gotFireMap
	.word	mgba_printf
	.word	.LC0
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
	mov	r3, #7680
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L101
	strh	r4, [r2]	@ movhi
	ldr	lr, .L101+4
	str	ip, [r3]
	ldr	r3, .L101+8
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L101+12
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L101+16
	mov	r3, r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L101+20
	mov	lr, pc
	bx	r5
	ldr	r4, .L101+24
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L101+28
	ldr	r1, .L101+32
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L101+36
	ldr	r1, .L101+40
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r5, .L101+44
	ldr	r0, .L101+48
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r7, .L101+48
	add	r6, r1, #3
.L98:
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	cmp	r1, r6
	ble	.L98
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	PoopHitPal
	.word	seconds
	.word	5968
	.word	PoopHitTiles
	.word	100724736
	.word	PoopHitMap
	.word	mgba_printf
	.word	.LC0
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
	ldr	r3, .L107
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L107+4
	ldr	r3, .L107+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #7680
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L107+12
	strh	r4, [r2]	@ movhi
	ldr	lr, .L107+16
	str	ip, [r3]
	ldr	r3, .L107+20
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L107+24
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L107+28
	mov	r3, r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L107+32
	mov	lr, pc
	bx	r5
	ldr	r4, .L107+36
	mov	r3, #2176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L107+40
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L107+44
	ldr	r1, .L107+48
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r5, .L107+52
	ldr	r0, .L107+56
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r7, .L107+56
	add	r6, r1, #3
.L104:
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	cmp	r1, r6
	ble	.L104
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotLeafPal
	.word	seconds
	.word	gotLeafTiles
	.word	100724736
	.word	gotLeafMap
	.word	mgba_printf
	.word	.LC0
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
	ldr	r3, .L113
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L110
	ldr	r4, .L113+4
	mov	r0, #3
	ldr	r1, .L113+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L113+12
	ldr	r1, .L113+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L113+20
	ldr	r1, .L113+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L110:
	ldr	r4, .L113+4
	mov	r0, #3
	ldr	r1, .L113+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L113+12
	ldr	r1, .L113+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L113+20
	ldr	r1, .L113+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L114:
	.align	2
.L113:
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
	ldr	r3, .L119
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L116
	ldr	r4, .L119+4
	mov	r0, #3
	ldr	r1, .L119+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L119+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L119+16
	ldr	r1, .L119+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L116:
	ldr	r4, .L119+4
	mov	r0, #3
	ldr	r1, .L119+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L119+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L119+16
	ldr	r1, .L119+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L120:
	.align	2
.L119:
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
	ldr	r4, .L123
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L123+4
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L123+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L123+12
	ldr	r1, .L123+16
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r0, #3
	ldr	r2, .L123+20
	ldr	r1, .L123+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L123+28
	ldr	r1, .L123+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L124:
	.align	2
.L123:
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
	ldr	r3, .L129
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L126
	ldr	r4, .L129+4
	mov	r0, #3
	ldr	r1, .L129+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L129+12
	ldr	r1, .L129+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L129+20
	ldr	r1, .L129+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L126:
	ldr	r4, .L129+4
	mov	r0, #3
	ldr	r1, .L129+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L129+12
	ldr	r1, .L129+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L129+20
	ldr	r1, .L129+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L130:
	.align	2
.L129:
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
	ldr	r3, .L141
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L131
.L134:
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L131
	.word	.L136
	.word	.L135
	.word	.L133
.L133:
	ldr	r3, .L141+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+8
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L141+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L141+20
	ldr	r2, .L141+24
	ldr	r3, .L141+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setLeafStoneClearingBackground
.L139:
	ldr	r3, .L141+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+36
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	lr, #56320
	mov	ip, #4352
	mov	r3, #512
	ldr	r0, .L141+20
	ldr	r1, .L141+24
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L141+28
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L138:
	ldr	r3, .L141+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+36
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L141+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L141+20
	ldr	r2, .L141+24
	ldr	r3, .L141+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L137:
	ldr	r3, .L141+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+44
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L141+16
	strh	r1, [r2]	@ movhi
	ldr	r0, .L141+20
	ldr	r1, .L141+24
	ldr	r2, .L141+28
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L136:
	ldr	r3, .L141+48
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+52
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #54272
	mov	r2, #4864
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	r0, .L141+56
	ldr	lr, .L141+16
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L141+20
	ldr	r2, .L141+24
	ldr	r3, .L141+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L135:
	ldr	r3, .L141+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L141+8
	ldr	r3, .L141+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L141+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L141+20
	ldr	r2, .L141+24
	ldr	r3, .L141+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L131:
	pop	{r4, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	stage
	.word	caveMusic_length
	.word	caveMusic_data
	.word	playSoundA
	.word	scroll
	.word	mapWidth
	.word	mapHeight
	.word	waitForVBlank
	.word	houseSong_length
	.word	houseSong_data
	.word	volcanoSong_length
	.word	volcanoSong_data
	.word	forestSong_length
	.word	forestSong_data
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
	ldr	r2, .L145
	ldrh	r1, [r2]
	ldr	r2, .L145+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L146:
	.align	2
.L145:
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
	ldr	r4, .L149
	mov	r0, #3
	ldr	r2, .L149+4
	ldr	r1, .L149+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L149+12
	ldr	r1, .L149+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L149+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L149+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L150:
	.align	2
.L149:
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
	ldr	r3, .L166
	add	r1, r3, #1016
.L152:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L152
	ldr	r3, .L166+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L153
	cmp	r3, #4
	bne	.L151
	mov	r2, #8
	mov	r5, #2
	mov	r1, #0
	mov	r4, #161
	mov	lr, #1
	ldr	r0, .L166+12
	ldr	r3, .L166+16
	ldr	r0, [r0, #4]
	add	ip, r3, #480
	add	r0, r0, #20
.L159:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #4]
	str	r4, [r3]
	str	lr, [r3, #44]
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L159
	mov	r0, #27
	mov	r2, #23
	ldr	r3, .L166+20
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #20]
.L151:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L153:
	mov	fp, #0
	mov	r5, #16
	ldr	r10, .L166+24
	ldr	r4, .L166+28
	ldr	r7, .L166+32
	ldr	r6, .L166+36
	ldr	r9, .L166+40
	ldr	r8, .L166+44
	b	.L158
.L156:
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
.L160:
	str	r3, [r10, #4]
	mov	lr, pc
	bx	r4
	ldr	r1, [r7]
	sub	r1, r1, #16
	mov	lr, pc
	bx	r6
	add	fp, fp, #1
	cmp	fp, #14
	str	r1, [r10], #48
	beq	.L151
.L158:
	ands	r3, fp, #1
	str	r5, [r10, #16]
	str	r5, [r10, #20]
	beq	.L156
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
	b	.L160
.L167:
	.align	2
.L166:
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
	ldr	ip, .L170
	ldr	r0, .L170+4
	ldr	r2, .L170+8
	ldr	r1, .L170+12
	ldr	r3, .L170+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r0, #144
	ldr	r7, .L170+20
	ldr	r6, .L170+24
	ldrh	r1, [r7]
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r6]
	strh	r1, [r3, #16]	@ movhi
	ldr	r3, .L170+28
	ldr	r1, .L170+32
	str	r4, [r3]
	str	r2, [r7]
	ldr	r3, .L170+36
	ldr	r2, .L170+40
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
	ldr	r3, .L170+44
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
.L171:
	.align	2
.L170:
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
	ldr	ip, .L174
	ldr	r1, .L174+4
	ldr	r3, .L174+8
	ldr	r2, .L174+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L174+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L174+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L174+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L175:
	.align	2
.L174:
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
	ldr	r3, .L192
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L177
	cmp	r3, #4
	bne	.L176
	ldr	r5, .L192+4
	ldr	r3, [r5]
	ldr	r2, .L192+8
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	asr	ip, r3, #31
	add	r2, r2, r3
	rsb	ip, ip, r2, asr #4
	rsb	ip, ip, ip, lsl #4
	sub	ip, r3, ip, lsl #1
	ldr	r3, .L192+12
	str	ip, [r5]
	sub	r10, r3, #8
	add	r0, r3, #480
.L182:
	ldr	r2, [r3, #-8]
	cmp	r2, #160
	ldrle	r1, [r3]
	addle	r2, r1, r2
	strle	r2, [r3, #-8]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L182
	cmp	ip, #0
	bne	.L176
	mov	r9, #10
	ldr	r4, .L192+16
	ldr	fp, .L192+20
	ldr	r8, .L192+24
	ldr	r7, .L192+28
	add	r10, r10, #436
	b	.L185
.L184:
	cmp	r4, r10
	beq	.L176
.L191:
	ldr	r3, [r5]
	cmp	r3, #0
	add	r4, r4, #48
	bne	.L176
.L185:
	ldr	r3, [r4, #-4]
	cmp	r3, #160
	ble	.L184
	ldr	r1, [fp, #4]
	str	r9, [r4, #-4]
	add	r6, r1, #20
	mov	lr, pc
	bx	r8
	ldr	r3, .L192+32
	ldr	r1, [r7, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r1, r1, r6
	add	r3, r3, #1
	cmp	r4, r10
	str	r1, [r4]
	str	r3, [r5]
	bne	.L191
.L176:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L177:
	ldr	r3, .L192+36
	ldr	r4, .L192+40
	ldr	r5, [r3]
	ldr	r7, .L192+32
	sub	r5, r5, #16
	add	r6, r4, #672
.L180:
	ldr	r0, [r4, #-8]
	ldr	r3, [r4]
	mov	r1, r5
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	add	r4, r4, #48
	str	r1, [r4, #-56]
	cmp	r6, r4
	bne	.L180
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L193:
	.align	2
.L192:
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
	ldr	r3, .L225
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	beq	.L195
	cmp	r3, #4
	beq	.L196
	cmp	r3, #1
	beq	.L221
.L194:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L195:
	ldr	r2, .L225+4
	ldr	r3, .L225+8
	ldr	ip, [r2]
	ldr	r4, [r3]
	ldr	r2, .L225+12
	lsl	r6, ip, #16
	lsl	r5, r4, #16
	mov	r8, #192
	ldr	r1, .L225+16
	ldr	r7, .L225+20
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	add	lr, r2, #672
	b	.L204
.L222:
	cmp	r9, #160
	bgt	.L202
	ldr	r3, [r2, #4]
	ldr	r10, [r2, #16]
	add	r10, r3, r10
	sub	r10, r10, r4
	cmp	r10, #0
	sub	r9, r3, r4
	blt	.L202
	sub	r3, r3, r5
	sub	r0, r0, r6
	and	r3, r3, r7
	cmp	r9, #240
	and	r0, r0, #255
	orr	r3, r3, #16384
	bgt	.L202
	strh	r0, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r8, [r1, #12]	@ movhi
.L203:
	add	r2, r2, #48
	cmp	lr, r2
	add	r1, r1, #8
	beq	.L194
.L204:
	ldr	r0, [r2]
	ldr	r3, [r2, #20]
	add	r3, r0, r3
	sub	r3, r3, ip
	cmp	r3, #0
	sub	r9, r0, ip
	bge	.L222
.L202:
	ldrh	r3, [r1, #8]
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	b	.L203
.L221:
	ldr	r0, .L225+24
	ldr	r2, [r0]
	ldr	r1, .L225+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L225+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	ip, [r7]
	bne	.L198
	ldr	r2, .L225+36
	add	r3, ip, #1
	smull	r1, ip, r2, r3
	sub	ip, ip, r3, asr #31
	add	ip, ip, ip, lsl #1
	sub	ip, r3, ip
.L198:
	ldr	r3, .L225+8
	ldr	r1, .L225+4
	ldrh	r3, [r3]
	ldr	r0, .L225+40
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
	ldr	lr, .L225+16
	orr	r2, r2, #32768
	strh	r2, [lr, #10]	@ movhi
	ldr	r2, .L225+44
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
.L196:
	ldr	r0, .L225+24
	ldr	r2, [r0]
	ldr	r1, .L225+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L225+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	r1, [r7]
	beq	.L223
.L205:
	ldr	lr, .L225+16
	mov	r2, lr
	ldr	r3, .L225+4
	ldr	fp, .L225+8
	ldr	r0, [r3]
	ldr	r6, [fp]
	ldr	r3, .L225+48
	lsl	r10, r0, #16
	lsl	r9, r6, #16
	str	r1, [r7]
	lsr	r10, r10, #16
	lsr	r9, r9, #16
	add	r4, r3, #480
.L208:
	ldr	ip, [r3]
	ldr	r1, [r3, #20]
	add	r1, ip, r1
	sub	r1, r1, r0
	cmp	r1, #0
	sub	r5, ip, r0
	blt	.L206
	cmp	r5, #160
	bgt	.L206
	ldr	r5, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, r5, r1
	sub	r1, r1, r6
	cmp	r1, #0
	sub	r8, r5, r6
	blt	.L206
	cmp	r8, #240
	cmple	ip, #159
	ble	.L224
.L206:
	ldrh	r1, [r2, #8]
	orr	r1, r1, #512
	strh	r1, [r2, #8]	@ movhi
.L207:
	add	r3, r3, #48
	cmp	r4, r3
	add	r2, r2, #8
	bne	.L208
	ldr	r1, .L225+52
	ldr	r3, [fp]
	ldr	r2, [r1, #4]
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	r3, .L225+4
	ldrh	r0, [r3]
	rsb	r3, r0, #10
	and	r3, r3, #255
	strh	ip, [lr, #98]	@ movhi
	strh	r3, [lr, #96]	@ movhi
	ldr	ip, .L225+56
	ldr	r3, [r7]
	ldrh	ip, [ip, #48]
	lsl	r3, r3, #23
	tst	ip, #32
	ldr	ip, .L225+60
	lsr	r3, r3, #16
	addeq	r3, r3, #28
	addne	r3, r3, #24
	ldr	ip, [ip]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	ip, #0
	strh	r3, [lr, #100]	@ movhi
	beq	.L194
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
.L223:
	ldr	r2, .L225+36
	add	r3, r1, #1
	smull	r0, r1, r2, r3
	sub	r1, r1, r3, asr #31
	add	r1, r1, r1, lsl #1
	sub	r1, r3, r1
	b	.L205
.L224:
	mov	r1, #256	@ movhi
	sub	r5, r5, r9
	sub	ip, ip, r10
	lsl	r5, r5, #23
	and	ip, ip, #255
	lsr	r5, r5, #23
	strh	ip, [r2, #8]	@ movhi
	strh	r5, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	b	.L207
.L226:
	.align	2
.L225:
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
	ldr	r3, .L231
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L228
	ldr	r2, .L231+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L229:
	ldr	r3, .L231+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L231+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L231+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L231+16
	ldrh	r1, [r2]
	ldr	r2, .L231+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L228:
	bl	drawPlayer.part.0
	b	.L229
.L232:
	.align	2
.L231:
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
	ldr	r1, .L235
	ldr	r3, .L235+4
	ldr	r2, .L235+8
	push	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	str	r0, [r1]
	bl	setStage
	mov	r3, #142
	mov	r5, #0
	mov	r2, #112
	ldr	r4, .L235+12
	ldr	r7, .L235+16
	ldr	r6, .L235+20
	str	r3, [r4]
	ldr	r3, .L235+24
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
.L236:
	.align	2
.L235:
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
	ldr	r6, .L295
	ldr	r3, [r6]
	sub	sp, sp, #20
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L237
.L240:
	.word	.L245
	.word	.L244
	.word	.L243
	.word	.L237
	.word	.L242
	.word	.L241
	.word	.L239
.L244:
	ldr	r3, .L295+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L237
	ldr	r3, .L295+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L290
.L237:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L239:
	mov	ip, #23
	mov	r1, #21
	mov	r2, #107
	mov	r3, #80
	ldr	r0, .L295+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L295+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L237
	ldr	r3, .L295+16
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L291
.L260:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToHouse
.L245:
	ldr	r4, .L295+4
	ldr	r1, [r4]
	cmp	r1, #256
	ldr	r0, [r4, #4]
	bne	.L246
	cmp	r0, #256
	beq	.L260
.L246:
	mov	r3, #60
	mov	r8, #3
	mov	r2, #17
	ldr	r7, .L295+20
	stm	sp, {r3, r7, r8}
	str	r2, [sp, #12]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r9, .L295+12
	mov	lr, pc
	bx	r9
	subs	r5, r0, #0
	beq	.L247
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L295+24
	str	r2, [r6]
	ldr	r2, .L295+28
	ldr	ip, .L295+32
	str	r0, [r1]
	ldr	r1, .L295+36
	ldr	r0, .L295+40
	str	r3, [r2]
	ldr	r2, .L295+44
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	setStage
	mov	r1, #0
	mov	r2, #130
	mov	r3, #67108864
	mov	lr, #33
	mov	ip, #240
	ldr	r0, .L295+48
	str	r1, [r0]
	ldr	r0, .L295+52
	str	lr, [r4]
	str	ip, [r4, #4]
	str	r2, [r0]
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
.L288:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initNonPlayers
.L242:
	ldr	r4, .L295+4
	ldr	r5, .L295+56
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r9, .L295+60
	ldr	r8, .L295+12
	add	r7, r5, #480
	b	.L265
.L262:
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L264
.L287:
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
.L261:
	add	r5, r5, #48
	cmp	r5, r7
	beq	.L292
.L265:
	ldr	ip, [r5]
	ldr	r1, [r4]
	cmp	ip, r1
	ble	.L261
	ldr	r3, [r9]
	add	r10, r5, #16
	cmp	r3, #0
	ldr	lr, [r5, #4]
	ldr	r3, [r4, #20]
	ldm	r10, {r10, fp}
	beq	.L262
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	sub	r1, r1, #5
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L263
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldm	r5, {ip, lr}
	ldm	r10, {r10, fp}
	b	.L262
.L241:
	mov	r3, #16
	ldr	r2, .L295+4
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L295+12
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
	beq	.L237
	ldr	r3, .L295+64
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L260
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedFlareonBackground
	b	.L260
.L243:
	ldr	r3, .L295+68
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L267
.L253:
	mov	r2, #22
	mov	r3, #237
	mov	r5, #5
	ldr	r4, .L295+4
	str	r2, [sp, #8]
	str	r5, [sp, #12]
	str	r3, [sp]
	ldr	ip, .L295+72
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r8, .L295+12
	str	ip, [sp, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L293
	ldr	r3, .L295+32
	ldr	r1, [r4]
	ldr	r9, [r3]
	mul	r3, r1, r9
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	add	ip, r0, r2
	ldr	r6, .L295+76
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
	beq	.L294
.L254:
	ldr	r5, .L295+80
	ldr	r6, .L295+84
	ldr	r7, .L295+44
	add	r9, r5, #672
	b	.L258
.L255:
	add	r5, r5, #48
	cmp	r9, r5
	beq	.L237
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L258:
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
	beq	.L255
	bl	setLavaHitBackground
	b	.L286
.L256:
	mov	lr, pc
	bx	r7
.L286:
	ldr	r3, [r6]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6]
	bgt	.L256
	bl	returnToHouse
	b	.L255
.L264:
	bl	setPoopHitBackground
	bl	returnToHouse
	b	.L287
.L292:
	ldr	r1, .L295+32
	ldr	r3, [r1]
	sub	r3, r3, r2
	sub	r3, r3, #10
	cmp	r3, r0
	bgt	.L237
	mov	r3, #240
	mov	r5, #0
	mov	ip, #160
	mov	r0, #6
	ldr	r2, .L295+24
	str	r3, [r1]
	ldr	r3, .L295+28
	ldr	r1, .L295+88
	str	r5, [r2]
	ldr	r2, .L295+36
	str	ip, [r3]
	ldr	r3, .L295+44
	str	r1, [r2]
	str	r0, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #152
	mov	r2, #143
	mov	r3, #67108864
	ldr	ip, .L295+48
	ldr	r0, .L295+52
	str	r5, [ip]
	str	r5, [r0]
	str	r1, [r4, #4]
	str	r2, [r4]
.L289:
	strh	r5, [r3, #18]	@ movhi
	strh	r5, [r3, #16]	@ movhi
	b	.L288
.L263:
	mov	ip, #320
	str	ip, [r5]
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	lr, [r5, #4]
	ldm	r10, {r10, fp}
	b	.L262
.L247:
	mov	r2, #19
	ldr	r3, .L295+92
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
	beq	.L237
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L295+24
	str	r2, [r3]
	ldr	r2, .L295+28
	ldr	r3, .L295+32
	str	r1, [r2]
	ldr	r2, .L295+36
	ldr	r1, .L295+96
	str	r0, [r3]
	ldr	r3, .L295+44
	str	r1, [r2]
	str	ip, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #112
	mov	r0, #50
	ldr	r1, .L295+48
	str	r2, [r4]
	ldr	r2, .L295+52
	mov	r3, #67108864
	str	r0, [r4, #4]
	str	r5, [r1]
	str	r5, [r2]
	b	.L289
.L290:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToOutside
.L291:
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedLeafeonBackground
	b	.L260
.L267:
	mov	r2, #83886080
	ldr	r1, .L295+100
.L250:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L250
	b	.L253
.L293:
	mov	r7, #0
	mov	r1, #160
	mov	r0, #240
	ldr	r3, .L295+24
	ldr	r2, .L295+28
	str	r7, [r3]
	ldr	r3, .L295+32
	str	r1, [r2]
	ldr	r2, .L295+36
	ldr	r1, .L295+104
	str	r0, [r3]
	ldr	r3, .L295+44
	str	r1, [r2]
	str	r5, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #110
	mov	r3, #67108864
	mov	r2, #127
	str	r1, [r4, #4]
	ldr	r0, .L295+48
	ldr	r1, .L295+52
	str	r7, [r0]
	str	r7, [r1]
	str	r2, [r4]
	strh	r7, [r3, #18]	@ movhi
	strh	r7, [r3, #16]	@ movhi
	bl	initNonPlayers
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L254
.L294:
	bl	setLavaHitBackground
	bl	returnToHouse
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L254
.L296:
	.align	2
.L295:
	.word	stage
	.word	player
	.word	67109120
	.word	collision
	.word	hasLeafStone
	.word	382
	.word	scroll
	.word	mapHeight
	.word	mapWidth
	.word	collisionMap
	.word	volcanoCMBitmap
	.word	waitForVBlank
	.word	vOff
	.word	hOff
	.word	poops
	.word	cheat
	.word	hasFireStone
	.word	wait
	.word	498
	.word	lavaPoolCMBitmap
	.word	lavaRocks
	.word	infoScreen
	.word	forestClearingCMBitmap
	.word	449
	.word	forestCMBitmap
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
	ldr	r2, .L303
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	push	{r4, lr}
	str	r3, [r2]
	bl	updateStage
	bl	updateNonPlayers
	bl	updatePlayer
	ldr	r3, .L303+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L297
	ldr	r3, .L303+8
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L297:
	pop	{r4, lr}
	bx	lr
.L304:
	.align	2
.L303:
	.word	wait
	.word	hasFireStone
	.word	hasLeafStone
	.size	updateGame, .-updateGame
	.comm	poops,480,4
	.comm	lavaRocks,672,4
	.comm	togekiss,48,4
	.comm	player,48,4
	.comm	shadowOAM,1024,4
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
	.comm	stage,4,4
	.comm	cseconds,4,4
	.comm	seconds,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

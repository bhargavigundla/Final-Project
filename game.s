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
	.global	waitSeconds
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitSeconds, %function
waitSeconds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L90
	ldr	r0, .L90+4
	ldr	r1, [r6]
	ldr	r7, .L90+8
	mov	lr, pc
	bx	r7
	mov	r5, #0
	ldr	r4, [r6]
	ldr	r8, .L90+4
	b	.L86
.L88:
	ldr	r3, [r6]
	cmp	r3, r4
	mov	r4, r3
	addne	r5, r5, #1
.L86:
	mov	r1, r4
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r5, #5
	bne	.L88
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	seconds
	.word	.LC0
	.word	mgba_printf
	.size	waitSeconds, .-waitSeconds
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
	push	{r4, lr}
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L94
	strh	r4, [r2]	@ movhi
	ldr	lr, .L94+4
	str	ip, [r3]
	ldr	r3, .L94+8
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L94+12
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L94+16
	mov	r0, #3
	ldr	r1, .L94+20
	mov	lr, pc
	bx	r4
	mov	r3, #5952
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L94+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L94+28
	ldr	r1, .L94+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	waitSeconds
.L95:
	.align	2
.L94:
	.word	mapHeight
	.word	scroll
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
	ldr	r3, .L98
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L98+4
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #7680
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L98+12
	strh	r4, [r2]	@ movhi
	ldr	lr, .L98+16
	str	ip, [r3]
	ldr	r3, .L98+20
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L98+24
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L98+28
	mov	r0, #3
	ldr	r1, .L98+32
	mov	lr, pc
	bx	r4
	mov	r3, #3024
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L98+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L98+40
	ldr	r1, .L98+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L98+48
	ldr	r0, .L98+52
	ldr	r1, [r3]
	ldr	r3, .L98+56
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	waitSeconds
.L99:
	.align	2
.L98:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotFirePal
	.word	gotFireTiles
	.word	100724736
	.word	gotFireMap
	.word	seconds
	.word	.LC0
	.word	mgba_printf
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
	push	{r4, lr}
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L102
	strh	r4, [r2]	@ movhi
	ldr	lr, .L102+4
	str	ip, [r3]
	ldr	r3, .L102+8
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L102+12
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L102+16
	mov	r0, #3
	ldr	r1, .L102+20
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L102+24
	ldr	r1, .L102+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L102+32
	ldr	r1, .L102+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	waitSeconds
.L103:
	.align	2
.L102:
	.word	mapHeight
	.word	scroll
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
	ldr	r3, .L106
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L106+4
	ldr	r3, .L106+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #7680
	mov	ip, #160
	mov	r4, #256
	mov	r1, #0
	mov	r0, #240
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L106+12
	strh	r4, [r2]	@ movhi
	ldr	lr, .L106+16
	str	ip, [r3]
	ldr	r3, .L106+20
	str	r1, [lr]
	str	r0, [r3]
	strh	r1, [r2, #18]	@ movhi
	ldr	r3, .L106+24
	strh	r1, [r2, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L106+28
	mov	r0, #3
	ldr	r1, .L106+32
	mov	lr, pc
	bx	r4
	mov	r3, #2176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L106+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L106+40
	ldr	r1, .L106+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L106+48
	ldr	r0, .L106+52
	ldr	r1, [r3]
	ldr	r3, .L106+56
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	waitSeconds
.L107:
	.align	2
.L106:
	.word	evolvedSong_length
	.word	evolvedSong_data
	.word	playSoundB
	.word	mapHeight
	.word	scroll
	.word	mapWidth
	.word	waitForVBlank
	.word	DMANow
	.word	gotLeafPal
	.word	gotLeafTiles
	.word	100724736
	.word	gotLeafMap
	.word	seconds
	.word	.LC0
	.word	mgba_printf
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
	ldr	r3, .L112
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L109
	ldr	r4, .L112+4
	mov	r0, #3
	ldr	r1, .L112+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L112+12
	ldr	r1, .L112+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L112+20
	ldr	r1, .L112+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L109:
	ldr	r4, .L112+4
	mov	r0, #3
	ldr	r1, .L112+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L112+12
	ldr	r1, .L112+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L112+20
	ldr	r1, .L112+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L113:
	.align	2
.L112:
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
	ldr	r3, .L118
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	push	{r4, lr}
	beq	.L115
	ldr	r4, .L118+4
	mov	r0, #3
	ldr	r1, .L118+8
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L118+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L118+16
	ldr	r1, .L118+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L115:
	ldr	r4, .L118+4
	mov	r0, #3
	ldr	r1, .L118+24
	mov	lr, pc
	bx	r4
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L118+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L118+16
	ldr	r1, .L118+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L119:
	.align	2
.L118:
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
	ldr	r4, .L122
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L122+4
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L122+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L122+12
	ldr	r1, .L122+16
	mov	lr, pc
	bx	r4
	mov	r3, #64
	mov	r0, #3
	ldr	r2, .L122+20
	ldr	r1, .L122+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L122+28
	ldr	r1, .L122+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
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
	ldr	r3, .L140
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L130
.L133:
	.word	.L138
	.word	.L137
	.word	.L136
	.word	.L130
	.word	.L135
	.word	.L134
	.word	.L132
.L132:
	ldr	r3, .L140+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+8
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L140+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L140+20
	ldr	r2, .L140+24
	ldr	r3, .L140+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setLeafStoneClearingBackground
.L138:
	ldr	r3, .L140+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+36
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	lr, #56320
	mov	ip, #4352
	mov	r3, #512
	ldr	r0, .L140+20
	ldr	r1, .L140+24
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r2, .L140+28
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setOutsideBackground
.L137:
	ldr	r3, .L140+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+36
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7296
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L140+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L140+20
	ldr	r2, .L140+24
	ldr	r3, .L140+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setHouseBackground
.L136:
	ldr	r3, .L140+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+44
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #55296
	mov	r1, #4352
	mov	lr, #1
	mov	r3, #512
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L140+16
	strh	r1, [r2]	@ movhi
	ldr	r0, .L140+20
	ldr	r1, .L140+24
	ldr	r2, .L140+28
	str	lr, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	setVolcanoBackground
.L135:
	ldr	r3, .L140+48
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+52
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #54272
	mov	r2, #4864
	mov	r4, #1
	mov	ip, #512
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	r0, .L140+56
	ldr	lr, .L140+16
	strh	r0, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r0, .L140+20
	ldr	r2, .L140+24
	ldr	r3, .L140+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setForestBackground
.L134:
	ldr	r3, .L140+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L140+8
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #7168
	mov	r2, #4352
	mov	r4, #0
	mov	ip, #240
	mov	r1, #160
	strh	r0, [r3, #8]	@ movhi
	ldr	lr, .L140+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L140+20
	ldr	r2, .L140+24
	ldr	r3, .L140+28
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	setFireCaveBackground
.L130:
	pop	{r4, lr}
	bx	lr
.L141:
	.align	2
.L140:
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
	ldr	r2, .L144
	ldrh	r1, [r2]
	ldr	r2, .L144+4
	ldrh	r2, [r2]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L145:
	.align	2
.L144:
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
	ldr	r4, .L148
	mov	r0, #3
	ldr	r2, .L148+4
	ldr	r1, .L148+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L148+12
	ldr	r1, .L148+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L148+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L148+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L149:
	.align	2
.L148:
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
	ldr	r3, .L165
	add	r1, r3, #1016
.L151:
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L151
	ldr	r3, .L165+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L165+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L152
	cmp	r3, #4
	bne	.L150
	mov	r2, #8
	mov	r5, #2
	mov	r1, #0
	mov	r4, #161
	mov	lr, #1
	ldr	r0, .L165+12
	ldr	r3, .L165+16
	ldr	r0, [r0, #4]
	add	ip, r3, #480
	add	r0, r0, #20
.L158:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #4]
	str	r4, [r3]
	str	lr, [r3, #44]
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L158
	mov	r0, #27
	mov	r2, #23
	ldr	r3, .L165+20
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #20]
.L150:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L152:
	mov	fp, #0
	mov	r5, #16
	ldr	r10, .L165+24
	ldr	r4, .L165+28
	ldr	r7, .L165+32
	ldr	r6, .L165+36
	ldr	r9, .L165+40
	ldr	r8, .L165+44
	b	.L157
.L155:
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
.L159:
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
	beq	.L150
.L157:
	ands	r3, fp, #1
	str	r5, [r10, #16]
	str	r5, [r10, #20]
	beq	.L155
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
	b	.L159
.L166:
	.align	2
.L165:
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
	ldr	ip, .L169
	ldr	r0, .L169+4
	ldr	r2, .L169+8
	ldr	r1, .L169+12
	ldr	r3, .L169+16
	str	r5, [ip]
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	setOutsideBackground
	mov	r3, #67108864
	mov	r2, #220
	mov	r0, #144
	ldr	r7, .L169+20
	ldr	r6, .L169+24
	ldrh	r1, [r7]
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r6]
	strh	r1, [r3, #16]	@ movhi
	ldr	r3, .L169+28
	ldr	r1, .L169+32
	str	r4, [r3]
	str	r2, [r7]
	ldr	r3, .L169+36
	ldr	r2, .L169+40
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
	ldr	r3, .L169+44
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
.L170:
	.align	2
.L169:
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
	ldr	ip, .L173
	ldr	r1, .L173+4
	ldr	r3, .L173+8
	ldr	r2, .L173+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	bl	initNonPlayers
	mov	lr, #220
	mov	ip, #144
	mov	r0, #67108864
	ldr	r1, .L173+16
	add	r2, r1, #16
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #300
	str	r2, [r1]
	ldr	r2, .L173+20
	add	r3, r3, r3, lsr #31
	str	lr, [r2]
	ldr	r2, .L173+24
	asr	r3, r3, #1
	str	ip, [r2]
	rsb	r3, r3, #264
	strh	lr, [r0, #18]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	pop	{r4, lr}
	str	r3, [r1, #4]
	b	setStage
.L174:
	.align	2
.L173:
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
	ldr	r3, .L191
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L176
	cmp	r3, #4
	bne	.L175
	ldr	r5, .L191+4
	ldr	r3, [r5]
	ldr	ip, .L191+8
	add	r3, r3, #1
	smull	r1, r2, ip, r3
	asr	ip, r3, #31
	rsb	ip, ip, r2, asr #4
	add	ip, ip, ip, lsl #2
	sub	ip, r3, ip, lsl #3
	ldr	r3, .L191+12
	str	ip, [r5]
	sub	r10, r3, #8
	add	r0, r3, #480
.L181:
	ldr	r2, [r3, #-8]
	cmp	r2, #160
	ldrle	r1, [r3]
	addle	r2, r1, r2
	strle	r2, [r3, #-8]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L181
	cmp	ip, #0
	bne	.L175
	mov	r9, #10
	ldr	r4, .L191+16
	ldr	fp, .L191+20
	ldr	r8, .L191+24
	ldr	r7, .L191+28
	add	r10, r10, #436
	b	.L184
.L183:
	cmp	r4, r10
	beq	.L175
.L190:
	ldr	r3, [r5]
	cmp	r3, #0
	add	r4, r4, #48
	bne	.L175
.L184:
	ldr	r3, [r4, #-4]
	cmp	r3, #160
	ble	.L183
	ldr	r1, [fp, #4]
	str	r9, [r4, #-4]
	add	r6, r1, #20
	mov	lr, pc
	bx	r8
	ldr	r3, .L191+32
	ldr	r1, [r7, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r1, r1, r6
	add	r3, r3, #1
	cmp	r4, r10
	str	r1, [r4]
	str	r3, [r5]
	bne	.L190
.L175:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L176:
	ldr	r3, .L191+36
	ldr	r4, .L191+40
	ldr	r5, [r3]
	ldr	r7, .L191+32
	sub	r5, r5, #16
	add	r6, r4, #672
.L179:
	ldr	r0, [r4, #-8]
	ldr	r3, [r4]
	mov	r1, r5
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	add	r4, r4, #48
	str	r1, [r4, #-56]
	cmp	r6, r4
	bne	.L179
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L192:
	.align	2
.L191:
	.word	stage
	.word	poopCount
	.word	1717986919
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
	ldr	r3, .L224
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	beq	.L194
	cmp	r3, #4
	beq	.L195
	cmp	r3, #1
	beq	.L220
.L193:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L194:
	ldr	r2, .L224+4
	ldr	r3, .L224+8
	ldr	ip, [r2]
	ldr	r4, [r3]
	ldr	r2, .L224+12
	lsl	r6, ip, #16
	lsl	r5, r4, #16
	mov	r8, #192
	ldr	r1, .L224+16
	ldr	r7, .L224+20
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	add	lr, r2, #672
	b	.L203
.L221:
	cmp	r9, #160
	bgt	.L201
	ldr	r3, [r2, #4]
	ldr	r10, [r2, #16]
	add	r10, r3, r10
	sub	r10, r10, r4
	cmp	r10, #0
	sub	r9, r3, r4
	blt	.L201
	sub	r3, r3, r5
	sub	r0, r0, r6
	and	r3, r3, r7
	cmp	r9, #240
	and	r0, r0, #255
	orr	r3, r3, #16384
	bgt	.L201
	strh	r0, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r8, [r1, #12]	@ movhi
.L202:
	add	r2, r2, #48
	cmp	lr, r2
	add	r1, r1, #8
	beq	.L193
.L203:
	ldr	r0, [r2]
	ldr	r3, [r2, #20]
	add	r3, r0, r3
	sub	r3, r3, ip
	cmp	r3, #0
	sub	r9, r0, ip
	bge	.L221
.L201:
	ldrh	r3, [r1, #8]
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	b	.L202
.L220:
	ldr	r0, .L224+24
	ldr	r2, [r0]
	ldr	r1, .L224+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L224+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	ip, [r7]
	bne	.L197
	ldr	r2, .L224+36
	add	r3, ip, #1
	smull	r1, ip, r2, r3
	sub	ip, ip, r3, asr #31
	add	ip, ip, ip, lsl #1
	sub	ip, r3, ip
.L197:
	ldr	r3, .L224+8
	ldr	r1, .L224+4
	ldrh	r3, [r3]
	ldr	r0, .L224+40
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
	ldr	lr, .L224+16
	orr	r2, r2, #32768
	strh	r2, [lr, #10]	@ movhi
	ldr	r2, .L224+44
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
.L195:
	ldr	r0, .L224+24
	ldr	r2, [r0]
	ldr	r1, .L224+28
	add	r2, r2, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #1
	ldr	r7, .L224+32
	cmp	r3, #0
	str	r3, [r0]
	ldr	r1, [r7]
	beq	.L222
.L204:
	ldr	lr, .L224+16
	mov	r2, lr
	ldr	r3, .L224+4
	ldr	fp, .L224+8
	ldr	r0, [r3]
	ldr	r6, [fp]
	ldr	r3, .L224+48
	lsl	r10, r0, #16
	lsl	r9, r6, #16
	str	r1, [r7]
	lsr	r10, r10, #16
	lsr	r9, r9, #16
	add	r4, r3, #480
.L207:
	ldr	ip, [r3]
	ldr	r1, [r3, #20]
	add	r1, ip, r1
	sub	r1, r1, r0
	cmp	r1, #0
	sub	r5, ip, r0
	blt	.L205
	cmp	r5, #160
	bgt	.L205
	ldr	r5, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, r5, r1
	sub	r1, r1, r6
	cmp	r1, #0
	sub	r8, r5, r6
	blt	.L205
	cmp	r8, #240
	cmple	ip, #159
	ble	.L223
.L205:
	ldrh	r1, [r2, #8]
	orr	r1, r1, #512
	strh	r1, [r2, #8]	@ movhi
.L206:
	add	r3, r3, #48
	cmp	r4, r3
	add	r2, r2, #8
	bne	.L207
	ldr	r1, .L224+52
	ldr	r3, [fp]
	ldr	r2, [r1, #4]
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	r3, .L224+4
	ldrh	r0, [r3]
	rsb	r3, r0, #10
	and	r3, r3, #255
	strh	ip, [lr, #98]	@ movhi
	strh	r3, [lr, #96]	@ movhi
	ldr	ip, .L224+56
	ldr	r3, [r7]
	ldrh	ip, [ip, #48]
	lsl	r3, r3, #23
	tst	ip, #32
	ldr	ip, .L224+60
	lsr	r3, r3, #16
	addeq	r3, r3, #28
	addne	r3, r3, #24
	ldr	ip, [ip]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	ip, #0
	strh	r3, [lr, #100]	@ movhi
	beq	.L193
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
.L222:
	ldr	r2, .L224+36
	add	r3, r1, #1
	smull	r0, r1, r2, r3
	sub	r1, r1, r3, asr #31
	add	r1, r1, r1, lsl #1
	sub	r1, r3, r1
	b	.L204
.L223:
	mov	r1, #256	@ movhi
	sub	r5, r5, r9
	sub	ip, ip, r10
	lsl	r5, r5, #23
	and	ip, ip, #255
	lsr	r5, r5, #23
	strh	ip, [r2, #8]	@ movhi
	strh	r5, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	b	.L206
.L225:
	.align	2
.L224:
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
	ldr	r3, .L230
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L227
	ldr	r2, .L230+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L228:
	ldr	r3, .L230+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L230+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L230+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L230+16
	ldrh	r1, [r2]
	ldr	r2, .L230+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L227:
	bl	drawPlayer.part.0
	b	.L228
.L231:
	.align	2
.L230:
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
	ldr	r1, .L234
	ldr	r3, .L234+4
	ldr	r2, .L234+8
	push	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	str	r0, [r1]
	bl	setStage
	mov	r3, #142
	mov	r5, #0
	mov	r2, #112
	ldr	r4, .L234+12
	ldr	r7, .L234+16
	ldr	r6, .L234+20
	str	r3, [r4]
	ldr	r3, .L234+24
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
.L235:
	.align	2
.L234:
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
	ldr	r6, .L294
	ldr	r3, [r6]
	sub	sp, sp, #20
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L236
.L239:
	.word	.L244
	.word	.L243
	.word	.L242
	.word	.L236
	.word	.L241
	.word	.L240
	.word	.L238
.L243:
	ldr	r3, .L294+4
	ldr	r3, [r3]
	cmp	r3, #141
	ble	.L236
	ldr	r3, .L294+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L289
.L236:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L238:
	mov	ip, #23
	mov	r1, #21
	mov	r2, #107
	mov	r3, #80
	ldr	r0, .L294+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L294+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L236
	ldr	r3, .L294+16
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L290
.L259:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToHouse
.L244:
	ldr	r4, .L294+4
	ldr	r1, [r4]
	cmp	r1, #256
	ldr	r0, [r4, #4]
	bne	.L245
	cmp	r0, #256
	beq	.L259
.L245:
	mov	r3, #60
	mov	r8, #3
	mov	r2, #17
	ldr	r7, .L294+20
	stm	sp, {r3, r7, r8}
	str	r2, [sp, #12]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r9, .L294+12
	mov	lr, pc
	bx	r9
	subs	r5, r0, #0
	beq	.L246
	mov	r2, #2
	mov	r0, #1
	mov	r3, #512
	ldr	r1, .L294+24
	str	r2, [r6]
	ldr	r2, .L294+28
	ldr	ip, .L294+32
	str	r0, [r1]
	ldr	r1, .L294+36
	ldr	r0, .L294+40
	str	r3, [r2]
	ldr	r2, .L294+44
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
	ldr	r0, .L294+48
	str	r1, [r0]
	ldr	r0, .L294+52
	str	lr, [r4]
	str	ip, [r4, #4]
	str	r2, [r0]
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
.L287:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initNonPlayers
.L241:
	ldr	r4, .L294+4
	ldr	r5, .L294+56
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r9, .L294+60
	ldr	r8, .L294+12
	add	r7, r5, #480
	b	.L264
.L261:
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L263
.L286:
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
.L260:
	add	r5, r5, #48
	cmp	r5, r7
	beq	.L291
.L264:
	ldr	ip, [r5]
	ldr	r1, [r4]
	cmp	ip, r1
	ble	.L260
	ldr	r3, [r9]
	add	r10, r5, #16
	cmp	r3, #0
	ldr	lr, [r5, #4]
	ldr	r3, [r4, #20]
	ldm	r10, {r10, fp}
	beq	.L261
	str	fp, [sp, #12]
	str	r10, [sp, #8]
	str	ip, [sp, #4]
	str	lr, [sp]
	sub	r1, r1, #5
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L262
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldm	r5, {ip, lr}
	ldm	r10, {r10, fp}
	b	.L261
.L240:
	mov	r3, #16
	ldr	r2, .L294+4
	add	r0, r2, #16
	ldm	r0, {r0, ip}
	ldm	r2, {r1, r2}
	ldr	r4, .L294+12
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
	beq	.L236
	ldr	r3, .L294+64
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L259
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedFlareonBackground
	b	.L259
.L242:
	ldr	r3, .L294+68
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L266
.L252:
	mov	r2, #22
	mov	r3, #237
	mov	r5, #5
	ldr	r4, .L294+4
	str	r2, [sp, #8]
	str	r5, [sp, #12]
	str	r3, [sp]
	ldr	ip, .L294+72
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r8, .L294+12
	str	ip, [sp, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L292
	ldr	r3, .L294+32
	ldr	r1, [r4]
	ldr	r9, [r3]
	mul	r3, r1, r9
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	add	ip, r0, r2
	ldr	r6, .L294+76
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
	beq	.L293
.L253:
	ldr	r5, .L294+80
	ldr	r6, .L294+84
	ldr	r7, .L294+44
	add	r9, r5, #672
	b	.L257
.L254:
	add	r5, r5, #48
	cmp	r9, r5
	beq	.L236
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L257:
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
	beq	.L254
	bl	setLavaHitBackground
	b	.L285
.L255:
	mov	lr, pc
	bx	r7
.L285:
	ldr	r3, [r6]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6]
	bgt	.L255
	bl	returnToHouse
	b	.L254
.L263:
	bl	setPoopHitBackground
	bl	returnToHouse
	b	.L286
.L291:
	ldr	r1, .L294+32
	ldr	r3, [r1]
	sub	r3, r3, r2
	sub	r3, r3, #10
	cmp	r3, r0
	bgt	.L236
	mov	r3, #240
	mov	r5, #0
	mov	ip, #160
	mov	r0, #6
	ldr	r2, .L294+24
	str	r3, [r1]
	ldr	r3, .L294+28
	ldr	r1, .L294+88
	str	r5, [r2]
	ldr	r2, .L294+36
	str	ip, [r3]
	ldr	r3, .L294+44
	str	r1, [r2]
	str	r0, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #152
	mov	r2, #143
	mov	r3, #67108864
	ldr	ip, .L294+48
	ldr	r0, .L294+52
	str	r5, [ip]
	str	r5, [r0]
	str	r1, [r4, #4]
	str	r2, [r4]
.L288:
	strh	r5, [r3, #18]	@ movhi
	strh	r5, [r3, #16]	@ movhi
	b	.L287
.L262:
	mov	ip, #320
	str	ip, [r5]
	add	r2, r4, #16
	add	r10, r5, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	lr, [r5, #4]
	ldm	r10, {r10, fp}
	b	.L261
.L246:
	mov	r2, #19
	ldr	r3, .L294+92
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
	beq	.L236
	mov	r2, #1
	mov	r1, #160
	mov	r0, #512
	mov	ip, #4
	ldr	r3, .L294+24
	str	r2, [r3]
	ldr	r2, .L294+28
	ldr	r3, .L294+32
	str	r1, [r2]
	ldr	r2, .L294+36
	ldr	r1, .L294+96
	str	r0, [r3]
	ldr	r3, .L294+44
	str	r1, [r2]
	str	ip, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r2, #112
	mov	r0, #50
	ldr	r1, .L294+48
	str	r2, [r4]
	ldr	r2, .L294+52
	mov	r3, #67108864
	str	r0, [r4, #4]
	str	r5, [r1]
	str	r5, [r2]
	b	.L288
.L289:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	returnToOutside
.L290:
	mov	r2, #1
	str	r2, [r3]
	bl	setObtainedLeafeonBackground
	b	.L259
.L266:
	mov	r2, #83886080
	ldr	r1, .L294+100
.L249:
	ldrh	r3, [r2]
	add	r3, r3, #1
	and	r3, r3, #255
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L249
	b	.L252
.L292:
	mov	r7, #0
	mov	r1, #160
	mov	r0, #240
	ldr	r3, .L294+24
	ldr	r2, .L294+28
	str	r7, [r3]
	ldr	r3, .L294+32
	str	r1, [r2]
	ldr	r2, .L294+36
	ldr	r1, .L294+104
	str	r0, [r3]
	ldr	r3, .L294+44
	str	r1, [r2]
	str	r5, [r6]
	mov	lr, pc
	bx	r3
	bl	setStage
	mov	r1, #110
	mov	r3, #67108864
	mov	r2, #127
	str	r1, [r4, #4]
	ldr	r0, .L294+48
	ldr	r1, .L294+52
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
	b	.L253
.L293:
	bl	setLavaHitBackground
	bl	returnToHouse
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L253
.L295:
	.align	2
.L294:
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
	ldr	r2, .L302
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	push	{r4, lr}
	str	r3, [r2]
	bl	updateStage
	bl	updateNonPlayers
	bl	updatePlayer
	ldr	r3, .L302+4
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L296
	ldr	r3, .L302+8
	ldr	r0, [r3]
	subs	r0, r0, #0
	movne	r0, #1
.L296:
	pop	{r4, lr}
	bx	lr
.L303:
	.align	2
.L302:
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

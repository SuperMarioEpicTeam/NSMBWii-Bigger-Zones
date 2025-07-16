#include <asm_setup.S>

.text
.align 4

.extern DoneWithInitializeNextIDto1				#800837c4

.global InitializeNextIDto1
InitializeNextIDto1:
	li		r5, 1
	sth		r5, 0xc08(r3)
	b		DoneWithInitializeNextIDto1



.extern HardcodedEmptyTile_Return				#800776c8
.extern ContinueFromHardcodedEmptyTile			#800776bc

.global HardcodedEmptyTile
HardcodedEmptyTile:
	cmpwi	r3, 0
	beq		HardcodedEmptyTile_Zero

	mr		r4, r3					#og instruction
	b		ContinueFromHardcodedEmptyTile
HardcodedEmptyTile_Zero:
	li		r3, 0
	li		r4, 0
	b		HardcodedEmptyTile_Return

.extern getBlockIDforPosition__12TilemapClassFiib			#80083f90
.extern CreateBgBuffer__12TilemapClassFi					#800837d0
.extern getPointerToTile__12TilemapClassFiiPUib
.extern ContinueFromSomeTileGodFix							#800778c8

.global SomeTileGodFix
SomeTileGodFix:
	cmpwi	r3, 0
	bne		SomeTileGodFix_End

	mr		r3, r26
	mr		r4, r27
	mr		r5, r28
	li		r6, 0			#this arg is not being used anyway
	bl		getBlockIDforPosition__12TilemapClassFiib

	mr		r4, r3
	mr		r3, r26
	bl		CreateBgBuffer__12TilemapClassFi

	#and.....call it again!

	mr		r3, r26
	mr		r4, r27
	mr		r5, r28
	rlwinm	r6, r29, 0x0, 0x18, 0x1f
	addi	r7, sp, 0xc
	li		r8, 1
	bl		getPointerToTile__12TilemapClassFiiPUib

SomeTileGodFix_End:
	lwz		r0, 0xc(sp)
	b		ContinueFromSomeTileGodFix
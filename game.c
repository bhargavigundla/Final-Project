#include <stdlib.h>
#include "game.h"
#include "house.h"
#include "houseCM.h"
#include "outsideCM.h"
#include "outside.h"
#include "volcano.h"
#include "volcanoCM.h"
#include "lavaPoolCM.h"
#include "volcanoNoStone.h"
#include "fireStoneCave.h"
#include "fireStoneCaveNoStone.h"
#include "fireStoneCaveCM.h"
#include "spritesheet.h"
#include "mode0.h"
#include "ocean.h"
#include "oceanNoStone.h"
#include "oceanCM.h"
#include "forest.h"
#include "forestNoStone.h"
#include "forestCM.h"
#include "soundB.h"
#include "sound.h"

#define lavaBlobsLen 5

// Variables
int hOff;
int vOff;

int hasFireStone;
int hasWaterStone;
int hasLeafStone;

int loopCount;

enum {
    STATIC,
    SCROLLING
};
int scroll;

enum {
    OUTSIDE,
    HOUSE,
    VOLCANO,
    OCEAN,
    FOREST,
    FIRESTONEROOM
};
enum {
    EEVEEDOORROW = 256,
    EEVEEDOORCOL = 256,
    EEVEEDOORWIDTH = 16,
    LAVADOORROW = 430,
    LAVADOORCOL = 254,
    LAVADOORWIDTH = 18,
    HOUSEEXITROW = 159,
    HOUSEEXITCOL = 106,
    HOUSEEXITWIDTH = 28,
    HOUSEEXITHEIGHT = 1,
    FIRESTONECOL = 110,
    FIRESTONEROW = 56,
    FIRESTONEWIDTH = 16,
    FIRESTONEHEIGHT = 16,
    FIRESTONECAVEDOORCOL = 237,
    FIRESTONECAVEDOORROW = 498,
    FIRESTONECAVEDOORHEIGHT = 5,
    FIRESTONECAVEDOORWIDTH = 22,
    LAVABLOBSWIDTH = 16,
    LAVABLOBSHEIGHT = 16,
    OCEANDOORROW = 382,
    OCEANDOORCOL = 60,
    OCEANDOORWIDTH = 3,
    OCEANDOORHEIGHT = 17,
    WATERSTONECOL = 496,
    WATERSTONEROW = 224,
    WATERSTONEWIDTH = 16,
    WATERSTONEHEIGHT = 16,
    WATERSTONEENABLED = 2,
    FORESTDOORCOL = 449,
    FORESTDOORROW = 382,
    FORESTDOORWIDTH = 3,
    FORESTDOORHEIGHT = 19,
    LEAFSTONECOL = 496,
    LEAFSTONEROW = 112,
    LEAFSTONEWIDTH = 16,
    LEAFSTONEHEIGHT = 16
};
int stage;

enum {OUTSIDEWIDTH = 512, OUTSIDEHEIGHT = 512,
      HOUSEWIDTH = 240, HOUSEHEIGHT = 160,
      VOLCANOWIDTH = 512, VOLCANOHEIGHT = 512,
      OCEANWIDTH = 512, OCEANHEIGHT = 240,
      FORESTWIDTH = 512, FORESTHEIGHT = 160,
      FIRESTONEROOMWIDTH = 240, FIRESTONEROOMHEIGHT = 160};

OBJ_ATTR shadowOAM[128];
ANISPRITE player;

ANISPRITE lavaBlobs[lavaBlobsLen];

unsigned char* collisionMap;

// Initialize the game
void initGame() {
    collisionMap = (unsigned char *) outsideCMBitmap;
    scroll = SCROLLING;
    stage = OUTSIDE;

	waitForVBlank();
    setOutsideBackground();

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

	vOff = 220;
	hOff = 144;

    hasFireStone = 0;
    hasLeafStone = 0;
    hasWaterStone = 0;

    // Set up the sprites
    initNonPlayers();
    initSprites();
    initPlayer();
}

// Updates the game each frame
int updateGame() {
    updateStage();
    updateNonPlayers();
	updatePlayer();
    return (hasFireStone && hasLeafStone && hasWaterStone);
}

// Draws the game each frame
void drawGame() {
    drawNonPlayers();
    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Initialize the player
void initPlayer() {

    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;

    // Place in the middle of the screen
    player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERFRONT;
}


// Handle basic player movement
void updatePlayer() {
    if(BUTTON_HELD(BUTTON_UP)) {
        if (stage != FOREST && collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            0, -player.rdel)) {
            player.worldRow -= player.rdel;
			vOff -= (vOff - scroll >= 0) ? scroll : 0;
        }  
    }
	if(BUTTON_HELD(BUTTON_DOWN)) {
        if (stage != FOREST && collisionCheck(collisionMap, mapWidth, 
                player.worldCol, player.worldRow, 
                player.width, player.height, 
                0, player.rdel)) {
            player.worldRow += player.rdel;
			vOff += ((vOff + scroll + SCREENHEIGHT - 1) < mapHeight) ? scroll : 0;
        }

    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            -player.cdel, 0)) {
                
            player.worldCol -= player.cdel;
			hOff -= (hOff - scroll >= 0) ? scroll : 0;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            player.cdel, 0)) {
                    
            player.worldCol += player.cdel;
			hOff += ((hOff + scroll + SCREENWIDTH - 1) < mapWidth) ? scroll : 0;
        }
    }
    if (stage == OCEAN) {
        // move ocean every frame by 1 pixel until end of screen
        if ((hOff + scroll + SCREENWIDTH - 1) < mapWidth) {
            hOff = (hOff + 1) % OCEANWIDTH;    
            loopCount += (hOff == 0) ? 1 : 0;     
            player.worldCol += player.cdel;
        } else {
           if (BUTTON_HELD(BUTTON_LEFT)) {
               player.worldCol -= player.cdel;
           } 
        }
    }
    animatePlayer();
}

void updateStage() {
	// change stage, world variables, background vars to specified stage
	switch (stage) {
		case OUTSIDE:
		    if (player.worldRow == EEVEEDOORROW && player.worldCol == EEVEEDOORCOL) { 
                // move into house
                collisionMap = (unsigned char *) houseCMBitmap;
                stage = HOUSE;

                setStage();
                vOff = 0;
                hOff = 0;

                player.worldRow = 142;
                player.worldCol = 112;
                
                hideSprites();
                player.hide = 0;
                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
            } else if (player.worldRow + player.height - 1 == LAVADOORROW && player.worldCol == LAVADOORCOL) {
                scroll = SCROLLING;
                collisionMap = (unsigned char *) volcanoCMBitmap;
                mapHeight = VOLCANOHEIGHT;
                mapWidth = VOLCANOWIDTH;
                stage = VOLCANO;

                waitForVBlank();
                setStage();
                vOff = 0;
                hOff = 130;
                player.worldRow = 33;
                player.worldCol = 240;
                
                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
            } else if (collision(player.worldCol, player.worldRow, player.width, player.height, 
                OCEANDOORCOL, OCEANDOORROW, OCEANDOORWIDTH, OCEANDOORHEIGHT)) {
                scroll = SCROLLING;
                collisionMap = (unsigned char *) oceanCMBitmap;
                mapHeight = OCEANHEIGHT;
                mapWidth = OCEANWIDTH;
                stage = OCEAN;

                waitForVBlank();
                setStage();
                vOff = 0;
                hOff = 0;
                player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
                player.worldCol = 10;
                
                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
            } else if (collision(player.worldCol, player.worldRow, player.width, player.height,
                FORESTDOORCOL, FORESTDOORROW, FORESTDOORWIDTH, FORESTDOORHEIGHT)) {               
                scroll = SCROLLING;
                collisionMap = (unsigned char *) forestCMBitmap;
                mapHeight = FORESTHEIGHT;
                mapWidth = FORESTWIDTH;
                stage = FOREST;

                waitForVBlank();
                setStage();
                vOff = 0;
                hOff = 0;
                player.worldRow = 112;
                player.worldCol = 0;
                
                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
            }
			break;
		case HOUSE:
            if (player.worldRow >= 142 && BUTTON_HELD(BUTTON_DOWN)) {
                returnToOutside();
                playSoundB(soundB_data, soundB_length, 0);
            }
			break;
		case VOLCANO:
            for (int i = 0; i < 16; i++) {
                PALETTE[i] = (PALETTE[i] + 1) % 256;
            }
            
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
                          FIRESTONECAVEDOORCOL, FIRESTONECAVEDOORROW, FIRESTONECAVEDOORWIDTH, FIRESTONECAVEDOORHEIGHT)) {
                scroll = STATIC;
                collisionMap = (unsigned char *) fireStoneCaveCMBitmap;
                mapHeight = 160;
                mapWidth = 240;
                stage = FIRESTONEROOM;

                waitForVBlank();
                setStage();
                vOff = 0;
                hOff = 0;
                player.worldCol = 110;
                player.worldRow = 127;

                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
            } else if (!collisionCheck((unsigned char *) lavaPoolCMBitmap, mapWidth,
                player.worldCol, player.worldRow, player.width, player.height, 0, 0)) {
                returnToOutside();
                playSoundB(soundB_data, soundB_length, 0);
            }

            for (int i = 0; i < lavaBlobsLen; i++) {
                if (collision(player.worldCol, player.worldRow, player.width, player.height,
                    lavaBlobs[i].worldCol, lavaBlobs[i].worldRow, lavaBlobs[i].width, lavaBlobs[i].height)) {
                    returnToOutside();
                }
                playSoundB(soundB_data, soundB_length, 0);
            }
			break;
        case FIRESTONEROOM:
            if (collision(FIRESTONECOL, FIRESTONEROW, FIRESTONEWIDTH, FIRESTONEHEIGHT,
            player.worldCol, player.worldRow, player.width, player.height)) {
                if (!hasFireStone) {
                        hasFireStone = 1;
                }
                returnToOutside();
                playSoundB(soundB_data, soundB_length, 0);
            }
            break;
        case OCEAN:
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
                WATERSTONECOL, WATERSTONEROW, WATERSTONEWIDTH, WATERSTONEHEIGHT)) {
                    if (!hasWaterStone) {
                        hasWaterStone = 1;
                    }
                    returnToOutside();
                    playSoundB(soundB_data, soundB_length, 0);
            }
            break;
        case FOREST:
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
                LEAFSTONECOL, LEAFSTONEROW, LEAFSTONEWIDTH, LEAFSTONEHEIGHT)) {
                if (!hasLeafStone) {
                    hasLeafStone = 1; 
                }
                returnToOutside();
                playSoundB(soundB_data, soundB_length, 0);
            }
            break;
	}
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    // Change the animation frame every 20 frames
    if(player.aniCounter % 15 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        player.aniState = PLAYERBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        player.aniState = PLAYERFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = PLAYERLEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = PLAYERRIGHT;

    // If the player aniState is idle, frame is player standing
    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        // TODO 1.1: Set the character's row and col properly
        shadowOAM[0].attr0 = (ROWMASK &(player.worldRow - vOff)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK &(player.worldCol - hOff)) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }
}

int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, int colShift, int rowShift) {
    int smallestSoFar = 256;
    int current;

    // Top Left
    current = collisionMap[OFFSET(col + colShift, row + rowShift, mapWidth)];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }

    // Top Right
    current = collisionMap[OFFSET(col + colShift + width - 1, row + rowShift, mapWidth)];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }

    // Bottom Left
    current = collisionMap[OFFSET(col + colShift, row + rowShift + height - 1, mapWidth)];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }    

    // Bottom Right
    current = collisionMap[OFFSET(col + colShift + width - 1, row + rowShift + height - 1, mapWidth)];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }

    return smallestSoFar;
}

void setOutsideBackground() {
    DMANow(3, outsidePal, PALETTE, 256);
    DMANow(3, outsideTiles, &CHARBLOCK[0], outsideTilesLen / 2);
    DMANow(3, outsideMap, &SCREENBLOCK[28], outsideMapLen / 2);
}

void setHouseBackground() {
    DMANow(3, housePal, PALETTE, 256);
    DMANow(3, houseTiles, &CHARBLOCK[0], houseTilesLen / 2);
    DMANow(3, houseMap, &SCREENBLOCK[28], houseMapLen / 2);
}

void setVolcanoBackground() {
    DMANow(3, volcanoPal, PALETTE, 256);
    DMANow(3, volcanoTiles, &CHARBLOCK[0], volcanoTilesLen / 2);
    DMANow(3, volcanoMap, &SCREENBLOCK[24], volcanoMapLen / 2);
}

void setFireCaveBackground() {
    if (hasFireStone) {        
        DMANow(3, fireStoneCaveNoStonePal, PALETTE, 256);
        DMANow(3, fireStoneCaveNoStoneTiles, &CHARBLOCK[0], fireStoneCaveTilesLen / 2);
        DMANow(3, fireStoneCaveNoStoneMap, &SCREENBLOCK[28], fireStoneCaveMapLen / 2);
    } else {        
        DMANow(3, fireStoneCavePal, PALETTE, 256);
        DMANow(3, fireStoneCaveTiles, &CHARBLOCK[0], fireStoneCaveTilesLen / 2);
        DMANow(3, fireStoneCaveMap, &SCREENBLOCK[28], fireStoneCaveMapLen / 2);
    }   
}

void setOceanBackground() {
    if (hasWaterStone) {        
        DMANow(3, oceanNoStonePal, PALETTE, 256);
        DMANow(3, oceanNoStoneTiles, &CHARBLOCK[0], oceanTilesLen / 2);
        DMANow(3, oceanNoStoneMap, &SCREENBLOCK[24], oceanMapLen / 2);
        
    } else {
        DMANow(3, oceanPal, PALETTE, 256);
        DMANow(3, oceanTiles, &CHARBLOCK[0], oceanTilesLen / 2);
        DMANow(3, oceanMap, &SCREENBLOCK[24], oceanMapLen / 2);
    }
}

void setForestBackground() {
    if (hasLeafStone) {        
        DMANow(3, forestNoStonePal, PALETTE, 256);
        DMANow(3, forestNoStoneTiles, &CHARBLOCK[0], forestTilesLen / 2);
        DMANow(3, forestNoStoneMap, &SCREENBLOCK[24], forestMapLen / 2);
        
    } else {
        DMANow(3, forestPal, PALETTE, 256);
        DMANow(3, forestTiles, &CHARBLOCK[0], forestTilesLen / 2);
        DMANow(3, forestMap, &SCREENBLOCK[24], forestMapLen / 2);
    }
}

void showGame() {
    // sets registers and initializes backgrounds for correct stage
    setStage();

    // Set up background 0's hOff and vOff
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
}

void setStage() {
    switch (stage) {
        case (OUTSIDE):
            REG_BG0CNT = BG_8BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            REG_DISPCTL = MODE0 | BG0_ENABLE |SPRITE_ENABLE;
            mapWidth = OUTSIDEWIDTH;
	        mapHeight = OUTSIDEHEIGHT;

            waitForVBlank();
            setOutsideBackground();
            break;
        case (HOUSE):
            REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            REG_DISPCTL = MODE0 | BG0_ENABLE |SPRITE_ENABLE;
            scroll = STATIC;
            mapWidth = HOUSEWIDTH;
	        mapHeight = HOUSEHEIGHT;

            waitForVBlank();
            setHouseBackground();
            break;
        case VOLCANO:
            REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24);
            REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
            scroll = SCROLLING;
            mapWidth = VOLCANOWIDTH;
	        mapHeight = VOLCANOHEIGHT;
            
            waitForVBlank();
            setVolcanoBackground();
            break;
        case OCEAN:
            REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24);
            REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
            scroll = SCROLLING;
            mapWidth = OCEANWIDTH;
	        mapHeight = OCEANHEIGHT;
            
            waitForVBlank();
            setOceanBackground();
            break;
        case FOREST:            
            REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24);
            REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
            scroll = SCROLLING;
            mapWidth = FORESTWIDTH;
	        mapHeight = FORESTHEIGHT;
            
            waitForVBlank();
            setForestBackground();
            break;
        case FIRESTONEROOM:
            REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            REG_DISPCTL = MODE0 | BG0_ENABLE |SPRITE_ENABLE;
                        
            scroll = STATIC;
            mapWidth = FIRESTONEROOMWIDTH;
	        mapHeight = FIRESTONEROOMHEIGHT;

            waitForVBlank();
            setFireCaveBackground();
            break;
    }
}

void initSprites() {
    // Setup the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void returnToOutside() {
    scroll = SCROLLING;
    collisionMap = (unsigned char *) outsideCMBitmap;
    stage = OUTSIDE;
    initNonPlayers();

    vOff = 220;
    hOff = 144;
    player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff;
    
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    setStage();
}

void initNonPlayers() {
    for (int i = 1; i < 128; i++) {
        shadowOAM[i].attr0 = 0;
        shadowOAM[i].attr1 = 0;
        shadowOAM[i].attr2 = 0;
    }
    hideSprites();
    switch (stage) {
        case OUTSIDE:
            break;
        case HOUSE:
            break;
        case VOLCANO:
            for (int i = 0; i < lavaBlobsLen; i++) {
                lavaBlobs[i].width = 16;
                lavaBlobs[i].height = 16;
                lavaBlobs[i].rdel = 1;
                lavaBlobs[i].cdel = 0;
                lavaBlobs[i].worldCol = rand() % (mapWidth - LAVABLOBSWIDTH);
                lavaBlobs[i].worldRow = rand() % (mapHeight - LAVABLOBSWIDTH);
            }
            break;
        case OCEAN:
            break;
    }
}

void updateNonPlayers() {
    switch (stage) {
        case VOLCANO:
            for (int i = 0; i < lavaBlobsLen; i++) {
                lavaBlobs[i].worldRow = (lavaBlobs[i].worldRow + lavaBlobs[i].rdel) % (mapHeight - LAVABLOBSHEIGHT);
            }
        break;
    }
}

void drawNonPlayers() {
    switch (stage) {
        case OUTSIDE:
            break;
        case HOUSE:
            break;
        case VOLCANO:
            for (int i = 1; i < lavaBlobsLen + 1; i++) {
                if (lavaBlobs[i - 1].worldCol > hOff && lavaBlobs[i - 1].worldCol < hOff + SCREENWIDTH) {
                    shadowOAM[i].attr0 = (ROWMASK &(lavaBlobs[i - 1].worldRow - vOff)) | ATTR0_SQUARE;
                    shadowOAM[i].attr1 = (COLMASK &(lavaBlobs[i - 1].worldCol - hOff)) | ATTR1_SMALL; 
                    shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 6);
                } else {
                    shadowOAM[i].attr0 |= ATTR0_HIDE;            
                }   
            }
            break;
    }
}
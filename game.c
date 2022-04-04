#include "game.h"
#include "house.h"
#include "houseCM.h"
#include "outsideCM.h"
#include "outside.h"
#include "spritesheet.h"
#include "mode0.h"

// Variables
int hOff;
int vOff;

enum {
    OUTSIDE,
    HOUSE,
    VOLCANO,
    OCEAN,
    FOREST
};
enum {
    EEVEEDOORROW = 256,
    EEVEEDOORCOL = 256,
    EEVEEDOORWIDTH = 16
};
int stage;

enum {OUTSIDEWIDTH = 512, OUTSIDEHEIGHT = 512,
      HOUSEWIDTH = 512, HOUSEHEIGHT = 512};

OBJ_ATTR shadowOAM[128];
SPRITE player;

unsigned char* collisionMap;

// Initialize the game
void initGame() {
    collisionMap = (unsigned char *) outsideCMBitmap;
    stage = OUTSIDE;

	waitForVBlank();
    setOutsideBackground();

    // TODO 3.5: Set up background 0's hOff and vOff
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

	vOff = 137;
	hOff = 83;

    // Set up the sprites
    initSprites();
	
    initPlayer();
}

// Updates the game each frame
void updateGame() {
    updateStage();
	updatePlayer();
}

// Draws the game each frame
void drawGame() {

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
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            0, -player.rdel)) {
            player.worldRow -= player.rdel;
			vOff --;
        }
    }
	if(BUTTON_HELD(BUTTON_DOWN)) {
        if (collisionCheck(collisionMap, mapWidth, 
                player.worldCol, player.worldRow, 
                player.width, player.height, 
                0, player.rdel)) {
            player.worldRow += player.rdel;
			vOff ++;
        }

    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            -player.cdel, 0)) {
                
            player.worldCol -= player.cdel;
			hOff --;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            player.cdel, 0)) {
                    
            player.worldCol += player.cdel;
			hOff ++;
        }
    }
    animatePlayer();
}

void updateStage() {
	// change stage, world variables, background varibales to specified stage
	switch (stage) {
		case OUTSIDE:
		    if (player.worldRow == EEVEEDOORROW && player.worldCol == EEVEEDOORCOL) { 
                // REG_BG0CNT = BG_8BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
                // REG_DISPCTL = MODE0 | BG0_ENABLE;
                collisionMap = (unsigned char *) houseCMBitmap; // good
                stage = HOUSE;
                player.worldCol = 114;
                player.worldRow = 114;
                vOff = 137;
                hOff = 275;
                setStage();
            }
			break;
		case HOUSE:
			break;
		case VOLCANO:
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

void showGame() {
    // sets registers and initializes backgrounds for correct stage
    setStage();

    // Set up background 0's hOff and vOff
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    // initSprites();
}

void setStage() {
    switch (stage) {
        case (OUTSIDE):
            REG_BG0CNT = BG_8BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            mapWidth = OUTSIDEWIDTH;
	        mapWidth = OUTSIDEHEIGHT;

            waitForVBlank();
            setOutsideBackground();
            break;
        case (HOUSE):
            // REG_BG0CNT = BG_8BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            mapWidth = HOUSEWIDTH;
	        mapWidth = HOUSEHEIGHT;

            waitForVBlank();
            setHouseBackground();
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
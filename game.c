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
#include "forestForeground.h"
#include "sky.h"
#include "forestCM.h"
#include "soundB.h"
#include "sound.h"
#include "LavaLose.h"
#include "forestClearing.h"
#include "forestClearingNoStone.h"
#include "forestClearingCM.h"
#include "PoopHit.h"
#include "gotLeaf.h"
#include "gotFire.h"
#include "caveMusic.h"
#include "volcanoSong.h"

#define lavaRocksLen 12
#define poopsLen 10

// Variables
int hOff;
int vOff;
int skyShift;

int hasFireStone;
int hasWaterStone;
int hasLeafStone;

int wait;

int infoScreen;

int loopCount;
int poopCount;
int numPoops;

int currEeveeFrame;
int currPokeFrame;
int eeveeTimer;

int cheat;

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
    FIRESTONEROOM,
    LEAFSTONECLEARING
};
enum {
    SLEEPINGEEVEEROW = 57,
    SLEEPINGEEVEECOL = 108,
    STANDINGSLEEPYEEVEEROW = 59,
    STANDINGSLEEPYEEVEECOL = 158,
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
    LAVAROCKSWIDTH = 16,
    LAVAROCKSHEIGHT = 16,
    HOTDOORROW = 382,
    HOTDOORCOL = 60,
    HOTDOORWIDTH = 3,
    HOTDOORHEIGHT = 17,
    WATERSTONECOL = 496,
    WATERSTONEROW = 224,
    WATERSTONEWIDTH = 16,
    WATERSTONEHEIGHT = 16,
    WATERSTONEENABLED = 2,
    FORESTDOORCOL = 449,
    FORESTDOORROW = 382,
    FORESTDOORWIDTH = 3,
    FORESTDOORHEIGHT = 19,
    LEAFSTONECOL = 80,
    LEAFSTONEROW = 107,
    LEAFSTONEWIDTH = 21,
    LEAFSTONEHEIGHT = 23,
    FORESTCLEARINGHEIGHT = 160,
    FORESTCLEARINGWIDTH = 240
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
ANISPRITE togekiss;

ANISPRITE lavaRocks[lavaRocksLen];
ANISPRITE poops[poopsLen];

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

    cheat = 0;
    // Set up the sprites
    initNonPlayers();
    initSprites();
    initPlayer();
}

// Updates the game each frame
int updateGame() {
    wait = (wait == 0) ? 1 : 0;
    updateStage();
    updateNonPlayers();
	updatePlayer();
    return (hasFireStone && hasLeafStone);
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
            skyShift -= (wait == 0) ? 1 : 0;
            if (BUTTON_HELD(BUTTON_B)) {
                player.worldCol -= player.cdel;
                if (player.worldCol - 100 > 0) {
                    hOff -= (hOff - scroll >= 0) ? scroll : 0;
                }
                
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (collisionCheck(collisionMap, mapWidth, 
            player.worldCol, player.worldRow, 
            player.width, player.height, 
            player.cdel, 0)) {
                    
            player.worldCol += player.cdel;
			hOff += ((hOff + scroll + SCREENWIDTH - 1) < mapWidth) ? scroll : 0;
            skyShift += (wait == 0) ? 1 : 0;
            if (BUTTON_HELD(BUTTON_B)) {
                player.worldCol += player.cdel;
                if (player.worldCol + player.width + 100 > mapWidth) {
                    hOff += ((hOff + scroll + SCREENWIDTH - 1) < mapWidth) ? scroll : 0;
                }
            }
        }
    }
    // if (stage == OCEAN) {
    //     // move ocean every frame by 1 pixel until end of screen
    //     if ((hOff + scroll + SCREENWIDTH - 1) < mapWidth) {
    //         hOff = (hOff + 1) % OCEANWIDTH;    
    //         loopCount += (hOff == 0) ? 1 : 0;     
    //         player.worldCol += player.cdel;
    //     } else {
    //        if (BUTTON_HELD(BUTTON_LEFT)) {
    //            player.worldCol -= player.cdel;
    //        } 
    //     }
    // }
    REG_BG1HOFF = skyShift;
    if (stage == FOREST  && BUTTON_PRESSED(BUTTON_B)) {
        cheat = 1;
    }
    animatePlayer();
}

void updateStage() {
	// change stage, world variables, background vars to specified stage
	switch (stage) {
		case OUTSIDE:
		    if (player.worldRow == EEVEEDOORROW && player.worldCol == EEVEEDOORCOL) { 
                // move into house
                returnToHouse();
            } else if (collision(player.worldCol, player.worldRow, player.width, player.height, 
                HOTDOORCOL, HOTDOORROW, HOTDOORWIDTH, HOTDOORHEIGHT)) {
                playSoundA(volcanoSong_data, volcanoSong_length, 1);
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
            } 
            // else if (collision(player.worldCol, player.worldRow, player.width, player.height, 
            //     OCEANDOORCOL, OCEANDOORROW, OCEANDOORWIDTH, OCEANDOORHEIGHT)) {
            //     scroll = SCROLLING;
            //     collisionMap = (unsigned char *) oceanCMBitmap;
            //     mapHeight = OCEANHEIGHT;
            //     mapWidth = OCEANWIDTH;
            //     stage = OCEAN;

            //     waitForVBlank();
            //     setStage();
            //     vOff = 0;
            //     hOff = 0;
            //     player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
            //     player.worldCol = 10;
                
            //     REG_BG0VOFF = vOff;
            //     REG_BG0HOFF = hOff;
            //     initNonPlayers();
            //     playSoundB(soundB_data, soundB_length, 0);
            // } 
            else if (collision(player.worldCol, player.worldRow, player.width, player.height,
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
                player.worldCol = 50;
                
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
            if (wait == 1) {
                for (int i = 0; i < 16; i++) {
                    PALETTE[i] = (PALETTE[i] + 1) % 256;
                }
            }
            
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
                          FIRESTONECAVEDOORCOL, FIRESTONECAVEDOORROW, FIRESTONECAVEDOORWIDTH, FIRESTONECAVEDOORHEIGHT)) {
                playSoundA(caveMusic_data, caveMusic_length, 1);
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
                setLavaHitBackground();
                returnToHouse();
            }

            for (int i = 0; i < lavaRocksLen; i++) {
                if (collision(player.worldCol, player.worldRow, player.width, player.height,
                    lavaRocks[i].worldCol, lavaRocks[i].worldRow, lavaRocks[i].width, lavaRocks[i].height)) {                
                    setLavaHitBackground();
                    while (--infoScreen > 0) {
                        waitForVBlank();
                    }
                    returnToHouse();
                }
                playSoundB(soundB_data, soundB_length, 0);
            }
			break;
        case FIRESTONEROOM:
            if (collision(FIRESTONECOL, FIRESTONEROW, FIRESTONEWIDTH, FIRESTONEHEIGHT,
            player.worldCol, player.worldRow, player.width, player.height)) {
                if (!hasFireStone) {
                        hasFireStone = 1;
                        setObtainedFlareonBackground();
                }
                returnToHouse();
                playSoundB(soundB_data, soundB_length, 0);
            }
            break;
        // case OCEAN:
        //     if (collision(player.worldCol, player.worldRow, player.width, player.height,
        //         WATERSTONECOL, WATERSTONEROW, WATERSTONEWIDTH, WATERSTONEHEIGHT)) {
        //             if (!hasWaterStone) {
        //                 hasWaterStone = 1;
        //             }
        //             returnToOutside();
        //             playSoundB(soundB_data, soundB_length, 0);
        //     }
        //     break;
        case FOREST:
            for (int i = 0; i < poopsLen; i++) {
                    if (poops[i].worldRow > player.worldRow) {
                        if (cheat) {
                            if (collision(player.worldCol, player.worldRow - 5, player.width, player.height,
                            poops[i].worldCol, poops[i].worldRow, poops[i].width, poops[i].height)) {
                                poops[i].worldRow = SCREENHEIGHT * 2;
                            }
                        } 
                        if (collision(player.worldCol, player.worldRow, player.width, player.height,
                            poops[i].worldCol, poops[i].worldRow, poops[i].width, poops[i].height)) {
                                setPoopHitBackground();
                                returnToHouse();                            
                        }
                    }
                } 

            if (player.worldCol == mapWidth - player.width - 5) {
                // if (!hasLeafStone) {
                //     hasLeafStone = 1; 
                // }
                // returnToHouse();
                // playSoundB(soundB_data, soundB_length, 0); 
                playSoundA(caveMusic_data, caveMusic_length, 1);               
                scroll = STATIC;
                collisionMap = (unsigned char *) forestClearingCMBitmap;
                mapHeight = 160;
                mapWidth = 240;
                stage = LEAFSTONECLEARING;

                waitForVBlank();
                setStage();
                vOff = 0;
                hOff = 0;
                player.worldCol = 152;
                player.worldRow = 143;

                REG_BG0VOFF = vOff;
                REG_BG0HOFF = hOff;
                initNonPlayers();
                playSoundB(soundB_data, soundB_length, 0);
                
            }
            break;
        case LEAFSTONECLEARING:
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
            LEAFSTONECOL, LEAFSTONEROW, LEAFSTONEWIDTH, LEAFSTONEHEIGHT)) {
                if (!hasLeafStone) {
                    hasLeafStone = 1;
                    setObtainedLeafeonBackground();
                }
                returnToHouse();
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

void setLavaHitBackground() {
    infoScreen = 500;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    scroll = STATIC;
    mapHeight = 160;
    mapWidth = 240;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, LavaLosePal, PALETTE, 256);
    DMANow(3, LavaLoseTiles, &CHARBLOCK[0], LavaLoseTilesLen / 2);
    DMANow(3, LavaLoseMap, &SCREENBLOCK[30], LavaLoseMapLen / 2);                
    while (--infoScreen > 0) {
        waitForVBlank();
    } 
}

void setObtainedFlareonBackground() {
    infoScreen = 500;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    scroll = STATIC;
    mapHeight = 160;
    mapWidth = 240;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, gotFirePal, PALETTE, 256);
    DMANow(3, gotFireTiles, &CHARBLOCK[0], gotFireTilesLen / 2);
    DMANow(3, gotFireMap, &SCREENBLOCK[30], gotFireMapLen / 2);                
    while (--infoScreen > 0) {
        waitForVBlank();
    } 
}

void setPoopHitBackground() {
    infoScreen = 500;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    scroll = STATIC;
    mapHeight = 160;
    mapWidth = 240;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, PoopHitPal, PALETTE, 256);
    DMANow(3, PoopHitTiles, &CHARBLOCK[0], PoopHitTilesLen / 2);
    DMANow(3, PoopHitMap, &SCREENBLOCK[30], PoopHitMapLen / 2);                
    while (--infoScreen > 0) {
        waitForVBlank();
    } 
}

void setObtainedLeafeonBackground() {
    infoScreen = 500;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    scroll = STATIC;
    mapHeight = 160;
    mapWidth = 240;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, gotLeafPal, PALETTE, 256);
    DMANow(3, gotLeafTiles, &CHARBLOCK[0], gotLeafTilesLen / 2);
    DMANow(3, gotLeafMap, &SCREENBLOCK[30], gotLeafMapLen / 2);                
    while (--infoScreen > 0) {
        waitForVBlank();
    } 
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
    // REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20);
    // REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    DMANow(3, forestForegroundPal, PALETTE, 256);
    DMANow(3, forestForegroundTiles, &CHARBLOCK[0], forestForegroundTilesLen / 2);
    DMANow(3, forestForegroundMap, &SCREENBLOCK[20], forestForegroundMapLen / 2);
    DMANow(3, skyTiles, &CHARBLOCK[1], skyTilesLen / 2);
    DMANow(3, skyMap, &SCREENBLOCK[30], skyMapLen / 2);
    // DMANow(3, forestNoStonePal, PALETTE, 256);
    // DMANow(3, forestNoStoneTiles, &CHARBLOCK[0], forestTilesLen / 2);
    // DMANow(3, forestNoStoneMap, &SCREENBLOCK[24], forestMapLen / 2);
}

void setLeafStoneClearingBackground() {
    if (hasLeafStone) {        
        DMANow(3, forestClearingNoStonePal, PALETTE, 256);
        DMANow(3, forestClearingNoStoneTiles, &CHARBLOCK[0], forestClearingTilesLen / 2);
        DMANow(3, forestClearingNoStoneMap, &SCREENBLOCK[28], forestClearingMapLen / 2);
    } else {        
        DMANow(3, forestClearingPal, PALETTE, 256);
        DMANow(3, forestClearingTiles, &CHARBLOCK[0], forestClearingTilesLen / 2);
        DMANow(3, forestClearingMap, &SCREENBLOCK[28], forestClearingMapLen / 2);
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
            REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
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
        // case OCEAN:
        //     REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24);
        //     REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        //     scroll = SCROLLING;
        //     mapWidth = OCEANWIDTH;
	    //     mapHeight = OCEANHEIGHT;
            
        //     waitForVBlank();
        //     setOceanBackground();
        //     break;
        case FOREST:            
            REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20);
            REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
            REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
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
        case LEAFSTONECLEARING:
            REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
            REG_DISPCTL = MODE0 | BG0_ENABLE |SPRITE_ENABLE;

            scroll = STATIC;
            mapWidth = FORESTCLEARINGWIDTH;
	        mapHeight = FORESTCLEARINGHEIGHT;

            waitForVBlank();
            setLeafStoneClearingBackground();
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
            for (int i = 0; i < lavaRocksLen; i++) {
                lavaRocks[i].width = 16;
                lavaRocks[i].height = 16;
                lavaRocks[i].rdel = (i % 2 == 0) ? 2 : 3;
                lavaRocks[i].cdel = 0;
                lavaRocks[i].worldCol = (i % 2 == 0) ? rand() % 228 : (rand() % (240 - LAVAROCKSWIDTH)) + 265;
                lavaRocks[i].worldRow = rand() % (mapHeight - LAVAROCKSWIDTH);
            }
            break;
        case FOREST:          
            for (int i = 0; i < poopsLen; i++) {
                poops[i].width = 8;
                poops[i].height = 8;
                poops[i].rdel = (i % 2 == 0) ? 2 : 2;
                poops[i].cdel = 0;
                poops[i].worldCol = player.worldCol + 20;
                poops[i].worldRow = SCREENHEIGHT + 1;
                poops[i].hide = 1;
            }
            togekiss.width = 27;
            togekiss.height = 23;
            togekiss.worldCol = 0;
            togekiss.worldRow = 0;
            break;
    }
}

void updateNonPlayers() {
    switch (stage) {
        case VOLCANO:
            for (int i = 0; i < lavaRocksLen; i++) {
                lavaRocks[i].worldRow = (lavaRocks[i].worldRow + lavaRocks[i].rdel) % (mapHeight - LAVAROCKSHEIGHT);
            }
        break;
        case FOREST:
            poopCount = (poopCount + 1) % 30;
            for (int i = 0; i < poopsLen; i++) {
                if (poops[i].worldRow <= SCREENHEIGHT) {
                    poops[i].worldRow += poops[i].rdel;
                }
                
            }
            if (poopCount == 0) {
                for (int i = 0; i < poopsLen && poopCount == 0; i++) {
                    if (poops[i].worldRow > SCREENHEIGHT) {
                        poops[i].worldRow = 10;
                        poops[i].worldCol = player.worldCol + 20 + (rand() % togekiss.width);
                        poopCount += 1;
                    }
                }
            }
        break;
    }
}

void drawNonPlayers() {
    switch (stage) {
        case OUTSIDE:
            break;
        case HOUSE:
            eeveeTimer = (eeveeTimer + 1) % 30;
            currEeveeFrame = (eeveeTimer == 0) ? (currEeveeFrame + 1) % 3 : currEeveeFrame;
            if (hasFireStone) {
                shadowOAM[1].attr0 = (ROWMASK &(SLEEPINGEEVEEROW - vOff)) | ATTR0_SQUARE;
                shadowOAM[1].attr1 = (COLMASK &(SLEEPINGEEVEECOL - hOff)) | ATTR1_MEDIUM;
                shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, (currEeveeFrame * 4));
            } else {
                shadowOAM[1].attr0 = (ROWMASK &(SLEEPINGEEVEEROW - vOff)) | ATTR0_SQUARE;
                shadowOAM[1].attr1 = (COLMASK &(SLEEPINGEEVEECOL - hOff)) | ATTR1_MEDIUM;
                shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, (currEeveeFrame * 4));
            }
            if (hasLeafStone) {
                shadowOAM[2].attr0 = (ROWMASK &(STANDINGSLEEPYEEVEEROW - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK &(STANDINGSLEEPYEEVEECOL - hOff)) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, (currEeveeFrame * 4));  
            } else {            
                shadowOAM[3].attr0 = (ROWMASK &(STANDINGSLEEPYEEVEEROW - vOff)) | ATTR0_SQUARE;
                shadowOAM[3].attr1 = (COLMASK &(STANDINGSLEEPYEEVEECOL - hOff)) | ATTR1_MEDIUM;
                shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, (currEeveeFrame * 4));  
            }
            break;
        case VOLCANO:
            for (int i = 1; i < lavaRocksLen + 1; i++) {
                // if (row + height - vOff >= 0 and row - vOff <= SCREENHEIGHT) and
                // (col + width - hOff >= 0 and col - hOff <= SCREENWIDTH)
                if ((lavaRocks[i - 1].worldRow + lavaRocks[i - 1].height - vOff >= 0 && lavaRocks[i - 1].worldRow - vOff <= SCREENHEIGHT) && 
                    (lavaRocks[i - 1].worldCol + lavaRocks[i - 1].width - hOff >= 0 && lavaRocks[i - 1].worldCol - hOff <= SCREENWIDTH)) {
                    shadowOAM[i].attr0 = (ROWMASK &(lavaRocks[i - 1].worldRow - vOff)) | ATTR0_SQUARE;
                    shadowOAM[i].attr1 = (COLMASK &(lavaRocks[i - 1].worldCol - hOff)) | ATTR1_SMALL; 
                    shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 6);
                } else {
                    shadowOAM[i].attr0 |= ATTR0_HIDE;            
                }   
            }
            break;
        case FOREST:
                eeveeTimer = (eeveeTimer + 1) % 30;
                currEeveeFrame = (eeveeTimer == 0) ? (currEeveeFrame + 1) % 3 : currEeveeFrame;
                for (int i = 1; i < poopsLen + 1; i++) {
                    // if (row + height - vOff >= 0 and row - vOff <= SCREENHEIGHT) and
                    // (col + width - hOff >= 0 and col - hOff <= SCREENWIDTH)
                    if ((poops[i - 1].worldRow + poops[i - 1].height - vOff >= 0 && poops[i - 1].worldRow - vOff <= SCREENHEIGHT) && 
                        (poops[i - 1].worldCol + poops[i - 1].width - hOff >= 0 && poops[i - 1].worldCol - hOff <= SCREENWIDTH) && poops[i - 1].worldRow < SCREENHEIGHT) {
                        shadowOAM[i].attr0 = (ROWMASK &(poops[i - 1].worldRow - vOff)) | ATTR0_SQUARE;
                        shadowOAM[i].attr1 = (COLMASK &(poops[i - 1].worldCol - hOff)) | ATTR1_TINY; 
                        shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 8);
                    } else {
                        shadowOAM[i].attr0 |= ATTR0_HIDE;            
                    }   
                }
                shadowOAM[poopsLen + 2].attr0 = (ROWMASK &(10 - vOff)) | ATTR0_SQUARE;
                shadowOAM[poopsLen + 2].attr1 = (COLMASK &(player.worldCol - hOff)) | ATTR1_MEDIUM;
                if (BUTTON_HELD(BUTTON_LEFT)) {
                    shadowOAM[poopsLen + 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, (currEeveeFrame * 4)); 
                } else {
                    shadowOAM[poopsLen + 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, (currEeveeFrame * 4)); 
                }
                
                if (cheat) {
                    shadowOAM[poopsLen + 3].attr0 = (ROWMASK &(player.worldRow - 5 - vOff)) | ATTR0_SQUARE;
                    shadowOAM[poopsLen + 3].attr1 = (COLMASK &(player.worldCol - hOff)) | ATTR1_SMALL;
                    shadowOAM[poopsLen + 3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 10);                    
                }

            break;
    }
}

void returnToHouse() {                
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
}
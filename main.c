// FOR DETAILED GAME UPDATE, CHECK README!

#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "start.h"
#include "instructions.h"
#include "win.h"
#include "pause.h"
#include "game.h"
#include "house.h"
#include "outside.h"
#include "spritesheet.h"
#include "gameSong.h"
#include "sound.h"


// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToGame();
void game();
void goToInstructions();
void instructions();
void goToPause();
void pause();
void goToWin();
void win();

int seed;

// States.
enum {
    START,
    GAME,
    INSTRUCTIONS,
    PAUSE,
    WIN
};

int state;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    
    setupSounds();
    setupInterrupts();
    
    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state.
void goToStart() {
    playSoundA(gameSong_data, gameSong_length, 1);

    state = START;
    REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, startPal, PALETTE, 256);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);
}

// Runs every frame of the start state.
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    } else {
        seed++;
    }
}

// Sets up the game state.
void goToInstructions() {
    state = INSTRUCTIONS;

    REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, instructionsPal, PALETTE, 256);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);
}

// Runs every frame of the game state.
void instructions() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// Sets up the game state.
void goToGame() {
    state = GAME;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    showGame();
}

// Runs every frame of the game state.
void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } else {
        if (updateGame() == 1) {
            goToWin();
        } else {
            drawGame();
        }
        
    }
}

// Sets up the pause state.
void goToPause() {
    state = PAUSE;

    REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_B)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the win state.
void goToWin() {
    state = WIN;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    waitForVBlank();
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_B) || BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }   
}
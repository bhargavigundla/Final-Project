#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "start.h"
#include "instructions.h"
#include "win.h"
#include "pause.h"
#include "game.h"

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

// States.
enum {
    START,
    GAME,
    INSTRUCTIONS,
    PAUSE,
    WIN
};

enum {
    OUTSIDE,
    HOUSE,
    VOLCANO,
    OCEAN,
    FOREST
};

int state;
int stage;

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
    // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state.
void goToStart() {
    state = START;
    waitForVBlank();
    DMANow(3, startPal, PALETTE, 256);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);
}

// Runs every frame of the start state.
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

// Sets up the game state.
void goToInstructions() {
    state = INSTRUCTIONS;
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
    waitForVBlank();
    DMANow(3, gamePal, PALETTE, 256);
    DMANow(3, gameTiles, &CHARBLOCK[0], gameTilesLen / 2);
    DMANow(3, gameMap, &SCREENBLOCK[28], gameMapLen / 2);
}

// Runs every frame of the game state.
void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } else {
        switch (stage) {
            case OUTSIDE:
                break;
            case HOUSE:
                break;
            case VOLCANO:
                break;
            case OCEAN:
                break;
            case FOREST:
                break;
        }
    }

}

// Sets up the pause state.
void goToPause() {
    state = PAUSE;
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
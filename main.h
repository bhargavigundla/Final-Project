#ifndef MAIN_H
#define MAIN_H
// States.
enum {
    START,
    GAME,
    INSTRUCTIONS,
    PAUSE,
    WIN,
    IDLE
};

int state;

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
void goToIdle();
void idle();

void enableTimerInterrupts(void);






#endif
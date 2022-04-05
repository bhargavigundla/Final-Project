#ifndef GAME_H
#define GAME_H

#include "mode0.h"
#include "outsideCM.h"

// Constants
int mapHeight;
int mapWidth;

// Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE player;

// Player animation states for aniState
enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

unsigned char* collisionMap;

// Prototypes
void play();
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void updateStage();
void showGame();
void setOutsideBackground(); 
void setHouseBackground();
void setVolcanoBackground();
void initSprites();
void setStage();

void returnToOutside();

// Collision function prototypes
int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, 
        int colShift, int rowShift);

#endif
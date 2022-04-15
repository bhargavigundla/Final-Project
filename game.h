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
int updateGame();
void drawGame();
void initPlayer();
void initNonPlayers();
void updatePlayer();
void updateNonPlayers();
void animatePlayer();
void drawPlayer();
void drawNonPlayers();
void updateStage();
void showGame();
void setOutsideBackground(); 
void setHouseBackground();
void setVolcanoBackground();
void setOceanBackground();
void setForestBackground();
void initSprites();
void setStage();

void returnToOutside();
void initNonPlayerSprites();
void clearSprites();

// Collision function prototypes
int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, 
        int colShift, int rowShift);


#endif
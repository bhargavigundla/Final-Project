# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 83 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 152 "mode0.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} SPRITE;
# 190 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 238 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 5 "game.h" 2
# 1 "outsideCM.h" 1
# 20 "outsideCM.h"
extern const unsigned short outsideCMBitmap[131072];
# 6 "game.h" 2


int mapHeight;
int mapWidth;


extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE player;


enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

unsigned char* collisionMap;


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

void initSprites();
void setStage();


int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height,
        int colShift, int rowShift);
# 2 "game.c" 2
# 1 "house.h" 1
# 22 "house.h"
extern const unsigned short houseTiles[44928];


extern const unsigned short houseMap[4096];


extern const unsigned short housePal[256];
# 3 "game.c" 2
# 1 "houseCM.h" 1
# 20 "houseCM.h"
extern const unsigned short houseCMBitmap[131072];
# 4 "game.c" 2

# 1 "outside.h" 1
# 22 "outside.h"
extern const unsigned short outsideTiles[26592];


extern const unsigned short outsideMap[4096];


extern const unsigned short outsidePal[256];
# 6 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "game.c" 2



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




unsigned char* collisionMap = (unsigned char *) outsideCMBitmap;


void initGame() {
 waitForVBlank();
    setOutsideBackground();


    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;

 vOff = 137;
 hOff = 83;


    initSprites();



    initPlayer();
}


void updateGame() {
    updateStage();
 updatePlayer();
}


void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void initPlayer() {

    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;


    player.worldRow = 160 / 2 - player.width / 2 + vOff;
    player.worldCol = 240 / 2 - player.height / 2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERFRONT;
}



void updatePlayer() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        if (collisionCheck(collisionMap, mapWidth,
            player.worldCol, player.worldRow,
            player.width, player.height,
            0, -player.rdel)) {
            player.worldRow -= player.rdel;
   vOff --;
        }
    }
 if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        if (collisionCheck(collisionMap, mapWidth,
                player.worldCol, player.worldRow,
                player.width, player.height,
                0, player.rdel)) {
            player.worldRow += player.rdel;
   vOff ++;
        }

    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (collisionCheck(collisionMap, mapWidth,
            player.worldCol, player.worldRow,
            player.width, player.height,
            -player.cdel, 0)) {

            player.worldCol -= player.cdel;
   hOff --;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
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

 switch (stage) {
  case OUTSIDE:
      if (player.worldRow == EEVEEDOORROW && player.worldCol == EEVEEDOORCOL) {
                collisionMap = (unsigned char *) houseCMBitmap;
                vOff = 137;
                hOff = 275;
                stage = HOUSE;
                player.worldCol = 114;
                player.worldRow = 114;
                setStage();
            }
   break;
  case HOUSE:
   break;
  case VOLCANO:
   break;
 }
}


void animatePlayer() {


    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;


    if(player.aniCounter % 15 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))))
        player.aniState = PLAYERBACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))))
        player.aniState = PLAYERFRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))))
        player.aniState = PLAYERLEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))))
        player.aniState = PLAYERRIGHT;


    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}


void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2 << 8);
    } else {

        shadowOAM[0].attr0 = (0xFF &(player.worldRow - vOff)) | (0 << 14);
        shadowOAM[0].attr1 = (0x1FF &(player.worldCol - hOff)) | (1 << 14);
        shadowOAM[0].attr2 = ((0) << 12) | ((player.curFrame * 2)*32 + (player.aniState * 2));
    }
}

int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, int colShift, int rowShift) {
    int smallestSoFar = 256;
    int current;


    current = collisionMap[((row + rowShift) * (mapWidth) + (col + colShift))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + rowShift) * (mapWidth) + (col + colShift + width - 1))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + rowShift + height - 1) * (mapWidth) + (col + colShift))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + rowShift + height - 1) * (mapWidth) + (col + colShift + width - 1))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }

    return smallestSoFar;
}

void setOutsideBackground() {
    DMANow(3, outsidePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, outsideTiles, &((charblock *)0x6000000)[0], 53184 / 2);
    DMANow(3, outsideMap, &((screenblock *)0x6000000)[28], 8192 / 2);
}

void setHouseBackground() {
    DMANow(3, housePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, houseTiles, &((charblock *)0x6000000)[0], 89856 / 2);
    DMANow(3, houseMap, &((screenblock *)0x6000000)[28], 8192 / 2);
}

void showGame() {

    setStage();


    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;

    initSprites();
}

void setStage() {
    switch (stage) {
        case (OUTSIDE):
            (*(volatile unsigned short *)0x4000008) = (1 << 7) | (3 << 14) | ((0) << 2) | ((28) << 8);
            mapWidth = OUTSIDEWIDTH;
         mapWidth = OUTSIDEHEIGHT;

            waitForVBlank();
            setOutsideBackground();
            break;
        case (HOUSE):
            (*(volatile unsigned short *)0x4000008) = (1 << 7) | (3 << 14) | ((0) << 2) | ((28) << 8);
            mapWidth = HOUSEWIDTH;
         mapWidth = HOUSEHEIGHT;

            waitForVBlank();
            setHouseBackground();
            break;
    }
}

void initSprites() {

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
}

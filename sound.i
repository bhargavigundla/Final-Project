# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 85 "mode0.h"
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
# 157 "mode0.h"
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
} ANISPRITE;
# 198 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 209 "mode0.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 249 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 285 "mode0.h"
typedef void (*ihp)(void);
# 305 "mode0.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "sound.c" 2
# 1 "sound.h" 1
int time_s;

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void enableTimerInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 52 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "sound.c" 2
# 1 "game.h" 1




# 1 "outsideCM.h" 1
# 20 "outsideCM.h"
extern const unsigned short outsideCMBitmap[131072];
# 6 "game.h" 2


int mapHeight;
int mapWidth;


extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;


enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

unsigned char* collisionMap;


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
void setFireCaveBackground();
void setOceanBackground();
void setForestBackground();
void initSprites();
void setStage();

void returnToOutside();
void initNonPlayerSprites();
void clearSprites();


int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height,
        int colShift, int rowShift);
# 4 "sound.c" 2
# 1 "main.h" 1



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
# 5 "sound.c" 2

int time_s;

void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
    dma[1].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000102 = 0;

    *(volatile unsigned short*)0x4000100 = -ticks;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = sound;
    soundA.length = length;
    soundA.loops = loops;
    soundA.isPlaying = 1;
    soundA.duration = ((59.727) * length) / 11025;
    soundA.vBlankCount = 0;
}


void playSoundB( const signed char* sound, int length, int loops) {

    dma[2].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000106 = 0;

    *(volatile unsigned short*)0x4000104 = -ticks;
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = sound;
    soundB.length = length;
    soundB.loops = loops;
    soundB.isPlaying = 1;
    soundB.duration = ((59.727) * length) / 11025;
    soundB.vBlankCount = 0;
}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;

    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;

    *((ihp*)0x03007FFC) = interruptHandler;
    enableTimerInterrupts();
 *(unsigned short*)0x4000208 = 1;

}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                }
            }
        }

        if (soundB.isPlaying) {

            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                }
            }
  }


  *(volatile unsigned short*)0x4000202 = 1 << 0;
 } else if (*(volatile unsigned short*)0x4000202 & 1<<4) {
        if (state == START) {
            goToIdle();
        }
  }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;

 *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSound() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}

void enableTimerInterrupts(void) {
    *(unsigned short*)0x4000200 |= 1<<3 | 1<<4;

    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000100 = 65536-16384;
    *(volatile unsigned short*)0x4000102 = 3 | (1<<7);

    *(volatile unsigned short*)0x4000106 = 0;
    *(volatile unsigned short*)0x4000104 = 65536-10;
    *(volatile unsigned short*)0x4000106 = (1<<6) | (1<<2) | (1<<7);
}

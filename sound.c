#include "mode0.h"
#include "sound.h"
#include "game.h"

void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
    dma[1].cnt = 0;

    int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

    DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    REG_TM0CNT = 0;

    REG_TM0D = -ticks;
    REG_TM0CNT = TIMER_ON;

    soundA.data = sound;
    soundA.length = length;
    soundA.loops = loops;
    soundA.isPlaying = 1;
    soundA.duration = (VBLANK_FREQ * length) / SOUND_FREQ;
    soundA.vBlankCount = 0;
}


void playSoundB( const signed char* sound, int length, int loops) {

    dma[2].cnt = 0;

    int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

    DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    REG_TM1CNT = 0;

    REG_TM1D = -ticks;
    REG_TM1CNT = TIMER_ON;

    soundB.data = sound;
    soundB.length = length;
    soundB.loops = loops;
    soundB.isPlaying = 1;
    soundB.duration = (VBLANK_FREQ * length) / SOUND_FREQ;
    soundB.vBlankCount = 0;
}



void setupInterrupts() {

	REG_IME = 0;

    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;

    REG_INTERRUPT = interruptHandler;
    enableTimerInterrupts();

	REG_IME = 1;
}

void enableTimerInterrupts(void) {
  // TODO 2.0: Enable timer interrupts
  REG_IE |= INT_TM2 | INT_TM3;

  // TODO 2.1: Set control register and data register for timer 0 (triggers once per cs)
  REG_TM2CNT = 0;
  REG_TM2D = (65536 - 164);
  REG_TM2CNT = TM_FREQ_1024 |TIMER_ON | TM_IRQ;

  // TODO 2.2: Set control register and data register for timer 1 (triggers once per s)
  REG_TM3CNT = 0;
  REG_TM3D = (65536 - 16384);
  REG_TM3CNT = TM_FREQ_1024 |TIMER_ON | TM_IRQ;
  
}

void interruptHandler() {

	REG_IME = 0;

    if (REG_IF & INT_TM2) {
        cseconds++;
        if (cseconds > 99) cseconds = 0;
    }

    if (REG_IF & INT_TM3) {
        seconds = (seconds + 1) % 60;
    }

	if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
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
                    REG_TM1CNT = TIMER_OFF;
                }
            }
		}
		REG_IF = INT_VBLANK;
	}
    REG_IF = REG_IF;
	REG_IME = 1;
}

void pauseSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
}

void unpauseSound() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

void stopSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}
#include "mode0.h"
#include "sound.h"
#include "game.h"

int time_s;

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

void interruptHandler() {

	REG_IME = 0;

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
	} else if (REG_IF & INT_TM1) {
        time_s++;
        if (time_s > 59) {
            time_s = time_s - 60;
        }
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

void enableTimerInterrupts(void) {
    REG_IE |= INT_TM0 | INT_TM1;

    REG_TM0CNT = 0; // Turn off timer 0
    REG_TM0D = 65536-16384; //a one second timer
    REG_TM0CNT = TM_FREQ_1024 | TIMER_ON;

    REG_TM1CNT = 0; // Turn off timer 1
    REG_TM1D = 65536-10; // 10 secs != 1 minute
    REG_TM1CNT = TM_IRQ | TM_CASCADE | TIMER_ON;
}
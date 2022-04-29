
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 205 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6560 + 2048 = 9120
//
//	Time-stamp: 2022-04-29, 01:06:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 6560
extern const unsigned short pauseTiles[3280];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)

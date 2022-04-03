
//{{BLOCK(start)

//======================================================================
//
//	start, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 690 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 44160 + 2048 = 46720
//
//	Time-stamp: 2022-04-03, 15:52:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 44160
extern const unsigned short startTiles[22080];

#define startMapLen 2048
extern const unsigned short startMap[1024];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)


//{{BLOCK(outside)

//======================================================================
//
//	outside, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 831 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 53184 + 8192 = 61888
//
//	Time-stamp: 2022-04-03, 22:57:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_OUTSIDE_H
#define GRIT_OUTSIDE_H

#define outsideTilesLen 53184
extern const unsigned short outsideTiles[26592];

#define outsideMapLen 8192
extern const unsigned short outsideMap[4096];

#define outsidePalLen 512
extern const unsigned short outsidePal[256];

#endif // GRIT_OUTSIDE_H

//}}BLOCK(outside)

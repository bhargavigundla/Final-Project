
//{{BLOCK(outside)

//======================================================================
//
//	outside, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 788 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 25216 + 8192 = 33920
//
//	Time-stamp: 2022-04-28, 16:35:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_OUTSIDE_H
#define GRIT_OUTSIDE_H

#define outsideTilesLen 25216
extern const unsigned short outsideTiles[12608];

#define outsideMapLen 8192
extern const unsigned short outsideMap[4096];

#define outsidePalLen 512
extern const unsigned short outsidePal[256];

#endif // GRIT_OUTSIDE_H

//}}BLOCK(outside)


//{{BLOCK(forest)

//======================================================================
//
//	forest, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 128 + 4096 = 4736
//
//	Time-stamp: 2022-04-15, 18:35:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FOREST_H
#define GRIT_FOREST_H

#define forestTilesLen 128
extern const unsigned short forestTiles[64];

#define forestMapLen 4096
extern const unsigned short forestMap[2048];

#define forestPalLen 512
extern const unsigned short forestPal[256];

#endif // GRIT_FOREST_H

//}}BLOCK(forest)

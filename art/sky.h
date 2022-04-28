
//{{BLOCK(sky)

//======================================================================
//
//	sky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 128 + 4096 = 4736
//
//	Time-stamp: 2022-04-28, 10:27:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKY_H
#define GRIT_SKY_H

#define skyTilesLen 128
extern const unsigned short skyTiles[64];

#define skyMapLen 4096
extern const unsigned short skyMap[2048];

#define skyPalLen 512
extern const unsigned short skyPal[256];

#endif // GRIT_SKY_H

//}}BLOCK(sky)

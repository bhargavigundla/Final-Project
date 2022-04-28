
//{{BLOCK(sky)

//======================================================================
//
//	sky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 914 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 29248 + 4096 = 33856
//
//	Time-stamp: 2022-04-27, 20:54:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKY_H
#define GRIT_SKY_H

#define skyTilesLen 29248
extern const unsigned short skyTiles[14624];

#define skyMapLen 4096
extern const unsigned short skyMap[2048];

#define skyPalLen 512
extern const unsigned short skyPal[256];

#endif // GRIT_SKY_H

//}}BLOCK(sky)

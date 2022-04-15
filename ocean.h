
//{{BLOCK(ocean)

//======================================================================
//
//	ocean, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 96 + 4096 = 4704
//
//	Time-stamp: 2022-04-15, 17:22:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_OCEAN_H
#define GRIT_OCEAN_H

#define oceanTilesLen 96
extern const unsigned short oceanTiles[48];

#define oceanMapLen 4096
extern const unsigned short oceanMap[2048];

#define oceanPalLen 512
extern const unsigned short oceanPal[256];

#endif // GRIT_OCEAN_H

//}}BLOCK(ocean)

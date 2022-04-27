
//{{BLOCK(house)

//======================================================================
//
//	house, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 421 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 26944 + 2048 = 29504
//
//	Time-stamp: 2022-04-27, 13:57:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 26944
extern const unsigned short houseTiles[13472];

#define houseMapLen 2048
extern const unsigned short houseMap[1024];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)

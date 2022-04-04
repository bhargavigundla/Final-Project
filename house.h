
//{{BLOCK(house)

//======================================================================
//
//	house, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 1404 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 89856 + 8192 = 98560
//
//	Time-stamp: 2022-04-04, 14:26:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 89856
extern const unsigned short houseTiles[44928];

#define houseMapLen 8192
extern const unsigned short houseMap[4096];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)

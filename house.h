
//{{BLOCK(house)

//======================================================================
//
//	house, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 1438 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 92032 + 8192 = 100736
//
//	Time-stamp: 2022-04-03, 18:40:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 92032
extern const unsigned short houseTiles[46016];

#define houseMapLen 8192
extern const unsigned short houseMap[4096];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)

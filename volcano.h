
//{{BLOCK(volcano)

//======================================================================
//
//	volcano, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 192 + 2048 = 2752
//
//	Time-stamp: 2022-04-05, 16:48:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_VOLCANO_H
#define GRIT_VOLCANO_H

#define volcanoTilesLen 192
extern const unsigned short volcanoTiles[96];

#define volcanoMapLen 2048
extern const unsigned short volcanoMap[1024];

#define volcanoPalLen 512
extern const unsigned short volcanoPal[256];

#endif // GRIT_VOLCANO_H

//}}BLOCK(volcano)

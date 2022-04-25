
//{{BLOCK(volcano)

//======================================================================
//
//	volcano, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 366 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 11712 + 8192 = 20416
//
//	Time-stamp: 2022-04-22, 13:01:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_VOLCANO_H
#define GRIT_VOLCANO_H

#define volcanoTilesLen 11712
extern const unsigned short volcanoTiles[5856];

#define volcanoMapLen 8192
extern const unsigned short volcanoMap[4096];

#define volcanoPalLen 512
extern const unsigned short volcanoPal[256];

#endif // GRIT_VOLCANO_H

//}}BLOCK(volcano)

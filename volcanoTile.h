
//{{BLOCK(volcanoTile)

//======================================================================
//
//	volcanoTile, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 5 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 160 + 8192 = 8864
//
//	Time-stamp: 2022-04-15, 11:55:31
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_VOLCANOTILE_H
#define GRIT_VOLCANOTILE_H

#define volcanoTileTilesLen 160
extern const unsigned short volcanoTileTiles[80];

#define volcanoTileMapLen 8192
extern const unsigned short volcanoTileMap[4096];

#define volcanoTilePalLen 512
extern const unsigned short volcanoTilePal[256];

#endif // GRIT_VOLCANOTILE_H

//}}BLOCK(volcanoTile)


//{{BLOCK(game)

//======================================================================
//
//	game, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 231 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14784 + 2048 = 17344
//
//	Time-stamp: 2022-04-03, 16:25:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME_H
#define GRIT_GAME_H

#define gameTilesLen 14784
extern const unsigned short gameTiles[7392];

#define gameMapLen 2048
extern const unsigned short gameMap[1024];

#define gamePalLen 512
extern const unsigned short gamePal[256];

#endif // GRIT_GAME_H

//}}BLOCK(game)

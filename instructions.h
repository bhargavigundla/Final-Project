
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 393 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12576 + 2048 = 15136
//
//	Time-stamp: 2022-04-29, 01:27:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 12576
extern const unsigned short instructionsTiles[6288];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)

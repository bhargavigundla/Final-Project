
//{{BLOCK(volcanoNoStone)

//======================================================================
//
//	volcanoNoStone, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 5 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 160 + 8192 = 8864
//
//	Time-stamp: 2022-04-15, 15:26:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

const unsigned short volcanoNoStoneTiles[80] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x2111,0x2211,0x2211,0x2112,0x2211,0x1122,0x2222,0x1233,
	0x3322,0x1333,0x3322,0x3333,0x3322,0x2213,0x3221,0x1111,
	0x1122,0x1222,0x1111,0x1121,0x1111,0x1111,0x2111,0x1123,
	0x3211,0x2233,0x3331,0x2333,0x3312,0x1113,0x3221,0x1111,
	0x2211,0x1112,0x2211,0x3311,0x2222,0x2332,0x3222,0x3323,
	0x3311,0x1113,0x3331,0x1122,0x2332,0x1122,0x2211,0x2112,

	0x1223,0x1111,0x2133,0x1112,0x2312,0x1123,0x3331,0x1233,
	0x3331,0x1223,0x3221,0x1122,0x1211,0x1221,0x1112,0x1221,
};

const unsigned short volcanoNoStoneMap[4096] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0000,0x0000,0x0000,0x0000,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,0x0001,0x0002,
	0x0001,0x0002,0x0001,0x0002,0x0000,0x0000,0x0000,0x0000,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,0x0003,0x0004,
	0x0003,0x0004,0x0003,0x0004,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short volcanoNoStonePal[256] __attribute__((aligned(4)))=
{
	0x0000,0x086F,0x0CB3,0x1D16,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//}}BLOCK(volcanoNoStone)

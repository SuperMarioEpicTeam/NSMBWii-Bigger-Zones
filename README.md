# NSMBWii-Bigger-Zones
"Bigger Zones" is a Kamek code pack allowing you to place more tiles within one really big zone.
In the original game, placing tiles (even a very few) in a big zone triggers tile-allocation-related errors.
This patch is about fixing this game behaviour.

# Requirements: 

- Knowledge about how to compile a Kamek patch (refer to : https://horizon.miraheze.org/wiki/Setting_Up_and_Compiling_the_Newer_Sources)
(This code patch was untested on CodeWarrior-based Kamek packs only!!)

# Installation:
- Install "zone.yaml" in your "Kamek" folder
- Install "zone.S" in your "Kamek/src" folder
- Add the following symbols in your "kamek_pal.x": 

	ContinueFromSomeTileGodFix = 0x800778c8;

	HardcodedEmptyTile_Return = 0x800776c8;

	ContinueFromHardcodedEmptyTile = 0x800776bc;

	getBlockIDforPosition__12TilemapClassFiib = 0x80083f90;

	CreateBgBuffer__12TilemapClassFi = 0x800837d0;

	DoneWithInitializeNextIDto1 = 0x800837c4;

	getBgUnit = 0x80081850;

- Enjoy ^^

If you meet any sort dysfunctionment or missing explanation, please let us know.

# Credits:
- RoadrunnerWMC for the original idea (reference: 
- CLF78 for giving Walid further explanations about RoadrunnerWMC's robust patch idea
- Walid, for writing the patch.

require "Foraging/forageDefinitions";

local Rubber = {};
Rubber.type = "DP.Rubber";
Rubber.snowChance = -50;
Rubber.xp = 2;
Rubber.categories = { "Stones" };
Rubber.zones = {
	Forest      = 5,
	DeepForest  = 5,
	Vegitation  = 5,
	FarmLand    = 5,
	Farm        = 5,
	TrailerPark = 5,
	TownZone    = 5,
	Nav         = 5,
};
table.insert(forageDefs, Rubber);
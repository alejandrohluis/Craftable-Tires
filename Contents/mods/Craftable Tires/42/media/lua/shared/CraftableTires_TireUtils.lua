-----------------------------
--- Craftable Tires Utils ---
-----------------------------

CraftableTires = CraftableTires or {}

-- [ "texture" ] = tires in texture
CraftableTires.TireTiles = {
    -- one tire
    [ "location_business_machinery_01_48" ] = 1 ,
    [ "location_business_machinery_01_49" ] = 1 ,
    -- two tires
    [ "location_business_machinery_01_40" ] = 2 ,
    [ "location_business_machinery_01_41" ] = 2 ,
    [ "location_business_machinery_01_50" ] = 2 ,
    -- three tires
    [ "location_business_machinery_01_42" ] = 3 ,
    [ "location_business_machinery_01_43" ] = 3 ,
    [ "location_business_machinery_01_51" ] = 3 ,
    -- four tires
    [ "location_business_machinery_01_44" ] = 4 ,
    [ "location_business_machinery_01_45" ] = 4 ,
    [ "location_business_machinery_01_52" ] = 4 ,
}

-- Item IDs
CraftableTires.TireItemIDs = {
    "Base.OldTire1", "Base.NormalTire1", "Base.ModernTire1",
    "Base.OldTire2", "Base.NormalTire2", "Base.ModernTire2",
    "Base.OldTire3", "Base.NormalTire3", "Base.ModernTire3",
}

function CraftableTires.getTireAmountIn(tile)
    if not tile or not tile:getSprite() then return end
    local spriteName = tile:getSprite():getName()
    return CraftableTires.TireTiles[spriteName] or 0
end

-- CraftableTires.addTireTileID(tileID, tiresPerTile)  
--  - tileID (string): the exact sprite name for the tile with tires  
--  - tiresPerTile (number): the number of randomly generated tires, from different types  
-- Let's you add a tile ID to the disassembling list so that your tile with tires can be disassembled and spawn variable tire types of variable quality  
function CraftableTires.addTireTileID(tileID, tiresPerTile)
    if not tileID or type(tileID) ~= "string" or not tiresPerTile or not type(tiresPerTile) ~= "number" then return end

    CraftableTires.TireItemIDs[tileID] = tiresPerTile
end

-- CraftableTires.addTireID(itemID)
--  - itemID (string): the exact item ID from your tire item, including the module. for example: "YourMod.YourTireItem"
-- Let's you add a tire item ID so that any tile disassembling that contains tires can reward your mod's tires
function CraftableTires.addTireID(itemID)
    if not itemID or type(itemID) ~= "string" then return end

    table.insert(CraftableTires.TireItemIDs, itemID)
end
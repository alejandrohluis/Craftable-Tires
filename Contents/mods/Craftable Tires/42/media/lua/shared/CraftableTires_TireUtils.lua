CraftableTires = CraftableTires or {}

CraftableTires.TireTiles = {
    -- tires in texture:
    -- one tire
    [ "location_business_machinery_01_48" ] = 1 ,
    [ "location_business_machinery_01_49" ] = 1,
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

function CraftableTires.getTireAmountIn(tile)
    if not tile or not tile:getSprite() then return end
    local spriteName = tile:getSprite():getName()
    return CraftableTires.TireTiles[spriteName] or 0
end

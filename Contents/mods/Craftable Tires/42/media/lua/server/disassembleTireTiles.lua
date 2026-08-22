local CraftableTiresCommands = {}

local allTireType = {
    "Base.OldTire1", "Base.NormalTire1", "Base.ModernTire1",
    "Base.OldTire2", "Base.NormalTire2", "Base.ModernTire2",
    "Base.OldTire3", "Base.NormalTire3", "Base.ModernTire3",
}

local tireTiles = {
    -- tires in texture:
    -- one tire
    [ "location_business_machinery_01_48" ] = 1 , [ "location_business_machinery_01_49" ] = 1,
    -- two tires
    [ "location_business_machinery_01_40" ] = 2 , [ "location_business_machinery_01_41" ] = 2 , [ "location_business_machinery_01_50" ] = 2 ,
    -- three tires
    [ "location_business_machinery_01_42" ] = 3 , ["location_business_machinery_01_43"] = 3 , ["location_business_machinery_01_51"] = 3 ,
    -- four tires
    [ "location_business_machinery_01_44" ] = 4 , ["location_business_machinery_01_45"] = 4 , ["location_business_machinery_01_52"] = 4 ,
}

local function getTireAmountIn(isoObject)
    if not isoObject or not isoObject:getSprite() then return 0 end
    local spriteName = isoObject:getSprite():getName()

    return tireTiles[spriteName] or 0
end

local function generateTires(amountOfTiresToGenerate)
    local generatedTires = {}
    for i = 1, amountOfTiresToGenerate do
        local tireType = allTireType[ZombRand(1, #allTireType + 1)]

        local tire = instanceItem(tireType)

        local maxCondition = math.floor(tire:getConditionMax() * 0.5)
        tire:setCondition(ZombRand(1 , maxCondition + 1))

        table.insert(generatedTires, tire)
    end
    return generatedTires
end

local function spawnTiresAt(square, tires)
    for i = 1, #tires do
        local tire = tires[i]
        -- random position offset
        local xOff = ZombRand(0 , 101) / 100
        local yOff = ZombRand(0 , 101) / 100

        -- spawn tire
        square:AddWorldInventoryItem(tire, xOff, yOff, 0.0)
    end
end

CraftableTiresCommands.RemoveTile = function(player, args)
    local square = getCell():getGridSquare(args.x, args.y, args.z)
    if not square then return end

    local isoObject = square:getObjects():get(args.index)
    if not isoObject then return end

    local quantityOfTiresGenerated = getTireAmountIn(isoObject)
    local tires = generateTires(quantityOfTiresGenerated)
    if #tires ~= quantityOfTiresGenerated then return end

    square:transmitRemoveItemFromSquare(isoObject)

    spawnTiresAt(square, tires)
end

local function OnClientCommand(module, command, player, args)
    if module == "DisassembleTire" and CraftableTiresCommands[command] then
        CraftableTiresCommands[command](player, args)
    end
end

Events.OnClientCommand.Add(OnClientCommand)
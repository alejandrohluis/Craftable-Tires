require "CraftableTires_TireUtils"

-----------------------------------------------------------------
---                     ATTENTION !                           ---
--- if you are looking to make an addon or add compatibility, ---
--- check out "CraftableTires_TireUtils.lua" in lua/shared !  ---
-----------------------------------------------------------------

local CraftableTiresCommands = {}

CraftableTires = CraftableTires or {}

local function isPlayerClose(player, x, y, z)
    if not player then return false end
    if player:getZ() ~= z then return false end

    local distance_x = player:getX() - x
    local distance_y = player:getY() - y
    local distance = distance_x * distance_x + distance_y * distance_y
    local max_distance = 2.5 * 2.5

    return distance <= max_distance
end


local function generateTires(amountOfTiresToGenerate)
    local generatedTires = {}
    local createItemMethod = instanceItem
    local randomNumberGenerator = ZombRand
    local tireTypeList = CraftableTires.TireItemIDs
    local tireTypeCount = #tireTypeList
    for i = 1, amountOfTiresToGenerate do
        local tireType = tireTypeList[randomNumberGenerator(1, tireTypeCount + 1)]

        local tire = createItemMethod(tireType)

        local maxCondition = math.floor(tire:getConditionMax() * 0.5)
        tire:setCondition(randomNumberGenerator(1 , maxCondition + 1))

        table.insert(generatedTires, tire)
    end
    return generatedTires
end

local function spawnTiresAt(square, tires)
    local randomNumberGenerator = ZombRand
    for i = 1, #tires do
        local tire = tires[i]
        -- random position offset
        local xOff = randomNumberGenerator(0 , 101) / 100
        local yOff = randomNumberGenerator(0 , 101) / 100

        -- spawn tire
        square:AddWorldInventoryItem(tire, xOff, yOff, 0.0)
    end
end

local function validArgs(args)
    return args and
        args.x and type(args.x) == "number" and
        args.y and type(args.y) == "number" and
        args.z and type(args.z) == "number"
end

CraftableTiresCommands.DisassembleTire = function(player, args)
    if not validArgs(args) then return end

    if not isPlayerClose(player, args.x, args.y, args.z) then return end

    local square = getCell():getGridSquare(args.x, args.y, args.z)
    if not square then return end

    local tireTile = square:getObjects():get(args.index)
    if not tireTile then return end

    local quantityOfTiresGenerated = CraftableTires.getTireAmountIn(tireTile)
    if quantityOfTiresGenerated <= 0 then return end

    local tires = generateTires(quantityOfTiresGenerated)
    if #tires ~= quantityOfTiresGenerated then return end

    square:transmitRemoveItemFromSquare(tireTile)

    spawnTiresAt(square, tires)
end

local function OnClientCommand(module, command, player, args)
    if module == "CraftableTires" and CraftableTiresCommands[command] then
        CraftableTiresCommands[command](player, args)
    end
end

Events.OnClientCommand.Add(OnClientCommand)
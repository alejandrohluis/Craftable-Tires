require "TimedActions/ISBaseTimedAction"

ISDisassembleTireAction = ISBaseTimedAction:derive("ISDisassembleTireAction")

function ISDisassembleTireAction:new(character, args)
    local o = ISBaseTimedAction.new(self, character)

    o.args = args

    o.maxTime = 1

    o.stopOnWalk = true
    o.stopOnRun = true

    return o
end

function ISDisassembleTireAction:isValid()
    return self.character ~= nil and self.args ~= nil
end
function ISDisassembleTireAction:start()
end
function ISDisassembleTireAction:update()
end
function ISDisassembleTireAction:perform()
    sendClientCommand(self.character, "DisassembleTire", "RemoveTile", self.args)
    ISBaseTimedAction.perform(self)
end

------------------------

local tireTiles = {
    -- tires in texture:
    -- one tire
    { "location_business_machinery_01_48" , "location_business_machinery_01_49"},
    -- two tires
    { "location_business_machinery_01_40" , "location_business_machinery_01_41" , "location_business_machinery_01_50" },
    -- three tires
    { "location_business_machinery_01_42" , "location_business_machinery_01_43" , "location_business_machinery_01_51" },
    -- four tires
    { "location_business_machinery_01_44" , "location_business_machinery_01_45" , "location_business_machinery_01_52" },
}

local function hasTiresInTile(isoObject)
    if not isoObject or not isoObject:getSprite() then return false end
    local spriteName = isoObject:getSprite():getName()

    for i = 1, #tireTiles do
        local tireType = tireTiles[i]
        for j = 1, #tireType do
            local tire = tireType[j]
            if spriteName == tire then
                return true
            end
        end
    end
    return false
end

local function onDisassembleTile(worldobjects, playerNum, isoObject)
    local player = getSpecificPlayer(playerNum)

    if not player or not isoObject then return end

    local squareToWalk = isoObject:getSquare()
    -- walk to the tire
    if not luautils.walkAdj(player, squareToWalk, true) then return end

    local args = {
        x = isoObject:getX(),
        y = isoObject:getY(),
        z = isoObject:getZ(),
        index = isoObject:getObjectIndex(),
    }

    ISTimedActionQueue.add(ISDisassembleTireAction:new(player, args))
end

local function DisassembleTireTilesContextMenu(playerNum, context, worldobjects, test)
    if test then return end

    local clickedObject = nil

    -- loop through clicked objects to find the tire tiles
    for _, obj in ipairs(worldobjects) do
        if hasTiresInTile(obj) then
            clickedObject = obj
            break
        end
    end

    if clickedObject then
        context:addOption("Disassemble", worldobjects, onDisassembleTile, playerNum, clickedObject)
    end
end

Events.OnFillWorldObjectContextMenu.Add(DisassembleTireTilesContextMenu)
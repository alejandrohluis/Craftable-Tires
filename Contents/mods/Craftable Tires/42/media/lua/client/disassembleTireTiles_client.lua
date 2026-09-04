require "TimedActions/ISBaseTimedAction"
require "CraftableTires_TireUtils"

ISDisassembleTireAction = ISBaseTimedAction:derive("ISDisassembleTireAction")

function ISDisassembleTireAction:new(character, args, isoObject)
    local o = ISBaseTimedAction.new(self, character)

    o.args = args
    o.isoObject = isoObject

    -- tiempo que tarda la accion en ticks
    o.maxTime = 100

    o.stopOnWalk = true
    o.stopOnRun = true

    return o
end

function ISDisassembleTireAction:isValid()
    if not self.character or not self.args or not self.isoObject then return false end

    local square = self.isoObject:getSquare()
    if not square then return false end

    local tireQuantity = CraftableTires.getTireAmountIn(self.isoObject)
    if tireQuantity <= 0 then return false end
    return true
end

function ISDisassembleTireAction:start()
    self:setActionAnim("VehicleWorkOnTire")
    -- self.sound = self.character:playSound("TakeWheel")
end

function ISDisassembleTireAction:update()
    self.character:faceThisObject(self.isoObject)
end

-- function ISDisassembleTireAction:stop()
--     if self.sound then
--         self.character:stopOrTriggerSound(self.sound)
--     end
--     ISBaseTimedAction.stop(self)
-- end

function ISDisassembleTireAction:perform()
    -- if self.sound then
    --     self.character:stopOrTriggerSound(self.sound)
    -- end
    sendClientCommand(self.character, "CraftableTires", "DisassembleTire", self.args)
    ISBaseTimedAction.perform(self)
end

------------------------

local function hasTiresInTile(isoObject)
    local tireQuantity = CraftableTires.getTireAmountIn(isoObject)
    return tireQuantity > 0
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

    ISTimedActionQueue.add(ISDisassembleTireAction:new(player, args, isoObject))
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
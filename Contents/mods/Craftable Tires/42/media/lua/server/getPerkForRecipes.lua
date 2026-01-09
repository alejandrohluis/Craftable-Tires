local Recipe = RecipeCodeOnCreate

local function getBaseTireCondition(p_player)
    local player = p_player
    local baseCondition = SandboxVars.CraftableTires.StartingCondition
    local mechanicsModifier = player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier
    local metalweldingModifier = player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.WeldingLevelMultiplier

    local condition = baseCondition + mechanicsModifier + metalweldingModifier
    return math.min(condition, 100)
end

local function randomizeTireCondition(tireCondition, deltaNegative, deltaPositive)
    local minimumCondition = tireCondition - deltaNegative
    local maximumCondition = tireCondition + deltaPositive
    local randomizedCondition = ZombRand(minimumCondition, maximumCondition)
    randomizedCondition = math.max(0, math.min(randomizedCondition, 100))
    return randomizedCondition
end

-- recipe functions

function Recipe.SetTireCondHeavyDuty(craftRecipeData, player)
    local tireCondition = getBaseTireCondition(player)
    if SandboxVars.CraftableTires.RandomizedQuality then
        local minimumRandomCond = SandboxVars.CraftableTires.RandomHeavyDutyLow -- 4
        local maximumRandomCond = SandboxVars.CraftableTires.RandomHeavyDutyHigh -- 1
        tireCondition = randomizeTireCondition(tireCondition, minimumRandomCond, maximumRandomCond)
    end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end

function Recipe.SetTireCondStandard(craftRecipeData, player)
    local tireCondition = getBaseTireCondition(player)
    if SandboxVars.CraftableTires.RandomizedQuality then
        local minimumRandomCond = SandboxVars.CraftableTires.RandomStandardLow -- 5
        local maximumRandomCond = SandboxVars.CraftableTires.RandomStandardHigh -- 5
        tireCondition = randomizeTireCondition(tireCondition, minimumRandomCond, maximumRandomCond)
    end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end

function Recipe.SetTireCondSport(craftRecipeData, player)
    local tireCondition = getBaseTireCondition(player)
    if SandboxVars.CraftableTires.RandomizedQuality then
        local minimumRandomCond = SandboxVars.CraftableTires.RandomSportLow -- 14
        local maximumRandomCond = SandboxVars.CraftableTires.RandomSportHigh -- 1
        tireCondition = randomizeTireCondition(tireCondition, minimumRandomCond, maximumRandomCond)
    end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end
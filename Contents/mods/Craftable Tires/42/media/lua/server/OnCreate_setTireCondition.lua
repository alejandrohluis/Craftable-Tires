local Recipe = RecipeCodeOnCreate

local function getBaseTireCondition(player)
    local baseCondition = SandboxVars.CraftableTires.StartingCondition
    local mechanicsModifier = player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier
    local metalweldingModifier = player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.WeldingLevelMultiplier

    local condition = math.min(100, baseCondition + mechanicsModifier + metalweldingModifier)
    return condition
end

local function randomizeTireCondition(tireCondition, deltaNegative, deltaPositive)
    local minimumCondition = math.max(0, tireCondition - deltaNegative)
    local maximumCondition = math.min(100, tireCondition + deltaPositive)
    local randomizedCondition = ZombRand(minimumCondition, maximumCondition + 1)
    return randomizedCondition
end

local function setTireCondition(craftRecipeData, player, minimumSandboxKey, maximumSandboxKey)
    local tireCondition = getBaseTireCondition(player)

    if SandboxVars.CraftableTires.RandomizedQuality then
        local minimumRandomCond = SandboxVars.CraftableTires[minimumSandboxKey]
        local maximumRandomCond = SandboxVars.CraftableTires[maximumSandboxKey]
        tireCondition = randomizeTireCondition(tireCondition, minimumRandomCond, maximumRandomCond)
    end

    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end

-- recipe functions

function Recipe.SetTireCondHeavyDuty(craftRecipeData, player)
    setTireCondition(craftRecipeData, player, "RandomHeavyDutyLow", "RandomHeavyDutyHigh")
end

function Recipe.SetTireCondStandard(craftRecipeData, player)
    setTireCondition(craftRecipeData, player, "RandomStandardLow", "RandomStandardHigh")
end

function Recipe.SetTireCondSport(craftRecipeData, player)
    setTireCondition(craftRecipeData, player, "RandomSportLow", "RandomSportHigh")
end
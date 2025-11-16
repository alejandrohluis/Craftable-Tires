require "recipecode"

local Recipe = Recipe

function Recipe.OnCreate.SetTireCondHeavyDuty(craftRecipeData, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.WeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 4, tireCondition + 1) end
    if tireCondition <= 0 then tireCondition = 0 end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end

function Recipe.OnCreate.SetTireCondStandard(craftRecipeData, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.WeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 9, tireCondition + 1) end
    if tireCondition <= SandboxVars.CraftableTires.StartingCondition then tireCondition = SandboxVars.CraftableTires.StartingCondition end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end

function Recipe.OnCreate.SetTireCondSport(craftRecipeData, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.WeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 14, tireCondition + 1) end
    if tireCondition <= SandboxVars.CraftableTires.StartingCondition then tireCondition = SandboxVars.CraftableTires.StartingCondition end
    local result = craftRecipeData:getAllCreatedItems():get(0)
    result:setCondition(tireCondition)
end
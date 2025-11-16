local Recipe = Recipe

function Recipe.OnCreate.CheckTireCond(items, result, player)
    local tireCondition = 0
	for i=0, items:size()-1 do
		local item = items:get(i)
		if item:getType() ~= "SharpKnife" then
			tireCondition = item:getCondition()
            break
		end
	end
    if tireCondition >= 80 then player:getInventory():AddItems("DP.Rubber", 1) end
end

function Recipe.OnCreate.SetTireCondHeavyDuty(items, result, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.MetalWeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 4, tireCondition + 1) end
    if tireCondition <= 0 then tireCondition = 0 end
    result:setCondition(tireCondition)
end

function Recipe.OnCreate.SetTireCondStandard(items, result, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.MetalWeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 9, tireCondition + 1) end
    if tireCondition <= SandboxVars.CraftableTires.StartingCondition then tireCondition = SandboxVars.CraftableTires.StartingCondition end
    result:setCondition(tireCondition)
end

function Recipe.OnCreate.SetTireCondSport(items, result, player)
    local tireCondition = SandboxVars.CraftableTires.StartingCondition +
                          player:getPerkLevel(Perks.Mechanics)*SandboxVars.CraftableTires.MechanicsLevelMultiplier +
                          player:getPerkLevel(Perks.MetalWelding)*SandboxVars.CraftableTires.MetalWeldingLevelMultiplier
    if tireCondition >= 100 then tireCondition = 100 end
    if SandboxVars.CraftableTires.RandomizedQuality then tireCondition = ZombRand(tireCondition - 14, tireCondition + 1) end
    if tireCondition <= SandboxVars.CraftableTires.StartingCondition then tireCondition = SandboxVars.CraftableTires.StartingCondition end
    result:setCondition(tireCondition)
end
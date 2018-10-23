local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	Asset( "ANIM", "anim/famine.zip"),
	Asset( "ANIM", "anim/ghost_famine_build.zip"),
    Asset( "SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

-- When the character is revived from human
local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "famine_speed_mod", 1)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "famine_speed_mod", 1.5)
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local function HealthChange(inst, data)

    local health = data.newpercent
	local health_percent = inst.components.health:GetPercent()
	
    if 1 == health_percent then
		inst.components.combat.damagemultiplier = 1
	elseif 0.5 < health_percent then
        inst.components.combat.damagemultiplier = 1.2
	elseif 0.05 < health_percent then
        inst.components.combat.damagemultiplier = 2
    end
	
end

local function OnHungerChange(inst, data)

	local hunger = data.newpercent
    local hungerpct = data.newpercent
	
	local speedmult = 1 -- 
    if hungerpct > 0.9 then -- hunger is above 90%
        speedmult = 1.025
    elseif hunger > 0.8 then -- hunger is above 80%
        speedmult = 1.05
	elseif hunger > 0.7 then -- hunger is above 70%
        speedmult = 1.075
	elseif hunger > 0.6 then -- hunger is above 60%
        speedmult = 1.1
	elseif hunger > 0.5 then -- hunger is above 50%
        speedmult = 1.125
	elseif hunger > 0.4 then -- hunger is above 40%
        speedmult = 1.15
	elseif hunger > 0.3 then -- hunger is above 30%
        speedmult = 1.175
	elseif hunger > 0.2 then -- hunger is above 20%
        speedmult = 1.2
    elseif hunger > 0.15 then -- hunger is above 15%
        speedmult = 1.25
	elseif hunger > 0.05 then -- hunger is above 5%
		speedmult = 1.3
	elseif hunger < 0.05 then -- hunger is below 15%
		speedmult = 2
    end

    if inst.components.locomotor.runspeed ~= speedmult * TUNING.WILSON_RUN_SPEED then
        inst.components.locomotor.runspeed = speedmult * TUNING.WILSON_RUN_SPEED
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst:AddTag("monster")
	inst.MiniMapEntity:SetIcon("famine.tex")
end

-- This initializes for the server only. Components are added here.
local function master_postinit(inst)

	inst.soundsname = "webber"
    inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	inst.components.eater.ignoresspoilage = true
	inst.components.eater.strongstomach = true
	inst.components.eater:SetCanEatRaw()
	inst.components.eater:SetCanEatHorrible()
	
	inst.components.hunger.hungerrate = 2.0 * TUNING.WILSON_HUNGER_RATE
	
	inst:ListenForEvent("hungerdelta", OnHungerChange)
	inst:ListenForEvent("healthdelta", HealthChange)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end
	
return MakePlayerCharacter("famine", prefabs, assets, common_postinit, master_postinit, start_inv)

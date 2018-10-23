PrefabFiles = {
	"famine",
	"famine_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/famine.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/famine.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/famine.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/famine.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/famine_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/famine_silho.xml" ),

    Asset( "IMAGE", "bigportraits/famine.tex" ),
    Asset( "ATLAS", "bigportraits/famine.xml" ),
	
	Asset( "IMAGE", "images/map_icons/famine.tex" ),
	Asset( "ATLAS", "images/map_icons/famine.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_famine.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_famine.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_famine.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_famine.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_famine.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_famine.xml" ),
	
	Asset( "IMAGE", "images/names_famine.tex" ),
    Asset( "ATLAS", "images/names_famine.xml" ),
	
	Asset( "IMAGE", "bigportraits/famine_none.tex" ),
    Asset( "ATLAS", "bigportraits/famine_none.xml" ),
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

STRINGS.CHARACTER_TITLES.famine = "The Third Horseman"
STRINGS.CHARACTER_NAMES.FAMINE = "Famine"
STRINGS.CHARACTER_DESCRIPTIONS.famine = "*Are very bony\n*Possibly would smile a lot\n*Not so much hunger"
STRINGS.CHARACTER_QUOTES.famine = "\"We hunger.\""
STRINGS.CHARACTERS.FAMINE = require "speech_famine"

STRINGS.NAMES.FAMINE = "Famine"
AddModCharacter("famine", "PLURAL")
AddMinimapAtlas("images/map_icons/famine.xml")



local health_famine = GetModConfigData("Health_Famine")
if health_famine == 1 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.health:SetMaxHealth(120)
	end)
	
elseif health_famine == 2 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.health:SetMaxHealth(220)
	end)
	
elseif health_famine == 3 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.health:SetMaxHealth(320)
	end)
	
elseif health_famine == 4 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.health:SetMaxHealth(420)
	end)
end


local hunger_famine = GetModConfigData("Hunger_Famine")
if hunger_famine == 1 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.hunger:SetMax(120)
	end)
	
elseif hunger_famine == 2 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.hunger:SetMax(220)
	end)
	
elseif hunger_famine == 3 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.hunger:SetMax(320)
	end)
	
elseif hunger_famine == 4 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.hunger:SetMax(420)
	end)
end


local sanity_famine = GetModConfigData("Sanity_Famine")
if sanity_famine == 1 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.sanity:SetMax(200)
	end)
	
elseif sanity_famine == 2 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.sanity:SetMax(300)
	end)
	
elseif sanity_famine == 3 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.sanity:SetMax(400)
	end)
	
elseif sanity_famine == 4 then
	AddPrefabPostInit("famine", function(inst)
		if not GLOBAL.TheWorld.ismastersim then return inst end
		inst.components.sanity:SetMax(500)
	end)
end


local assets =
{
	Asset( "ANIM", "anim/famine.zip" ),
	Asset( "ANIM", "anim/ghost_famine_build.zip" ),
}

local skins =
{
	normal_skin = "famine",
	ghost_skin = "ghost_famine_build",
}

local base_prefab = "famine"

local tags = {"FAMINE", "CHARACTER"}

return CreatePrefabSkin("famine_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})
-- This information tells other players more about the mod
name = "Famine"
description = "More info on steam workshop!"
author = "Venfaaniik"
version = "1.4" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
 forumthread = "/files/file/1798-famine-the-third-rider-of-apocapypse-dst/"


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character", "famine",
}

configuration_options = 
{
	{
		name = "Health_Famine",
		label = "Famine's Max Health",
		options = 
		{
			{description = "Normal", data = 1, hover = "120"},
			{description = "High", data = 2, hover = "220"},
			{description = "Very High", data = 3, hover = "320"},
			{description = "Super High", data = 4, hover = "420"},
		},
		default = 1
	},
	
	{
		name = "Hunger_Famine",
		label = "Famine's Max Hunger",
		options = 
		{
			{description = "Normal", data = 1, hover = "120"},
			{description = "High", data = 2, hover = "220"},
			{description = "Very High", data = 3, hover = "320"},
			{description = "Super High", data = 4, hover = "420"},
		},
		default = 1
	},
	
	{
		name = "Sanity_Famine",
		label = "Famine's Max Sanity",
		options = 
		{
			{description = "Normal", data = 1, hover = "200"},
			{description = "High", data = 2, hover = "300"},
			{description = "Very High", data = 3, hover = "400"},
			{description = "Super High", data = 4, hover = "500"},
		},
		default = 1
	},
}
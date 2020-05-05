--[[
	Autobuy in Misc -> General
]]

local Groupbox = gui.Groupbox(gui.Reference('Misc', 'General'), 'Autobuy', 16, 466, 295)
local Autobuy = {
	Utility = {},
	Grenades = {}
}
Autobuy.Enable = gui.Checkbox(Groupbox, 'autobuy.enable', 'Enable', 0)
Autobuy.Enable:SetDescription('Enable autobuy.')

-- Weapons
Autobuy.PrimaryWeapon = gui.Combobox(Groupbox, 'autobuy.primary', 'Primary Weapon', 'Off', 'MAC-10 | MP9', 'MP7 | MP5-SD', 'UMP-45', 'P90', 'PP-Bizon', 'Galil AR | FAMAS', 'AK-47 | M4A4 | M4A1-S', 'SSG 08', 'AUG', 'AWP', 'G3SG1 | SCAR-20', 'Nova', 'XM1014', 'Sawed-Off | MAG-7', 'M249', 'Negev')
Autobuy.SecondaryWeapon = gui.Combobox(Groupbox, 'autobuy.secondary', 'Secondary Weapon', 'Off', 'Glock-18 | P2000 | USP-S', 'Dual Berettas', 'P250', 'CZ75-Auto | Five-SeveN | Tec-9', 'Desert Eagle | R8 Revolver')

-- Armor
Autobuy.Armor = gui.Combobox(Groupbox, 'autobuy.armor', 'Armor', 'Off', 'Kevlar', 'Kevlar + Helmet')

-- Utility
Autobuy.Utility.Multibox = gui.Multibox(Groupbox, 'Utility')
Autobuy.Utility.Defuser = gui.Checkbox(Autobuy.Utility.Multibox, 'autobuy.utility.defuser', 'Defuser', 0)
Autobuy.Utility.Taser = gui.Checkbox(Autobuy.Utility.Multibox, 'autobuy.utility.taser', 'Taser', 0)

-- Grenades
Autobuy.Grenades.Multibox = gui.Multibox(Groupbox, 'Grenades')
Autobuy.Grenades.HEGrenade = gui.Checkbox(Autobuy.Grenades.Multibox, 'autobuy.grenade.hegrenade', 'HE Grenade' , 0)
Autobuy.Grenades.Smoke = gui.Checkbox(Autobuy.Grenades.Multibox, 'autobuy.grenade.smoke', 'Smoke Grenade' , 0)
Autobuy.Grenades.Molotov = gui.Checkbox(Autobuy.Grenades.Multibox, 'autobuy.grenade.molotov', 'Molotov' , 0)
Autobuy.Grenades.Flashbang = gui.Checkbox(Autobuy.Grenades.Multibox, 'autobuy.grenade.flashbang', 'Flashbang' , 0)
Autobuy.Grenades.Decoy = gui.Checkbox(Autobuy.Grenades.Multibox, 'autobuy.grenade.decoy', 'Decoy' , 0)

-- Menu Objects Handler
callbacks.Register('Draw', function()
	local isAutoBuyEnabled = not Autobuy.Enable:GetValue()
	Autobuy.PrimaryWeapon:SetInvisible(isAutoBuyEnabled)
	Autobuy.SecondaryWeapon:SetInvisible(isAutoBuyEnabled)
	Autobuy.Armor:SetInvisible(isAutoBuyEnabled)
	Autobuy.Utility.Multibox:SetInvisible(isAutoBuyEnabled)
	Autobuy.Grenades.Multibox:SetInvisible(isAutoBuyEnabled)
end)

local BuyCommands = {
	PrimaryWeapon = {
		'buy mac10;',
		'buy mp7;',
		'buy ump45;',
		'buy p90;',
		'buy bizon;',
		'buy galilar;',
		'buy ak47;',
		'buy ssg08;',
		'buy aug;',
		'buy awp;',
		'buy g3sg1;',
		'buy nova;',
		'buy xm1014;',
		'buy sawedoff;',
		'buy m249;',
		'buy negev;'
	},
	SecondaryWeapon = {
		'buy glock;',
		'buy elite;',
		'buy p250;',
		'buy tec9;',
		'buy deagle;'
	},
	Armor = {
		'buy vest;',
		'buy vesthelm;',
	}
}

callbacks.Register('FireGameEvent', function(Event)
	if not Autobuy.Enable:GetValue() or Event:GetName() ~= 'round_prestart' then
		return
	end

	-- Weapons & Armor
	for key, value in pairs(Autobuy) do
		if key == 'PrimaryWeapon' or key == 'SecondaryWeapon' or key == 'Armor' then
			if Autobuy[key]:GetValue() ~= 0 then
				client.Command(BuyCommands[key][Autobuy[key]:GetValue()], true)
			end
		end
	end

	-- Grenades
	for key, value in pairs(Autobuy.Grenades) do
		if key ~= 'Multibox' then
			if Autobuy.Grenades[key]:GetValue() then
				local Grenade = string.lower(tostring(tostring(value):gsub("%s+", "")))
				client.Command('buy ' .. Grenade .. ';', true)
			end
		end
	end

	-- Utility
	for key, value in pairs(Autobuy.Utility) do
		if key ~= 'Multibox' then
			if Autobuy.Utility[key]:GetValue() then
				client.Command('buy ' .. string.lower(key) .. ';', true)
			end
		end
	end
end)
client.AllowListener('round_prestart')	
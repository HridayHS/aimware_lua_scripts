local WeaponNames = {
	['knife'] = 'Knife',
	['taser'] = 'Taser',
	['glock'] = 'Glock-18',
	['hpk2000'] = 'P2000',
	['usp_silencer'] = 'USP-S',
	['Elite'] = 'Dual Berettas',
	['p250'] = 'P250',
	['cz75a'] = 'CZ75-Auto',
	['fiveseven'] = 'Fiven-SeveN',
	['tec9'] = 'Tec-9',
	['deagle'] = 'Desert Eagle',
	['revolver'] = 'R8 Revolver',
	['mac10'] = 'MAC-10',
	['mp9'] = 'MP9',
	['mp7'] = 'MP7',
	['mp5sd'] = 'MP5-SD',
	['ump45'] = 'UPM-45',
	['p90'] = 'P90',
	['bizon'] = 'PP-Bizon',
	['galilar'] = 'Galil AR',
	['famas'] = 'FAMAS',
	['ak47'] = 'AK-47',
	['m4a1'] = 'M4A4',
	['m4a1_silencer'] = 'M4A1-S',
	['ssg08'] = 'SSG 08',
	['sg556'] = 'SG 553',
	['aug'] = 'AUG',
	['awp'] = 'AWP',
	['g3sg1'] = 'G3SG1',
	['scar20'] = 'SCAR-20',
	['nova'] = 'Nova',
	['xm1014'] = 'XM1014',
	['sawedoff'] = 'Sawed-Off',
	['mag7'] = 'MAG-7',
	['m249'] = 'M249',
	['negev'] = 'Negev',
	['inferno'] = 'Molotov',
	['decoy'] = 'Decoy Grenade',
	['flashbang'] = 'Flashbang',
	['hegrenade'] = 'HE Grenade',
	['smokegrenade'] = 'Smoke Grenade'
}


local Tab = gui.Tab(gui.Reference('Misc'), 'chickens', 'Chickens')
local Groupbox = {
	General = gui.Groupbox(Tab, 'General', 16, 16, 295),
	Extra = gui.Groupbox(Tab, 'Extra', 328, 16, 295)
}

local Chicken = {
	AntiAim = gui.Checkbox(Groupbox.General, 'antiaim', 'Anti-Aim', 0),
	Skin = gui.Combobox(Groupbox.General, 'skin', 'Skin', 'White', 'Red'),
	Theme = gui.Combobox(Groupbox.General, 'theme', 'Theme', 'Off', 'Party Chicken', 'Ghost Chicken', 'Festive Chicken', 'Easter Chicken', 'Jack-o-Chicken'),
	PartyMode = gui.Checkbox(Groupbox.General, 'partymode', 'Party Mode', 0),
	Size = gui.Slider(Groupbox.General, "size", 'Size', 1.0, 1.0, 5.0),
	DeathSay = gui.Checkbox(Groupbox.Extra, 'deathsay', 'Death Say', 0)
}

-- Object Description
Chicken.DeathSay:SetDescription('Sends a chat message on chicken death.')

-- Main
callbacks.Register('Draw', function()
	if not gui.GetValue('misc.master') then
		return
	end

	local Chickens = entities.FindByClass('CChicken')

	for i=1, #Chickens do
		Chickens[i]:SetProp('m_nSkin', Chicken.Skin:GetValue())
		Chickens[i]:SetProp('m_nBody', Chicken.Theme:GetValue())
		Chickens[i]:SetProp('m_flModelScale', Chicken.Size:GetValue())
	end

	if Chicken.AntiAim:GetValue() then
		for i=1, #Chickens do
			Chickens[i]:SetProp('m_nSequence', -509)
		end
	end

	if Chicken.PartyMode:GetValue() then
		client.SetConVar('sv_party_mode', 1, true)
	else
		client.SetConVar('sv_party_mode', 0, true)
	end
end)

-- Death Say
client.AllowListener('other_death')
callbacks.Register('FireGameEvent', function(Event)
	if  not gui.GetValue('misc.master') or not Chicken.DeathSay:GetValue() then
		return
	end

	if Event:GetName() == 'other_death' then
		local Killer_INT = Event:GetInt('attacker')
		local Killer_Name = client.GetPlayerNameByUserID(Killer_INT)
		local Weapon = WeaponNames[Event:GetString('weapon')]
		client.ChatSay( string.format("%s murdered a chicken with the %s.", Killer_Name, Weapon) )
	end
end)
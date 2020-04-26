--[[
	- Checkbox in Misc -> General -> Extra
]]

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

local Ref_MiscExtra = gui.Reference('Misc', 'General', 'Extra')
local ChickenDeathSay = gui.Checkbox(Ref_MiscExtra, 'chickendeathsay', 'Chicken Death Say', 0)
ChickenDeathSay:SetDescription('Sends a chat message on chicken death.')

client.AllowListener('other_death')
callbacks.Register('FireGameEvent', function(Event)
	if not ChickenDeathSay:GetValue() then
		return
	end

	if Event:GetName() == 'other_death' then
		local Killer_INT = Event:GetInt('attacker')
		local Killer_Name = client.GetPlayerNameByUserID(Killer_INT)
		local Weapon = WeaponNames[Event:GetString('weapon')]

		client.ChatSay( string.format("%s murdered a chicken with the %s.", Killer_Name, Weapon) )
	end
end)
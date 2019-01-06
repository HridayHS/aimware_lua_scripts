local MSC_OTHER_REF = gui.Reference( "MISC", "AUTOMATION", "Other" );

local Autobuy_Text = gui.Text( MSC_OTHER_REF, "Autobuy" );
local Autobuy_Enable = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_enable", "Enable", 0 );

local Autobuy_PrimaryWeapon = gui.Combobox( MSC_OTHER_REF, "lua_autobuy_primaryweapon", "Primary Weapon", "Off", "Auto", "Scout", "AWP", "Rifle", "Famas : Galil AR", "AUG : SG 553", "MP9 : MAC-10", "MP7 : MP5-SD", "UMP-45", "P90", "PP-Bizon", "Nova", "XM1014", "MAG-7 : Sawed-Off", "M249", "Negev" );
local Autobuy_SecondaryWeapon = gui.Combobox( MSC_OTHER_REF, "lua_autobuy_secondaryweapon", "Secondary Weapon", "Off", "Dual Berettas", "P250", "Five-Seven : CZ75-Auto : Tec-9", "Desert Eagle : R8 Revolver" );

local Autobuy_Armor = gui.Combobox( MSC_OTHER_REF, "lua_autobuy_armor", "Armor", "Off", "Kevlar", "Kevlar + Helmet" );
local Autobuy_Defuser = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_defuser", "Defuser", 0 );
local Autobuy_Taser = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_taser", "Taser", 0 );

local Autobuy_HEGrenade = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_hegrenade", "HE Grenade", 0 );
local Autobuy_Smoke = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_smoke", "Smoke", 0 );
local Autobuy_Molotov = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_molotov", "Molotov", 0 );
local Autobuy_Flashbang = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_flashbang", "Flashbang", 0 );
local Autobuy_Decoy = gui.Checkbox( MSC_OTHER_REF, "lua_autobuy_decoy", "Decoy", 0 );

local Money = 0

local function LocalPlayerMoney()
	if Autobuy_Enable:GetValue() then
		if entities.GetLocalPlayer() ~= nil then
			Money = entities.GetLocalPlayer():GetProp( "m_iAccount" )
		end
	end
end

local function Autobuy( Event )

	local PrimaryWeapon = Autobuy_PrimaryWeapon:GetValue()
	local SecondaryWeapon = Autobuy_SecondaryWeapon:GetValue()
	local Armor = Autobuy_Armor:GetValue()

	if Autobuy_Enable:GetValue() then

		if Event:GetName() ~= "player_spawn" then
			return;
		end

		local INT_UID = Event:GetInt( "userid" );
		local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );
		
		if client.GetLocalPlayerIndex() == PlayerIndex then
			ME = true
		else
			ME = false
		end

		if ME and Money == 0 then
			-- Primary Weapon
			if PrimaryWeapon == 1 then client.Command( "buy scar20", true ); -- Auto
			elseif PrimaryWeapon == 2 then client.Command( "buy ssg08", true ); -- Scout
			elseif PrimaryWeapon == 3 then client.Command( "buy awp", true ); -- AWP
			elseif PrimaryWeapon == 4 then client.Command( "buy ak47", true ); -- Rifle
			elseif PrimaryWeapon == 5 then client.Command( "buy famas", true ); -- Famas : Galil AR
			elseif PrimaryWeapon == 6 then client.Command( "buy aug", true ); -- AUG : SG 553
			elseif PrimaryWeapon == 7 then client.Command( "buy mac10", true ); --  MP9 : MAC-10
			elseif PrimaryWeapon == 8 then client.Command( "buy mp7", true ); -- MP7 : MP5-SD
			elseif PrimaryWeapon == 9 then client.Command( "buy ump45", true ); -- UMP-45
			elseif PrimaryWeapon == 10 then client.Command( "buy p90", true ); -- P90
			elseif PrimaryWeapon == 11 then client.Command( "buy bizon", true ); -- PP-Bizon
			elseif PrimaryWeapon == 12 then client.Command( "buy nova", true ); -- Nova
			elseif PrimaryWeapon == 13 then client.Command( "buy xm1014", true ); -- XM1014
			elseif PrimaryWeapon == 14 then client.Command( "buy mag7", true ); -- MAG-7 : Sawed-Off
			elseif PrimaryWeapon == 15 then client.Command( "buy m249", true ); -- M249
			elseif PrimaryWeapon == 16 then client.Command( "buy negev", true ); -- Negev
			end
			-- Secondary Weapon
			if SecondaryWeapon == 1 then client.Command( "buy elite", true ); -- Dual Berettas
			elseif SecondaryWeapon == 2 then client.Command( "buy p250", true ); -- P250
			elseif SecondaryWeapon == 3 then client.Command( "buy tec9", true ); -- Five-Seven : CZ75-Auto : Tec-9
			elseif SecondaryWeapon == 4 then client.Command( "buy deagle", true ); -- Desert Eagle : R8 Revolver
			end
			-- Taser
			if Autobuy_Taser:GetValue() then
				client.Command( "buy taser", true );
			end
		elseif ME and Money <= 800 then
			-- Secondary Weapon
			if SecondaryWeapon == 1 then client.Command( "buy elite", true ); -- Dual Berettas
			elseif SecondaryWeapon == 2 then client.Command( "buy p250", true ); -- P250
			elseif SecondaryWeapon == 3 then client.Command( "buy tec9", true ); -- Five-Seven : CZ75-Auto : Tec-9
			elseif SecondaryWeapon == 4 then client.Command( "buy deagle", true ); -- Desert Eagle : R8 Revolver
			end
			-- Taser
			if Autobuy_Taser:GetValue() then
				client.Command( "buy taser", true );
			end
		elseif ME and Money > 800 then
			-- Primary Weapon
			if PrimaryWeapon == 1 then client.Command( "buy scar20", true ); -- Auto
			elseif PrimaryWeapon == 2 then client.Command( "buy ssg08", true ); -- Scout
			elseif PrimaryWeapon == 3 then client.Command( "buy awp", true ); -- AWP
			elseif PrimaryWeapon == 4 then client.Command( "buy ak47", true ); -- Rifle
			elseif PrimaryWeapon == 5 then client.Command( "buy famas", true ); -- Famas : Galil AR
			elseif PrimaryWeapon == 6 then client.Command( "buy aug", true ); -- AUG : SG 553
			elseif PrimaryWeapon == 7 then client.Command( "buy mac10", true ); --  MP9 : MAC-10
			elseif PrimaryWeapon == 8 then client.Command( "buy mp7", true ); -- MP7 : MP5-SD
			elseif PrimaryWeapon == 9 then client.Command( "buy ump45", true ); -- UMP-45
			elseif PrimaryWeapon == 10 then client.Command( "buy p90", true ); -- P90
			elseif PrimaryWeapon == 11 then client.Command( "buy bizon", true ); -- PP-Bizon
			elseif PrimaryWeapon == 12 then client.Command( "buy nova", true ); -- Nova
			elseif PrimaryWeapon == 13 then client.Command( "buy xm1014", true ); -- XM1014
			elseif PrimaryWeapon == 14 then client.Command( "buy mag7", true ); -- MAG-7 : Sawed-Off
			elseif PrimaryWeapon == 15 then client.Command( "buy m249", true ); -- M249
			elseif PrimaryWeapon == 16 then client.Command( "buy negev", true ); -- Negev
			end
			-- Secondary Weapon
			if SecondaryWeapon == 1 then client.Command( "buy elite", true ); -- Dual Berettas
			elseif SecondaryWeapon == 2 then client.Command( "buy p250", true ); -- P250
			elseif SecondaryWeapon == 3 then client.Command( "buy tec9", true ); -- Five-Seven : CZ75-Auto : Tec-9
			elseif SecondaryWeapon == 4 then client.Command( "buy deagle", true ); -- Desert Eagle : R8 Revolver
			end

			-- Armor
			if Armor == 1 then client.Command( "buy vest", true );
			elseif Armor == 2 then client.Command( "buy vesthelm", true );
			end
			-- Defuser
			if Autobuy_Defuser:GetValue() then
				client.Command( "buy defuser", true );
			end
			-- Taser
			if Autobuy_Taser:GetValue() then
				client.Command( "buy taser", true );
			end

			-- HE Grenade
			if Autobuy_HEGrenade:GetValue() then
				client.Command( "buy hegrenade", true );
			end
			-- Smoke
			if Autobuy_Smoke:GetValue() then
				client.Command( "buy smokegrenade", true );
			end
			-- Molotov
			if Autobuy_Molotov:GetValue() then
				client.Command( "buy molotov", true );
			end
			-- Flashbang
			if Autobuy_Flashbang:GetValue() then
				client.Command( "buy flashbang", true );
			end
			-- Decoy
			if Autobuy_Decoy:GetValue() then
				client.Command( "buy decoy", true );
			end
		end

	end

end

client.AllowListener( "player_spawn" )

callbacks.Register( "Draw", "Local Player Money", LocalPlayerMoney )
callbacks.Register( "FireGameEvent", "Autobuy", Autobuy )

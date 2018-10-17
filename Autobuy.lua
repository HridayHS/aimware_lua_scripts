local MSC_PART_3_REF = gui.Reference( "MISC", "Part 3" );

local Autobuy_Groupbox = gui.Groupbox( MSC_PART_3_REF, "Autobuy", 0, 890, 213, 180 );
local Autobuy_Enable = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_enable", "Enable", 0 );

local Autobuy_PrimaryWeapon = gui.Combobox( Autobuy_Groupbox, "lua_autobuy_primaryweapon", "Primary Weapon", "Off", "Auto", "Scout", "AWP", "Rifle" );
local Autobuy_SecondaryWeapon = gui.Combobox( Autobuy_Groupbox, "lua_autobuy_secondaryweapon", "Secondary Weapon", "Off", "Dualies", "Deagle/Revolver" );

local Autobuy_Kevlar = gui.Combobox( Autobuy_Groupbox, "lua_autobuy_armor", "Armor", "Off", "Kevlar", "Kevlar + Helmet" );
local Autobuy_Defuser = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_defuser", "Defuser", 0 );
local Autobuy_Taser = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_taser", "Taser", 0 );

local Autobuy_HEGrenade = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_hegrenade", "HE Grenade", 0 );
local Autobuy_Smoke = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_smoke", "Smoke", 0 );
local Autobuy_Molotov = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_molotov", "Molotov", 0 );
local Autobuy_Flashbang = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_flashbang", "Flashbang", 0 );
local Autobuy_Decoy = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_decoy", "Decoy", 0 );

local Money = 0

local function LocalPlayerMoney()
	if entities.GetLocalPlayer() ~= nil then
		Money = entities.GetLocalPlayer():GetProp( "m_iAccount" )
	end
end

local function Autobuy( Event )

	local PrimaryWeapon = Autobuy_PrimaryWeapon:GetValue()
	local SecondaryWeapon = Autobuy_SecondaryWeapon:GetValue()
	local Kevlar = Autobuy_Kevlar:GetValue()

	if Autobuy_Enable:GetValue() then

		if Event:GetName() == "round_prestart" then

			if ( Money > 2200 ) then
				-- Primary Weapon
				if PrimaryWeapon == 1 then -- Auto
					client.Command( "buy scar20", true );
				end
				if PrimaryWeapon == 2 then -- Scout
					client.Command( "buy ssg08", true );
				end
				if PrimaryWeapon == 3 then -- AWP
					client.Command( "buy awp", true );
				end
				if PrimaryWeapon == 4 then -- Rifle
					client.Command( "buy ak47; buy m4a1; buy m4a1_silencer", true );
				end
				-- Secondary Weapon
				if SecondaryWeapon == 1 then -- Dualies
					client.Command( "buy elite", true );
				end
				if SecondaryWeapon == 2 then -- Deagle/Revolver
					client.Command( "buy deagle", true );
				end

				-- Kevlar
				if Kevlar == 1 then
					client.Command( "buy vest", true );
				end
				if Kevlar == 2 then
					client.Command( "buy vesthelm", true );
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
					client.Command( "buy molotov; buy incgrenade", true );
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

			if ( Money > 199 ) then
				if Autobuy_Taser:GetValue() then
					client.Command( "buy taser", true );
				end

			end

		end

	end

end

client.AllowListener( "round_prestart" )

callbacks.Register( "Draw", "Local Player Money", LocalPlayerMoney )
callbacks.Register( "FireGameEvent", "Autobuy", Autobuy )

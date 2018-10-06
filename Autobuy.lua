local msc_ref_part_3 = gui.Reference( "MISC", "Part 3" );

local Autobuy_Groupbox = gui.Groupbox( msc_ref_part_3, "Autobuy", 0, 890, 213, 180 );

local Autobuy_Enable = gui.Checkbox( Autobuy_Groupbox, "lua_autobuy_enable", "Enable", 0 );

local Autobuy_Weapon_Groupbox = gui.Groupbox( Autobuy_Groupbox, "Weapons", 0, 30, 182, 120 );
local Autobuy_PrimaryWeapon = gui.Combobox( Autobuy_Weapon_Groupbox, "lua_autobuy_primaryweapon", "Primary", "Off", "Auto", "Scout", "AWP", "Rifle" );
local Autobuy_SecondaryWeapon = gui.Combobox( Autobuy_Weapon_Groupbox, "lua_autobuy_secondaryweapon", "Secondary", "Off", "Dualies", "Deagle/Revolver" );

local Autobuy_Equipment_Groupbox = gui.Groupbox( Autobuy_Groupbox, "Equipments", 0, 170, 182, 144 );
local Autobuy_Kevlar = gui.Combobox( Autobuy_Equipment_Groupbox, "lua_autobuy_armor", "Armor", "Off", "Kevlar", "Kevlar + Helmet" );
local Autobuy_Defuser = gui.Checkbox( Autobuy_Equipment_Groupbox, "lua_autobuy_defuser", "Defuser", 0 );
local Autobuy_Grenades = gui.Checkbox( Autobuy_Equipment_Groupbox, "lua_autobuy_grenades", "Grenades", 0 );
local Autobuy_Taser = gui.Checkbox( Autobuy_Equipment_Groupbox, "lua_autobuy_taser", "Taser", 0 );

local Money = 0

local function Autobuy( Event )

	if entities.GetLocalPlayer() ~= nil then
		Money = entities.GetLocalPlayer():GetProp( "m_iAccount" )
	end

	local PrimaryWeapon = Autobuy_PrimaryWeapon:GetValue()
	local SecondaryWeapon = Autobuy_SecondaryWeapon:GetValue()
	local Kevlar = Autobuy_Kevlar:GetValue()

	if Autobuy_Enable:GetValue() then

		if Event:GetName() == "round_prestart" then

			if ( Money > 2200 ) then
			-- Weapon Groupbox

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

			-- Weapon Groupbox End

			-- Equipment Groupbox

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

				-- Grenades
				if Autobuy_Grenades:GetValue() then
					client.Command( "buy incgrenade; buy molotov; buy hegrenade; buy smokegrenade", true );
				end

				-- Taser
				if Autobuy_Taser:GetValue() then
					client.Command( "buy taser", true );
				end

			-- Equipment Groupbox End
			end

			if ( Money > 199 ) then
				if Autobuy_Taser:GetValue() then
					client.Command( "buy taser", true );
				end

			end

		end

	end

end

client.AllowListener( "round_prestart" );

callbacks.Register( "FireGameEvent", "Autobuy", Autobuy );

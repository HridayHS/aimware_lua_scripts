local RBOT_AIMBOT_REF = gui.Reference( "RAGE", "MAIN", "Aimbot" );

local DELAY_SHOT_EXTRA_GROUPBOX = gui.Groupbox( RBOT_AIMBOT_REF, "Delay Shot Extra", 0, 492, 213, 180 );
local DELAY_SHOT_EXTRA = gui.Checkbox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot", "Enable", 0 );

local ACCURATE_UNLAG_ON_KNIFE = gui.Checkbox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_knife", "Accurate Unlag On Knife", 0 );
local ACCURATE_UNLAG_ON_TASER = gui.Checkbox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_taser", "Accurate Unlag On Taser", 0 );

local DELAY_SHOT_ON_WEAPON = gui.Checkbox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_weapon", "On Weapon", 0 );
local PISTOL_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_pistol_delayshot", "Pistol", "Off", "Accurate Unlag", "Accurate History" );
local REVOLVER_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_revolver_delayshot", "Revolver", "Off", "Accurate Unlag", "Accurate History" );
local SMG_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_smg_delayshot", "SMG", "Off", "Accurate Unlag", "Accurate History" );
local RIFLE_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_rifle_delayshot", "Rifle", "Off", "Accurate Unlag", "Accurate History" );
local SHOTGUN_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_shotgun_delayshot", "Shotgun", "Off", "Accurate Unlag", "Accurate History" );
local SCOUT_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_scout_delayshot", "Scout", "Off", "Accurate Unlag", "Accurate History" );
local AUTOSNIPER_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_autosniper_delayshot", "Auto Sniper", "Off", "Accurate Unlag", "Accurate History" );
local SNIPER_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_sniper_delayshot", "Sniper", "Off", "Accurate Unlag", "Accurate History" );
local LMG_DELAY_SHOT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_lmg_delayshot", "LMG", "Off", "Accurate Unlag", "Accurate History" );

local function WeaponDelayShot( Event )

	if DELAY_SHOT_EXTRA:GetValue() then

		if ( Event:GetName() ~= "item_equip" ) then
			return;
		end

		local ME = client.GetLocalPlayerIndex();

		local INT_UID = Event:GetInt( "userid" );
		local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );

		local WepType = Event:GetInt( "weptype" );
		local ITEM = Event:GetString( "item" );

		if ME == PlayerIndex then
			if WepType == 0 then
				Knife = true
			else
				Knife = false
			end
			if WepType == 1 then
				Pistol = true
			else
				Pistol = false
			end
			if WepType == 2 then
				SMG = true
			else
				SMG = false
			end
			if WepType == 3 then
				Rifle = true
			else
				RIFLE = false
			end
			if WepType == 4 then
				Shotgun = true
			else
				Shotgun = false
			end
			if WepType == 6 then
				LMG = true
			else
				LMG = false
			end
			if WepType == 8 then
				Taser = true
			else
				Taser = false
			end
			if ITEM == "deagle" then
				Revolver = true
			else
				Revolver = false
			end
			if ITEM == "ssg08" then
				Scout = true
			else
				Scout = false
			end
			if ITEM == "g3sg1" or ITEM == "scar20" then
				AutoSniper = true
			else
				AutoSniper = false
			end
			if ITEM == "awp" then
				Sniper = true
			else
				Sniper = false
			end
		end

		if Knife and ACCURATE_UNLAG_ON_KNIFE:GetValue() then
			gui.SetValue( "rbot_delayshot", 1 );
		end
		if Taser and ACCURATE_UNLAG_ON_TASER:GetValue() then
			gui.SetValue( "rbot_delayshot", 1 );
		end

		if DELAY_SHOT_ON_WEAPON:GetValue() then
			if Pistol then
				if PISTOL_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif PISTOL_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif PISTOL_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if Revolver then
				if REVOLVER_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif REVOLVER_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif REVOLVER_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if SMG then
				if SMG_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif SMG_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif SMG_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if Rifle then
				if RIFLE_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif RIFLE_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif RIFLE_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if Shotgun then
				if SHOTGUN_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif SHOTGUN_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif SHOTGUN_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if Scout then
				if SCOUT_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif SCOUT_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif SCOUT_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if AutoSniper then
				if AUTOSNIPER_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif AUTOSNIPER_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif AUTOSNIPER_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if Sniper then
				if SNIPER_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif SNIPER_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif SNIPER_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
			if LMG then
				if LMG_DELAY_SHOT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
				elseif LMG_DELAY_SHOT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
				elseif LMG_DELAY_SHOT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
				end
			end
		end

	end

end

callbacks.Register( "FireGameEvent", "WeaponDelayShot", WeaponDelayShot )

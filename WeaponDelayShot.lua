local SetValue = gui.SetValue;

local PISTOL_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "PISTOL", "Accuracy" ), "lua_pistol_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local REVOLVER_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "REVOLVER", "Accuracy" ), "lua_revolver_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local SMG_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "SMG", "Accuracy" ), "lua_smg_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local RIFLE_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "RIFLE", "Accuracy" ), "lua_rifle_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local SHOTGUN_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "SHOTGUN", "Accuracy" ), "lua_shotgun_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local SCOUT_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "SCOUT", "Accuracy" ), "lua_scout_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local AUTOSNIPER_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "A. SNIPER", "Accuracy" ), "lua_autosniper_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local SNIPER_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "SNIPER", "Accuracy" ), "lua_sniper_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )
local LMG_DELAY_SHOT = gui.Combobox( gui.Reference( "RAGE", "WEAPON", "LMG", "Accuracy" ), "lua_lmg_delayshot", "Delay Shot", "Off", "Accurate Unlag", "Accurate History" )

local function WeaponDelayShot( Event )

	if not gui.GetValue( "rbot_sharedweaponcfg" ) then

--[[	if PISTOL_DELAY_SHOT:GetValue() ~= 0 or REVOLVER_DELAY_SHOT:GetValue() ~= 0 or SMG_DELAY_SHOT:GetValue() ~= 0
		or RIFLE_DELAY_SHOT:GetValue() ~= 0 or SHOTGUN_DELAY_SHOT:GetValue() ~= 0 or SCOUT_DELAY_SHOT:GetValue() ~= 0
		or AUTOSNIPER_DELAY_SHOT:GetValue() ~= 0 or SNIPER_DELAY_SHOT:GetValue() ~= 0 or LMG_DELAY_SHOT:GetValue() ~= 0
		then	]]

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

		if Pistol then
			if PISTOL_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif PISTOL_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif PISTOL_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Revolver then
			if REVOLVER_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif REVOLVER_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif REVOLVER_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if SMG then
			if SMG_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif SMG_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif SMG_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Rifle then
			if RIFLE_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif RIFLE_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif RIFLE_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Shotgun then
			if SHOTGUN_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif SHOTGUN_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif SHOTGUN_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Scout then
			if SCOUT_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif SCOUT_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif SCOUT_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if AutoSniper then
			if AUTOSNIPER_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif AUTOSNIPER_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif AUTOSNIPER_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Sniper then
			if SNIPER_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif SNIPER_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif SNIPER_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if LMG then
			if LMG_DELAY_SHOT:GetValue() == 0 then SetValue( "rbot_delayshot", 0 );
			elseif LMG_DELAY_SHOT:GetValue() == 1 then SetValue( "rbot_delayshot", 1 );
			elseif LMG_DELAY_SHOT:GetValue() == 2 then SetValue( "rbot_delayshot", 2 );
			end
		end

		if Knife then
			SetValue( "rbot_delayshot", 0 );
		end
	end
end

callbacks.Register( "FireGameEvent", "WeaponDelayShot", WeaponDelayShot )

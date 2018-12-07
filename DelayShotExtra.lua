local RBOT_AIMBOT_REF = gui.Reference( "RAGE", "MAIN", "Aimbot" );

local DELAY_SHOT_EXTRA_GROUPBOX = gui.Groupbox( RBOT_AIMBOT_REF, "Delay Shot Extra", 0, 540, 213, 180 );

local DELAY_SHOT_EXTRA = gui.Checkbox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot", "Enable", 0 );

local DELAY_SHOT_SMG = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_smg", "SMG", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_RIFLE = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_rifle", "Rifle", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_SHOTGUN = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_shotgun", "Shotgun", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_SCOUT = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_scout", "Scout", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_AUTOSNIPER = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_autosniper", "Auto Sniper", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_SNIPER = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_sniper", "Sniper", "Off", "Accurate Unlag", "Accurate History" );
local DELAY_SHOT_LMG = gui.Combobox( DELAY_SHOT_EXTRA_GROUPBOX, "lua_delayshot_lmg", "LMG", "Off", "Accurate Unlag", "Accurate History" );

local function DelayShotExtra( Event )

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

		if SMG then
			if DELAY_SHOT_SMG:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_SMG:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_SMG:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if Rifle then
			if DELAY_SHOT_RIFLE:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_RIFLE:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_RIFLE:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if Shotgun then
			if DELAY_SHOT_SHOTGUN:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_SHOTGUN:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_SHOTGUN:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if Scout then
			if DELAY_SHOT_SCOUT:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_SCOUT:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_SCOUT:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if AutoSniper then
			if DELAY_SHOT_AUTOSNIPER:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_AUTOSNIPER:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_AUTOSNIPER:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if Sniper then
			if DELAY_SHOT_SNIPER:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_SNIPER:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_SNIPER:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end
		if LMG then
			if DELAY_SHOT_LMG:GetValue() == 0 then gui.SetValue( "rbot_delayshot", 0 );
			elseif DELAY_SHOT_LMG:GetValue() == 1 then gui.SetValue( "rbot_delayshot", 1 );
			elseif DELAY_SHOT_LMG:GetValue() == 2 then gui.SetValue( "rbot_delayshot", 2 );
			end
		end

	end

end

callbacks.Register( "FireGameEvent", "Delay Shot Extra", DelayShotExtra )

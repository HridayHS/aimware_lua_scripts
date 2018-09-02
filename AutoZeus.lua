local SET = gui.SetValue;

function AutoZeus( Event )
	if (Event:GetName() ~= 'item_equip') then
		return;
	end

	local ME = client.GetLocalPlayerIndex();
	local PlayerIndex = client.GetPlayerIndexByUserID;
	local INT_UID = Event:GetInt( 'userid' );
	local item = Event:GetString('item');

	if ( ME == PlayerIndex( INT_UID ) ) then

		if (item == "taser") then
			SET("rbot_active", 1); -- Ragebot Master Switch: On
			SET("rbot_enable", 1);
			SET("rbot_fov", 30);
			SET("rbot_silentaim", 1); -- Silent Aim: On
			SET("rbot_rifle_hitchance", 80); -- Zeus hitchance
			SET("rbot_speedlimit", 1); -- Speed limit: On
		else
			SET("rbot_active", 0); -- Ragebot Master Switch: Off
		end
	end
end

client.AllowListener( 'item_equip' );

callbacks.Register( "FireGameEvent", "AutoZeus", AutoZeus );

local SetValue = gui.SetValue;

local LEGIT_AIMBOT_REF = gui.Reference( "LEGIT", "Aimbot" );

local AWAutoZeus = gui.Checkbox( LEGIT_AIMBOT_REF, "lua_lbot_autozeus", "Auto Zeus", 0 );

local function AutoZeus( Event )

	if gui.GetValue("lbot_active") == true then
		
		if AWAutoZeus:GetValue() then
		
			if ( Event:GetName() ~= "item_equip" ) then
				return;
			end

			local ME = client.GetLocalPlayerIndex();
			local INT_UID = Event:GetInt( "userid" );
			local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );

			local WepType = Event:GetInt( "weptype" );
			local Item = Event:GetString( "item" );

			if ( ME == PlayerIndex ) then
				if ( Item == "taser" ) then
					SetValue("rbot_active", 1);
					SetValue("rbot_enable", 1);
					SetValue("rbot_fov", 15);
					SetValue("rbot_speedlimit", 1);
					SetValue("rbot_silentaim", 0);
					if ( gui.GetValue( "lbot_positionadjustment" ) > 0 ) then
						SetValue("rbot_positionadjustment", 5)
					else
						SetValue("rbot_positionadjustment", 0)
					end
				else
					SetValue("rbot_active", 0);
				end

			end

		end

	end

end

client.AllowListener( "item_equip" )

callbacks.Register( "FireGameEvent", "AutoZeus", AutoZeus )

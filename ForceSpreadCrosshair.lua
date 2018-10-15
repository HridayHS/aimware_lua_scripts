local VIS_MAIN_REF = gui.Reference( "VISUALS", "Main" );

local ShowSpreadCrosshair = gui.Checkbox( VIS_MAIN_REF, "lua_spreadcrosshair", "Spread Crosshair On Sniper", 0 );

local function SpreadCrosshair()

	if ShowSpreadCrosshair:GetValue() then
		if entities.GetLocalPlayer() ~= nil then
			local LocalPlayerEntity = entities.GetLocalPlayer();
			local isScoped = LocalPlayerEntity:GetPropInt( "m_bIsScoped" );
	
			local Thirdperson = gui.GetValue( "vis_thirdperson_dist" );
			local Scoperemover = gui.GetValue( "vis_scoperemover" );

			if Scoperemover ~= 1 then
				if ( isScoped == 1 or Thirdperson > 0 ) then
					client.SetConVar( "weapon_debug_spread_show", 0, true );
				else
					client.SetConVar( "weapon_debug_spread_show", 3, true );
				end
			elseif Scoperemover == 1 then
				if ( Thirdperson > 0 and isScoped == 0 ) then
					client.SetConVar( "weapon_debug_spread_show", 0, true );
				else
					client.SetConVar( "weapon_debug_spread_show", 3, true );
				end
			end
		end
	else
		client.SetConVar( "weapon_debug_spread_show", 0, true );
	end

end

callbacks.Register( "Draw", "Show Spread Crosshair", SpreadCrosshair )

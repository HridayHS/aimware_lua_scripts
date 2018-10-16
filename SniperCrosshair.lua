local VIS_MAIN_REF = gui.Reference( "VISUALS", "Main" );

local AWSniperCrosshair = gui.Checkbox( VIS_MAIN_REF, "lua_snipercrosshair", "Sniper Crosshair", 0 );

local function SniperCrosshair()

	if AWSniperCrosshair:GetValue() then
		if entities.GetLocalPlayer() ~= nil then
			local LocalPlayerEntity = entities.GetLocalPlayer();
			local Alive = LocalPlayerEntity:IsAlive();
			
			local isScoped = LocalPlayerEntity:GetPropInt( "m_bIsScoped" );
	
			local Thirdperson = gui.GetValue( "vis_thirdperson_dist" );
			local Scoperemover = gui.GetValue( "vis_scoperemover" );

			if Alive then
			if Scoperemover ~= 1 then
				if ( ( isScoped == 1 or isScoped == 257 ) or Thirdperson > 0 ) then
					client.SetConVar( "weapon_debug_spread_show", 0, true );
				else
					client.SetConVar( "weapon_debug_spread_show", 3, true );
				end
			elseif Scoperemover == 1 then
				if ( Thirdperson > 0 and ( isScoped == 0 or isScoped == 257 ) ) then
					client.SetConVar( "weapon_debug_spread_show", 0, true );
				else
					client.SetConVar( "weapon_debug_spread_show", 3, true );
				end
			end
			end
		end
	else
		client.SetConVar( "weapon_debug_spread_show", 0, true );
	end

end

callbacks.Register( "Draw", "Sniper Crosshair", SniperCrosshair )

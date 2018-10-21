local SetValue = gui.SetValue;
local GetValue = gui.GetValue;

local LBOT_EXTRA_REF = gui.Reference( "LEGIT", "Extra" );

local LBOT_ANTI_AIM_ON_PING = gui.Slider( LBOT_EXTRA_REF, "lua_lbot_antiaim_ping", "Legit Anti-Aim Off On Ping", 0, 0, 120 );

local LBOT_ANTI_AIM_MODE = GetValue( "lbot_antiaim_mode" );

local function LegitAnitAimOnPing()

	if ( GetValue( "lbot_active" ) and LBOT_ANTI_AIM_MODE ~= 0 ) then

		local LegitAnitAimOnPingValue = math.floor( LBOT_ANTI_AIM_ON_PING:GetValue() )

		if entities.GetPlayerResources() ~= nil then

			local Ping = entities.GetPlayerResources():GetPropInt( "m_iPing", client.GetLocalPlayerIndex() );	
	
			if LegitAnitAimOnPingValue > 0 then
				if Ping >= LegitAnitAimOnPingValue then
					SetValue( "lbot_antiaim_mode", 0 );	
				else
					SetValue( "lbot_antiaim_mode", LBOT_ANTI_AIM_MODE );
				end
			end

		end

	end

end

callbacks.Register( "Draw", "Legit Anit-Aim On Ping", LegitAnitAimOnPing )

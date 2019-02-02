local EngineRadarCheckbox = gui.Checkbox( gui.Reference( "VISUALS", "Shared" ), "lua_engineradar", "View enemies on radar", 0 );

local function EngineRadar()

	for index, Player in pairs( entities.FindByClass( "CCSPlayer" ) ) do
        Player:SetProp( "m_bSpotted", EngineRadar );
    end
	
	if EngineRadarCheckbox:GetValue() then
		EngineRadar = 1
	else
		EngineRadar = 0
	end
	
end

callbacks.Register( "Draw", EngineRadar )

local VIS_MAIN_REF = gui.Reference( "VISUALS", "Shared" );

local EngineRadarCheckbox = gui.Checkbox( VIS_MAIN_REF, "lua_engineradar", "Engine Radar", 0 );

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

callbacks.Register( "Draw", "Engine Radar", EngineRadar )

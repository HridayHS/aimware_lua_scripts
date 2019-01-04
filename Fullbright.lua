local VIS_MAIN_REF = gui.Reference( "VISUALS", "MISC", "World" );

local FullbrightCheckbox = gui.Checkbox( VIS_MAIN_REF, "lua_fullbright", "Full Bright", 0 );

local function Fullbright()
	
	if FullbrightCheckbox:GetValue() then
		client.SetConVar( "mat_fullbright", 1, true )
	else
		client.SetConVar( "mat_fullbright", 0, true )
	end
	
end

callbacks.Register( "Draw", "FullBrightness", Fullbright )

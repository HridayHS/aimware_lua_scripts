local VIS_MAIN_REF = gui.Reference( "VISUALS", "Main" );

local DisablePostProcessing = gui.Checkbox( VIS_MAIN_REF, "lua_disablepostprocess", "Disable Post Processing", 0 );

local function PostProcessing()

	if DisablePostProcessing:GetValue() then
		client.SetConVar( "mat_postprocess_enable", 0, true );
	else
		client.SetConVar( "mat_postprocess_enable", 1, true );
	end

end

callbacks.Register( "Draw", "Disable Post Processing", PostProcessing )

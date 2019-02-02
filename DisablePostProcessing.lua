local DisablePostProcessing = gui.Checkbox( gui.Reference( "MISC", "GENERAL", "Extra" );, "lua_disablepostprocess", "Disable Post Processing", 0 );

local function PostProcessing()

	if DisablePostProcessing:GetValue() then
		client.SetConVar( "mat_postprocess_enable", 0, true );
	else
		client.SetConVar( "mat_postprocess_enable", 1, true );
	end

end

callbacks.Register( "Draw", PostProcessing )

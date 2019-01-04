local FPS = 0.0

local VIS_MAIN_REF = gui.Reference( "VISUALS", "Shared" );

local ShowFPS = gui.Checkbox( VIS_MAIN_REF, "lua_showfps", "Show FPS", 0 );

local function GameFPS()

	if ShowFPS:GetValue() then
		FPS = 0.9 * FPS + (1.0 - 0.9) * globals.AbsoluteFrameTime();
		return math.floor((1.0 / FPS) + 0.5);
	end

end

local function DrawFPS()

	if ShowFPS:GetValue() then

		local w, h = draw.GetScreenSize();
	
		draw.Color( 255, 255, 255, 255 );
		draw.Text( 2, h - 431, "FPS:" );

		draw.Color( 50, 255, 0, 255 );
		draw.Text( 28, h - 431, GameFPS() );

	end

end

callbacks.Register( "Draw", "GameFPS", DrawFPS )

local FPS = 0.0;

local GameFPS = function()

    FPS = 0.9 * FPS + (1.0 - 0.9) * globals.AbsoluteFrameTime();
    return math.floor((1.0 / FPS) + 0.5);

end

local function DrawFPS()

	local w, h = draw.GetScreenSize();
	
	draw.Color( 255, 255, 255, 255 );
	draw.Text( 2, h - 428, "FPS:" );

	draw.Color( 150, 255, 0, 255 );
	draw.Text( 28, h - 428, GameFPS() );

end

callbacks.Register( "Draw", "GameFPS", DrawFPS )

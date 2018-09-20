function LegitAAIndicator()

	local w, h = draw.GetScreenSize();

	local LegitAA = gui.GetValue("lbot_antiaim");
	
	if ( LegitAA == 0 ) then
		draw.Text( 50, h - 464, "Off" );
	elseif ( LegitAA == 90 ) then
		draw.Text( 50, h - 464, "Left" );
	elseif ( LegitAA == 270 ) then
		draw.Text( 50, h - 464, "Right" );
	else
		draw.Text( 50, h - 464, LegitAA );
	end
	
	draw.Color( 255, 255, 255, 255 );
	draw.Text( 2, h - 464, "Legit AA:" );
	
end

callbacks.Register("Draw", "LegitAAIndicator", LegitAAIndicator)

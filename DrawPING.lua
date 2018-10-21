local function DrawPING()

	local w, h = draw.GetScreenSize();

	if entities.GetPlayerResources() ~= nil then
	
		PING = entities.GetPlayerResources():GetPropInt( "m_iPing", client.GetLocalPlayerIndex() );

		DrawPingColor();
		draw.Text( 30, h - 443, PING );

	else

		draw.Color( 255, 255, 255, 255 );
		draw.Text( 30, h - 443, "0" );

	end

	if gui.GetValue("msc_fakelatency_enable") then
		draw.Color( 0, 255, 0, 255 );
	else
		draw.Color( 255, 255, 255, 255 );
	end

	draw.Text( 2, h - 443, "PING" )

end

function DrawPingColor()

	if ( PING <= 50 ) then
		draw.Color(0, 255, 0, 255); -- Green
	elseif ( PING <= 100 ) then
		draw.Color( 50, 255, 0, 255 );
	elseif ( PING <= 200 ) then
		draw.Color( 100, 255, 0, 255 );
	elseif ( PING <= 300 ) then
		draw.Color( 150, 255, 0, 255 );
	elseif ( PING <= 400 ) then
		draw.Color( 200, 255, 0, 255 );
	elseif ( PING <= 500 ) then
		draw.Color( 255, 255, 0, 255 ); -- Orange
	elseif ( PING <= 600 ) then
		draw.Color( 255, 200, 0, 255 ); 
	elseif ( PING <= 700 ) then
		draw.Color( 255, 150, 0, 255 );
	elseif ( PING <= 800 ) then
		draw.Color( 255, 100, 0, 255 );
	elseif ( PING <= 900 ) then
		draw.Color( 255, 50, 0, 255 );
	else
		draw.Color( 255, 0, 0, 255 ); -- Red
	end
	
end

callbacks.Register( "Draw", "DrawPING", DrawPING )

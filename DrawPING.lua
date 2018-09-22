function PING()

	local w, h = draw.GetScreenSize();

	if entities.GetPlayerResources() ~= nil then
	
	local RPING = entities.GetPlayerResources():GetPropInt( "m_iPing", client.GetLocalPlayerIndex() )
	
	if ( RPING <= 50 ) then
		draw.Color(0, 255, 0, 255); -- Green
	elseif ( RPING <= 100 ) then
		draw.Color( 50, 255, 0, 255 );
	elseif ( RPING <= 200 ) then
		draw.Color( 100, 255, 0, 255 );
	elseif ( RPING <= 300 ) then
		draw.Color( 150, 255, 0, 255 );
	elseif ( RPING <= 400 ) then
		draw.Color( 200, 255, 0, 255 );
	elseif ( RPING <= 500 ) then
		draw.Color( 255, 255, 0, 255 ); -- Orange
	elseif ( RPING <= 600 ) then
		draw.Color( 255, 200, 0, 255 ); 
	elseif ( RPING <= 700 ) then
		draw.Color( 255, 150, 0, 255 );
	elseif ( RPING <= 800 ) then
		draw.Color( 255, 100, 0, 255 );
	elseif ( RPING <= 900 ) then
		draw.Color( 255, 50, 0, 255 );
	else
		draw.Color( 255, 0, 0, 255 ); -- Red
	end
	
	--draw.Color( 255, 255, 255, 255 );
	draw.Text( 30, h - 440, RPING )

	end
end

callbacks.Register( "Draw", "PING", PING )

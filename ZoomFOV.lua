local GET = gui.GetValue;
local SET = gui.SetValue;

local ME = client.GetLocalPlayerIndex();
local PlayerIndex = client.GetPlayerIndexByUserID;

local function ZoomFOV( Event )

	local INT_UID = Event:GetInt( 'userid' );
	
	if ( Event:GetName() == 'weapon_zoom' or Event:GetName() == 'weapon_zoom_rifle' ) then
	
		if ( ME == PlayerIndex( INT_UID ) ) then
			SET("vis_view_fov", 0);
		end

	else if ( Event:GetName() ~= 'weapon_zoom' or Event:GetName() ~= 'weapon_zoom_rifle' ) then

		if ( ME == PlayerIndex( INT_UID ) ) then
			SET("vis_view_fov", 110);
		end

	end
	
end

client.AllowListener( 'weapon_zoom' );
client.AllowListener( 'weapon_zoom_rifle' );

callbacks.Register( "FireGameEvent", "ZoomFOV", ZoomFOV);

local GET = gui.GetValue;
local SET = gui.SetValue;

local UserViewFov = GET("vis_view_fov");

local function ZoomFOV()
	
	if ( UserViewFov > 0 ) then
	
		if entities.GetLocalPlayer() ~= nil then

			local LocalPlayer = entities.GetLocalPlayer();
			local isScoped = LocalPlayer:GetProp( 'm_bIsScoped' );
	
			if isScoped == 1 then
				SET("vis_view_fov", 0);
			else
				SET("vis_view_fov", UserViewFov);
			end

		end

	end
	
end

callbacks.Register( "Draw", "ZoomFOV", ZoomFOV);

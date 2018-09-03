local SET = gui.SetValue;

local function ZoomFOV()
	
	local LocalPlayer = entities.GetLocalPlayer();
	local isScoped = LocalPlayer:GetProp( 'm_bIsScoped' );
	
	if isScoped == 1 then
		SET("vis_view_fov", 0);
	else
		SET("vis_view_fov", 110);
	end
	
end

callbacks.Register( "Draw", "ZoomFOV", ZoomFOV);

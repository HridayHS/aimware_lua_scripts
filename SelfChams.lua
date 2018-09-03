local GET = gui.GetValue;
local SET = gui.SetValue;

local UserChamsValue = GET("esp_self_chams");

local function SelfChams()

	if entities.GetLocalPlayer() ~= nil then
	
		local LocalPlayer = entities.GetLocalPlayer();
		local isScoped = LocalPlayer:GetProp( 'm_bIsScoped' );
	
		if isScoped == 1 then
			SET("esp_self_chams", 0);
		else
			SET("esp_self_chams", UserChamsValue);
		end

	end

end

callbacks.Register( "Draw", "SelfChams", SelfChams);

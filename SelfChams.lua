local GetValue = gui.GetValue;
local SetValue = gui.SetValue;

local UserChamsValue = GetValue( "esp_self_chams" );

local function SelfChams()

	if entities.GetLocalPlayer() ~= nil then

		local LocalPlayer = entities.GetLocalPlayer();
		local isScoped = LocalPlayer:GetProp( "m_bIsScoped" );

		if isScoped == 1 or isScoped == 257 then
			SetValue( "esp_self_chams", 0 );
		else
			SetValue( "esp_self_chams", UserChamsValue );
		end

	end

end

callbacks.Register( "Draw", "SelfChams", SelfChams);

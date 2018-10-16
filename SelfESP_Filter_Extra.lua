local GetValue = gui.GetValue;
local SetValue = gui.SetValue;

local VIS_SELF_FILTER_REF = gui.Reference( "VISUALS", "YOURSELF", "Filter" );

local SelfESP_Combobox = gui.Combobox( VIS_SELF_FILTER_REF, "lua_filter_self_extra", "ESP When Scoped In", "Off", "Off Chams", "Off Glow", "On Glow", "Off Chams + On Glow", "Off Filter" );

local UserSelfChamsValue = GetValue( "esp_self_chams" );
local UserSelfGlowValue = GetValue( "esp_self_glow" );

local function SelfESP_Filter()

if entities.GetLocalPlayer() ~= nil then

	local LocalPlayer = entities.GetLocalPlayer();
	local isScoped = LocalPlayer:GetProp( "m_bIsScoped" );

	if SelfESP_Combobox:GetValue() ~= 0 then

		if SelfESP_Combobox:GetValue() == 1 then
			if isScoped == 1 or isScoped == 257 then
				SetValue( "esp_self_chams", 0 );
		else
				SetValue( "esp_self_chams", UserSelfChamsValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 2 and UserSelfGlowValue ~= 0 then
			if isScoped == 1 or isScoped == 257 then
				SetValue( "esp_self_glow", 0 );
			else
				SetValue( "esp_self_glow", UserSelfGlowValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 3 and UserSelfGlowValue == 0 then
			if isScoped == 1 or isScoped == 257 then
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_glow", 0 );
			end
		end

		if SelfESP_Combobox:GetValue() == 4 then
			if isScoped == 1 or isScoped == 257 then
				SetValue( "esp_self_chams", 0 );
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_chams", UserSelfChamsValue );
				SetValue( "esp_self_glow", UserSelfGlowValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 5 then
			if isScoped == 1 or isScoped == 257 then
				SetValue( "esp_filter_self", 0 );
			else
				SetValue( "esp_filter_self", 1 );
			end
		end

	end
end

end

callbacks.Register( "Draw", "Self ESP Filter", SelfESP_Filter )

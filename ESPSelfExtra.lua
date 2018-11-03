local SetValue = gui.SetValue;

local VIS_SELF_FILTER_REF = gui.Reference( "VISUALS", "YOURSELF", "Filter" );

local ESP_SELF_EXTRA_COMBOBOX = gui.Combobox( VIS_SELF_FILTER_REF, "lua_filter_self_extra", "When Scoped In", "Off", "Glow Off", "Glow On", "Chams Off", "Chams Off + Glow Off", "Chams Off + Glow On", "Filter Off" );
local ESP_SELF_EXTRA_CHAMS = gui.Combobox( VIS_SELF_FILTER_REF, "lua_filter_self_chams", "When Scoped Out Chams", "Off", "Color", "Metallic" );
local ESP_SELF_EXTRA_GLOW = gui.Combobox( VIS_SELF_FILTER_REF, "lua_filter_self_glow", "When Scoped Out Glow", "Off", "Team Color", "Health Color" );

local function AW_ESP_SELF_EXTRA()

	local ESP_SELF_EXTRA = ESP_SELF_EXTRA_COMBOBOX:GetValue();

 	if ESP_SELF_EXTRA_CHAMS:GetValue() == 0 then
		CHAMS_VALUE = 0
	elseif ESP_SELF_EXTRA_CHAMS:GetValue() == 1 then
		CHAMS_VALUE = 1
	elseif ESP_SELF_EXTRA_CHAMS:GetValue() == 2 then
		CHAMS_VALUE = 6
	end
	if ESP_SELF_EXTRA_GLOW:GetValue() == 0 then
		GLOW_VALUE = 0
	elseif ESP_SELF_EXTRA_GLOW:GetValue() == 1 then
		GLOW_VALUE = 1
	elseif ESP_SELF_EXTRA_GLOW:GetValue() == 2 then
		GLOW_VALUE = 2
	end

	if entities.GetLocalPlayer() ~= nil then
		local LocalPlayer = entities.GetLocalPlayer();
		local m_bIsScoped = LocalPlayer:GetProp( "m_bIsScoped" );
		if m_bIsScoped == 1 or m_bIsScoped == 257 then
			isScoped = true
		else
			isScoped = false
		end
	end

	if ESP_SELF_EXTRA ~= 0 then
	
	SetValue( "esp_self_chams", CHAMS_VALUE );
	SetValue( "esp_self_glow", GLOW_VALUE );

		if ESP_SELF_EXTRA == 1 and GLOW_VALUE ~= 0 then
			if isScoped then
				SetValue( "esp_self_glow", 0 );
			else
				SetValue( "esp_self_glow", GLOW_VALUE );
			end
		end

		if ESP_SELF_EXTRA == 2 and GLOW_VALUE == 0 then
			if isScoped then
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_glow", 0 );
			end
		end

		if ESP_SELF_EXTRA == 3 then
			if isScoped then
				SetValue( "esp_self_chams", 0 );
		else
				SetValue( "esp_self_chams", CHAMS_VALUE );
			end
		end

		if ESP_SELF_EXTRA == 4 then
			if isScoped then
				SetValue( "esp_self_chams", 0 );
				SetValue( "esp_self_glow", 0 );
			else
				SetValue( "esp_self_chams", CHAMS_VALUE );
				SetValue( "esp_self_glow", GLOW_VALUE );
			end
		end

		if ESP_SELF_EXTRA == 5 then
			if isScoped then
				SetValue( "esp_self_chams", 0 );
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_chams", CHAMS_VALUE );
				SetValue( "esp_self_glow", GLOW_VALUE );
			end
		end

		if ESP_SELF_EXTRA == 6 then
			if isScoped then
				SetValue( "esp_filter_self", 0 );
			else
				SetValue( "esp_filter_self", 1 );
			end
		end

	end

end

callbacks.Register( "Draw", "Self ESP Extra Options", AW_ESP_SELF_EXTRA )

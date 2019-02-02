local VIS_OTHER_OPTIONS_REF = gui.Reference( "VISUALS", "OTHER", "Options" );

local ChickenTheme_Combobox = gui.Combobox( VIS_OTHER_OPTIONS_REF, "lua_chickentheme", "Chicken Theme", "Off", "Ghost Chicken", "Festive Chicken", "Easter Chicken", "Jack-o-Chicken", "Party Chicken" );
local ChickenSkin_Combobox = gui.Combobox( VIS_OTHER_OPTIONS_REF, "lua_chickenskin", "Chicken Skin", "White", "Red" );

local ChickenAntiAim = gui.Checkbox( VIS_OTHER_OPTIONS_REF, "lua_chicken_antiaim", "Chicken Anti-Aim", 0 );
local ChickenPartyMode = gui.Checkbox( VIS_OTHER_OPTIONS_REF, "lua_chicken_partymode", "Chicken Party Mode", 0 );

local ChickenScale_Slider = gui.Slider( VIS_OTHER_OPTIONS_REF, "lua_chickenscale", "Chicken Scale", 1.0, 1.0, 5.0 );

local function ChickenExtra()

	if gui.GetValue( "esp_active" ) then

		local Chickens = entities.FindByClass( "CChicken" );
		local ChickenScale = ChickenScale_Slider:GetValue();

		-- Chicken Theme
		if ChickenTheme_Combobox:GetValue() == 0 then
			ChickenTheme = 0
		elseif ChickenTheme_Combobox:GetValue() == 1 then
			ChickenTheme = 2
		elseif ChickenTheme_Combobox:GetValue() == 2 then
			ChickenTheme = 3
		elseif ChickenTheme_Combobox:GetValue() == 3 then
			ChickenTheme = 4
		elseif ChickenTheme_Combobox:GetValue() == 4 then
			ChickenTheme = 5
		elseif ChickenTheme_Combobox:GetValue() == 5 then
			ChickenTheme = 1
		end

		-- Chicken Skin
		if ChickenSkin_Combobox:GetValue() == 0 then
			ChickenSkin = 0
		elseif ChickenSkin_Combobox:GetValue() == 1 then
			ChickenSkin = 1
		end
	
		for i=1, #Chickens do
			local Chicken = Chickens[i]

			Chicken:SetProp( "m_nSkin", ChickenSkin );
			Chicken:SetProp( "m_nBody", ChickenTheme );
			Chicken:SetProp( "m_flModelScale", ChickenScale );
		end

		if ChickenAntiAim:GetValue() then
			for i=1, #Chickens do
				local Chicken = Chickens[i]
				
				Chicken:SetProp( "m_nSequence", -509 );

			end
		end

		if ChickenPartyMode:GetValue() then
			client.SetConVar( "sv_party_mode", 1, true )
		else
			client.SetConVar( "sv_party_mode", 0, true )
		end

	end

end

callbacks.Register( "Draw", ChickenExtra )

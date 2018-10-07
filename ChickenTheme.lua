local VIS_OTHER_OPTIONS_REF = gui.Reference( "VISUALS", "OTHER", "Options" );

local ChickenTheme_Combobox = gui.Combobox( VIS_OTHER_OPTIONS_REF, "lua_chickentheme", "Chicken Theme", "Default", "Ghost Chicken", "Festive Chicken", "Easter Chicken", "Jack-o-Chicken", "Party Chicken" );
local ChickenSkin_Combobox = gui.Combobox( VIS_OTHER_OPTIONS_REF, "lua_chickenskin", "Chicken Skin", "White", "Red" );

local ChickenScale_Slider = gui.Slider( VIS_OTHER_OPTIONS_REF, "lua_chickenscale", "Chicken Scale", 1.0, 1.0, 5.0 );

local function ExtraChickenOptions()

	local Chickens = entities.FindByClass( "CChicken" );
	local ChickenScale = ChickenScale_Slider:GetValue();
	
	for i=1, #Chickens do
	
		local Chicken = Chickens[i]  
		
		Chicken:SetProp( "m_nSkin", ChickenSkin );
		Chicken:SetProp( "m_nBody", ChickenTheme );
		Chicken:SetProp( "m_flModelScale", ChickenScale );

	end
	
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
	-- End Chicken Theme
	
	-- Chicken Skin
	if ChickenSkin_Combobox:GetValue() == 0 then
		ChickenSkin = 0
	end
	if ChickenSkin_Combobox:GetValue() == 1 then
		ChickenSkin = 1
	end
	-- End Chicken Skin
	
end

callbacks.Register( "Draw", "Chicken Theme", ExtraChickenOptions )

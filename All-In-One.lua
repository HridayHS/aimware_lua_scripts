local GetValue = gui.GetValue;
local SetValue = gui.SetValue;

local msc_ref_part_3 = gui.Reference( "MISC", "Part 3" );

--[[ 
Extra Part 2 Groupbox 
]]

local Extra_Part_2_Groupbox = gui.Groupbox( msc_ref_part_3, "Extra Part 2", 0, 890, 215, 264 );

-- Autobuy
local Autobuy_Combobox = gui.Combobox( Extra_Part_2_Groupbox, "msc_autobuy", "Autobuy", "Off", "Auto", "Scout" );

local function Autobuy( Event )

if Autobuy_Combobox:GetValue() ~= 0 then

	if Event:GetName() == "round_prestart" then
	
		-- Auto
		if msc_autobuy:GetValue() == 1 then
			client.Command("buy scar20; buy deagle; buy vest; buy vesthelm; buy incgrenade; buy molotov; buy hegrenade; buy smokegrenade; buy taser; buy defuser", true)
		end

		-- Scout
		if msc_autobuy:GetValue() == 2 then
			client.Command("buy ssg08; buy deagle; buy vest; buy vesthelm; buy incgrenade; buy molotov; buy hegrenade; buy smokegrenade; buy taser; buy defuser", true)
		end
	end
end

end

client.AllowListener( "round_prestart" )
callbacks.Register( "FireGameEvent", "Autobuy", Autobuy)
-- End Autobuy

-- Disable Post Proc
local PostProc_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "msc_postproc", "No Post Processing", 0 );

local function PostProc()

	if PostProc_Checkbox:GetValue() then
		client.SetConVar( "mat_postprocess_enable", 0, true );
	else
		client.SetConVar( "mat_postprocess_enable", 1, true );
	end

end

callbacks.Register( "Draw", "Disable Post Processing", PostProc )
-- End Disable Post Proc

-- Engine Radar
local EngineRadar_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "msc_engine_radar", "Engine Radar", 0 );

local function EngineRadar()

	for index, Player in pairs( entities.FindByClass( "CCSPlayer" ) ) do
        Player:SetProp( "m_bSpotted", EngineRadar );
    end
	
	if EngineRadar_Checkbox:GetValue() then
		EngineRadar = 1
	else
		EngineRadar = 0
	end
	
end

callbacks.Register( "Draw", "Engine Radar", EngineRadar )
-- End Engine Radar

-- Fullbrightness
local Fullbright_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "msc_fullbright", "Full Bright", 0 );

local function Fullbright()
	
	if Fullbright_Checkbox:GetValue() then
		client.SetConVar( "mat_fullbright", 1, true )
	else
		client.SetConVar( "mat_fullbright", 0, true )
	end
	
end

callbacks.Register( "Draw", "FullBrightness", Fullbright )
-- End Fullbrightness

-- Force Double Zoom
local ForceDoubleZoom_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "vis_force_double_zoom", "Force Double Zoom", 0 );

local UserViewFov = GetValue( "vis_view_fov" );

local function ForceDoubleZoom()

if ForceDoubleZoom_Checkbox:GetValue() then

	if ( UserViewFov > 0 ) then
	
		if entities.GetLocalPlayer() ~= nil then

			local LocalPlayer = entities.GetLocalPlayer();
			local isScoped = LocalPlayer:GetProp( "m_bIsScoped" );
	
			if isScoped == 1 then
				SetValue( "vis_view_fov", 0 );
			else
				SetValue( "vis_view_fov", UserViewFov );
			end

		end

	end

end

end

callbacks.Register( "Draw", "Force Double Zoom", ForceDoubleZoom )
-- End Force Double Zoom

-- Force Show Default Crosshair
local DefaultCrosshair_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "vis_defaultcrosshair", "Default Crosshair", 0 );

local function DefaultCrosshair()

if DefaultCrosshair_Checkbox:GetValue() then
	if entities.GetLocalPlayer() ~= nil then
		local LocalPlayerEntity = entities.GetLocalPlayer();
		local isScoped = LocalPlayerEntity:GetPropInt( "m_bIsScoped" );

		local Thirdperson = gui.GetValue( "vis_thirdperson_dist" );
		local Scoperemover = gui.GetValue( "vis_scoperemover" );

		if Scoperemover ~= 1 then
			if ( isScoped == 1 or Thirdperson > 0 ) then
				client.SetConVar( "weapon_debug_spread_show", 0, true );
			else
				client.SetConVar( "weapon_debug_spread_show", 3, true );
			end
		elseif Scoperemover == 1 then
			if ( Thirdperson > 0 and isScoped == 0 ) then
				client.SetConVar( "weapon_debug_spread_show", 0, true );
			else
				client.SetConVar( "weapon_debug_spread_show", 3, true );
			end
		end
	end
else
	client.SetConVar( "weapon_debug_spread_show", 0, true );
end
end

callbacks.Register( "Draw", "Show Default Crosshair", DefaultCrosshair )
-- End Force Show Default Crosshair

-- Chicken Death Say
local ChickenDeathSay_Checkbox = gui.Checkbox( Extra_Part_2_Groupbox, "msc_chicken_deathsay", "Chicken Death Say", 0 );

local function ChickenDeathSay( Event, Entity )

if ChickenDeathSay_Checkbox:GetValue() then

	if Event:GetName() ~= nil then

	local UID = Event:GetInt( "userid" );  
	
	local Killer_INT = Event:GetInt( "attacker" ); 
	local Killer_Name = client.GetPlayerNameByUserID( Killer_INT ); 
	
	local Weapon = Event:GetString( "weapon" );
	local Locate = entities.FindByClass( "CBasePlayer" );

		for i = 1, #Locate do
			local Location = Locate[i]:GetPropString( "m_szLastPlaceName" );

			if Location == nil then 
				Location = "Unknown"; 
			end

			chatsay = string.format( "%s murdered a chicken with the %s at %s!", Killer_Name, Weapon, Location )

			if ( Event:GetName() == "other_death" ) then
				client.ChatSay(chatsay)
			end
		end
	end
end

end

client.AllowListener( "other_death" )
callbacks.Register( "FireGameEvent", "Chicken Death Say", ChickenDeathSay )
-- End Chicken Death Say

-- Self player ESP
local SelfESP_Combobox = gui.Combobox( Extra_Part_2_Groupbox, "esp_self_extra", "Self ESP When Scoped In", "Off", "Off Chams", "Off Glow", "On Glow", "Off Chams + On Glow", "Off Filter" );

local UserSelfChamsValue = GetValue( "esp_self_chams" );
local UserSelfGlowValue = GetValue( "esp_self_glow" );

local function SelfESP()

if entities.GetLocalPlayer() ~= nil then

	local LocalPlayer = entities.GetLocalPlayer();
	local isScoped = LocalPlayer:GetProp( "m_bIsScoped" );

	if SelfESP_Combobox:GetValue() ~= 0 then

		if SelfESP_Combobox:GetValue() == 1 then
			if isScoped == 1 then
				SetValue( "esp_self_chams", 0 );
		else
				SetValue( "esp_self_chams", UserSelfChamsValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 2 and UserSelfGlowValue ~= 0 then
			if isScoped == 1 then
				SetValue( "esp_self_glow", 0 );
			else
				SetValue( "esp_self_glow", UserSelfGlowValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 3 and UserSelfGlowValue == 0 then
			if isScoped == 1 then
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_glow", 0 );
			end
		end

		if SelfESP_Combobox:GetValue() == 4 then
			if isScoped == 1 then
				SetValue( "esp_self_chams", 0 );
				SetValue( "esp_self_glow", 1 );
			else
				SetValue( "esp_self_chams", UserSelfChamsValue );
				SetValue( "esp_self_glow", UserSelfGlowValue );
			end
		end

		if SelfESP_Combobox:GetValue() == 5 then
			if isScoped == 1 then
				SetValue( "esp_filter_self", 0 );
			else
				SetValue( "esp_filter_self", 1 );
			end
		end

	end
end

end

callbacks.Register( "Draw", "Self ESP", SelfESP )
-- End Self player ESP

--[[
Extra Part 2 End
]]

--[[ 
Chicken Theme Groupbox
]]

local ChickenTheme_Groupbox = gui.Groupbox( msc_ref_part_3, "Chicken Theme", 0, 1168, 215, 168 );

local ChickenTheme_Combobox = gui.Combobox( ChickenTheme_Groupbox, "vis_ChickenTheme_Combobox", "Chicken Theme", "Default", "Ghost Chicken", "Festive Chicken", "Easter Chicken", "Jack-o-Chicken", "Party Chicken" );
local ChickenSkin_Combobox = gui.Combobox( ChickenTheme_Groupbox, "vis_ChickenSkin_Combobox", "Chicken Skin", "White", "Red" );

local ChickenScale_Slider = gui.Slider( ChickenTheme_Groupbox, "vis_chicken_scale", "Chicken Scale", 1.0, 0.5, 5.0 );

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

--[[
Chicken Theme Groupbox End
]]

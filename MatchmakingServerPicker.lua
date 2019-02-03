local MSC_GENERAL_MAIN_REF = gui.Reference( "MISC", "GENERAL", "Main" );

local MMServerPicker_Text = gui.Text( MSC_GENERAL_MAIN_REF, "Matchmaking Server Picker" );
local MMServerPicker_Editbox = gui.Editbox( MSC_GENERAL_MAIN_REF, "lua_matchmaking_picker", "" );

local function MMServerPIcker()

	if gui.GetValue( "msc_active" ) ~= false then

		if MMServerPicker_Editbox:GetValue() == "" then
			client.Command( "sdr ClientForceRelayCluster " .. "\"\"", true );
		elseif MMServerPicker_Editbox:GetValue() ~= "" then
			client.Command( "sdr ClientForceRelayCluster " .. MMServerPicker_Editbox:GetValue(), true );
		end

	end

end

callbacks.Register( "Draw", MMServerPIcker )

-- Matchmaking Server List

local MM_ServerList_WindowCheckbox = gui.Checkbox( MSC_GENERAL_MAIN_REF, "lua_matchmaking_serverlist", "Matchmaking Server List", 0 );

local MMServerList_WND = gui.Window( "lua_wnd_matchmaking_serverlist", "Matchmaking Server List", 0, 0, 271, 670 );

-- Africa
local MMServerList_Africa = gui.Groupbox( MMServerList_WND, "Africa", 18, 16, 235, 54 );
local MMServerList_Africa_ServerList = gui.Text( MMServerList_Africa, "Johannesburg (Africa South) -> jnb" );

-- Asia
local MMServerList_Asia = gui.Groupbox( MMServerList_WND, "Asia", 18, 88, 235, 100 );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Beijing (Asia North-East) -> tsnt" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Bombay (India West) -> bom" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Cangzhou (Asia North-East) -> pwj" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Chennai (India South-East) -> maa" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Dongcheng Qu (Asia Central) -> pwu" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Dubai (Middle-East) -> dxb" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Guangzhou 1 (Asia East) -> canm" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Guangzhou 2 (Asia East) -> cant" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Guangzhou 3 (Asia East) -> canu" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Guangzhou 4 (Asua East) -> pwg" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Hong Kong (Asia East) -> hkg" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Hongshan Qu (Asia South-East) -> pww" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Huangpu Qu (Asia East) -> pwt" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Manilla (Asia South-East) -> man" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Qingcheng (Asia East) -> can" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Shanghai 1 (Asia East) -> sha" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Shanghai 2 (Asia East) -> shau" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Singapore (Asia South-East) -> sgp" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Tianjin 1 (Asia North-East) -> tsnm" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Tianjin 2 (Asia North-East) -> tsnu" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Tokyo 1 (Asia East) -> tyo" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Tokyo 2 (Asia East) -> tyo1" );
local MMServerList_Asia_ServerList = gui.Text( MMServerList_Asia, "Xianghe Xian (Asia North-East) -> tsn" );

-- Australia
local MMServerList_Australia = gui.Groupbox( MMServerList_WND, "Australia", 18, 208, 235, 54 );
local MMServerList_Australia_ServerList = gui.Text( MMServerList_Australia, "Sydney (Australia South-East) -> syd" );

-- Europe
local MMServerList_Europe = gui.Groupbox( MMServerList_WND, "Europe", 18, 280, 235, 100 );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Amsterdam (EU West) -> ams" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Frankfurt (EU West) -> fra" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Hamina (EU North) -> ghel" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "London (EU North) -> lhr" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Luxembourg (EU West) -> lux" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Madrid (EU South) -> mad" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Paris (EU West) -> par" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Stockholm (Bromma) (EU North) -> sto2" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Stockholm (Kista) (EU North) -> sto" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Vienna (EU Central) -> vie" );
local MMServerList_Europe_ServerList = gui.Text( MMServerList_Europe, "Warsaw (EU Central) -> waw" );

-- North America
local MMServerList_NorthAmerica = gui.Groupbox( MMServerList_WND, "North America", 18, 398, 235, 100 );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Atlanta (US East) -> atl" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Chicago (US Central) -> ord" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Los Angeles (US West) -> lax" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Moses Lake 1 (US Central) -> eat" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Moses Lake 2 (US Central) -> mwh" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Oklahoma City (US Central) -> okc" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Seattle (US North-West) -> sea" );
local MMServerList_NorthAmerica_ServerList = gui.Text( MMServerList_NorthAmerica, "Sterling (US East) -> iad" );

-- South America
local MMServerList_SouthAmerica = gui.Groupbox( MMServerList_WND, "South America", 18, 516, 235, 100 );
local MMServerList_SouthAmerica_ServerList = gui.Text( MMServerList_SouthAmerica, "Lima (SA West) -> lim" );
local MMServerList_SouthAmerica_ServerList = gui.Text( MMServerList_SouthAmerica, "Sao Paulo 1 (SA East) -> gru" );
local MMServerList_SouthAmerica_ServerList = gui.Text( MMServerList_SouthAmerica, "Sao Paulo 2 (SA East) -> ggru" );
local MMServerList_SouthAmerica_ServerList = gui.Text( MMServerList_SouthAmerica, "Santiago (SA South-West) -> scl" );

local WindowToggle = 1;

local function MMServerList()

	local MenuKey = gui.GetValue( "msc_menutoggle" );

	if input.IsButtonPressed( MenuKey ) then
		WindowToggle = WindowToggle == 0 and 1 or 0
	end
	
	if MM_ServerList_WindowCheckbox:GetValue() then
		MMServerList_WND:SetActive(WindowToggle);
	else
		MMServerList_WND:SetActive(0)
	end

end

callbacks.Register( "Draw", MMServerList )

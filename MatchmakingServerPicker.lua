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

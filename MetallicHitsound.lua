local MSC_PART_3_REF = gui.Reference( "MISC", "Part 3" );

local MetallicHitsound = gui.Checkbox( MSC_PART_3_REF, "lua_metallichitsound", "Metallic Hitsound", 0 );

local function MetallicHitsound( Event )

	if MetallicHitsound:GetValue() then

		if gui.GetValue( "msc_hitmarker_enable" ) then
			gui.SetValue( "msc_hitmarker_volume", 0 );
		end

		if ( Event:GetName() == "player_hurt" ) then

			local ME = client.GetLocalPlayerIndex();

			local INT_UID = Event:GetInt( "userid" );
			local INT_ATTACKER = Event:GetInt( "attacker" );

			local NAME_Victim = client.GetPlayerNameByUserID( INT_UID );
			local INDEX_Victim = client.GetPlayerIndexByUserID( INT_UID );

			local NAME_Attacker = client.GetPlayerNameByUserID( INT_ATTACKER );
			local INDEX_Attacker = client.GetPlayerIndexByUserID( INT_ATTACKER );

			if ( INDEX_Attacker == ME and INDEX_Victim ~= ME ) then
				client.Command( "play buttons\\arena_switch_press_02.wav", true );
			end
	 
		end
	
	end

end

client.AllowListener( "player_hurt" );

callbacks.Register( "FireGameEvent", "Metallic Hitsound", MetallicHitsound );

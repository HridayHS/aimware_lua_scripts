local SetValue = gui.SetValue;

local MSC_PART_2_REF = gui.Reference( "MISC", "Part 2" );

local FAKELAG_ON_KNIFE = gui.Checkbox( MSC_PART_2_REF, "lua_fakelagonknife", "Disable Fakelag On Knife", 0 );

local function FakelagOnKnife( Event )

	if FAKELAG_ON_KNIFE:GetValue() then

		if ( Event:GetName() ~= "item_equip" ) then
			return;
		end

		local ME = client.GetLocalPlayerIndex();
		local INT_UID = Event:GetInt( "userid" );
		local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );
		local WepType = Event:GetInt( "weptype" );
		local Item = Event:GetString( "item" );
	
		if ( ME == PlayerIndex ) then

			if ( WepType == 0 ) then
				SetValue( "msc_fakelag_enable", false );
			else
				SetValue( "msc_fakelag_enable", true );
			end

		end

	end

end

client.AllowListener( "item_equip" );

callbacks.Register( "FireGameEvent", "Disable Fakelag On Knife", FakelagOnKnife );

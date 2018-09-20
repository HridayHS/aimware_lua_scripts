local SET = gui.SetValue;

function FakelagOnKnife( Event )

	if (Event:GetName() ~= 'item_equip') then
		return;
	end

	local ME = client.GetLocalPlayerIndex();
	local PlayerIndex = client.GetPlayerIndexByUserID;
	local INT_UID = Event:GetInt( 'userid' );
	local WepType = Event:GetInt( 'weptype' );

	if ( ME == PlayerIndex( INT_UID ) ) then

		if ( WepType == 0 ) then
			SET("msc_fakelag_enable", false);
		else
			SET("msc_fakelag_enable", true);
		end
		
	end
end

client.AllowListener( 'item_equip' );

callbacks.Register( 'FireGameEvent', 'FakelagOnKnife', FakelagOnKnife );

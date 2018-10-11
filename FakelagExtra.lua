local SetValue = gui.SetValue;

local MSC_PART_2_REF = gui.Reference( "MISC", "Part 2" );

local FAKELAG_EXTRA_GROUPBOX = gui.Groupbox( MSC_PART_2_REF, "Fakelag Extra", 0, 888, 213, 180 );
local FAKELAG_EXTRA_GROUPBOX_CHECKBOX = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagextra_enable", "Activate", 0 );

local FAKELAG_ON_KNIFE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagonknife", "Disable On Knife", 0 );
local FAKELAG_ON_TASER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagontaser", "Disable On Taser", 0 );
local FAKELAG_ON_GRENADE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagongrenade", "Disable On Grenade", 0 );

local FAKELAG_ON_PISTOL = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagonpistol", "Disable On Pistol", 0 );

local function FakelagExtra( Event )

	if FAKELAG_EXTRA_GROUPBOX_CHECKBOX:GetValue() then

		if ( Event:GetName() ~= "item_equip" ) then
			return;
		end

		local ME = client.GetLocalPlayerIndex();
		local INT_UID = Event:GetInt( "userid" );
		local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );

		local WepType = Event:GetInt( "weptype" );
		local Item = Event:GetString( "item" );

		if ME == PlayerIndex then
			if ( FAKELAG_ON_KNIFE:GetValue() and WepType == 0 ) or -- On Knife
			   ( FAKELAG_ON_TASER:GetValue() and WepType == 8 ) or -- On Taser
			   ( FAKELAG_ON_GRENADE:GetValue() and WepType == 9 ) or -- On Grenade
			   ( FAKELAG_ON_PISTOL:GetValue() and WepType == 1 ) then -- On Pistol
				SetValue( "msc_fakelag_enable", 0 );
			else
				SetValue( "msc_fakelag_enable", 1 );
			end
		end

	end

end

client.AllowListener( "item_equip" );

callbacks.Register( "FireGameEvent", "Extra Fakelag Options", FakelagExtra );

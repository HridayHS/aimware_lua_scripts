local SetValue = gui.SetValue;

local MSC_PART_2_REF = gui.Reference( "MISC", "Part 2" );

local FAKELAG_EXTRA_GROUPBOX = gui.Groupbox( MSC_PART_2_REF, "Fakelag Extra", 0, 888, 213, 180 );
local FAKELAG_EXTRA_GROUPBOX_CHECKBOX = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagextra_enable", "Activate", 0 );

local FAKELAG_ON_KNIFE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagonknife", "Disable On Knife", 0 );
local FAKELAG_ON_TASER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagontaser", "Disable On Taser", 0 );
local FAKELAG_ON_GRENADE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagongrenade", "Disable On Grenade", 0 );
local FAKELAG_ON_PISTOL = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagonpistol", "Disable On Pistol", 0 );

local FAKELAG_SMART_MODE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelagsmartmode", "Smart Fakelag Mode", 0 );
local FAKELAG_SMART_MODE_STANDING = gui.Comboox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_standing", "While Standing", "Off", "Factor", "Switch", "Adaptive", "Random", "Rapid Peek" );
local FAKELAG_SMART_MODE_RUNNING = gui.Comboox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_running", "While Running", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );
local FAKELAG_SMART_MODE_INAIR = gui.Comboox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_inair", "In Air", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );

local function FakelagExtra( Event )

	if FAKELAG_EXTRA_GROUPBOX_CHECKBOX:GetValue() then

		if ( Event:GetName() ~= "item_equip" ) then
			return;
		end

		local ME = client.GetLocalPlayerIndex();
		local INT_UID = Event:GetInt( "userid" );
		local PlayerIndex = client.GetPlayerIndexByUserID( INT_UID );

		local WepType = Event:GetInt( "weptype" );
		local ITEM = Event:GetString( "item" );

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

		-- Smart Fakelag Mode
		if FAKELAG_SMART_MODE:GetValue() then
			if entities.GetLocalPlayer() ~= nil then

				local FAKELAG_STANDING = FAKELAG_SMART_MODE_STANDING:GetValue();
				local FAKELAG_RUNNING = FAKELAG_SMART_MODE_RUNNING:GetValue();
				local FAKELAG_INAIR = FAKELAG_SMART_MODE_INAIR:GetValue();

				local LocalPlayerEntity = entities.GetLocalPlayer();
				local fFlags = LocalPlayerEntity:GetProp( "m_fFlags" );

				local VelocityX = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[0]" );
				local VelocityY = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[1]" );
				local Velocity = math.sqrt( VelocityX^2 + VelocityY^2 );

				-- Standing
				if ( Velocity == 0 and fFlags == 257 ) then
					Standing = true;
				else
					Standing = false;
				end

				-- Running
				if ( Velocity > 0 and fFlags == 257 ) then
					Running = true;
				else
					Running = false;
				end

				-- In Air
				if fFlags == 256 then
					InAir = true;
				else
					InAir = false;
				end

			end

			if Standing then
				SetValue( "msc_fakelag_mode", STANDING_MODE );
				if FAKELAG_STANDING == 0 then
					SetValue( "msc_fakelag_enable", 0 );
				elseif FAKELAG_STANDING == 1 then
					STANDING_MODE = 0
				elseif FAKELAG_STANDING == 2 then
					STANDING_MODE = 1
				elseif FAKELAG_STANDING == 3 then
					STANDING_MODE = 2
				elseif FAKELAG_STANDING == 4 then
					STANDING_MODE = 3
				elseif FAKELAG_STANDING == 5 then
					STANDING_MODE = 5
				end
			end

			if Running then
				SetValue( "msc_fakelag_mode", RUNNING_MODE );
				if FAKELAG_RUNNING == 0 then
					SetValue( "msc_fakelag_enable", 0 );
				elseif FAKELAG_RUNNING == 1 then
					RUNNING_MODE = 0
				elseif FAKELAG_RUNNING == 2 then
					RUNNING_MODE = 1
				elseif FAKELAG_RUNNING == 3 then
					RUNNING_MODE = 2
				elseif FAKELAG_RUNNING == 4 then
					RUNNING_MODE = 3
				elseif FAKELAG_RUNNING == 5 then
					RUNNING_MODE = 4
				elseif FAKELAG_RUNNING == 6 then
					RUNNING_MODE = 5
				end
			end

			if InAir then
				SetValue( "msc_fakelag_mode", INAIR_MODE );
				if FAKELAG_INAIR == 0 then
					SetValue( "msc_fakelag_enable", 0 );
				elseif FAKELAG_INAIR == 1 then
					INAIR_MODE = 0
				elseif FAKELAG_INAIR == 2 then
					INAIR_MODE = 1
				elseif FAKELAG_INAIR == 3 then
					INAIR_MODE = 2
				elseif FAKELAG_INAIR == 4 then
					INAIR_MODE = 3
				elseif FAKELAG_INAIR == 5 then
					INAIR_MODE = 4
				elseif FAKELAG_INAIR == 6 then
					INAIR_MODE = 5
				end
			end

		end
	end

end

client.AllowListener( "item_equip" );

callbacks.Register( "FireGameEvent", "Extra Fakelag Options", FakelagExtra );

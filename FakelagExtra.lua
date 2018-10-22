local SetValue = gui.SetValue;

local MSC_PART_2_REF = gui.Reference( "MISC", "Part 2" );

local FAKELAG_EXTRA_GROUPBOX = gui.Groupbox( MSC_PART_2_REF, "Fakelag Extra", 0, 888, 213, 180 );
local FAKELAG_EXTRA_GROUPBOX_CHECKBOX = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_enable", "Enable", 0 );

local FAKELAG_ON_KNIFE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_knife", "Disable On Knife", 0 );
local FAKELAG_ON_TASER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_taser", "Disable On Taser", 0 );
local FAKELAG_ON_GRENADE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_grenade", "Disable On Grenade", 0 );
local FAKELAG_ON_PISTOL = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_pistol", "Disable On Pistol", 0 );
local FAKELAG_ON_REVOLVER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_revolver", "Disable On R8/Deagle", 0 );

local FAKELAG_ON_PING = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_ping", "Disable Fakelag On Ping", 0 )
local FAKELAG_ON_PING_AMOUNT = gui.Slider( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_ping_amount", "Amount", 120, 0, 1000 )

local FAKELAG_SMART_MODE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_smartmode", "Fakelag Smart Mode", 0 );
local FAKELAG_SMART_MODE_STANDING = gui.Combobox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_standing", "While Standing", "Off", "Factor", "Switch", "Adaptive", "Random", "Rapid Peek" );
local FAKELAG_SMART_MODE_MOVING = gui.Combobox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_moving", "While Moving", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );
local FAKELAG_SMART_MODE_INAIR = gui.Combobox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_inair", "While In Air", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );

local Ping = 0

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
			if WepType == 0 then
				Knife = true
			else
				Knife = false
			end
			if WepType == 1 then
				Pistol = true
			else
				Pistol = false
			end
			if WepType == 8 then
				Taser = true
			else
				Taser = false
			end
			if WepType == 9 then
				Grenade = true
			else
				Grenade = false
			end
			if ITEM == "deagle" then
				Revolver = true
			else
				Revolver = false
			end
		end
		
		if ( FAKELAG_ON_KNIFE:GetValue() and Knife ) or -- On Knife
		   ( FAKELAG_ON_TASER:GetValue() and Taser ) or -- On Taser
		   ( FAKELAG_ON_GRENADE:GetValue() and Grenade ) or -- On Grenade
		   ( FAKELAG_ON_PISTOL:GetValue() and Pistol ) or -- On Pistol
		   ( FAKELAG_ON_REVOLVER:GetValue() and Revolver ) then -- On Revolver
			SetValue( "msc_fakelag_enable", 0 );
		else
			SetValue( "msc_fakelag_enable", 1 );
		end
		
	end

end

local function FakelagOnPing()

	if FAKELAG_EXTRA_GROUPBOX_CHECKBOX:GetValue() then
		if FAKELAG_ON_PING:GetValue() then

			if entities.GetPlayerResources() ~= nil then
				Ping = entities.GetPlayerResources():GetPropInt( "m_iPing", client.GetLocalPlayerIndex() );
			end
			FakelagOnPingAmount = math.floor( FAKELAG_ON_PING_AMOUNT:GetValue() )

			if Ping >= FakelagOnPingAmount then
				SetValue( "msc_fakelag_enable", 0 );
			else
				SetValue( "msc_fakelag_enable", 1 );
			end

		end
	end

end		

local function FakelagSmartMode()

	if FAKELAG_EXTRA_GROUPBOX_CHECKBOX:GetValue() then

		if FAKELAG_SMART_MODE:GetValue() then

			local FAKELAG_STANDING = FAKELAG_SMART_MODE_STANDING:GetValue();
			local FAKELAG_MOVING = FAKELAG_SMART_MODE_MOVING:GetValue();
			local FAKELAG_INAIR = FAKELAG_SMART_MODE_INAIR:GetValue();

			if entities.GetLocalPlayer() ~= nil then

				local LocalPlayerEntity = entities.GetLocalPlayer();
				local fFlags = LocalPlayerEntity:GetProp( "m_fFlags" );

				local VelocityX = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[0]" );
				local VelocityY = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[1]" );

				local Velocity = math.sqrt( VelocityX^2 + VelocityY^2 );

				-- Standing
				if ( Velocity == 0 and fFlags == 257 ) then
					Standing = true	
				else
					Standing = false
				end

				-- Moving
				if ( Velocity > 0 and fFlags == 257 ) then
					Moving = true
				else
					Moving = false
				end

				-- In Air
				if fFlags == 256 then
					InAir = true
				else
					InAir = false
				end
			end

			if Standing then
				if FAKELAG_STANDING == 0 or
				( FAKELAG_ON_KNIFE:GetValue() and Knife ) or
				( FAKELAG_ON_TASER:GetValue() and Taser ) or
				( FAKELAG_ON_GRENADE:GetValue() and Grenade ) or
				( FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
				( FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
				( FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) then
					SetValue( "msc_fakelag_enable", 0 );
				else
					SetValue( "msc_fakelag_enable", 1 );
				end

				SetValue( "msc_fakelag_mode", STANDING_MODE );

				if FAKELAG_STANDING == 1 then
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

			if Moving then
				if FAKELAG_MOVING == 0 or
				( FAKELAG_ON_KNIFE:GetValue() and Knife ) or
				( FAKELAG_ON_TASER:GetValue() and Taser ) or
				( FAKELAG_ON_GRENADE:GetValue() and Grenade ) or
				( FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
				( FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
				( FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) then
					SetValue( "msc_fakelag_enable", 0 );
				else
					SetValue( "msc_fakelag_enable", 1 );
				end

				SetValue( "msc_fakelag_mode", MOVING_MODE );

				if FAKELAG_MOVING == 1 then
					MOVING_MODE = 0
				elseif FAKELAG_MOVING == 2 then
					MOVING_MODE = 1
				elseif FAKELAG_MOVING == 3 then
					MOVING_MODE = 2
				elseif FAKELAG_MOVING == 4 then
					MOVING_MODE = 3
				elseif FAKELAG_MOVING == 5 then
					MOVING_MODE = 4
				elseif FAKELAG_MOVING == 6 then
					MOVING_MODE = 5
				end
			end

			if InAir then
				if FAKELAG_INAIR == 0 or
				( FAKELAG_ON_KNIFE:GetValue() and Knife ) or
				( FAKELAG_ON_TASER:GetValue() and Taser ) or
				( FAKELAG_ON_GRENADE:GetValue() and Grenade ) or
				( FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
				( FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
				( FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) then
					SetValue( "msc_fakelag_enable", 0 );
				else
					SetValue( "msc_fakelag_enable", 1 );
				end

				SetValue( "msc_fakelag_mode", INAIR_MODE );

				if FAKELAG_INAIR == 1 then
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
					INAIR_MODE = 6
				end
			end

		end

	end
end

client.AllowListener( "item_equip" )

callbacks.Register( "FireGameEvent", "Extra Fakelag Options", FakelagExtra )
callbacks.Register( "Draw", "Fakelag On Ping", FakelagOnPing )
callbacks.Register( "Draw", "Fakelag Smart Mode", FakelagSmartMode )

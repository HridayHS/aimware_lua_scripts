local SetValue = gui.SetValue
local GetValue = gui.GetValue

local MENU = gui.Reference( "MENU" );

local MSC_FAKELAG_REF = gui.Reference( "MISC", "ENHANCEMENT", "Fakelag" );
local FAKELAG_WND_CHECKBOX = gui.Checkbox ( MSC_FAKELAG_REF, "lua_fakelag_wnd", "Advance Fakelag Configuration", 0 );

local x, y = GetValue( "wnd_menu" );
local FAKELAG_WINDOW = gui.Window( "lua_wnd_fakelag", "Advance Fakelag Configuration", x+816, y+168, 400, 400+32 );

local MASTER_SWITCH = gui.Checkbox( FAKELAG_WINDOW, "lua_fakelag", "Master Switch", 0 );

local SMARTMODE_GROUPBOX = gui.Groupbox( FAKELAG_WINDOW, "Fakelag Smart Mode", 16, 48, 200 - 32, 400 - 64 );
local FAKELAG_EXTRA_GROUPBOX = gui.Groupbox( FAKELAG_WINDOW, "Fakelag Extra", (200-32)+32, 48, 200 - 16, 400 - 64 );

local FAKELAG_SMART_MODE = gui.Checkbox( SMARTMODE_GROUPBOX, "lua_fakelag_smartmode_enable", "Enable", 0 );
local FAKELAG_SMART_MODE_STANDING = gui.Combobox( SMARTMODE_GROUPBOX, "lua_fakelag_standing", "While Standing", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );
local FAKELAG_SMART_MODE_STANDING_FACTOR = gui.Slider( SMARTMODE_GROUPBOX, "lua_fakelag_standing_factor", "Factor", 15, 1, 62 );
local FAKELAG_SMART_MODE_MOVING = gui.Combobox( SMARTMODE_GROUPBOX, "lua_fakelag_moving", "While Moving", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );
local FAKELAG_SMART_MODE_MOVING_FACTOR = gui.Slider( SMARTMODE_GROUPBOX, "lua_fakelag_moving_factor", "Factor", 15, 1, 62 );
local FAKELAG_SMART_MODE_INAIR = gui.Combobox( SMARTMODE_GROUPBOX, "lua_fakelag_inair", "While In Air", "Off", "Factor", "Switch", "Adaptive", "Random", "Peek", "Rapid Peek" );
local FAKELAG_SMART_MODE_INAIR_FACTOR = gui.Slider( SMARTMODE_GROUPBOX, "lua_fakelag_inair_factor", "Factor", 15, 1, 62 );

local FAKELAG_EXTRA = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_extra_enable", "Enable", 0 );
local FAKELAG_ON_KNIFE = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_knife", "Disable On Knife", 0 );
local FAKELAG_ON_PISTOL = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_pistol", "Disable On Pistol", 0 );
local FAKELAG_ON_REVOLVER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_revolver", "Disable On Revolver", 0 );
local FAKELAG_ON_SLOWWALK = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_slowwalk", "Disable On Slow Walk", 0 );
local FAKELAG_ON_TASER = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_taser", "Disable On Taser", 0 );
local FAKELAG_ON_PING = gui.Checkbox( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_ping", "Disable On Ping", 0 )
local FAKELAG_ON_PING_AMOUNT = gui.Slider( FAKELAG_EXTRA_GROUPBOX, "lua_fakelag_ping_amount", "On Ping Amount", 120, 0, 1000 );

local Ping = 0
local Time = 0

callbacks.Register( 'Draw',  function()

	if FAKELAG_WND_CHECKBOX:GetValue() and MENU:IsActive() then
		FAKELAG_WINDOW:SetActive(1)
	else
		FAKELAG_WINDOW:SetActive(0)
	end

	if not MASTER_SWITCH:GetValue() then
		return
	end

	if entities.GetLocalPlayer() == nil then
		return
	end

	local LocalPlayerEntity = entities.GetLocalPlayer();
	local WeaponID = LocalPlayerEntity:GetWeaponID();
	local WeaponType = LocalPlayerEntity:GetWeaponType();

	if ( WeaponType == 0 and WeaponID ~= 31 ) then Knife = true else Knife = false end
	if ( WeaponType == 1 and WeaponID ~= 64 ) then Pistol = true else Pistol = false end
	if WeaponID == 31 then Taser = true else Taser = false end
	if WeaponID == 64 then Revolver = true else Revolver = false end

end
)

local function FakelagExtra()

	if not MASTER_SWITCH:GetValue() then
		return
	end

	if not FAKELAG_EXTRA:GetValue() then
		return
	end
		
	if ( FAKELAG_ON_KNIFE:GetValue() and Knife ) or -- On Knife
	   ( FAKELAG_ON_TASER:GetValue() and Taser ) or -- On Taser
	   ( FAKELAG_ON_PISTOL:GetValue() and Pistol ) or -- On Pistol
	   ( FAKELAG_ON_REVOLVER:GetValue() and Revolver ) then -- On Revolver
		SetValue( "msc_fakelag_enable", 0 );
	else
		SetValue( "msc_fakelag_enable", 1 );
	end

end

local function FakelagOnPing()

	if not MASTER_SWITCH:GetValue() then
		return
	end

	if not FAKELAG_EXTRA:GetValue() then
		return
	end

	if not FAKELAG_ON_PING:GetValue() then
		return
	end

	if entities.GetPlayerResources() ~= nil then
		Ping = entities.GetPlayerResources():GetPropInt( "m_iPing", client.GetLocalPlayerIndex() );
	end

	FakelagOnPingAmount = math.floor( FAKELAG_ON_PING_AMOUNT:GetValue() )

	if ( Ping >= FakelagOnPingAmount ) or
	   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_KNIFE:GetValue() and Knife ) or
	   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_TASER:GetValue() and Taser ) or
	   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
	   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_REVOLVER:GetValue() and Revolver ) then
		SetValue( "msc_fakelag_enable", 0 );
	else
		SetValue( "msc_fakelag_enable", 1 );
	end

end		

local function FakelagOnSlowWalk()

	if not MASTER_SWITCH:GetValue() then
		return
	end

	if not FAKELAG_EXTRA:GetValue() then
		return
	end

	if GetValue( "msc_slowwalk" ) ~= 0 then
		SlowWalkFakelagOff = input.IsButtonDown( GetValue( "msc_slowwalk" ) )
	end

	if FAKELAG_ON_SLOWWALK:GetValue() and GetValue( "msc_slowwalk" ) ~= 0 then
		if ( SlowWalkFakelagOff ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_KNIFE:GetValue() and Knife ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_TASER:GetValue() and Taser ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) then
			SetValue( "msc_fakelag_enable", 0 );
		else
			SetValue( "msc_fakelag_enable", 1 );
		end
	end

end

local function FakelagSmartMode()

	if not MASTER_SWITCH:GetValue() then
		return
	end

	if not FAKELAG_SMART_MODE:GetValue() then
		return
	end

	local FAKELAG_STANDING = FAKELAG_SMART_MODE_STANDING:GetValue();
	local FAKELAG_MOVING = FAKELAG_SMART_MODE_MOVING:GetValue();
	local FAKELAG_INAIR = FAKELAG_SMART_MODE_INAIR:GetValue();

	local FAKELAG_STANDING_FACTOR = math.floor( FAKELAG_SMART_MODE_STANDING_FACTOR:GetValue() )
	local FAKELAG_MOVING_FACTOR = math.floor( FAKELAG_SMART_MODE_MOVING_FACTOR:GetValue() )
	local FAKELAG_INAIR_FACTOR = math.floor( FAKELAG_SMART_MODE_INAIR_FACTOR:GetValue() )

	if entities.GetLocalPlayer() ~= nil then

		local LocalPlayerEntity = entities.GetLocalPlayer();
		local fFlags = LocalPlayerEntity:GetProp( "m_fFlags" );

		local VelocityX = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[0]" );
		local VelocityY = LocalPlayerEntity:GetPropFloat( "localdata", "m_vecVelocity[1]" );

		local Velocity = math.sqrt( VelocityX^2 + VelocityY^2 );

		-- Standing
		if ( Velocity == 0 and ( fFlags == 257 or fFlags == 261 or fFlags == 263 ) ) then
			Standing = true
		else
			Standing = false
		end

		-- Moving
		if ( Velocity > 0 and ( fFlags == 257 or fFlags == 261 or fFlags == 263 ) ) then
			Moving = true
		else
			Moving = false
		end

		-- In Air
		if fFlags == 256 or fFlags == 262 then
			InAir = true
			Time = globals.CurTime();
		else
			InAir = false
		end
	end

	if Standing and Time + 0.2 < globals.CurTime() then
		if ( FAKELAG_STANDING == 0 ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_KNIFE:GetValue() and Knife ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_TASER:GetValue() and Taser ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_SLOWWALK:GetValue() and GetValue( "msc_slowwalk" ) ~= 0 and SlowWalkFakelagOff ) then
			SetValue( "msc_fakelag_enable", 0 );
		else
			SetValue( "msc_fakelag_enable", 1 );
		end
		if FAKELAG_STANDING > 0 then
			STANDING_MODE = ( FAKELAG_STANDING - 1 )
		end
		SetValue( "msc_fakelag_mode", STANDING_MODE );
		SetValue( "msc_fakelag_value", FAKELAG_STANDING_FACTOR );
	end

	if Moving and Time + 0.2 < globals.CurTime() then
		if ( FAKELAG_MOVING == 0 ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_KNIFE:GetValue() and Knife ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_TASER:GetValue() and Taser ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) or
			  ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_SLOWWALK:GetValue() and GetValue( "msc_slowwalk" ) ~= 0 and SlowWalkFakelagOff ) then
			SetValue( "msc_fakelag_enable", 0 );
		else
			SetValue( "msc_fakelag_enable", 1 );
		end
		if FAKELAG_MOVING > 0 then
			MOVING_MODE = ( FAKELAG_MOVING - 1 )
		end
		SetValue( "msc_fakelag_mode", MOVING_MODE );
		SetValue( "msc_fakelag_value", FAKELAG_MOVING_FACTOR );
	end

	if InAir then
		if ( FAKELAG_INAIR == 0 ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_KNIFE:GetValue() and Knife ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_TASER:GetValue() and Taser ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PISTOL:GetValue() and Pistol ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_REVOLVER:GetValue() and Revolver ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_PING:GetValue() and Ping >= FakelagOnPingAmount ) or
		   ( FAKELAG_EXTRA:GetValue() and FAKELAG_ON_SLOWWALK:GetValue() and GetValue( "msc_slowwalk" ) ~= 0 and SlowWalkFakelagOff ) then
			SetValue( "msc_fakelag_enable", 0 );
		else
			SetValue( "msc_fakelag_enable", 1 );
		end
			if FAKELAG_INAIR > 0 then
			INAIR_MODE = ( FAKELAG_INAIR - 1 )
		end
		SetValue( "msc_fakelag_mode", INAIR_MODE );
		SetValue( "msc_fakelag_value", FAKELAG_INAIR_FACTOR );
	end

end

callbacks.Register( 'Draw', FakelagExtra )
callbacks.Register( 'Draw', FakelagOnPing )
callbacks.Register( 'Draw', FakelagOnSlowWalk )
callbacks.Register( 'Draw', FakelagSmartMode )

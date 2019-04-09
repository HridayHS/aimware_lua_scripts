local SetValue = gui.SetValue;

local LGT_EXTRA_REF = gui.Reference( "LEGIT", "Extra" );

local Auto_Zeus = gui.Combobox( LGT_EXTRA_REF, "lua_autozeus", "Auto Zeus", "Off", "Legitbot", "Ragebot" );

callbacks.Register( 'Draw',  function()

	if entities.GetLocalPlayer() == nil then
		return
	end

	local LocalPlayerEntity = entities.GetLocalPlayer();
	local WeaponID = LocalPlayerEntity:GetWeaponID();

	if WeaponID == 31 then 
		Taser = true
	else
		Taser = false
	end

end
)

local function AutoZeus()

	if not gui.GetValue("lbot_active") then
		return
	end

	if Auto_Zeus:GetValue() == 0 then
		return
	end

	if Taser then
		if Auto_Zeus:GetValue() == 1 then
			SetValue( "rbot_active", 0 )
			SetValue( "lbot_trg_enable", 1 )
			SetValue( "lbot_trg_autofire", 1 )
			SetValue( "lbot_trg_key", 0 )
			SetValue( "lbot_trg_hitchance", 80 )
			SetValue( "lbot_trg_mode", 3 )
			SetValue( "lbot_trg_delay", 0 )
			SetValue( "lbot_trg_burst", 0 )
			SetValue( "lbot_trg_throughsmoke", 0 )
		elseif Auto_Zeus:GetValue() == 2 then
			SetValue( "lbot_trg_enable", 0 )
			SetValue( "rbot_taser_hitchance", 80 )
			SetValue( "rbot_active", 1 )
			SetValue( "rbot_enable", 1 )
			SetValue( "rbot_fov", 15 )
			SetValue( "rbot_speedlimit", 1 )
			SetValue( "rbot_silentaim", 1 )
			if ( gui.GetValue( "lbot_positionadjustment" ) > 0 ) then
				SetValue( "rbot_positionadjustment", 5 )
			else
				SetValue( "rbot_positionadjustment", 0 )
			end
		end
	else
		if Auto_Zeus:GetValue() == 1 then
			SetValue( "lbot_trg_enable", 0 )
		elseif Auto_Zeus:GetValue() == 2 then
			SetValue( "rbot_active", 0 )
		end
	end

end

callbacks.Register( 'Draw', AutoZeus )

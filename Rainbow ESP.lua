frequency = 1 
-- <1 = faster, >1 = slower


function rainbowesp()

    RED = math.sin((globals.RealTime() / frequency) * 4) * 127 + 128;
    GREEN = math.sin((globals.RealTime() / frequency) * 4 + 2) * 127 + 128;
    BLUE = math.sin((globals.RealTime() / frequency) * 4 + 4) * 127 + 128;
    
    gui.SetValue( "clr_chams_ct_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_ct_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_weapon_primary", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_weapon_secondary", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_ammo1", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_ammo2", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_armor1", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_armor2", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_health1", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_health2", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_lbytimer1", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_bar_lbytimer2", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_ct_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_ghost_fake", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_ghost_lby", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_hands_primary", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_hands_secondary", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_historyticks", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_other_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_other_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_t_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_chams_t_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_ct_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_other_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_other_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_t_invis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_box_t_vis", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_crosshair", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_crosshair_recoil", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_esp_outofview", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
    gui.SetValue( "clr_misc_hitmarker", math.floor(RED), math.floor(GREEN), math.floor(BLUE), 255)
end

callbacks.Register( "Draw", "rainbowesp", rainbowesp);

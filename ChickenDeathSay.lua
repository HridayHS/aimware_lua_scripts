local MSC_PART_1_REF = gui.Reference( "MISC", "GENERAL", "Extra" );

local ChickenDeathSay_Checkbox = gui.Checkbox( MSC_PART_1_REF, "lua_chicken_deathsay", "Chicken Death Say", 0 );

local function ChickenDeathSay( Event )

	if ChickenDeathSay_Checkbox:GetValue() then

		if ( Event:GetName() == "other_death" ) then

			local Killer_INT = Event:GetInt( "attacker" );
			local Killer_Name = client.GetPlayerNameByUserID( Killer_INT );

			local Weapon = Event:GetString( "weapon" );

			client.ChatSay( string.format( "%s murdered a chicken with the %s.", Killer_Name, Weapon ) )

		end

	end

end

client.AllowListener( "other_death" )

callbacks.Register( "FireGameEvent", "Chicken Death Say", ChickenDeathSay )

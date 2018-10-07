local MSC_PART_1_REF = gui.Reference( "MISC", "Part 1" );

local Chicken_DeathSay = gui.Checkbox( MSC_PART_1_REF, "lua_chicken_deathsay", "Chicken Death Say", 0 );

local function ChickenDeathSay( Event, Entity )

if Chicken_DeathSay:GetValue() then

	if Event:GetName() ~= nil then

	local UID = Event:GetInt( "userid" );  
	
	local Killer_INT = Event:GetInt( "attacker" ); 
	local Killer_Name = client.GetPlayerNameByUserID( Killer_INT ); 
	
	local Weapon = Event:GetString( "weapon" );
	local Locate = entities.FindByClass( "CBasePlayer" );

		for i = 1, #Locate do
			local Location = Locate[i]:GetPropString( "m_szLastPlaceName" );

			if Location == nil then 
				Location = "Unknown"; 
			end

			chatsay = string.format( "%s murdered a chicken with the %s at %s!", Killer_Name, Weapon, Location )

			if ( Event:GetName() == "other_death" ) then
				client.ChatSay(chatsay)
			end
		end
	end
end

end

client.AllowListener( "other_death" )

callbacks.Register( "FireGameEvent", "Chicken Death Say", ChickenDeathSay )

--[[
	Checkbox in Visuals -> Other -> Extra
]]

local SniperCrosshair = gui.Checkbox(gui.Reference('Visuals', 'Other', 'Extra'), 'snipercrosshair', 'Sniper Crosshair', 0)
SniperCrosshair:SetDescription('Display in-game crosshair for snipers.')

client.AllowListener('item_equip')
callbacks.Register('FireGameEvent', function(Event)
	if not gui.GetValue('esp.master') or not SniperCrosshair:GetValue() or Event:GetName() ~= 'item_equip' then
		if not SniperCrosshair:GetValue() and client.GetConVar('weapon_debug_spread_show') == '3' then
			client.SetConVar('weapon_debug_spread_show', 0, true)
			return
		end
		return
	end

	local LocalPlayerIndex = client.GetLocalPlayerIndex()
	local PlayerIndex = client.GetPlayerIndexByUserID( Event:GetInt('userid') )
	local WeaponType = Event:GetInt('weptype')

	if LocalPlayerIndex == PlayerIndex then
		if WeaponType == 5 then
			client.SetConVar('weapon_debug_spread_show', 3, true)
		else
			client.SetConVar('weapon_debug_spread_show', 0, true)
		end	
	end
end)
--[[
	Checkbox in Legitbot -> Other -> Extra
]]

local ZeusTriggerbot = gui.Checkbox(gui.Reference('Legitbot', 'Other', 'Extra'), 'zeustrigger', 'Zeus Triggerbot', 0)
ZeusTriggerbot:SetDescription('Enable zeus triggerbot.')

-- Zeus Triggerbot Default Settings
gui.SetValue('lbot.trg.zeus.delay', 0)
gui.SetValue('lbot.trg.zeus.burst', 0)
gui.SetValue('lbot.trg.zeus.hitchance', 80)
gui.SetValue('lbot.trg.zeus.hitbox', '0 1 0 1 1 0 0 0')

client.AllowListener('item_equip')
callbacks.Register('FireGameEvent', function(Event)
	if not gui.GetValue('lbot.master') or not ZeusTriggerbot:GetValue() or Event:GetName() ~= 'item_equip' then
		return
	end

	local LocalPlayerIndex = client.GetLocalPlayerIndex()
	local PlayerIndex = client.GetPlayerIndexByUserID( Event:GetInt('userid') )
	local WeaponType = Event:GetInt('weptype')

	if LocalPlayerIndex == PlayerIndex then
		if WeaponType == 8 then
			gui.SetValue('lbot.trg.enable', 1)
			gui.SetValue('lbot.trg.autofire', 1)
		else
			gui.SetValue('lbot.trg.enable', 0)
			gui.SetValue('lbot.trg.autofire', 0)
		end	
	end
end)
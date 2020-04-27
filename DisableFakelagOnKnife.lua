--[[
	Checkbox in Misc -> Enhancement -> Fakelag
]]

local FakelagOnKnife = gui.Checkbox(gui.Reference('Misc', 'Enhancement', 'Fakelag'), 'onknife', 'Disable Fakelag On Knife', 0)

client.AllowListener('item_equip')
callbacks.Register('FireGameEvent', function(Event)
	if not gui.GetValue('misc.master') or not FakelagOnKnife:GetValue() or Event:GetName() ~= 'item_equip' then
		return
	end

	local LocalPlayerIndex = client.GetLocalPlayerIndex()
	local PlayerIndex = client.GetPlayerIndexByUserID( Event:GetInt('userid') )
	local WeaponType = Event:GetInt('weptype')

	if LocalPlayerIndex == PlayerIndex then
		if WeaponType == 0 then
			gui.SetValue('misc.fakelag.enable', 0)
		else
			gui.SetValue('misc.fakelag.enable', 1)
		end	
	end
end)
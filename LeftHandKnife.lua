local Ref_VisualExtra = gui.Reference('Visuals', 'Other', 'Extra')
local LeftHandKnife = gui.Checkbox(Ref_VisualExtra, 'lefthandknife', 'Left Hand Knife', 0)

callbacks.Register('Draw', function()
	if not LeftHandKnife:GetValue() then
		return
	end

	local LocalPlayer = entities.GetLocalPlayer()

	local WeaponID = LocalPlayer:GetWeaponID()
	local WeaponType = LocalPlayer:GetWeaponType()

	if WeaponType == 0 and WeaponID ~= 31 then
		client.Command('cl_righthand 0', true)
	else
		client.Command('cl_righthand 1', true)
	end
end)

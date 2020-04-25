--[[
	- Checkbox in Visuals -> World -> Materials
]]

local FullBright = gui.Checkbox(gui.Reference('Visuals', 'World', 'Materials'), "fullbright", "Full Bright", 0)

callbacks.Register('Draw', function()
	local isFullBrightOn = FullBright:GetValue()
	local convar_mat_fullbright = client.GetConVar('mat_fullbright')

	if isFullBrightOn and convar_mat_fullbright == '0' then
		client.SetConVar('mat_fullbright', 1, true)
	elseif not isFullBrightOn and convar_mat_fullbright == '1' then
		client.SetConVar('mat_fullbright', 0, true)
	end
end)
--[[
	* All credits goes to "- Luiz" from AIMWARE Forum. All I did is add a on/off button and I take zero credits for this script.
	- Checkbox in Visuals -> Other -> Extra
]]

local EngineRadar = gui.Checkbox(gui.Reference('Visuals', 'Other', 'Extra'), 'engineradar', 'Engine Radar', 0)
EngineRadar:SetDescription('Display enemies on in-game radar.')

callbacks.Register('Draw', function()
	if EngineRadar:GetValue() then
		isEngineRadarOn = 1
	else
		isEngineRadarOn = 0
	end

	for index, Player in pairs(entities.FindByClass('CCSPlayer')) do
        Player:SetProp('m_bSpotted', isEngineRadarOn)
	end
end)
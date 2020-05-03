--[[
	Tab in Misc -> Discord Ping
]]

local References = {
	Menu = gui.Reference('Menu'),
	Misc = gui.Reference('Misc')
}

local Tab = gui.Tab(References.Misc, 'discordping', 'Discord Ping')
local Groupbox = {
	General = gui.Groupbox(Tab, 'General', 16, 16, 295)
}

local GUIObjects = {
	Ping = {
		EndMatch = {}
	},
	Webhook = {}
}

-- Master Switch
GUIObjects.MasterSwitch = gui.Checkbox(Groupbox.General, 'enable', 'Enable', 0)
GUIObjects.MasterSwitch:SetDescription('Enable Discord Ping.') -- Set Master Switch Description

-- Ping Multibox
GUIObjects.Ping.MultiBox = gui.Multibox(Groupbox.General, 'Send Info')
GUIObjects.Ping.StartMatch = gui.Checkbox(GUIObjects.Ping.MultiBox, 'matchstart', 'At Match Start', 1)
GUIObjects.Ping.EndMatch.Enabled = gui.Checkbox(GUIObjects.Ping.MultiBox, 'matchend', 'At Match End', 0)
GUIObjects.Ping.EndMatch.MultiBox = gui.Multibox(Groupbox.General, 'At Match End')
GUIObjects.Ping.EndMatch.Send = {
	Rank = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.rank', 'Send Rank', 1),
	Kills = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.kills', 'Send Kills', 1),
	Assists = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.assists', 'Send Assists', 0),
	Deaths = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.deaths', 'Send Deaths', 1),
	MVPs = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.mvps', 'Send MVPs', 0),
	Score = gui.Checkbox(GUIObjects.Ping.EndMatch.MultiBox, 'matchend.score', 'Send Score', 0)
}

-- Webhook
GUIObjects.Webhook.Window = gui.Window('misc.discordping.webhook', 'Discord Webhook', 0, 0, 840, 100)
GUIObjects.Webhook.Button = gui.Button(Groupbox.General, 'Webhook', function()
	GUIObjects.Webhook.Window:SetActive(not GUIObjects.Webhook.Window:IsActive())
end)
GUIObjects.Webhook.Text = gui.Editbox(GUIObjects.Webhook.Window, 'text', '')
GUIObjects.Webhook.Window:SetActive(false) -- Disable Window By Default
GUIObjects.Webhook.Button:SetWidth(265) -- Set Webhook Button Width

-- You can add your webhook here as well so you won't need it add it all the time.
GUIObjects.Webhook.Text:SetValue('')

-- Menu Objects Handler
callbacks.Register('Draw', function()
	GUIObjects.Ping.EndMatch.MultiBox:SetInvisible(not GUIObjects.Ping.EndMatch.Enabled:GetValue()) -- Hide End Match Multibox if it's disabled.
	if not References.Menu:IsActive() then -- Hide webhook window if cheat menu is hidden
		GUIObjects.Webhook.Window:SetActive(false)
	end
end)

-- Main
local MapNames = {
	['ar_baggage'] = 'Baggage',
	['ar_dizzy'] = 'Dizzy',
	['ar_lunacy'] = 'Lunacy',
	['ar_monastery'] = 'Monastery',
	['ar_shoots'] = 'Shoots',
	['cs_agency'] = 'Agency',
	['cs_assault'] = 'Assault',
	['cs_italy'] = 'Italy',
	['cs_militia'] = 'militia',
	['cs_office'] = 'Office',
	['de_anubis'] = 'Anubis',
	['de_bank'] = 'Bank',
	['de_cache'] = 'Cache',
	['de_cbble'] = 'Cobblestone',
	['de_chlorine'] = 'Chlorine',
	['de_dust2'] = 'Dust II',
	['de_inferno'] = 'Inferno',
	['de_lake'] = 'Lake',
	['de_mirage'] = 'Mirage',
	['de_nuke'] = 'Nuke',
	['de_overpass'] = 'Overpass',
	['de_safehouse'] = 'Safehouse',
	['de_shortdust'] = 'Shortdust',
	['de_shortnuke'] = 'Shortnuke',
	['de_stmarc'] = 'St. Marc',
	['de_sugarcane'] = 'Sugarcane',
	['de_train'] = 'Train',
	['de_vertigo'] = 'Vertigo',
	['dz_blacksite'] = 'Blacksite',
	['dz_junglety'] = 'Junglety',
	['dz_sirocco'] = 'Sirocco',
	['gd_cbble'] = 'Cobblestone',
	['gd_rialto'] = 'Rialto'
}

local Ranks = {
    DangerZone = {
        [1] = 'Lab Rat I',
        [2] = 'Lab Rat II',
        [3] = 'Sprinting Hare I',
        [4] = 'Sprinting Hare II',
        [5] = 'Wild Scout I',
        [6] = 'Wild Scout II',
        [7] = 'Wild Scout Elite',
        [8] = 'Hunter Fox I',
        [9] = 'Hunter Fox II',
        [10] = 'Hunter Fox III',
        [11] = 'Hunter Fox Elite',
        [12] = 'Timber Wolf',
        [13] = 'Ember Wolf',
        [14] = 'Wildfire Wolf',
        [15] = 'The Howling Alpha'
    },
    Matchmaking = {
        [1] = 'Silver I',
        [2] = 'Silver II',
        [3] = 'Silver III',
        [4] = 'Silver IV',
        [5] = 'Silver Elite',
        [6] = 'Silver Elite Master',
        [7] = 'Gold Nova I',
        [8] = 'Gold Nova II',
        [9] = 'Gold Nova III',
        [10] = 'Gold Nova Master',
        [11] = 'Master Guardian I',
        [12] = 'Master Guardian II',
        [13] = 'Master Guardian Elite',
        [14] = 'Distinguished Master Guardian',
        [15] = 'Legendary Eagle',
        [16] = 'Legendary Eagle Master',
        [17] = 'Supreme Master First Class',
        [18] = 'Global Elite'
    }
}

local Get = {}

Get.CompetitiveRank = function(PlayerIndex)
	local PlayerRank = entities.GetPlayerResources():GetPropInt('m_iCompetitiveRanking', PlayerIndex)
	return (string.find(engine.GetMapName(), 'dz') and (Ranks.DangerZone[PlayerRank] or 'Unranked') or (Ranks.Matchmaking[PlayerRank] or 'Unranked'))
end

Get.GameMode = function()
	local GameMode, GameType = tonumber(client.GetConVar('game_mode')), tonumber(client.GetConVar('game_type'))
	if GameMode == 0 and GameType == 0 then
		return 'Casual'
	elseif GameMode == 1 and GameType == 0 then
		return 'Competitive'
	elseif GameMode == 2 and GameType == 0 then
		return 'Wingman'
	elseif GameMode == 0 and GameType == 1 then
		return 'Arms Race'
	elseif GameMode == 1 and GameType == 1 then
		return 'Demolition'
	elseif GameMode == 2 and GameType == 1 then
		return 'Deathmatch'
	elseif (GameMode >= 0 or GameMode <= 0) and GameType == 3 then
		return 'Custom'
	elseif GameMode == 0 and GameType == 4 then
		return 'Guardian'
	elseif GameMode == 1 and GameType == 4 then
		return 'Co-op Strike'
	elseif GameMode == 0 and GameType == 6 then
		return 'Danger Zone'
	end
end

Get.Team = function(PlayerIndex)
	return entities.GetPlayerResources():GetPropInt('m_iTeam', PlayerIndex)
end

Get.TeamInitials = function(bool)
	local MyTeam = Get.Team(client.GetLocalPlayerIndex())
	local EnemyTeam = (MyTeam == 3) and 2 or 3
	if bool then
		return EnemyTeam == 3 and 'CT' or 'T'
	else
		return MyTeam == 3 and 'CT' or 'T'
	end
end

Get.MatchStartInfo = function(bool)
	local String = ''

	local TotalPlayers = 0
	local MyTeam = Get.Team(client.GetLocalPlayerIndex())

	for PlayerIndex=1, globals.MaxClients() do
		local PlayerInfo = client.GetPlayerInfo(PlayerIndex)
		if PlayerInfo ~= nil then
			local PlayerName = PlayerInfo['Name']
			local PlayerSteamID = PlayerInfo['SteamID']
			local IsPlayerBot = PlayerInfo['IsBot']

			local PlayerRank = Get.CompetitiveRank(PlayerIndex)
			local PlayerTeam = Get.Team(PlayerIndex)

			if PlayerTeam == 2 or PlayerTeam == 3 then
				if (PlayerTeam == MyTeam and bool) or (PlayerTeam ~= MyTeam and not bool) then
					if IsPlayerBot then
						String = String .. [[\n\t● ]] .. PlayerName .. ' (Bot)'
					else
						if Get.GameMode() == 'Competitive' or Get.GameMode() == 'Wingman' or Get.GameMode() == 'Danger Zone' then
							String = String .. [[\n\t● ]] .. '[' .. PlayerName .. '](' .. '<https://steamcommunity.com/profiles/[U:1:' .. PlayerSteamID .. ']/>' .. ')' .. ' | ' .. PlayerRank
						else
							String = String .. [[\n\t● ]] .. '[' .. PlayerName .. '](' .. '<https://steamcommunity.com/profiles/[U:1:' .. PlayerSteamID .. ']/>' .. ')'
						end
					end
					TotalPlayers = TotalPlayers + 1
				end
			end
		end
	end

	if TotalPlayers == 0 then
		String = String .. [[\n\tN/A]]
	end
	return String .. [[\n\n]]
end

Get.MatchEndInfo = function(bool)
	local String = ''
	local Players = {}

	for PlayerIndex=1, globals.MaxClients() do
		if entities.GetPlayerResources():GetPropBool('m_bConnected', PlayerIndex) then
			local PlayerTeam = Get.Team(PlayerIndex)
			if PlayerTeam == 2 or PlayerTeam == 3 then
				local MyTeam = Get.Team(client.GetLocalPlayerIndex())
				local PlayerScore = entities.GetPlayerResources():GetPropInt('m_iScore', PlayerIndex)
				if (MyTeam == PlayerTeam and bool) or (MyTeam ~= PlayerTeam and not bool) then
					table.insert(Players, {
						player = PlayerIndex,
						score = PlayerScore
					})
				end
			end
		end
	end

	table.sort(Players, function(a,b)
		return a.score > b.score
	end)

	for _, v in pairs(Players) do
		local PlayerIndex = v.player
		local PlayerInfo = client.GetPlayerInfo(PlayerIndex)
		
		local PlayerName = PlayerInfo['Name']
		local PlayerSteamID = PlayerInfo['SteamID']
		local IsPlayerBot = PlayerInfo['IsBot']
		
		local PlayerRank = Get.CompetitiveRank(PlayerIndex)
		local PlayerKills = entities.GetPlayerResources():GetPropInt('m_iKills', PlayerIndex)
		local PlayerAssists = entities.GetPlayerResources():GetPropInt('m_iAssists', PlayerIndex)
		local PlayerDeaths = entities.GetPlayerResources():GetPropInt('m_iDeaths', PlayerIndex)
		local PlayerMVPs = entities.GetPlayerResources():GetPropInt('m_iMVPs', PlayerIndex)
		local PlayerScore = v.score

		if IsPlayerBot then
			String = String .. [[\n\t● ]] .. PlayerName .. ' (Bot)'
		else
			if (GUIObjects.Ping.EndMatch.Send.Rank:GetValue() and (Get.GameMode() == 'Competitive' or Get.GameMode() == 'Wingman' or Get.GameMode() == 'Danger Zone')) then
				String = String .. [[\n\t● ]] .. '[' .. PlayerName .. '](' .. '<https://steamcommunity.com/profiles/[U:1:' .. PlayerSteamID .. ']/>' .. ')' .. ' | ' .. PlayerRank
			else
				String = String .. [[\n\t● ]] .. '[' .. PlayerName .. '](' .. '<https://steamcommunity.com/profiles/[U:1:' .. PlayerSteamID .. ']/>' .. ')'
			end
		end
		if GUIObjects.Ping.EndMatch.Send.Kills:GetValue() then
			String = String .. ' | ' .. PlayerKills .. ' Kills'
		end
		if GUIObjects.Ping.EndMatch.Send.Assists:GetValue() then
			String = String .. ' | ' .. PlayerAssists .. ' Assists'
		end
		if GUIObjects.Ping.EndMatch.Send.Deaths:GetValue() then
			String = String .. ' | ' .. PlayerDeaths .. ' Deaths'
		end
		if GUIObjects.Ping.EndMatch.Send.MVPs:GetValue() then
			String = String .. ' | ' .. PlayerMVPs .. ' MVPs'
		end
		if GUIObjects.Ping.EndMatch.Send.Score:GetValue() then
			String = String .. ' | ' .. PlayerScore .. ' Score'
		end
	end

	if (#Players == 0) then
		String = String .. [[\n\tn/a]]
	end
   	return String .. [[\n\n]]
end

callbacks.Register('FireGameEvent', function(Event)
	if not gui.GetValue('misc.master') or not GUIObjects.MasterSwitch:GetValue() or GUIObjects.Webhook.Text:GetValue() == '' then
		return
	end

	-- At Match Start
	if GUIObjects.Ping.StartMatch:GetValue() and Event:GetName() == 'round_announce_match_start' then
		local MyTeam = Get.Team(client.GetLocalPlayerIndex())
		if not MyTeam == 2 and not MyTeam == 3 then
			print('DiscordPing: Send Info -> At Match Start: Team not found')
			return
		end

		local Content = '-------------------------' .. [[\n]]
		Content = Content .. '**CS:GO Match Started**' .. [[\n-------------------------\n\n]]
		Content = Content .. '**' .. Get.GameMode() .. ' | ' .. (MapNames[engine.GetMapName()] or engine.GetMapName()) .. '**'.. [[\n\n]]
		Content = Content .. '**Your Team**: ' .. Get.TeamInitials(false) .. Get.MatchStartInfo(true)
		Content = Content .. '**Enemy Team**: ' .. Get.TeamInitials(true) .. Get.MatchStartInfo(false)

		panorama.RunScript([[
			$.AsyncWebRequest(']] .. GUIObjects.Webhook.Text:GetValue() .. [[', {
				type: 'POST',
				data: {
					content: ']] .. Content .. [['
				}
			});
		]])
	end

	-- At Match End
	if GUIObjects.Ping.EndMatch.Enabled:GetValue() and Event:GetName() == 'cs_win_panel_match' then
		local MyTeam = Get.Team(client.GetLocalPlayerIndex())
		if not MyTeam == 2 and not MyTeam == 3 then
			print('DiscordPing: Send Info -> At Match End: Team not found')
			return
		end

		local Content = '--------------------------' .. [[\n]]
		Content = Content .. '**CS:GO Match Finished**' .. [[\n--------------------------\n\n]]
		Content = Content .. '**' .. Get.GameMode() .. ' | ' .. (MapNames[engine.GetMapName()] or engine.GetMapName()) .. '**'.. [[\n\n]]
		Content = Content .. '**Your Team**: ' .. Get.TeamInitials(false) .. Get.MatchEndInfo(true)
		Content = Content .. '**Enemy Team**: ' .. Get.TeamInitials(true) .. Get.MatchEndInfo(false)

		panorama.RunScript([[
			function GetGameScore() {
				const LocalPlayerTeamNumber = ']] .. tostring( Get.Team(client.GetLocalPlayerIndex()) ) .. [[';
				const GameScore = () => {
					CTScore = GameStateAPI.GetScoreDataJSO()['teamdata']['CT']['score'];
					TScore = GameStateAPI.GetScoreDataJSO()['teamdata']['TERRORIST']['score'];
					return LocalPlayerTeamNumber == 2 ? `**Score**: T: ${TScore} | CT: ${CTScore}` : `**Score**: CT: ${CTScore} | T: ${TScore}`;
				};
				const GameMode = GameStateAPI.GetGameModeInternalName(false);
				return (GameMode != 'gungameprogressive' && GameMode != 'deathmatch' && GameMode != 'survival') ? GameScore() : null;
			}

			$.AsyncWebRequest(']] .. GUIObjects.Webhook.Text:GetValue() .. [[', {
				type: 'POST',
				data: {
					content: GetGameScore() ? ']] .. Content .. [[' + GetGameScore() : ']] .. Content .. [['
				}
			});
		]])
	end
end)

client.AllowListener('round_announce_match_start')
client.AllowListener('cs_win_panel_match')
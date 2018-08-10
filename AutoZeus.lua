local SET = gui.SetValue;
local userid_to_index = client.GetPlayerIndexByUserID;
local get_local_player = client.GetLocalPlayerIndex;

local function on_item_equip(Event)
	-- returns if the current event is not the item_equip event
	if (Event:GetName() ~= 'item_equip') then
		return;
	end

	local local_player, userid, item, weptype = get_local_player(), Event:GetInt('userid'), Event:GetString('item'), Event:GetInt('weptype');

	-- checks if the local players index is equal to the player that called the event
	if (local_player == userid_to_index(userid)) then
		if (item == "taser") then
			SET("rbot_active", 1); -- Master Switch: On
			SET("rbot_enable", 1);
			SET("rbot_fov", 30);
			SET("rbot_silentaim", 1); -- Silent Aim: On
			SET("rbot_rifle_hitchance", 80); -- Zeus hitchance
		else
			SET("rbot_active", 0); -- Master Switch: Off
		end
	end
end

client.AllowListener('item_equip');
callbacks.Register("FireGameEvent", "on_item_equip", on_item_equip);

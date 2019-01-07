local MSC_EXTRA_REF = gui.Reference( "MISC", "GENERAL", "Extra" );

local LEFT_HAND_KNIFE = gui.Checkbox( MSC_EXTRA_REF, "lua_lefthand_knife", "Left Hand Knife", 0 );

local function LeftHandKnife()

	if LEFT_HAND_KNIFE:GetValue() then

		if entities.GetLocalPlayer() == nil then
			return;
		end

		local LocalPlayerEntity = entities.GetLocalPlayer();

		local IsAlive = LocalPlayerEntity:IsAlive();
		local WeaponType = LocalPlayerEntity:GetWeaponType();

		if IsAlive then
			if WeaponType == 0 then
				client.Command( "cl_righthand 0", true );
			else
				client.Command( "cl_righthand 1", true );
			end
		else
			client.Command( "cl_righthand 1", true );
		end

	end

end

callbacks.Register( "Draw", "Left Hand Knife", LeftHandKnife )

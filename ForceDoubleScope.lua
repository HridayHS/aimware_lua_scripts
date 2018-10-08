local GetValue = gui.GetValue;
local SetValue = gui.SetValue;

local UserViewFov = GetValue( "vis_view_fov" );

local function ZoomFOV()
    
    if ( UserViewFov > 0 ) then
    
        if entities.GetLocalPlayer() ~= nil then

            local LocalPlayer = entities.GetLocalPlayer();
            local isScoped = LocalPlayer:GetProp( "m_bIsScoped" );
    
            if isScoped == 1 or isScoped == 257 then
                SetValue( "vis_view_fov", 0 );
            else
                SetValue( "vis_view_fov", UserViewFov );
            end

        end

    end
    
end

callbacks.Register( "Draw", "ZoomFOV", ZoomFOV);

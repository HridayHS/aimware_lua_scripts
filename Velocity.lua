function Velocity()

    local w, h = draw.GetScreenSize();
   
    if entities.GetLocalPlayer() ~= nil then

        local Entity = entities.GetLocalPlayer();
        local Alive = Entity:IsAlive();

        local velocityX = Entity:GetPropFloat( "localdata", "m_vecVelocity[0]" );
        local velocityY = Entity:GetPropFloat( "localdata", "m_vecVelocity[1]" );
   
        local velocity = math.sqrt( velocityX^2 + velocityY^2 );
        local FinalVelocity = math.min( 9999, velocity ) + 0.2;
        
        draw.Color( 255, 255, 255, 255 );
        
        if ( Alive == true ) then
            draw.Text( 2, h - 416, "Vel: " .. math.floor(FinalVelocity) );
        else
            draw.Text( 2, h - 416, "Vel: 0" );
        end

    end

end

callbacks.Register( "Draw", "Velocity", Velocity )

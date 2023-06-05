function LoadUI()
    local ui = {}
    ui.health1 = love.graphics.newImage("assets/UI/HPBarSprite1HP.png")
    ui.health2 = love.graphics.newImage("assets/UI/HPBarSprite2HP.png")
    ui.health3 = love.graphics.newImage("assets/UI/HPBarSprite3HP.png")
    ui.health4 = love.graphics.newImage("assets/UI/HPBarSprite4HP.png")
    ui.health5 = love.graphics.newImage("assets/UI/HPBarSprite5HP.png")
    ui.health6 = love.graphics.newImage("assets/UI/HPBarSprite6HP.png")
    ui.health7 = love.graphics.newImage("assets/UI/HPBarSprite7HP.png")
    ui.health8 = love.graphics.newImage("assets/UI/HPBarSprite8HP.png")
    ui.health9 = love.graphics.newImage("assets/UI/HPBarSprite9HP.png")
    ui.health10 = love.graphics.newImage("assets/UI/HPBarSprite10HP.png")
    ui.health11 = love.graphics.newImage("assets/UI/HPBarSprite11HP.png")
    ui.health12 = love.graphics.newImage("assets/UI/HPBarSprite12HP.png")
    ui.health13 = love.graphics.newImage("assets/UI/HPBarSprite13HP.png")
    ui.health14 = love.graphics.newImage("assets/UI/HPBarSprite14HP.png")
    ui.health15 = love.graphics.newImage("assets/UI/HPBarSprite15HP.png")
    ui.health16 = love.graphics.newImage("assets/UI/HPBarSprite16HP.png")
    ui.health17 = love.graphics.newImage("assets/UI/HPBarSprite17HP.png")
    ui.health18 = love.graphics.newImage("assets/UI/HPBarSprite18HP.png")
    ui.health19 = love.graphics.newImage("assets/UI/HPBarSprite19HP.png")
    ui.health20 = love.graphics.newImage("assets/UI/HPBarSprite20HP.png")
    ui.health21 = love.graphics.newImage("assets/UI/HPBarSprite21HP.png")
    ui.health22 = love.graphics.newImage("assets/UI/HPBarSprite22HP.png")
    ui.health23 = love.graphics.newImage("assets/UI/HPBarSprite23HP.png")
    ui.health24 = love.graphics.newImage("assets/UI/HPBarSprite24HP.png")
    ui.health25 = love.graphics.newImage("assets/UI/HPBarSpriteFull.png")
    ui.SSM1 = love.graphics.newImage("assets/UI/SSMBarSprite1.png")
    ui.SSM2 = love.graphics.newImage("assets/UI/SSMBarSprite2.png")
    ui.SSM3 = love.graphics.newImage("assets/UI/SSMBarSprite3.png")
    ui.SSM4 = love.graphics.newImage("assets/UI/SSMBarSprite4.png")
    ui.SSM5 = love.graphics.newImage("assets/UI/SSMBarSprite5.png")
    ui.SSM6 = love.graphics.newImage("assets/UI/SSMBarSprite6.png")
    ui.SSM7 = love.graphics.newImage("assets/UI/SSMBarSprite7.png")
    ui.SSM8 = love.graphics.newImage("assets/UI/SSMBarSprite8.png")
    ui.SSM9 = love.graphics.newImage("assets/UI/SSMBarSprite9.png")
    ui.SSMempty = love.graphics.newImage("assets/UI/SSMBarSpriteEmpty.png")
    ui.SSMfull = love.graphics.newImage("assets/UI/SSMBarSpriteFull.png")
    ui.Stamina1 = love.graphics.newImage("assets/UI/StaminaBarSprite1.png")
    ui.Stamina2 = love.graphics.newImage("assets/UI/StaminaBarSprite2.png")
    ui.Stamina3 = love.graphics.newImage("assets/UI/StaminaBarSprite3.png")
    ui.Stamina4 = love.graphics.newImage("assets/UI/StaminaBarSprite4.png")
    ui.Stamina5 = love.graphics.newImage("assets/UI/StaminaBarSprite5.png")
    ui.Stamina6 = love.graphics.newImage("assets/UI/StaminaBarSprite6.png")
    ui.Stamina7 = love.graphics.newImage("assets/UI/StaminaBarSprite7.png")
    ui.Stamina8 = love.graphics.newImage("assets/UI/StaminaBarSprite8.png")
    ui.Stamina9 = love.graphics.newImage("assets/UI/StaminaBarSprite9.png")
    ui.StaminaEmpty = love.graphics.newImage("assets/UI/StaminaBarSpriteEmpty.png")
    ui.StaminaFull = love.graphics.newImage("assets/UI/StaminaBarSpriteFull.png")
    ui.key = love.graphics.newImage("assets/UI/KeyPicked.png")

    return ui
end

function DrawUI(player, ui)
    if player.health > 0 and player.health <= 1  then
        love.graphics.draw(ui.health1, 0, 0)
    elseif  player.health > 1 and player.health <= 2  then
        love.graphics.draw(ui.health2, 0, 0)
    elseif  player.health > 2 and player.health <= 3  then
        love.graphics.draw(ui.health3, 0, 0)
    elseif  player.health > 3 and player.health <= 4  then
        love.graphics.draw(ui.health4, 0, 0)
    elseif  player.health > 4 and player.health <= 5  then
        love.graphics.draw(ui.health5, 0, 0)
    elseif  player.health > 5 and player.health <= 6  then
        love.graphics.draw(ui.health6, 0, 0)
    elseif  player.health > 6 and player.health <= 7  then
        love.graphics.draw(ui.health7, 0, 0)
    elseif  player.health > 7 and player.health <= 8  then
        love.graphics.draw(ui.health8, 0, 0)
    elseif  player.health > 8 and player.health <= 9  then
        love.graphics.draw(ui.health9, 0, 0)
    elseif  player.health > 9 and player.health <= 10  then
        love.graphics.draw(ui.health10, 0, 0)
    elseif  player.health > 10 and player.health <= 11  then
        love.graphics.draw(ui.health11, 0, 0)
    elseif  player.health > 11 and player.health <= 12  then
        love.graphics.draw(ui.health12, 0, 0)
    elseif player.health > 12 and player.health <= 13  then
        love.graphics.draw(ui.health13, 0, 0)
    elseif player.health > 13 and player.health <= 14 then
        love.graphics.draw(ui.health14, 0, 0)
    elseif  player.health > 14 and player.health <= 15  then
        love.graphics.draw(ui.health15, 0, 0)
    elseif  player.health > 15 and player.health <= 16  then
        love.graphics.draw(ui.health16, 0, 0)
    elseif  player.health > 16 and player.health <= 17  then
        love.graphics.draw(ui.health17, 0, 0)
    elseif  player.health > 17 and player.health <= 18  then
        love.graphics.draw(ui.health18, 0, 0)
    elseif  player.health > 18 and player.health <= 19  then
        love.graphics.draw(ui.health19, 0, 0)
    elseif  player.health > 19 and player.health <= 20  then
        love.graphics.draw(ui.health20, 0, 0)
    elseif  player.health > 20 and player.health <= 21 then
        love.graphics.draw(ui.health21, 0, 0)
    elseif  player.health > 21 and player.health <= 22  then
        love.graphics.draw(ui.health22, 0, 0)
    elseif  player.health > 22 and player.health <= 23  then
        love.graphics.draw(ui.health23, 0, 0)
    elseif  player.health > 23 and player.health <= 24  then
        love.graphics.draw(ui.health24, 0, 0)
    elseif  player.health > 24 and player.health <= 25  then
        love.graphics.draw(ui.health25, 0, 0)
    end
    
    if player.SSM == 0 then
        love.graphics.draw(ui.SSMempty, 0, 127)
    
    elseif player.SSM == 1 then
        love.graphics.draw(ui.SSM1, 0, 127)
    
    elseif player.SSM == 2 then
        love.graphics.draw(ui.SSM2, 0, 127)
    
    elseif player.SSM == 3 then
        love.graphics.draw(ui.SSM3, 0, 127)
    
    elseif player.SSM == 4 then
        love.graphics.draw(ui.SSM4, 0, 127)
    
    elseif player.SSM == 5 then
        love.graphics.draw(ui.SSM5, 0, 127)
    
    elseif player.SSM == 6 then
        love.graphics.draw(ui.SSM6, 0, 127)
    
    elseif player.SSM == 7 then
        love.graphics.draw(ui.SSM7, 0, 127)
    
    elseif player.SSM == 8 then
        love.graphics.draw(ui.SSM8, 0, 127)
    
    elseif player.SSM == 9 then
        love.graphics.draw(ui.SSM9, 0, 127)
    
    elseif player.SSM == 10 then
        love.graphics.draw(ui.SSMfull, 0, 127)
    end

    if player.stamina >= 0 and player.stamina < 1 then
        love.graphics.draw(ui.StaminaEmpty, 0, 224)
    end
    if player.stamina >= 1 and player.stamina < 2 then
        love.graphics.draw(ui.Stamina1, 0, 224)
    end
    if player.stamina >= 2 and player.stamina < 3 then
        love.graphics.draw(ui.Stamina2, 0, 224)
    end
    if player.stamina >= 3 and player.stamina < 4 then
        love.graphics.draw(ui.Stamina3, 0, 224)
    end
    if player.stamina >= 4 and player.stamina < 5 then
        love.graphics.draw(ui.Stamina4, 0, 224)
    end
    if player.stamina >= 5 and player.stamina < 6 then
        love.graphics.draw(ui.Stamina5, 0, 224)
    end
    if player.stamina >= 6 and player.stamina < 7 then
        love.graphics.draw(ui.Stamina6, 0, 224)
    end
    if player.stamina >= 7 and player.stamina < 8 then
        love.graphics.draw(ui.Stamina7, 0, 224)
    end
    if player.stamina >= 8 and player.stamina < 9 then
        love.graphics.draw(ui.Stamina8, 0, 224)
    end
    if player.stamina >= 9 and player.stamina < 10 then
        love.graphics.draw(ui.Stamina9, 0, 224)
    end
    if player.stamina >= 10 then
        love.graphics.draw(ui.StaminaFull, 0, 224)
    end
    
    if player.keycollected == true then
        love.graphics.draw(ui.key, 1854, 0)
    end


end
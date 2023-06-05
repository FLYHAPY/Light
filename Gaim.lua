function LoadMAINMenu ()
  local mainMenu = {} 
    mainMenu.game_state = 'menu'
    mainMenu.menus = { 'Play', 'How To Play', 'Quit' }
    mainMenu.selected_menu_item = 1
    mainMenu.window_width = 1920
    mainMenu.window_height = 1080
    mainMenu.playy = love.graphics.newImage("assets/mainmenu/Playbutton.png")
    mainMenu.playy_act = love.graphics.newImage("assets/mainmenu/PlayButtonActive.png")
    mainMenu.quit = love.graphics.newImage("assets/mainmenu/QuitButton.png")
    mainMenu.quit_active = love.graphics.newImage("assets/mainmenu/QuitButtonActive.png")
    mainMenu.controls = love.graphics.newImage("assets/mainmenu/ControlsButton.png")
    mainMenu.controls_act = love.graphics.newImage("assets/mainmenu/ControlsButtonActive.png")
    mainMenu.pause_menus = { 'Resume', 'Quit' }
    mainMenu.selected_pause_item = 1
    mainMenu.resume = love.graphics.newImage("assets/mainmenu/ResumeButton.png")
    mainMenu.resume_act = love.graphics.newImage("assets/mainmenu/ResumeButtonActive.png")
    mainMenu.backmenu = love.graphics.newImage("assets/mainmenu/MenuWithoutButtons.png")
    mainMenu.backpause = love.graphics.newImage("assets/mainmenu/PauseWithoutButtons.png")
    mainMenu.overback = love.graphics.newImage("assets/mainmenu/Game_Over.png")
    mainMenu.winback = love.graphics.newImage("assets/mainmenu/Win_Screen.png")
    mainMenu.howback = love.graphics.newImage("assets/mainmenu/HowToPlay.png")
    mainMenu.start = 0
    mainMenu.transition = 0
    mainMenu.transition1 = 0
    mainMenu.gameback = love.graphics.newImage("assets/.png/GameBG.png")
    mainMenu.mainMenusong = love.audio.newSource("assets/.mp3/MainMenu.mp3","stream")
    mainMenu.Gamesong = love.audio.newSource("assets/.mp3/GameMusic.mp3","stream")
    
    return mainMenu

end

function Draw_menu(mainMenu)
  
  love.graphics.draw(mainMenu.backmenu, 0, 0)
  love.graphics.draw(mainMenu.playy, 750, 650)
  love.graphics.draw(mainMenu.quit, 750, 850)
  love.graphics.draw(mainMenu.controls, 750, 750)

  if mainMenu.selected_menu_item == 1 then
    love.graphics.draw(mainMenu.playy_act, 750, 650)  
  end
  if mainMenu.selected_menu_item == 3 then
    love.graphics.draw(mainMenu.quit_active, 750, 850)
  end
  if mainMenu.selected_menu_item == 2 then
    love.graphics.draw(mainMenu.controls_act, 750, 750)
  end

end

function DrawLose(mainMenu)
  love.graphics.draw(mainMenu.overback, 0, 0)
end

function DrawWin(mainMenu)
  love.graphics.draw(mainMenu.winback, 0, 0)
end

function Draw_how_to_play(mainMenu)

 love.graphics.draw(mainMenu.howback, 0, 0)

end

function Draw_pause(mainMenu)
  love.graphics.draw(mainMenu.backpause, 0, 0)
  love.graphics.draw(mainMenu.resume, 750, 700)
  love.graphics.draw(mainMenu.quit, 750, 900)


  if mainMenu.selected_pause_item == 1 then
    love.graphics.draw(mainMenu.resume_act, 750, 700)  
  end
  if mainMenu.selected_pause_item == 2 then
    love.graphics.draw(mainMenu.quit_active, 750, 900)
  end

end

function Menu_keypressed(key, mainMenu)

  -- pressing Esc on the main menu quits the game
  if key == 'escape' then
    love.event.quit()

  -- pressing up selects the previous menu item, wrapping to the bottom if necessary
  elseif key == 'up' then

    mainMenu.selected_menu_item = mainMenu.selected_menu_item - 1

    if mainMenu.selected_menu_item < 1 then
      mainMenu.selected_menu_item = #mainMenu.menus
    end

  -- pressing down selects the next menu item, wrapping to the top if necessary
  elseif key == 'down' then

    mainMenu.selected_menu_item = mainMenu.selected_menu_item + 1

    if mainMenu.selected_menu_item > #mainMenu.menus then
      mainMenu.selected_menu_item = 1
    end

  -- pressing enter changes the game state (or quits the game)
  elseif key == 'return' or key == 'kpenter' then

    if mainMenu.menus[mainMenu.selected_menu_item] == 'Play' then
      mainMenu.game_state = 'transition1'
    elseif mainMenu.menus[mainMenu.selected_menu_item] == 'How To Play' then
      mainMenu.game_state = 'how-to-play'

    elseif mainMenu.menus[mainMenu.selected_menu_item] == 'Quit' then
      love.event.quit()
    end
    

  end  
end


function How_to_play_keypressed(key, mainMenu)

  if key == 'escape' then
    mainMenu.game_state = 'menu'
  end

end

function Game_keypressed(key, mainMenu)

  if key == 'escape' then
    mainMenu.game_state = 'paused'
  end

end

function Lose_keypressed(key, mainMenu)

  if key == 'escape' then
    mainMenu.game_state = 'menu'
  end

end

function Win_keypressed(key, mainMenu)

  if key == 'escape' then
    mainMenu.game_state = 'menu'
  end

end

function Pause_keypressed(key, mainMenu)

  if key == 'escape' then
    mainMenu.game_state = 'game'

  elseif  key == 'up' then

      mainMenu.selected_pause_item = mainMenu.selected_pause_item - 1
  
      if mainMenu.selected_pause_item < 1 then
        mainMenu.selected_pause_item = #mainMenu.pause_menus
      end
  
    -- pressing down selects the next menu item, wrapping to the top if necessary
    elseif key == 'down' then
  
      mainMenu.selected_pause_item = mainMenu.selected_pause_item + 1
  
      if mainMenu.selected_pause_item > #mainMenu.pause_menus then
        mainMenu.selected_pause_item = 1
      end
    
  -- pressing enter changes the game state (or quits the game)    
    elseif key == 'return' or key == 'kpenter' then

      if mainMenu.selected_pause_item == 1 then
        mainMenu.game_state = 'game'
  
      elseif mainMenu.selected_pause_item == 2 then
        mainMenu.game_state = 'transition'
      end
  end
end

function LoadGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door, dt)
  if mainMenu.game_state ~= "game" and mainMenu.game_state ~= "paused" then
  
  mainMenu.start = mainMenu.start + dt

  end

  if mainMenu.game_state == "game" and mainMenu.start > 0.00001 then

  mainMenu.start = 0

    player.body:setPosition(70, 1800)
    player.body:setLinearVelocity(0 , -300)
    


    if enemy1[1].body == nil and enemy1[1].shape == nil then
      table.insert(enemy1, 1, Load_enemy(World, 768, 1728))
    end
    if   enemy1[2].body == nil and enemy1[2].shape == nil then
      table.insert(enemy1, 2, Load_enemy(World, 3584, 1792))
    end
    if  enemy1[3].body == nil and enemy1[3].shape == nil then
      table.insert(enemy1, 3, Load_enemy(World, 3008, 1152))
    end
    if  enemy1[4].body == nil and enemy1[4].shape == nil then
      table.insert(enemy1, 4, Load_enemy(World, 1088, 1152))
    end
    if  enemy1[5].body == nil and enemy1[5].shape == nil then
      table.insert(enemy1, 5, Load_enemy(World, 1280, 640))
    end
    if  enemy1[6].body == nil and enemy1[6].shape == nil then
      table.insert(enemy1, 6, Load_enemy(World, 1792, 640))
    end
    if  enemy1[7].body == nil and enemy1[7].shape == nil then
      table.insert(enemy1, 7, Load_enemy(World, 2624, 640))
    end
    if  enemy1[8].body == nil and enemy1[8].shape == nil then
      table.insert(enemy1, 8, Load_enemy(World, 4800, 832))
    end
    if  enemy1[9].body == nil and enemy1[9].shape == nil then
      table.insert(enemy1, 9, Load_enemy(World, 7296, 1984))
    end
    if  enemy1[10].body == nil and enemy1[10].shape == nil then
      table.insert(enemy1, 10, Load_enemy(World, 5824, 512))
    end
    if  enemy1[11].body == nil and enemy1[11].shape == nil then
      table.insert(enemy1, 11, Load_enemy(World, 6272, 512))
    end
    
    
    if repairKits[1].body == nil and repairKits[1].shape == nil then
      table.insert(repairKits, 1, Createkit(World, 3232, 672, 64, 64))
    end
    if   repairKits[2].body == nil and repairKits[2].shape == nil then
      table.insert(repairKits, 2, Createkit(World, 4896, 1440, 64, 64))
    end
    if   repairKits[3].body == nil and repairKits[3].shape == nil then
      table.insert(repairKits, 3, Createkit(World, 7008, 1056, 64, 64))
    end
    if   repairKits[4].body == nil and repairKits[4].shape == nil then
      table.insert(repairKits, 4, Createkit(World, 6176, 1760, 64, 64))
    end
    
    if key[1].body == nil and key[1].shape == nil then
      table.insert(key, 1, Createkey(World, 5280, 2016, 64, 64) )
    end
    if door[1].body == nil and door[1].shape == nil then
      table.insert(door, 1, Createdoor(World, 4704, 576, 64, 128))
    end
  end
end

function DestroyGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door)
  if  mainMenu.game_state == "transition" or mainMenu.game_state == "transition1" then 
    

    key.collected = false
    player.canopendoor = false
    player.health = 10
    player.SSM = 0
    player.died = false
    player.stamina = 10
    player.keycollected = false
    
    for i = 1 , #enemy1, 1 do
    if enemy1[1].body ~= nil and enemy1[1].shape ~= nil then
      enemy1[1].body:destroy()
      enemy1[1].shape:release()
      enemy1[1].body = nil
      enemy1[1].shape = nil
    end
    if enemy1[2].body ~= nil and enemy1[2].shape ~= nil then
      enemy1[2].body:destroy()
      enemy1[2].shape:release()
      enemy1[2].body = nil
      enemy1[2].shape = nil
    end 
    if  enemy1[3].body ~= nil and enemy1[3].shape ~= nil then
      enemy1[3].body:destroy()
      enemy1[3].shape:release()
      enemy1[3].body = nil
      enemy1[3].shape = nil     
    end
    if  enemy1[4].body ~= nil and enemy1[4].shape ~= nil then
      enemy1[4].body:destroy()
      enemy1[4].shape:release()
      enemy1[4].body = nil
      enemy1[4].shape = nil     
    end
    if  enemy1[5].body ~= nil and enemy1[5].shape ~= nil then
      enemy1[5].body:destroy()
      enemy1[5].shape:release()
      enemy1[5].body = nil
      enemy1[5].shape = nil     
    end
    if  enemy1[6].body ~= nil and enemy1[6].shape ~= nil then
      enemy1[6].body:destroy()
      enemy1[6].shape:release()
      enemy1[6].body = nil
      enemy1[6].shape = nil     
    end
    if  enemy1[7].body ~= nil and enemy1[7].shape ~= nil then
      enemy1[7].body:destroy()
      enemy1[7].shape:release()
      enemy1[7].body = nil
      enemy1[7].shape = nil     
    end
    if  enemy1[8].body ~= nil and enemy1[8].shape ~= nil then
      enemy1[8].body:destroy()
      enemy1[8].shape:release()
      enemy1[8].body = nil
      enemy1[8].shape = nil     
    end
    if  enemy1[9].body ~= nil and enemy1[9].shape ~= nil then
      enemy1[9].body:destroy()
      enemy1[9].shape:release()
      enemy1[9].body = nil
      enemy1[9].shape = nil     
    end
    if  enemy1[10].body ~= nil and enemy1[10].shape ~= nil then
      enemy1[10].body:destroy()
      enemy1[10].shape:release()
      enemy1[10].body = nil
      enemy1[10].shape = nil     
    end
    if  enemy1[11].body ~= nil and enemy1[11].shape ~= nil then
      enemy1[11].body:destroy()
      enemy1[11].shape:release()
      enemy1[11].body = nil
      enemy1[11].shape = nil     
    end

  end
  for i = 1 , #repairKits, 1 do
    if repairKits[1].body ~= nil and repairKits[1].shape ~= nil then
      repairKits[1].body:destroy()
      repairKits[1].shape:release()
      repairKits[1].body = nil
      repairKits[1].shape = nil
    end
    if repairKits[2].body ~= nil and repairKits[2].shape ~= nil then
      repairKits[2].body:destroy()
      repairKits[2].shape:release()
      repairKits[2].body = nil
      repairKits[2].shape = nil
    end
    if repairKits[3].body ~= nil and repairKits[3].shape ~= nil then
      repairKits[3].body:destroy()
      repairKits[3].shape:release()
      repairKits[3].body = nil
      repairKits[3].shape = nil
    end 
    if repairKits[4].body ~= nil and repairKits[4].shape ~= nil then
      repairKits[4].body:destroy()
      repairKits[4].shape:release()
      repairKits[4].body = nil
      repairKits[4].shape = nil
    end  
  end
    
    for i = 1, #key, 1 do
      if key.body ~= nil then
        key[1].body:destroy()
        key[1].shape:release()
        table.remove(key, 1)
        break
      end
    for i = 1, #door, 1 do
      if door.body ~= nil then
        door[1].body:destroy()
        door[1].shape:release()
        table.remove(door, 1)
        break
      end
    end
  end
end

function UpdateMenu(mainMenu, dt)
  if mainMenu.game_state == "game" then
    mainMenu.selected_menu_item = 1
    mainMenu.selected_pause_item = 1
    love.audio.play(mainMenu.Gamesong)
  end
  if mainMenu.game_state == "menu" then
  mainMenu.selected_pause_item = 1
  love.audio.play(mainMenu.mainMenusong)
  love.audio.stop(mainMenu.Gamesong)
  end
  if mainMenu.game_state == "transition" then
    mainMenu.transition = mainMenu.transition + dt
    love.audio.stop(mainMenu.Gamesong)
  end
  if mainMenu.transition >= 0.5 then
    mainMenu.transition = 0
    mainMenu.game_state = "menu"
  end
  
  if mainMenu.game_state == "transition1" then
    mainMenu.transition1 = mainMenu.transition1 + dt
    love.audio.stop(mainMenu.mainMenusong)
  end
  if mainMenu.transition1 >= 0.5 then
    mainMenu.transition1 = 0
    mainMenu.game_state = "game"
  end
end
end
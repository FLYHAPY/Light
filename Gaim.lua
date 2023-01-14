require "player"
require "repair_kit"
require "platform"
require "enemies"
require "vector2"
require "spikes"
require "key"
require "door"

function LoadMAINMenu ()
  local mainMenu = {} 
    mainMenu.game_state = 'menu'
    mainMenu.menus = { 'Play', 'How To Play', 'Quit' }
    mainMenu.selected_menu_item = 1
    mainMenu.window_width = 1920
    mainMenu.window_height = 1080
    mainMenu.playy = love.graphics.newImage("Playbutton.png")
    mainMenu.playy_act = love.graphics.newImage("PlayButtonActive.png")
    mainMenu.quit = love.graphics.newImage("QuitButton.png")
    mainMenu.quit_active = love.graphics.newImage("QuitButtonActive.png")
    mainMenu.controls = love.graphics.newImage("ControlsButton.png")
    mainMenu.controls_act = love.graphics.newImage("ControlsButtonActive.png")
    mainMenu.pause_menus = { 'Resume', 'Quit' }
    mainMenu.selected_pause_item = 1
    mainMenu.resume = love.graphics.newImage("ResumeButton.png")
    mainMenu.resume_act = love.graphics.newImage("ResumeButtonActive.png")
    mainMenu.backmenu = love.graphics.newImage("MenuWithoutButtons.png")
    mainMenu.backpause = love.graphics.newImage("PauseWithoutButtons.png")
    mainMenu.overback = love.graphics.newImage("GameOverNoButtons.png")
    mainMenu.howback = love.graphics.newImage("HowToPlay.png")
    mainMenu.start = 0
    
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
      mainMenu.game_state = 'game'
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
        mainMenu.game_state = 'menu'
      end
  end
end

function LoadGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door, dt)
  if mainMenu.game_state ~= "game" and mainMenu.game_state ~= "paused" then
  
  mainMenu.start = mainMenu.start + dt

  end

  if mainMenu.game_state == "game" and mainMenu.start > 0.00001 then

  mainMenu.start = 0

    player.body:setPosition(500, 1700)
    player.body:setLinearVelocity(0 , -300)
    

    --[[level1 = {}
    level1[1] = CreatePlatform(World, 0, 600, 2000, 50)
    level1[2] = CreatePlatform(World, -900, 560, 30, 80)
    level1[3] = CreatePlatform(World, -800, 550, 30, 130)
    level1[4] = CreatePlatform(World, -700, 520, 30, 200)
    level1[5] = CreatePlatform(World, -300, 580, 30, 20)
    level1[6] = CreatePlatform(World, 100, 580, 30, 20)
    level1[7] = CreatePlatform(World, 500, 580, 30, 20)--]]


    table.insert(repairKits, Createkit(World, -300, 560, 20, 20))
    table.insert(repairKits, Createkit(World, 100, 560, 20, 20))
    table.insert(repairKits, Createkit(World, 500, 560, 20, 20))

    table.insert(enemy1, Load_enemy(World, -300, 350))
    table.insert(enemy1, Load_enemy(World, 550, 1600))
    table.insert(enemy1, Load_enemy(World, 220, 1900))

    
    table.insert(spikes, Createspikes(World, -850, 560, 70, 30))
    table.insert(spikes, Createspikes(World, -750, 560, 70, 30))

    table.insert(key, Createkey(World, 550, 1600, 20, 20)) 

    
  end
end

function DestroyGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door)
  if  mainMenu.game_state == "menu" then 
    

    key.collected = false
    player.canopendoor = false
    player.health = 10
    
    
    for i = 1, #enemy1, 1 do
      enemy1[i].body:destroy()
      enemy1[i].shape:release()
      table.remove(enemy1, i)
      break
    end

    for i = 1, #spikes, 1 do
      spikes[i].body:destroy()
      spikes[i].shape:release()
      table.remove(spikes, i)
      break
    end 
    spikes = {}
    for i = 1, #repairKits, 1 do
      if repairKits.body == nil then
      repairKits[i].body:destroy()
      repairKits[i].shape:release()
      table.remove(repairKits, i)
      break
      end
    end
    for i = 1, #key, 1 do
      if key.body == nil then
        key[1].body:destroy()
        key[1].shape:release()
        table.remove(key, 1)
        break
      end
    end
  end
end

function UpdateMenu(mainMenu)
  if mainMenu.game_state == "game" then
    mainMenu.selected_menu_item = 1
  end
  if mainMenu.game_state == "menu" then
  mainMenu.selected_pause_item = 1
  end
end
function set_pause()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f1") then 
                DEBUG_PAUSE_STATE = "Pressing"
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f1") then 
                DEBUG_PAUSE_STATE = "Pressing"
            else
                DEBUG_PAUSE_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if DEBUG_PAUSE == false then 
                DEBUG_PAUSE = true
            elseif DEBUG_PAUSE == true then 
                DEBUG_PAUSE = false
            end
            if love.keyboard.isDown("f1") then 
                DEBUG_PAUSE_STATE = "Holding"
            else
                DEBUG_PAUSE_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("f1") then 
                DEBUG_PAUSE_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_PAUSE_STATE]
    if this_function then this_function() end
end

function set_show_hitbox()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Pressing"
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Pressing"
            else
                DEBUG_HITBOX_SHOWS_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if DEBUG_HITBOX_SHOWS == false then 
                DEBUG_HITBOX_SHOWS = true
            elseif DEBUG_HITBOX_SHOWS == true then 
                DEBUG_HITBOX_SHOWS = false
            end
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Holding"
            else
                DEBUG_HITBOX_SHOWS_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_HITBOX_SHOWS_STATE]
    if this_function then this_function() end
end

function set_show_info()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f3") then 
                DEBUG_INFO_SHOWS_STATE = "Pressing"
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f3") then 
                DEBUG_INFO_SHOWS_STATE = "Pressing"
            else
                DEBUG_INFO_SHOWS_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if DEBUG_INFO_SHOWS == false then 
                DEBUG_INFO_SHOWS = true
            elseif DEBUG_INFO_SHOWS == true then 
                DEBUG_INFO_SHOWS = false
            end
            if love.keyboard.isDown("f3") then 
                DEBUG_INFO_SHOWS_STATE = "Holding"
            else
                DEBUG_INFO_SHOWS_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("f3") then 
                DEBUG_INFO_SHOWS_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_INFO_SHOWS_STATE]
    if this_function then this_function() end
end




function update_character_frame_info(obj_char)
    -- none startup active recovery
    obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    if obj_char["move_state"] == "none" and obj_char_other_side["move_state"] == "recovery" then
        obj_char["frame_adv"] = obj_char["frame_adv"] + 1
    end
    if obj_char["move_state"] == "none" then
        return
    end
    if obj_char["game_speed"] == 0 or obj_char_other_side["game_speed"] == 0 then
        return
    end

    -- obj_char["startup_frame"] = 0
    -- obj_char["active_frame"] = 0
    -- obj_char["recovery_frame"] = 0
    -- obj_char["frame_adv"] = 0
    if obj_char["move_state"] == "startup" then
        obj_char["startup_frame"] = obj_char["startup_frame"] + 1
    end
    if obj_char["move_state"] == "active" 
    and obj_char["state"] ~= "hitstop" 
    and obj_char["state"] ~= "hurtstop" 
    and obj_char["state"] ~= "blockstop" 
    then
        obj_char["active_frame"] = obj_char["active_frame"] + 1
    end
    if obj_char["move_state"] == "recovery" then
        obj_char["recovery_frame"] = obj_char["recovery_frame"] + 1
    end

end



function draw_debug_info_all(x_offset,y_offset)
    draw_input_sys(x_offset,y_offset)
    love.graphics.print( "FRAMES_DRAWN", 0+x_offset, 240+y_offset)
    love.graphics.print( "GRAPHICIAL_FPS", 0+x_offset, 255+y_offset)
    love.graphics.print( "SCENE_TIMER", 0+x_offset, 270+y_offset)
    love.graphics.print( FRAMES_DRAWN, 110+x_offset, 240+y_offset)
    love.graphics.print( FPS, 110+x_offset, 255+y_offset)
    love.graphics.print( SCENE_TIMER, 110+x_offset, 270+y_offset)
    -- 获取统计信息
    local stats = love.graphics.getStats()
    -- 显示统计信息
    love.graphics.print("Draw Calls: " .. stats.drawcalls, 250+x_offset, 150+y_offset)
    love.graphics.print("Canvas Switches: " .. stats.canvasswitches, 250+x_offset, 30+y_offset)
    love.graphics.print("Texture Memory: " .. stats.texturememory / 1024 / 1024 .. " MB", 250+x_offset, 50+y_offset)
    love.graphics.print("Images Loaded: " .. stats.images, 250+x_offset, 70+y_offset)

    -- 绘制角色帧数
    if obj_char_game_scene_char_LP and obj_char_game_scene_char_RP then
        update_character_frame_info(obj_char_game_scene_char_LP)
        update_character_frame_info(obj_char_game_scene_char_RP)
        love.graphics.print("LP_current_f : " .. obj_char_game_scene_char_LP["f"], 0+x_offset, 300+y_offset)
        love.graphics.print("LP_startup   : " .. obj_char_game_scene_char_LP["startup_frame"], 0+x_offset, 315+y_offset)
        love.graphics.print("LP_active    : " .. obj_char_game_scene_char_LP["active_frame"], 0+x_offset, 330+y_offset)
        love.graphics.print("LP_recovery  : " .. obj_char_game_scene_char_LP["recovery_frame"], 0+x_offset, 345+y_offset)
        love.graphics.print("LP_frame_adv : " .. obj_char_game_scene_char_LP["frame_adv"], 0+x_offset, 360+y_offset)
        love.graphics.print("LP_move_state: " .. obj_char_game_scene_char_LP["move_state"], 0+x_offset, 375+y_offset)
        love.graphics.print("LP_GS_ctd	  : " .. obj_char_game_scene_char_LP["game_speed_abnormal_realtime_countdown"], 0+x_offset, 390+y_offset)
        love.graphics.print("LP_GS		  : " .. obj_char_game_scene_char_LP["game_speed"], 0+x_offset, 405+y_offset)
        love.graphics.print("LP_GS_sub_f  : " .. obj_char_game_scene_char_LP["game_speed_subframe"], 0+x_offset, 420+y_offset)
        love.graphics.print("RP_current_f : " .. obj_char_game_scene_char_RP["f"], 300+x_offset, 300+y_offset)
        love.graphics.print("RP_startup   : " .. obj_char_game_scene_char_RP["startup_frame"], 300+x_offset, 315+y_offset)
        love.graphics.print("RP_active    : " .. obj_char_game_scene_char_RP["active_frame"], 300+x_offset, 330+y_offset)
        love.graphics.print("RP_recovery  : " .. obj_char_game_scene_char_RP["recovery_frame"], 300+x_offset, 345+y_offset)
        love.graphics.print("RP_frame_adv : " .. obj_char_game_scene_char_RP["frame_adv"], 300+x_offset, 360+y_offset)
        love.graphics.print("RP_move_state: " .. obj_char_game_scene_char_RP["move_state"], 300+x_offset, 375+y_offset)
        love.graphics.print("RP_GS_ctd	  : " .. obj_char_game_scene_char_RP["game_speed_abnormal_realtime_countdown"], 300+x_offset, 390+y_offset)
        love.graphics.print("RP_GS		  : " .. obj_char_game_scene_char_RP["game_speed"], 300+x_offset, 405+y_offset)
        love.graphics.print("RP_GS_sub_f  : " .. obj_char_game_scene_char_RP["game_speed_subframe"], 300+x_offset, 420+y_offset)
    end
end
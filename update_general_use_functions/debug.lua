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
-- -- state
-- obj_char["f"] = nil
-- obj_char["sprite_sheet_state"] = "stand_idle"
-- obj_char["height_state"] = "stand" -- stand crouch air
-- obj_char["hit_type_state"] = "none" -- none strike throw burst
-- obj_char["hit_guard_type_state"] = "none" -- none all low high
-- obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
-- obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
-- obj_char["move_state"] = "none" -- none startup active recovery
-- obj_char["stand_hurt_animation"] = nil
-- obj_char["stand_block_animation"] = nil
-- obj_char["crouch_hurt_animation"] = nil
-- obj_char["crouch_block_animation"] = nil
-- obj_char["air_hurt_animation"] = nil
-- obj_char["air_block_animation"] = nil

-- obj_char["current_animation_length"] = 0 -- 如果为0则是循环动画

-- obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
-- obj_char["throw_active"] = false -- 防止在同一动作的active多次触发

-- obj_char["strike_inv"] = false
-- obj_char["strike_inv_countdown"] = 0
-- obj_char["throw_inv"] = false
-- obj_char["throw_inv_countdown"] = 0
-- obj_char["projectile_inv"] = false
-- obj_char["projectile_inv_countdown"] = 0
-- obj_char["burst_inv"] = false
-- obj_char["burst_inv_countdown"] = 0

-- obj_char["hit_function"] = function() end
-- obj_char["hurt_function"] = function() end
-- obj_char["parry_function"] = function() end

-- obj_char["hazama_hat_state"] = "off"
-- obj_char["hazama_hat_anchor_pos"] = {168,210}
-- obj_char["hazama_hat_animation"] = nil
-- obj_char["hazama_hat_8"] = 0 -- obj[hazama_hat_8]匕首图形上的帧数
-- obj_char["hazama_hat_f"] = 0 -- obj[hazama_hat_8]匕首逻辑上的帧数

-- -- state_number
-- obj_char["velocity"] = {0,0}
-- obj_char["velocity_cache"] = {0,0}
-- obj_char["gravity"] = 9.8
-- obj_char["friction"] = 1
-- obj_char["health"] = {11500, 11500, 11500, "fade_off"}
-- obj_char["heat"] = {0.0, 200.0} -- 0.0 - 200.0
-- obj_char["ability"] = {600.0, 600.0} -- 0.0 - 600.0
-- obj_char["overdrive"] = {600.0, 600.0, "off"} -- 0.0 - 600.0
-- obj_char["overdrive_timer"] = {0,0,0,0} -- 0f 00:00 
-- obj_char["overdrive_drain_speed"] = 24
-- obj_char["risk"] = {0.0, 300.0}-- 0.0 - 300.0
-- obj_char["positive_bouns"] = {0.0, 600.0} -- 0.0 - 600.0
-- obj_char["hurt_horizontal_velocity_correction"] = 1
-- obj_char["hurt_gravity_correction"] = 1
-- obj_char["hurt_damage_correction"] = 1

-- -- game_speed
-- obj_char["game_speed"] = 1
-- obj_char["game_speed_subframe"] = 1
-- obj_char["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
-- obj_char["hit_hurt_blockstop_countdown"] = 0
-- obj_char["hurtstop_wiggle_x"] = 0
-- obj_char["hurtstop_wiggle_y"] = 0
-- obj_char["current_hurtstop_wiggle_x_animation"] = nil
-- obj_char["current_hurtstop_wiggle_y_animation"] = nil

-- -- collide
-- obj_char["pushbox"] = {0, -185, 130, 370}
-- obj_char["collision_move_available"] = {1,1}
-- obj_char["hitbox_table"] = {}
-- obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

-- -- sub_obj
-- obj_char["projectile_table"] = {}
-- obj_char["VFX_HUD_table"] = {}
-- obj_char["black_overlay_table"] = {}

-- -- draw_correction
-- obj_char[8] = nil
-- obj_char["anchor_pos"] = {90,520}
-- obj_char["contrast"] = 1
-- obj_char["brightness"] = 0
-- obj_char["brightness_const"] = 0
-- obj_char["brightness_overdrive_const"] = 0.2
-- obj_char["hurtstop_wiggle_x"] = 0
-- obj_char["hurtstop_wiggle_y"] = 0
-- obj_char["current_hurtstop_wiggle_x_animation"] = nil
-- obj_char["current_hurtstop_wiggle_y_animation"] = nil


function load_game_scene_anim_char_TRM_stand_idle(obj_char)
    local res = {}
    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "5_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 0 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {215,520}

    end
    for i = 1,7 do
        res[i*7] = function()
            -- draw
            obj_char[8] = i
        end
    end
    res[8*7] = function()
        -- draw
        obj_char["f"] = -1
        obj_char[8] = 0
    end
    return res

end

function load_game_scene_anim_char_TRM_6(obj_char)
    local walk_speed = 9.0 -- 20
    local res = {}
    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "6_walk"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 84 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{7, -455, 100, 50}}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {288,510}

    end
    for i = 1,89 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end
    res[7] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- collide
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{10, -455, 100, 50}}

        -- draw
        obj_char[8] = 1
    end
    res[14] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 2
    end
    res[21] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 3
    end
    res[28] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 4
    end
    res[35] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 5
    end
    res[42] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 6
    end
    res[49] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 7
    end
    res[56] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 8
    end
    res[63] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 9
    end
    res[70] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 10
    end
    res[77] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 11
    end
    res[84] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char["f"] = 14
        obj_char[8] = 2
    end
    
    return res
end

function load_game_scene_anim_char_TRM_4(obj_char)
    local walk_speed = -7.0
    local res = {}
    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "4_walk"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 84 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{-7, -455, 100, 50}}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {171,520}

    end
    for i = 1,89 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end
    res[7] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- collide
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{-3, -455, 100, 50}}

        -- draw
        obj_char[8] = 1
        obj_char["anchor_pos"] = {160,520}
    end
    res[14] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 2
    end
    res[21] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 3
    end
    res[28] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 4
    end
    res[35] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 5
    end
    res[42] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 6
    end
    res[49] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 7
    end
    res[56] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 8
    end
    res[63] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 9
    end
    res[70] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 10
    end
    res[77] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char[8] = 11
    end
    res[84] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}

        -- draw
        obj_char["f"] = 21
        obj_char[8] = 2
    end
    return res
end

function load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
    local res = {}
    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "6_walk_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 8 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {155,520}

    end
    res[3] = function()
        -- state_number
        obj_char["velocity"] = {0,0}

        -- draw
        obj_char[8] = 1
    end
    res[8] = function()
        -- animation end
    end
    
    return res
end

function load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
    local res = {}
    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "4_walk_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 8 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {156,520}

    end
    res[3] = function()
        -- state_number
        obj_char["velocity"] = {0,0}

        -- draw
        obj_char[8] = 1
    end
    res[8] = function()
        -- animation end
    end
    
    return res
end



function load_game_scene_anim_char_TRM_overdrive(obj_char)
    local res = {}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- 更新hitbox table 有一个全屏的红框
    -- 更新逻辑为没有伤害 没有硬直 只是速度调为0

    local function update_move_overdrive_state()
        if obj_char["overdrive"][1] > 0 then
            obj_char["overdrive"][1] = 
            obj_char["overdrive"][1] - obj_char["overdrive_drain_speed"]
        elseif obj_char["overdrive"][1] < 0 then
            obj_char["overdrive"][1] = 0
        end
        if obj_char_other_side["game_speed_abnormal_realtime_countdown"] == 0 and obj_char["f"] >= 4 then
            obj_char["move_state"] = "recovery"
        end
    end
    
    for i = 0,69 do
        res[i] = function()
            -- state
            update_move_overdrive_state()
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "burst_overdrive"
        obj_char["height_state"] = "stand"
        obj_char["hit_type_state"] = "none"
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 70 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 70
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 70
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 70
        obj_char["burst_inv"] = true
        obj_char["burst_inv_countdown"] = 70

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        obj_char["hazama_hat_state"] = "off"
        obj_char["hazama_hat_anchor_pos"] = {168,210}

        -- state_number
        update_move_overdrive_state()
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["gravity"] = 9.8
        obj_char["friction"] = 1
        obj_char["overdrive"][3] = "on"

        play_obj_audio(audio_SFX_game_scene_overdrive)

        -- game_speed
        obj_char["game_speed"] = 1
        obj_char["game_speed_subframe"] = 1
        obj_char["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
        obj_char["hit_hurt_blockstop_countdown"] = 0

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑, 具体的box形状}
        obj_char["hurtbox_table"] = {}

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {286,619}
        obj_char["hurtstop_wiggle_x"] = 0
        obj_char["hurtstop_wiggle_y"] = 0

        -- VFX
        insert_VFX_game_scene_char_overdrive_badge(obj_char)
        insert_VFX_game_scene_char_overdrive_partical(obj_char)
        insert_VFX_game_scene_char_overdrive_black_overlay(obj_char)
    end
    res[3] = function() 
        -- state & state_number
        update_move_overdrive_state()
            -- idle状态下OD 恢复为3+13
            -- 攻击状态下OD 恢复为3+3
            -- block_stun状态下OD 恢复为3+23
        obj_char_other_side["game_speed"] = 0
        obj_char_other_side["game_speed_subframe"] = 0
        if obj_char["hurt_state"] == "idle" or  obj_char["unblock"] == "idle" then
            obj_char_other_side["game_speed_abnormal_realtime_countdown"] = obj_char["current_animation_length"] - 13 ---- 之后对面玩家根据情况不同要改
        elseif obj_char["state"] == "hitstop" then
            obj_char_other_side["game_speed_abnormal_realtime_countdown"] = obj_char["current_animation_length"] - 3 ---- 之后对面玩家根据情况不同要改
        elseif obj_char["state"] == "blockstop" then
            obj_char_other_side["game_speed_abnormal_realtime_countdown"] = obj_char["current_animation_length"] - 23 ---- 之后对面玩家根据情况不同要改
        end

    end
    res[4] = function()
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 3
    end
    res[28] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 4
    end
    res[30] = function()
        -- state & state_number
        update_move_overdrive_state()

        -- VFX
        insert_VFX_game_scene_char_overdrive_airflow(obj_char)
    end
    res[32] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 5
    end
    res[35] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 6
    end
    res[38] = function() 
        -- state & state_number
        update_move_overdrive_state()
        local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
        if obj_char_other_side["state"] == "hurtstop" or obj_char_other_side["state"] == "blockstop" then
            if obj_char["health"][1]/obj_char["health"][3] > 0.85 then
                obj_char["overdrive_timer"] = {0,2,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.60 then
                obj_char["overdrive_timer"] = {0,3,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.45 then
                obj_char["overdrive_timer"] = {0,4,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.35 then
                obj_char["overdrive_timer"] = {0,5,0,0}
            else
                obj_char["overdrive_timer"] = {0,6,0,0}
            end
        else
            if obj_char["health"][1]/obj_char["health"][3] > 0.85 then
                obj_char["overdrive_timer"] = {0,4,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.60 then
                obj_char["overdrive_timer"] = {0,6,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.45 then
                obj_char["overdrive_timer"] = {0,8,0,0}
            elseif obj_char["health"][1]/obj_char["health"][3] > 0.35 then
                obj_char["overdrive_timer"] = {1,0,0,0}
            else
                obj_char["overdrive_timer"] = {1,2,0,0}
            end
        end
        obj_char["overdrive"][3] = "on"

        -- draw_correction
        obj_char[8] = 7
    end
    res[41] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 5
    end
    res[44] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 6
    end
    res[47] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 7
    end
    res[50] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 5
    end
    res[53] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 6
    end
    res[56] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 7
    end
    res[60] = function() 
        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 8
    end
    res[65] = function() 
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)

        -- state & state_number
        update_move_overdrive_state()

        -- draw_correction
        obj_char[8] = 9
    end
    res[70] = function()
        -- animation end
    end

    return res

end



-- hurt_animation type
    -- stand_hurt_high/mid/low
    -- crouch_hurt
    -- launched/semi_launched_high/mid/low
    -- launched_land/semi_launched_land_high/mid/low
    -- air_hurt_high/mid/low
    -- air_launched/semi_launched_high/mid/low
    -- air_launched_land/semi_launched_land_high/mid/low



function load_game_scene_anim_char_TRM_5P(obj_char)
    local res = {}
    local overdrive_add = 0.05
    local heat_add = 0.05
    local ability_add = 0.05
    local friction = 4
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local function add_heat_ability_overdrive()
        if obj_char["overdrive"][1] < obj_char["overdrive"][2] then
            obj_char["overdrive"][1] = 
            math.min(obj_char["overdrive"][1] + overdrive_add,obj_char["overdrive"][2])
        end
        if obj_char["heat"][1] < obj_char["heat"][2] then
            obj_char["heat"][1] = 
            math.min(obj_char["heat"][1] + heat_add,obj_char["heat"][2])
        end
        if obj_char["ability"][1] < obj_char["ability"][2] then
            obj_char["ability"][1] = 
            math.min(obj_char["ability"][1] + ability_add,obj_char["ability"][2])
        end
    end

    for i = 0,29 do
        res[i] = function()
            -- state
            add_heat_ability_overdrive()
        end
    end

    res[0] = function() 
        -- state
        obj_char["sprite_sheet_state"] = "5P"
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hit_counter_state"] = 1 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        obj_char_other_side["frame_adv"] = 0

        if side == "L" then
            obj_char["stand_hurt_animation"] = anim_char_LP_5P_stand_hurt_high
            obj_char["stand_block_animation"] = nil
            obj_char["crouch_hurt_animation"] = nil
            obj_char["crouch_block_animation"] = nil
            obj_char["air_hurt_animation"] = nil
            obj_char["air_block_animation"] = nil
            obj_char["OTG_hurt_animation"] = nil
        elseif side == "R" then
            obj_char["stand_hurt_animation"] = anim_char_RP_5P_stand_hurt_high
            obj_char["stand_block_animation"] = nil
            obj_char["crouch_hurt_animation"] = nil
            obj_char["crouch_block_animation"] = nil
            obj_char["air_hurt_animation"] = nil
            obj_char["air_block_animation"] = nil
            obj_char["OTG_hurt_animation"] = nil
        end

        obj_char["current_animation_length"] = 27 -- 如果为0则是循环动画

        obj_char["hit_cancel"] = false -- 取消链

        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 8

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        add_heat_ability_overdrive()
        obj_char["friction"] = friction

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_ver0_hit_blast
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,99,-576,0.8,0.75,0.75,0}
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_ver0_hit_blast
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,88,-815,1,0.9,0.9,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = nil
        obj_char["block_VFX_insert_function_argument"] = nil
        obj_char["block_SFX"] = nil
        obj_char["hit_SFX"] = nil

        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {233,520}

        common_game_scene_hit_load_camera_anim(obj_char,0.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
    end
    res[1] = function() 
        -- state & state_number
        add_heat_ability_overdrive()

        -- draw_correction
        obj_char[8] = 1
    end
    res[2] = function() 
        -- state & state_number
        add_heat_ability_overdrive()

        -- draw_correction
        obj_char[8] = 2
    end
    res[4] = function() 
        -- state & state_number
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hit_hurt_blockstop_countdown"] = 12
            -- 根据状态设置hitstop状态和动画 存储缓存状态 使得结束hitstop状态后可以回到5p后续动画
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver1
        add_heat_ability_overdrive()

        -- collide
        obj_char["hitbox_table"] = {{130, -416, 260, 98}} --{ 攻击类型 打 投 指令投, 具体的box形状}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50},{119, -416, 320, 128}}

        -- draw_correction
        obj_char[8] = 3

        -- VFX
        insert_VFX_game_scene_char_TRM_5P_whiff(obj_char)

        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[5] = function() 
        -- state & state_number
        add_heat_ability_overdrive()

        -- draw_correction
        obj_char[8] = 4
    end
    res[8] = function() 
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 1
        obj_char["hurt_state"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        add_heat_ability_overdrive()

        -- collide
        obj_char["pushbox"] = {0, -185, 130, 370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

    end
    res[10] = function()
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[12] = function() 
        -- draw_correction
        obj_char[8] = 5
    end
    res[15] = function() 
        obj_char["height_state"] = "stand" -- stand crouch air
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char["hurt_state"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["hit_cancel"] = false -- 取消链
        obj_char["idle_cancel"] = true -- 取消链

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end

        -- state_number
        obj_char["gravity"] = 9.8
        obj_char["hurt_horizontal_velocity_correction"] = 1
        obj_char["hurt_gravity_correction"] = 1
        obj_char["hurt_damage_correction"] = 1

    end
    res[19] = function() 
        -- draw_correction
        obj_char[8] = 6
    end
    res[22] = function() 
        -- draw_correction
        obj_char[8] = 7
    end
    res[27] = function() 
        -- animation end
    end

    return res

end

function load_game_scene_anim_char_TRM_5P_stand_hurt_high(obj_char)
    local res = {}
    local overdrive_add = 0.05
    local heat_add = 0.05
    local ability_add = 0.05
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local function add_heat_ability_overdrive()
        if obj_char_other_side["overdrive"][1] < obj_char_other_side["overdrive"][2] then
            obj_char_other_side["overdrive"][1] = 
            math.min(obj_char_other_side["overdrive"][1] + overdrive_add,obj_char_other_side["overdrive"][2])
        end
        if obj_char_other_side["heat"][1] < obj_char_other_side["heat"][2] then
            obj_char_other_side["heat"][1] = 
            math.min(obj_char_other_side["heat"][1] + heat_add,obj_char_other_side["heat"][2])
        end
        if obj_char_other_side["ability"][1] < obj_char_other_side["ability"][2] then
            obj_char_other_side["ability"][1] = 
            math.min(obj_char_other_side["ability"][1] + ability_add,obj_char_other_side["ability"][2])
        end
    end

    for i = 0,12 do
        res[i] = function()
            -- state
            add_heat_ability_overdrive()
        end
    end

    res[0] = function()
        local hurt_horizontal_velocity = 30
        local hurt_horizontal_friction = 5

        -- state
        obj_char_other_side["sprite_sheet_state"] = "stand_hurt_high"
        obj_char_other_side["height_state"] = "stand" -- stand crouch air
        obj_char_other_side["hit_type_state"] = "none" -- none strike throw burst
        obj_char_other_side["hit_guard_type_state"] = "none" -- none all low high
        obj_char_other_side["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
        obj_char_other_side["hurt_state"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["current_animation_length"] = 13

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 18
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0

         -- state_number
        obj_char_other_side["velocity"] = {0,0}
        if obj_char["x"] < obj_char_other_side["x"] then
            if obj_char_other_side["collision_move_available"][2] == 1 then
                obj_char_other_side["velocity_cache"] = {
                    hurt_horizontal_velocity,
                    obj_char_other_side["velocity"][2]
                } -- 根据当前敌我x位置变化
                obj_char_other_side["velocity"] = {0,0}
                obj_char_other_side["friction"] = hurt_horizontal_friction
                if obj_char["velocity"][1] > 0 then
                    obj_char["velocity_cache"] = obj_char["velocity"]
                    obj_char["velocity"] = {0,0}
                end
            elseif obj_char_other_side["collision_move_available"][2] == 0 then
                obj_char["velocity_cache"] = {
                    - hurt_horizontal_velocity,
                    obj_char["velocity"][2]
                } -- 根据当前敌我x位置变化
                obj_char["velocity"] = {0,0}
                obj_char["friction"] = hurt_horizontal_friction
                if obj_char_other_side["velocity"][1] < 0 then
                    obj_char_other_side["velocity_cache"] = obj_char_other_side["velocity"]
                    obj_char_other_side["velocity"] = {0,0}
                end
            end
        elseif obj_char["x"] > obj_char_other_side["x"] then
            if obj_char_other_side["collision_move_available"][1] == 1 then
                obj_char_other_side["velocity_cache"] = {
                    - hurt_horizontal_velocity,
                    obj_char_other_side["velocity"][2]
                } -- 根据当前敌我x位置变化
                obj_char_other_side["velocity"] = {0,0}
                obj_char_other_side["friction"] = hurt_horizontal_friction
                if obj_char["velocity"][1] < 0 then
                    obj_char["velocity_cache"] = obj_char["velocity"]
                    obj_char["velocity"] = {0,0}
                end
            elseif obj_char_other_side["collision_move_available"][1] == 0 then
                obj_char["velocity_cache"] = {
                    hurt_horizontal_velocity,
                    obj_char["velocity"][2]
                } -- 根据当前敌我x位置变化
                obj_char["velocity"] = {0,0}
                obj_char["friction"] = hurt_horizontal_friction
                if obj_char_other_side["velocity"][1] > 0 then
                    obj_char_other_side["velocity_cache"] = obj_char_other_side["velocity"]
                    obj_char_other_side["velocity"] = {0,0}
                end
            end
        else
            obj_char_other_side["velocity_cache"] ={0,0}
            -- 根据当前敌我x位置变化
            obj_char_other_side["velocity"] = {0,0}
            obj_char_other_side["friction"] = hurt_horizontal_friction
            obj_char["velocity"] = {0,0}
            obj_char["velocity_cache"] = obj_char["velocity"]
        end
        
        add_heat_ability_overdrive()

        -- collide
        obj_char_other_side["pushbox"] = {0, -185, 130, 370}
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["stand_hurt_high"][0]

        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = {206,520}
        obj_char_other_side["hurtstop_wiggle_x"] = 0
        obj_char_other_side["hurtstop_wiggle_y"] = 0

        -- VFX
        insert_VFX_game_scene_stage_ground_smoke_horizontal_shot(
            obj_char_other_side,
            obj_char_other_side["ground_smoke_spawn_anchor_pos"]["stand_hurt_high"][1],
            obj_char_other_side["ground_smoke_spawn_anchor_pos"]["stand_hurt_high"][2],
            1,1,1,0
        )

    end
    res[2] = function() 
        -- state
        add_heat_ability_overdrive()

        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["stand_hurt_high"][2]
        
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function() 
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[9] = function() 
        -- state
        add_heat_ability_overdrive()

        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["stand_hurt_high"][1]

        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[11] = function() 
        -- state
        add_heat_ability_overdrive()

        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["stand_hurt_high"][0]

        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[13] = function() 
        -- animation end
    end

    return res

end
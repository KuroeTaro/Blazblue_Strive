-- RP -> RP
-- ASSET_DATA[3] -> ASSET_DATA[3]
-- "R" -> "R"
-- obj_char_game_scene_char_RP = {0, 0, 0, 1, -1, 1, 0, 0} -> obj_char_game_scene_char_RP = {0, 0, 0, 1, -1, 1, 0, 0}
-- obj_char_game_scene_char_RP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320

function load_game_scene_obj_char_RP()
    -- x y z opacity sx sy r f
    obj_char_game_scene_char_RP = {0, 0, 0, 1, -1, 1, 0, 0} -- obj[1-8]都为图形上的数据 obj[8]为图形上的帧数
    obj_char_game_scene_char_RP["x"] = 320
    obj_char_game_scene_char_RP["y"] = 365
    obj_char_game_scene_char_RP["f"] = -1 -- obj["f"] 逻辑上的帧数
    obj_char_game_scene_char_RP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_RP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_RP["LCD"] = {0,0,0,0,0,0,0,0}

    -- state
    obj_char_game_scene_char_RP["player_side"] = "R"
    obj_char_game_scene_char_RP["type"] = "character"
    obj_char_game_scene_char_RP["state"] = "before_ease_in"
    obj_char_game_scene_char_RP["state_cache"] = "none"
    obj_char_game_scene_char_RP["sprite_sheet_state"] = "stand_idle"
    obj_char_game_scene_char_RP["height_state"] = "stand" -- stand crouch air
    obj_char_game_scene_char_RP["hit_type_state"] = "none" -- none strike throw burst projectile
    obj_char_game_scene_char_RP["hit_guard_type_state"] = "none" -- none all low high
    obj_char_game_scene_char_RP["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
    obj_char_game_scene_char_RP["hurt_state"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_RP["move_state"] = "none" -- none startup active recovery

    obj_char_game_scene_char_RP["input_sys_state"] = "none" -- none save load
    obj_char_game_scene_char_RP["input_sys_cache"] = {}
    init_input_sys_cache(obj_char_game_scene_char_RP)

    obj_char_game_scene_char_RP["hit_SFX"] = nil
    obj_char_game_scene_char_RP["stand_hurt_animation"] = nil
    obj_char_game_scene_char_RP["stand_block_animation"] = nil
    obj_char_game_scene_char_RP["crouch_hurt_animation"] = nil
    obj_char_game_scene_char_RP["crouch_block_animation"] = nil
    obj_char_game_scene_char_RP["air_hurt_animation"] = nil
    obj_char_game_scene_char_RP["air_block_animation"] = nil
    obj_char_game_scene_char_RP["OTG_hurt_animation"] = nil

    obj_char_game_scene_char_RP["current_animation"] = nil
    obj_char_game_scene_char_RP["current_animation_length"] = 0 -- 如果为0则是循环动画

    obj_char_game_scene_char_RP["hit_cancel"] = false -- 取消链
    obj_char_game_scene_char_RP["idle_cancel"] = true -- 取消链

    obj_char_game_scene_char_RP["strike_active"] = false -- 防止在同一动作的active多次触发
    obj_char_game_scene_char_RP["throw_active"] = false -- 防止在同一动作的active多次触发

    obj_char_game_scene_char_RP["strike_inv"] = false
    obj_char_game_scene_char_RP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_RP["throw_inv"] = false
    obj_char_game_scene_char_RP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_RP["projectile_inv"] = false
    obj_char_game_scene_char_RP["projectile_inv_countdown"] = 0
    obj_char_game_scene_char_RP["burst_inv"] = false
    obj_char_game_scene_char_RP["burst_inv_countdown"] = 0

    obj_char_game_scene_char_RP["hit_function"] = function() end
    obj_char_game_scene_char_RP["hurt_function"] = function() end
    obj_char_game_scene_char_RP["parry_function"] = function() end
    obj_char_game_scene_char_RP["hit_counter_ver_function"] = function() end

    obj_char_game_scene_char_RP["hazama_hat_state"] = "off"
    obj_char_game_scene_char_RP["hazama_hat_anchor_pos"] = {168,210}
    obj_char_game_scene_char_RP["hazama_hat_animation"] = nil
    obj_char_game_scene_char_RP["hazama_hat_8"] = 0 -- obj[hazama_hat_8]匕首图形上的帧数
    obj_char_game_scene_char_RP["hazama_hat_f"] = 0 -- obj[hazama_hat_8]匕首逻辑上的帧数

    -- state_number
    obj_char_game_scene_char_RP["velocity"] = {0,0}
    obj_char_game_scene_char_RP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_RP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_RP["acceleration"] = {0,0}
    obj_char_game_scene_char_RP["gravity"] = 9.8
    obj_char_game_scene_char_RP["friction"] = 1
    obj_char_game_scene_char_RP["health"] = {11500, 11500, 11500, "fade_off"}
    obj_char_game_scene_char_RP["heat"] = {0.0, 200.0} -- 0.0 - 200.0
    obj_char_game_scene_char_RP["ability"] = {600.0, 600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_RP["overdrive"] = {600.0, 600.0, "off"} -- 0.0 - 600.0
    obj_char_game_scene_char_RP["overdrive_timer"] = {0,0,0,0} -- 0f 00:00 
    obj_char_game_scene_char_RP["overdrive_drain_speed"] = 24
    obj_char_game_scene_char_RP["risk"] = {0.0, 300.0}-- 0.0 - 300.0
    obj_char_game_scene_char_RP["positive_bouns"] = {0.0, 600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_RP["hurt_horizontal_velocity_correction"] = 1
    obj_char_game_scene_char_RP["hurt_gravity_correction"] = 1
    obj_char_game_scene_char_RP["hurt_damage_correction"] = 1

    -- game_speed
    obj_char_game_scene_char_RP["game_speed"] = 1
    obj_char_game_scene_char_RP["game_speed_subframe"] = 1
    obj_char_game_scene_char_RP["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_RP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_RP["hit_hurt_block_slowdown_countdown"] = 0

    -- collide
    obj_char_game_scene_char_RP["pushbox"] = {0, -185, 130, 370}
    obj_char_game_scene_char_RP["collision_move_available"] = {1,1}
    obj_char_game_scene_char_RP["hitbox_table"] = {}
    obj_char_game_scene_char_RP["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

    -- sub_obj
    obj_char_game_scene_char_RP["projectile_table"] = {}
    obj_char_game_scene_char_RP["VFX_HUD_table"] = {}
    obj_char_game_scene_char_RP["VFX_front_table"] = {}
    obj_char_game_scene_char_RP["VFX_back_table"] = {}
    obj_char_game_scene_char_RP["black_overlay_table"] = {}

    obj_char_game_scene_char_RP["hit_VFX_insert_function"] = nil
    obj_char_game_scene_char_RP["hit_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_RP["hit_SFX"] = nil
    obj_char_game_scene_char_RP["counter_VFX_insert_function"] = nil
    obj_char_game_scene_char_RP["counter_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_RP["counter_SFX"] = nil
    obj_char_game_scene_char_RP["block_VFX_insert_function"] = nil
    obj_char_game_scene_char_RP["block_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_RP["block_SFX"] = nil

    obj_char_game_scene_char_RP["oroboros_bite_pos"] = {0,0}
    obj_char_game_scene_char_RP["hazama_hat_aim_pos"] = {0,0}
    
    -- draw_correction
    obj_char_game_scene_char_RP[8] = 0
    obj_char_game_scene_char_RP["anchor_pos"] = {215,520}
    obj_char_game_scene_char_RP["contrast"] = 1
    obj_char_game_scene_char_RP["brightness"] = 0
    obj_char_game_scene_char_RP["brightness_const"] = 0
    obj_char_game_scene_char_RP["brightness_overdrive_const"] = 0
    obj_char_game_scene_char_RP["hurtstop_wiggle_x"] = 0
    obj_char_game_scene_char_RP["hurtstop_wiggle_y"] = 0
    obj_char_game_scene_char_RP["current_hurtstop_wiggle_x_animation"] = nil
    obj_char_game_scene_char_RP["current_hurtstop_wiggle_y_animation"] = nil

    obj_char_game_scene_char_RP["camera_x_shake_anim"] = nil
    obj_char_game_scene_char_RP["camera_y_shake_anim"] = nil
    obj_char_game_scene_char_RP["camera_enclosing_anim"] = nil

end

function order_load_game_scene_char_RP_frames(load_order)
    local PLAYER_ASSET_DATA = ASSET_DATA[3]
    local switch = 
    {
        [1] = function()
            image_sprite_sheet_table_char_game_scene_RP = {}

            image_sprite_sheet_table_char_game_scene_RP["stand_idle"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_stand_idle.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["stand_idle_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_RP["6"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_6.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["6_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_RP["4"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_4.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["4_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_RP["6_walk_stop"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_6_walk_stop.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["6_walk_stop_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_RP["4_walk_stop"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_4_walk_stop.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["4_walk_stop_sprite_batch"])
            )



            image_sprite_sheet_table_char_game_scene_RP["overdrive"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_overdrive.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["overdrive_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_RP["5P"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_5P.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["5P_sprite_batch"])
            )



            image_sprite_sheet_table_char_game_scene_RP["stand_hurt_high"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_stand_hurt_high.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["stand_hurt_high_sprite_batch"])
            )


            
            image_sprite_sheet_VFX_game_scene_RP_overdrive_badge = 
            sprite_sheet_load(
                "asset/game_scene/VFX/overdrive_badge/TRM_overdrive_badge.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["overdrive_badge_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_RP_5P_whiff = 
            sprite_sheet_load(
                "asset/game_scene/VFX/whiff_VFX/TRM/5P.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["5P_whiff_VFX_sprite_batch"])
            )

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end

    -- image_table_char_game_scene_RP_hazama_hat = {}
    -- image_table_char_game_scene_RP_hazama_hat["stand_idle_hold"] = {}
    -- image_table_char_game_scene_RP_hazama_hat["stand_idle_shoot"] = {}
    -- for i = 0,3 do
    --     image_table_char_game_scene_RP_hazama_hat["stand_idle_hold"][i] = love.graphics.newImage(ASSET_DATA[1]["RP_hazama_hat"]["stand_idle_hold"][i])
    -- end
    -- for i = 0,9 do
    --     image_table_char_game_scene_RP_hazama_hat["stand_idle_shoot"][i] = love.graphics.newImage(ASSET_DATA[1]["RP_hazama_hat"]["stand_idle_shoot"][i])
    -- end

end

function load_game_scene_anim_char_RP()
    local obj_char = obj_char_game_scene_char_RP
    -- 站姿待机动画
    anim_char_RP_stand_idle = load_game_scene_anim_char_TRM_stand_idle(obj_char)    
    -- 行走动画
    anim_char_RP_6_walk = load_game_scene_anim_char_TRM_6(obj_char)
    anim_char_RP_4_walk = load_game_scene_anim_char_TRM_4(obj_char)
    anim_char_RP_6_walk_stop = load_game_scene_anim_char_TRM_6_walk_stop(obj_char)
    anim_char_RP_4_walk_stop = load_game_scene_anim_char_TRM_4_walk_stop(obj_char)
    -- overdrive启动动画
    anim_char_RP_overdrive = load_game_scene_anim_char_TRM_overdrive(obj_char)
    -- 拳脚动画
    anim_char_RP_5P_stand_hurt_high = load_game_scene_anim_char_TRM_5P_stand_hurt_high(obj_char)
    anim_char_RP_5P = load_game_scene_anim_char_TRM_5P(obj_char)

    obj_char["current_animation"] = anim_char_RP_stand_idle

end

function load_game_scene_hurtbox_data_RP()
    obj_hurtboxs_data_game_scene_char_RP = {}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"] = {}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][0] = {{-10, -200, 270, 400},{-27, -430, 100, 60}}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][1] = {{5, -200, 330, 400},{-80, -415, 160, 30}}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][2] = {{5, -200, 330, 400},{-80, -415, 160, 30}}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][3] = {{5, -200, 330, 400},{-80, -415, 160, 30}}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][4] = {{-10, -200, 270, 400},{-34, -425, 115, 50}}
    obj_hurtboxs_data_game_scene_char_RP["stand_hurt_high"][5] = {{-10, -200, 270, 400},{-34, -425, 115, 50}}

end

function load_game_scene_shader_char_RP()
    -- no shader for now
end

function load_game_scene_audio_char_RP()

end





-- 更新和状态机
function update_game_scene_char_RP()
    state_machine_char_game_scene_char_RP()
    -- state_machine_char_game_scene_char_RP_hazama_hat()
    
end

function state_machine_char_game_scene_char_RP()
    -- 拉后最高优先级 然后是拉下 然后是拉前 然后是跳
    -- 然后是方向组合拳脚 普通拳脚 从轻到重
    -- 然后是必杀
    -- 然后是超必杀
    -- 最后是od和霸
    -- SP + 拉后 = 拉盾
    -- INPUT_SYS_COMMAND_TABLE = {
    --     "Up","Down","Left","Right",
    --     "P","S","HS","K",
    --     "SP","Launcher","Back","Start",
    --     "RC","Dash","Burst","UA"
    -- }

    -- sp + 拉前/回中 + p 扔球
    -- sp + 拉前/回中 + k 翻滚
    -- sp + 拉前/回中 + s 拔枪
    -- sp + 拉下/下前 + s 双手构/蛇刹
    -- sp + luncher 普通投

    local input = INPUT_SYS_CURRENT_COMMAND_STATE["R"]
    local obj_char = obj_char_game_scene_char_RP
    local switch = {
        -- 通用状态
        ["before_ease_in"] = function()
            character_animator(obj_char,obj_char["current_animation"])
        end,
        ["hitstop"] = function()
            update_game_scene_char_RP_hitstop_countdown()
            state_machine_char_game_scene_char_RP_input_sys_cache()
            if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
                obj_char["state"] = obj_char["state_cache"]
                obj_char["velocity"] = obj_char["velocity_cache"]
            end
        end,
        ["hurtstop"] = function()
            update_game_scene_char_RP_hurtstop_countdown()
            state_machine_char_game_scene_char_RP_input_sys_cache()
            if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
                obj_char["state"] = obj_char["state_cache"]
                obj_char["velocity"] = obj_char["velocity_cache"]
                obj_char["hurtstop_wiggle_x"] = 0
                obj_char["hurtstop_wiggle_y"] = 0
            end
        end,
        ["blockstop"] = function()

        end,
        ["hurt"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            if obj_char["f"] >= obj_char["current_animation_length"] then
                if obj_char["height_state"] == "stand" then
                    -- to idle
                    obj_char["current_animation"] = anim_char_RP_stand_idle
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "stand_idle"
                    state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
                end
            end
        end,
        ["block"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            if obj_char["f"] >= obj_char["current_animation_length"] then
                if obj_char["height_state"] == "stand" then
                    -- to idle
                    obj_char["current_animation"] = anim_char_RP_stand_idle
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "stand_idle"
                    state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
                end
            end
        end,

        -- 待机状态
        ["stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
        end,
        ["6_and_4_walk"] = function()
            common_game_scene_check_6_and_4_move(obj_char)
            state_gate_game_scene_char_RP_from_6_and_4_walk(input,obj_char)
        end,
        ["walk_stop"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
            if obj_char["f"] >= obj_char["current_animation_length"] then
                if obj_char["height_state"] == "stand" then
                    -- to idle
                    obj_char["current_animation"] = anim_char_RP_stand_idle
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "stand_idle"
                    state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
                end
            end
        end,
        ["overdrive"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            if test_input_sys_press(input["RC"]) and obj_char["f"] < 30 then
                -- to overdrive RC
                
            elseif obj_char["f"] >= obj_char["current_animation_length"] then
                -- to stand_idle
                obj_char["idle_cancel"] = true -- 取消链
                obj_char["current_animation"] = anim_char_RP_stand_idle
                init_character_anim_with(obj_char,obj_char["current_animation"])
                obj_char["state"] = "stand_idle"
                state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
            end
        end,
        ["5P"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            
            if obj_char["f"] >= obj_char["current_animation_length"] then
                -- to stand_idle
                obj_char["current_animation"] = anim_char_RP_stand_idle
                init_character_anim_with(obj_char,obj_char["current_animation"])
                obj_char["state"] = "stand_idle"
                state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
                return
            end
            if obj_char["hit_cancel"] and obj_char["f"] >= 8 then
                obj_char["input_sys_state"] = "load" -- none save load
                state_machine_char_game_scene_char_RP_input_sys_cache()
                if test_input_sys_press(input["P"]) then
                    obj_char["hit_cancel"] = false
                    -- to 5P
                    obj_char["current_animation"] = anim_char_RP_5P
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "5P"
                    return
                end
            end
            if obj_char["idle_cancel"] then
                obj_char["input_sys_state"] = "load" -- none save load
                state_machine_char_game_scene_char_RP_input_sys_cache()
                state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
            end
        end,
    }
    update_game_scene_char_RP_global_countdown()
    local this_function = switch[obj_char["state"]]
    if this_function then this_function() end

end

function state_machine_char_game_scene_char_RP_hazama_hat()
    local obj = obj_char_game_scene_char_RP
    local switch = {
        ["off"] = function()

        end,
        ["on"] = function()

        end,
        ["steady"] = function()

        end,
    }
    local this_function = switch[obj["hazama_hat_state"]]
    if this_function then this_function() end

end

function state_machine_char_game_scene_char_RP_input_sys_cache()
    local obj_char = obj_char_game_scene_char_RP
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["R"]
    local switch = {
        ["none"] = function()
        end,
        ["save"] = function()
            if input["UP"] == "Pressing" then
                obj_char["input_sys_cache"]["Up"] = true
                obj_char["input_sys_cache"]["Down"] = false
            elseif input["Down"] == "Pressing" then
                obj_char["input_sys_cache"]["Up"] = false
                obj_char["input_sys_cache"]["Down"] = true
            end
            if input["Left"] == "Pressing" then
                obj_char["input_sys_cache"]["Left"] = true
                obj_char["input_sys_cache"]["Right"] = false
            elseif input["Right"] == "Pressing" then
                obj_char["input_sys_cache"]["Left"] = false
                obj_char["input_sys_cache"]["Right"] = true
            end
            if input["P"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = true
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["S"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = true
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["K"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = true
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["Launcher"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = true
            end
            if input["RC"] == "Pressing" then
                obj_char["input_sys_cache"]["RC"] = true
            end
            if input["Burst"] == "Pressing" then
                obj_char["input_sys_cache"]["Burst"] = true
            end
            if input["UA"] == "Pressing" then
                obj_char["input_sys_cache"]["UA"] = true
            end
        end,
        ["load"] = function()
            for i=1,16 do
                if obj_char["input_sys_cache"][INPUT_SYS_COMMAND_TABLE[i]] then
                    input[INPUT_SYS_COMMAND_TABLE[i]] = "Pressing"
                end
            end
            obj_char["input_sys_state"] = "none"
            init_input_sys_cache(obj_char)
        end,
    }
    local this_function = switch[obj_char["input_sys_state"]]
    if this_function then this_function() end
end





function draw_game_scene_char_RP_logic_graphic_pos_sync()
    local obj = obj_char_game_scene_char_RP
    obj[1] = obj["x"]+(obj["hurtstop_wiggle_x"]*(math.random()-0.5)*2)-obj[5]*obj["anchor_pos"][1]
    obj[2] = obj["y"]+(obj["hurtstop_wiggle_y"]*(math.random()-0.5)*2)-obj[6]*obj["anchor_pos"][2]
end

function draw_game_scene_char_RP()
    local obj = obj_char_game_scene_char_RP
    local camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_table_char_game_scene_RP[obj["sprite_sheet_state"]]

    local x = obj[1]
    local y = obj[2]
    local z = obj[3]
    local opacity = obj[4]
    local sx = obj[5]
    local sy = obj[6]
    local r = obj[7]
    local f = obj[8]

    local shader = shader_game_scene_brightness_contrast
    shader:send("contrast", obj["contrast"])
    shader:send("brightness", obj["brightness"])
    love.graphics.setShader(shader)

    local hazama_hat_state = obj["hazama_hat_state"]

    if hazama_hat_state == "on" then
        local hazama_hat_8 = obj["hazama_hat_8"]
    
        local hazama_hat = {
            x+sx*obj["hazama_hat_anchor_pos"][1], 
            y+sy*obj["hazama_hat_anchor_pos"][2], 
            z, 
            opacity, 
            sx, 
            sy, 
            r, 
            hazama_hat_8
        }

        -- local hazama_hat_image_table = image_table_char_game_scene_RP_hazama_hat[obj["state"]]
        -- draw_3d_image_table(camera,hazama_hat,hazama_hat_image_table)
        local hazama_hat_image_table = image_UI_load_scene_loading_text
        draw_3d_image(camera,hazama_hat,hazama_hat_image_table)

    end

    -- draw_3d_image_table(camera,obj,character_image_table)
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(camera,obj,image_sprite_sheet,""..f.."")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setShader()

end

function draw_game_scene_char_RP_shadow()

end

function draw_game_scene_char_RP_hurtbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_RP
    local camera = obj_stage_game_scene_camera

    -- hurt box
    local color = DEBUG_BOX_COLOR_BLUE
    for i=1,#obj_char["hurtbox_table"] do
        local current_hurtbox = obj_char["hurtbox_table"][i]
        local draw_box = {
            obj_char["x"] + (current_hurtbox[1] - current_hurtbox[3]/2)*obj_char[5],
            obj_char["y"] + current_hurtbox[2] - current_hurtbox[4]/2,
            obj_char[3],obj_char[5],1
        }
        draw_box["w"] = current_hurtbox[3]
        draw_box["h"] = current_hurtbox[4]
        draw_3d_color_box(camera,draw_box,color)
    end

end

function draw_game_scene_char_RP_hitbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_RP
    local camera = obj_stage_game_scene_camera

    -- hit box
    local color = DEBUG_BOX_COLOR_RED
    for i=1,#obj_char["hitbox_table"] do
        local current_hitbox = obj_char["hitbox_table"][i]
        local draw_box = {
            obj_char["x"] + (current_hitbox[1] - current_hitbox[3]/2)*obj_char[5],
            obj_char["y"] + current_hitbox[2] - current_hitbox[4]/2,
            obj_char[3],obj_char[5],1
        }
        draw_box["w"] = current_hitbox[3]
        draw_box["h"] = current_hitbox[4]
        draw_3d_color_box(camera,draw_box,color)
    end

end

function draw_game_scene_char_RP_pushbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_RP
    local camera = obj_stage_game_scene_camera

    -- push box
    local color = DEBUG_BOX_COLOR_YELLOW
    local pushbox = {
        obj_char["x"] + (obj_char["pushbox"][1] - obj_char["pushbox"][3]/2)*obj_char[5],
        obj_char["y"] + obj_char["pushbox"][2] - obj_char["pushbox"][4]/2,
        obj_char[3],obj_char[5],1
    }
    pushbox["w"] = obj_char["pushbox"][3]
    pushbox["h"] = obj_char["pushbox"][4]
    draw_3d_color_box(camera,pushbox,color)

end





function update_game_scene_char_RP_projectile()
    for i = #obj_char_game_scene_char_RP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["projectile_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_RP["projectile_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_RP_projectile()
    for i = #obj_char_game_scene_char_RP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["projectile_table"][i]
        object["draw"](object)
    end
end






function update_game_scene_char_RP_VFX()
    for i = #obj_char_game_scene_char_RP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_HUD_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_RP["VFX_HUD_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_RP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_front_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_RP["VFX_front_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_RP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_back_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_RP["VFX_back_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_RP_VFX_HUD()
    for i = #obj_char_game_scene_char_RP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_HUD_table"][i]
        object["draw"](object)
    end
end

function draw_game_scene_char_RP_VFX_front()
    for i = #obj_char_game_scene_char_RP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_front_table"][i]
        object["draw"](object)
    end
end

function draw_game_scene_char_RP_VFX_back()
    for i = #obj_char_game_scene_char_RP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["VFX_back_table"][i]
        object["draw"](object)
    end
end

function update_game_scene_char_RP_black_overlay()
    for i = #obj_char_game_scene_char_RP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["black_overlay_table"][i]
        object["life"] = object["life"] - 1 -- 减少寿命
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_RP["black_overlay_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_RP_black_overlay()
    for i = #obj_char_game_scene_char_RP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_RP["black_overlay_table"][i]
        object["draw"](object)
    end
end




function update_game_scene_char_RP_hitstop_countdown()
    local obj_char = obj_char_game_scene_char_RP
    if obj_char["hit_hurt_blockstop_countdown"] > 1 then
        obj_char["hit_hurt_blockstop_countdown"] = obj_char["hit_hurt_blockstop_countdown"] - 1
    else
        obj_char["game_speed_abnormal_realtime_countdown"] = obj_char["hit_hurt_block_slowdown_countdown"]
        obj_char["hit_hurt_blockstop_countdown"] = 0 
        obj_char["hit_hurt_block_slowdown_countdown"] = 0
        obj_char["game_speed"] = 1
    end
end

function update_game_scene_char_RP_hurtstop_countdown()
    local obj_char = obj_char_game_scene_char_RP
    if obj_char["hit_hurt_blockstop_countdown"] > 1 then
        obj_char["hit_hurt_blockstop_countdown"] = obj_char["hit_hurt_blockstop_countdown"] - 1
        point_linear_animator(obj_char,obj_char["current_hurtstop_wiggle_x_animation"])
        point_linear_animator(obj_char,obj_char["current_hurtstop_wiggle_y_animation"])
    else
        obj_char["game_speed_abnormal_realtime_countdown"] = obj_char["hit_hurt_block_slowdown_countdown"]
        obj_char["hit_hurt_blockstop_countdown"] = 0 
        obj_char["hit_hurt_block_slowdown_countdown"] = 0
        obj_char["game_speed"] = 2
        obj_char["hurtstop_wiggle_x"] = 0
        obj_char["hurtstop_wiggle_y"] = 0
    end
end

function update_game_scene_char_RP_overdrive_countdown()
    local obj_char = obj_char_game_scene_char_RP
    if obj_char["state"] ~= "overdrive" and 
    obj_char["overdrive_timer"][1] + obj_char["overdrive_timer"][2] +
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] >= 1
    then
        if obj_char["overdrive_timer"][4] == 0 and obj_char["overdrive_timer"][3] ~= 0 then 
            obj_char["overdrive_timer"][3] = obj_char["overdrive_timer"][3] - 1
            obj_char["overdrive_timer"][4] = 9
        elseif obj_char["overdrive_timer"][4] > 0 then
            obj_char["overdrive_timer"][4] = obj_char["overdrive_timer"][4] - 1
        end
        if obj_char["overdrive_timer"][3] == 0 and obj_char["overdrive_timer"][2] ~= 0 then 
            obj_char["overdrive_timer"][2] = obj_char["overdrive_timer"][2] - 1
            obj_char["overdrive_timer"][3] = 5
        end
        if obj_char["overdrive_timer"][2] < 0 and obj_char["overdrive_timer"][1] ~= 0 then 
            obj_char["overdrive_timer"][1] = obj_char["overdrive_timer"][1] - 1
            obj_char["overdrive_timer"][2] = 9
        end
    elseif obj_char["state"] ~= "overdrive" and 
    obj_char["overdrive_timer"][1] + obj_char["overdrive_timer"][2] +
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] < 1
    then
        obj_char["overdrive"][3] = "off"
        obj_char["overdrive_timer"] = {0,0,0,0}
    end
end

function update_game_scene_char_RP_inv_state_countdown()
    local obj_char = obj_char_game_scene_char_RP
    if obj_char["strike_inv_countdown"] > 1 then
        obj_char["strike_inv_countdown"] = obj_char["strike_inv_countdown"] - 1
    else
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
    end
    if obj_char["throw_inv_countdown"] > 1 then
        obj_char["throw_inv_countdown"] = obj_char["throw_inv_countdown"] - 1
    else
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
    end
    if obj_char["projectile_inv_countdown"] > 1 then
        obj_char["projectile_inv_countdown"] = obj_char["projectile_inv_countdown"] - 1
    else
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
    end
    if obj_char["burst_inv_countdown"] > 1 then
        obj_char["burst_inv_countdown"] = obj_char["burst_inv_countdown"] - 1
    else
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
    end
end

function update_game_scene_char_RP_global_countdown()
    update_game_scene_char_RP_overdrive_countdown()
    update_game_scene_char_RP_inv_state_countdown()
end




function state_gate_game_scene_char_RP_from_stand_idle(input,obj_char)
    obj_char["input_sys_state"] = "load" -- none save load
    state_machine_char_game_scene_char_RP_input_sys_cache()
    if common_game_scene_get_input_direction(obj_char) == 7 
    or common_game_scene_get_input_direction(obj_char) == 8
    or common_game_scene_get_input_direction(obj_char) == 9 then
        -- to pre_jump

    elseif test_input_sys_press(input["Burst"]) and obj_char["overdrive"][1] == obj_char["overdrive"][2] then
        -- to over_drive
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_RP_overdrive
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_game_scene_overdrive_load_camera_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        obj_char["state"] = "overdrive"
    elseif test_input_sys_press(input["P"]) then
        -- to 5P
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_RP_5P
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5P"
    elseif common_game_scene_get_input_direction(obj_char) == 4
    or common_game_scene_get_input_direction(obj_char) == 6 then
        obj_char["idle_cancel"] = true
        common_game_scene_check_6_and_4_move(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_and_4_walk"
    end
end

function state_gate_game_scene_char_RP_from_6_and_4_walk(input,obj_char)
    obj_char["input_sys_state"] = "load" -- none save load
    state_machine_char_game_scene_char_RP_input_sys_cache()
    if common_game_scene_get_input_direction(obj_char) == 7 
    or common_game_scene_get_input_direction(obj_char) == 8
    or common_game_scene_get_input_direction(obj_char) == 9 then
        -- to pre_jump
        obj_char["idle_cancel"] = true
    elseif test_input_sys_press(input["Burst"]) and obj_char["overdrive"][1] == obj_char["overdrive"][2] then
        -- to over_drive
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_RP_overdrive
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "overdrive"
    elseif test_input_sys_press(input["P"]) then
        -- to 5P
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_RP_5P
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5P"
    elseif common_game_scene_get_input_direction(obj_char) == 5 then
        -- to 6_walk_stop or 4_walk_stop
        obj_char["idle_cancel"] = true
        if obj_char["sprite_sheet_state"] == "4" then
            obj_char["current_animation"] = anim_char_RP_4_walk_stop
        elseif obj_char["sprite_sheet_state"] == "6" then
            obj_char["current_animation"] = anim_char_RP_6_walk_stop
        end
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["velocity"] = {0,0}
        obj_char["state"] = "walk_stop"
    end
end
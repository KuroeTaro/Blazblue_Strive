-- LP -> RP
-- ASSET_DATA[2] -> ASSET_DATA[3]
-- "L" -> "R"
-- obj_char_game_scene_char_LP = {0, 0, 0, 1, 1, 1, 0, 0} -> obj_char_game_scene_char_RP = {0, 0, 0, 1, -1, 1, 0, 0}
-- obj_char_game_scene_char_LP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320

function load_game_scene_obj_char_LP()
    -- x y z opacity sx sy r f
    obj_char_game_scene_char_LP = {0, 0, 0, 1, 1, 1, 0, 0} -- obj[1-8]都为图形上的数据 obj[8]为图形上的帧数
    obj_char_game_scene_char_LP["x"] = -320
    obj_char_game_scene_char_LP["y"] = 365
    obj_char_game_scene_char_LP["f"] = -1 -- obj["f"] 逻辑上的帧数
    obj_char_game_scene_char_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCD"] = {0,0,0,0,0,0,0,0}

    -- state
    obj_char_game_scene_char_LP["player_side"] = "L"
    obj_char_game_scene_char_LP["type"] = "character"
    obj_char_game_scene_char_LP["state"] = "before_ease_in"
    obj_char_game_scene_char_LP["state_cache"] = "none"
    obj_char_game_scene_char_LP["sprite_sheet_state"] = "5_stand_idle"
    obj_char_game_scene_char_LP["height_state"] = "stand" -- stand crouch air
    obj_char_game_scene_char_LP["hit_type_state"] = "none" -- none strike throw burst projectile
    obj_char_game_scene_char_LP["hit_guard_type_state"] = "none" -- none all low high
    obj_char_game_scene_char_LP["hit_counter_state"] = 0 -- 当前攻击counter等级 0 1 2 3
    obj_char_game_scene_char_LP["hurt_state"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["move_state"] = "none" -- none startup active recovery
    obj_char_game_scene_char_LP["startup_frame"] = 0
    obj_char_game_scene_char_LP["active_frame"] = 0
    obj_char_game_scene_char_LP["recovery_frame"] = 0
    obj_char_game_scene_char_LP["frame_adv"] = 0

    obj_char_game_scene_char_LP["input_sys_state"] = "none" -- none save load
    obj_char_game_scene_char_LP["input_sys_cache"] = {}
    init_input_sys_cache(obj_char_game_scene_char_LP)

    obj_char_game_scene_char_LP["hit_SFX"] = nil
    obj_char_game_scene_char_LP["stand_hurt_animation"] = nil
    obj_char_game_scene_char_LP["stand_block_animation"] = nil
    obj_char_game_scene_char_LP["crouch_hurt_animation"] = nil
    obj_char_game_scene_char_LP["crouch_block_animation"] = nil
    obj_char_game_scene_char_LP["air_hurt_animation"] = nil
    obj_char_game_scene_char_LP["air_block_animation"] = nil
    obj_char_game_scene_char_LP["OTG_hurt_animation"] = nil

    obj_char_game_scene_char_LP["current_animation"] = nil
    obj_char_game_scene_char_LP["current_animation_length"] = 0 -- 如果为0则是循环动画

    obj_char_game_scene_char_LP["hit_cancel"] = false -- 取消链
    obj_char_game_scene_char_LP["idle_cancel"] = true -- 取消链

    obj_char_game_scene_char_LP["strike_active"] = false -- 防止在同一动作的active多次触发
    obj_char_game_scene_char_LP["throw_active"] = false -- 防止在同一动作的active多次触发

    obj_char_game_scene_char_LP["strike_inv"] = false
    obj_char_game_scene_char_LP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_LP["throw_inv"] = false
    obj_char_game_scene_char_LP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_LP["projectile_inv"] = false
    obj_char_game_scene_char_LP["projectile_inv_countdown"] = 0
    obj_char_game_scene_char_LP["burst_inv"] = false
    obj_char_game_scene_char_LP["burst_inv_countdown"] = 0

    obj_char_game_scene_char_LP["hit_function"] = function() end
    obj_char_game_scene_char_LP["hurt_function"] = function() end
    obj_char_game_scene_char_LP["parry_function"] = function() end
    obj_char_game_scene_char_LP["hit_counter_ver_function"] = function() end

    obj_char_game_scene_char_LP["hazama_hat_state"] = "off"
    obj_char_game_scene_char_LP["hazama_hat_anchor_pos"] = {168,210}
    obj_char_game_scene_char_LP["hazama_hat_animation"] = nil
    obj_char_game_scene_char_LP["hazama_hat_8"] = 0 -- obj[hazama_hat_8]匕首图形上的帧数
    obj_char_game_scene_char_LP["hazama_hat_f"] = 0 -- obj[hazama_hat_8]匕首逻辑上的帧数

    -- state_number
    obj_char_game_scene_char_LP["velocity"] = {0,0}
    obj_char_game_scene_char_LP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_LP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_LP["acceleration"] = {0,0}
    obj_char_game_scene_char_LP["gravity"] = 9.8
    obj_char_game_scene_char_LP["friction"] = 1
    obj_char_game_scene_char_LP["health"] = {11500, 11500, 11500, "fade_off"}
    obj_char_game_scene_char_LP["heat"] = {0.0, 200.0} -- 0.0 - 200.0
    obj_char_game_scene_char_LP["ability"] = {600.0, 600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive"] = {600.0, 600.0, "off"} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive_timer"] = {0,0,0,0} -- 0f 00:00 
    obj_char_game_scene_char_LP["overdrive_drain_speed"] = 24
    obj_char_game_scene_char_LP["risk"] = {0.0, 300.0}-- 0.0 - 300.0
    obj_char_game_scene_char_LP["positive_bouns"] = {0.0, 600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["hurt_horizontal_velocity_correction"] = 1
    obj_char_game_scene_char_LP["hurt_gravity_correction"] = 1
    obj_char_game_scene_char_LP["hurt_damage_correction"] = 1

    -- game_speed
    obj_char_game_scene_char_LP["game_speed"] = 1
    obj_char_game_scene_char_LP["game_speed_subframe"] = 1
    obj_char_game_scene_char_LP["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_LP["hit_hurt_block_slowdown_countdown"] = 0

    -- collide
    obj_char_game_scene_char_LP["pushbox"] = {0, -185, 130, 370}
    obj_char_game_scene_char_LP["collision_move_available"] = {1,1}
    obj_char_game_scene_char_LP["hitbox_table"] = {}
    obj_char_game_scene_char_LP["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}

    -- sub_obj
    obj_char_game_scene_char_LP["projectile_table"] = {}
    obj_char_game_scene_char_LP["VFX_HUD_table"] = {}
    obj_char_game_scene_char_LP["VFX_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_back_table"] = {}
    obj_char_game_scene_char_LP["black_overlay_table"] = {}

    obj_char_game_scene_char_LP["hit_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hit_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["hit_SFX"] = nil
    obj_char_game_scene_char_LP["counter_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["counter_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["counter_SFX"] = nil
    obj_char_game_scene_char_LP["block_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["block_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["block_SFX"] = nil

    obj_char_game_scene_char_LP["oroboros_bite_pos"] = {0,0}
    obj_char_game_scene_char_LP["hazama_hat_aim_pos"] = {0,0}
    
    -- draw_correction
    obj_char_game_scene_char_LP[8] = 0
    obj_char_game_scene_char_LP["anchor_pos"] = {215,520}
    obj_char_game_scene_char_LP["contrast"] = 1
    obj_char_game_scene_char_LP["brightness"] = 0
    obj_char_game_scene_char_LP["brightness_const"] = 0
    obj_char_game_scene_char_LP["brightness_overdrive_const"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_x"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_y"] = 0
    obj_char_game_scene_char_LP["current_hurtstop_wiggle_x_animation"] = nil
    obj_char_game_scene_char_LP["current_hurtstop_wiggle_y_animation"] = nil

    -- ground_smoke spawn pos
        -- attack button(not need to record in obj_char)
        -- move button(not need to record in obj_char)
            -- jump
            -- jump land
            -- dash
            -- dash stop
            -- any special move
        -- stand_block
        -- crouch_block
        -- stand_hurt_high/mid/low
        -- crouch_hurt
        -- launched/semi_launched_high/mid/low
        -- launched_land/semi_launched_land_high/mid/low
        -- no need
            -- air_hurt_high/mid/low
            -- air_launched/semi_launched_high/mid/low
            -- air_launched_land/semi_launched_land_high/mid/low

    obj_char_game_scene_char_LP["ground_smoke_spawn_anchor_pos"] = {}
    obj_char_game_scene_char_LP["ground_smoke_spawn_anchor_pos"]["stand_hurt_high"] = {-70,-195}

    obj_char_game_scene_char_LP["camera_x_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_y_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_enclosing_anim"] = nil

end

function order_load_game_scene_char_LP_frames(load_order)
    local PLAYER_ASSET_DATA = ASSET_DATA[2]
    local switch = 
    {
        [1] = function()
            image_sprite_sheet_table_char_game_scene_LP = {}

            image_sprite_sheet_table_char_game_scene_LP["5_stand_idle"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_5_stand_idle.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["5_stand_idle_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_LP["6_walk"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_6_walk.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["6_walk_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_LP["4_walk"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_4_walk.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["4_walk_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_LP["6_walk_to_stand_idle"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_6_walk_to_stand_idle.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["6_walk_to_stand_idle_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_LP["4_walk_to_stand_idle"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_4_walk_to_stand_idle.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["4_walk_to_stand_idle_sprite_batch"])
            )



            image_sprite_sheet_table_char_game_scene_LP["burst_overdrive"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_burst_overdrive.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["burst_overdrive_sprite_batch"])
            )
            image_sprite_sheet_table_char_game_scene_LP["5P"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_5P.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["5P_sprite_batch"])
            )



            image_sprite_sheet_table_char_game_scene_LP["stand_hurt_high"] = 
            sprite_sheet_load(
                "asset/game_scene/characters/TRM/_character/TRM_stand_hurt_high.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["stand_hurt_high_sprite_batch"])
            )


            
            image_sprite_sheet_VFX_game_scene_LP_overdrive_badge = 
            sprite_sheet_load(
                "asset/game_scene/VFX/overdrive_badge/TRM_overdrive_badge.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["overdrive_badge_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_LP_5P_whiff = 
            sprite_sheet_load(
                "asset/game_scene/VFX/whiff_VFX/TRM/5P.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["5P_whiff_VFX_sprite_batch"])
            )

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end

    -- image_table_char_game_scene_LP_hazama_hat = {}
    -- image_table_char_game_scene_LP_hazama_hat["stand_idle_hold"] = {}
    -- image_table_char_game_scene_LP_hazama_hat["stand_idle_shoot"] = {}
    -- for i = 0,3 do
    --     image_table_char_game_scene_LP_hazama_hat["stand_idle_hold"][i] = love.graphics.newImage(ASSET_DATA[1]["LP_hazama_hat"]["stand_idle_hold"][i])
    -- end
    -- for i = 0,9 do
    --     image_table_char_game_scene_LP_hazama_hat["stand_idle_shoot"][i] = love.graphics.newImage(ASSET_DATA[1]["LP_hazama_hat"]["stand_idle_shoot"][i])
    -- end

end

function load_game_scene_anim_char_LP()
    local obj_char = obj_char_game_scene_char_LP
    -- 站姿待机动画
    anim_char_LP_stand_idle = load_game_scene_anim_char_TRM_stand_idle(obj_char)    
    -- 行走动画
    anim_char_LP_6_walk = load_game_scene_anim_char_TRM_6(obj_char)
    anim_char_LP_4_walk = load_game_scene_anim_char_TRM_4(obj_char)
    anim_char_LP_6_walk_to_stand_idle = load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
    anim_char_LP_4_walk_to_stand_idle = load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
    -- overdrive启动动画
    anim_char_LP_overdrive = load_game_scene_anim_char_TRM_overdrive(obj_char)
    -- 拳脚动画
    anim_char_LP_5P_stand_hurt_high = load_game_scene_anim_char_TRM_5P_stand_hurt_high(obj_char)
    anim_char_LP_5P = load_game_scene_anim_char_TRM_5P(obj_char)

    obj_char["current_animation"] = anim_char_LP_stand_idle

end

function load_game_scene_hurtbox_data_LP()
    obj_hurtboxs_data_game_scene_char_LP = {}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"][0] = {{0, -220, 220, 440},{12, -461, 100, 42}}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"][1] = {{2, -200, 260, 400},{-21, -430, 100, 60}}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"][2] = {{2, -200, 300, 400}}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"][3] = {{-9, -190, 360, 380}}
    obj_hurtboxs_data_game_scene_char_LP["stand_hurt_high"][4] = {{-9, -190, 386, 380}}

end

function load_game_scene_shader_char_LP()
    -- no shader for now
end

function load_game_scene_audio_char_LP()

end





-- 更新和状态机
function update_game_scene_char_LP()
    state_machine_char_game_scene_char_LP()
    -- state_machine_char_game_scene_char_LP_hazama_hat()
    
end

function state_machine_char_game_scene_char_LP()
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

    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local obj_char = obj_char_game_scene_char_LP
    local switch = {
        -- 通用状态
        ["before_ease_in"] = function()
            character_animator(obj_char,obj_char["current_animation"])
        end,
        ["hitstop"] = function()
            update_game_scene_char_LP_hitstop_countdown()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
                obj_char["state"] = obj_char["state_cache"]
                obj_char["velocity"] = obj_char["velocity_cache"]
            end
        end,
        ["hurtstop"] = function()
            update_game_scene_char_LP_hurtstop_countdown()
            state_machine_char_game_scene_char_LP_input_sys_cache()
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
                    obj_char["current_animation"] = anim_char_LP_stand_idle
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "stand_idle"
                    state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
                end
            end
        end,
        ["block"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            if obj_char["f"] >= obj_char["current_animation_length"] then
                if obj_char["height_state"] == "stand" then
                    -- to idle
                    obj_char["current_animation"] = anim_char_LP_stand_idle
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "stand_idle"
                    state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
                end
            end
        end,

        -- 待机状态
            -- stand_idle为基本待机状态
            -- 所有其他状待机态回到基本待机状态都需要额外通过一个回归状态
            -- 但是stand_idle不需要 stand_idle进入其他待机状态的缓入会通过动画本身完成
            -- 6_and_4_walk -> walk_to_stand_idle
            -- 6_dash -> 6_dash_to_stand_idle
                -- 4_dash不是待机状态
            -- crouch -> crouch_to_stand_idle
            -- jump_air -> jump_air_to_stand_idle
        ["stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
        end,
        ["6_and_4_walk"] = function()
            common_game_scene_check_6_and_4_move(obj_char)
            state_gate_game_scene_char_LP_from_6_and_4_walk(input,obj_char)
        end,
        ["walk_to_stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
            if obj_char["f"] >= obj_char["current_animation_length"] then
                obj_char["current_animation"] = anim_char_LP_stand_idle
                if obj_char["sprite_sheet_state"] == "6_walk_to_stand_idle" then
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                elseif obj_char["sprite_sheet_state"] == "4_walk_to_stand_idle" then
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["f"] = 20
                    character_animator(obj_char,obj_char["current_animation"])
                end
                obj_char["state"] = "stand_idle"
                state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
            end
        end,

        -- 非待机状态
        ["overdrive"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            if test_input_sys_press(input["RC"]) and obj_char["f"] < 30 then
                -- to OD_RC
                
            elseif obj_char["f"] >= obj_char["current_animation_length"] then
                -- to stand_idle
                obj_char["idle_cancel"] = true -- 取消链
                obj_char["current_animation"] = anim_char_LP_stand_idle
                init_character_anim_with(obj_char,obj_char["current_animation"])
                obj_char["f"] = 28
                character_animator(obj_char,obj_char["current_animation"])
                obj_char["state"] = "stand_idle"
                state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
            end
        end,
        ["5P"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            
            if obj_char["f"] >= obj_char["current_animation_length"] then
                -- to stand_idle
                obj_char["current_animation"] = anim_char_LP_stand_idle
                init_character_anim_with(obj_char,obj_char["current_animation"])
                obj_char["state"] = "stand_idle"
                state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
                return
            end
            if obj_char["hit_cancel"] and obj_char["f"] >= 8 then
                obj_char["input_sys_state"] = "load" -- none save load
                state_machine_char_game_scene_char_LP_input_sys_cache()
                if test_input_sys_press(input["P"]) then
                    obj_char["hit_cancel"] = false
                    -- to 5P
                    obj_char["current_animation"] = anim_char_LP_5P
                    init_character_anim_with(obj_char,obj_char["current_animation"])
                    obj_char["state"] = "5P"
                    return
                end
            end
            if obj_char["idle_cancel"] then
                obj_char["input_sys_state"] = "load" -- none save load
                state_machine_char_game_scene_char_LP_input_sys_cache()
                state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
            end
        end,
    }
    update_game_scene_char_LP_global_countdown()
    local this_function = switch[obj_char["state"]]
    if this_function then this_function() end

end

function state_machine_char_game_scene_char_LP_hazama_hat()
    local obj = obj_char_game_scene_char_LP
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

function state_machine_char_game_scene_char_LP_input_sys_cache()
    local obj_char = obj_char_game_scene_char_LP
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
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





function draw_game_scene_char_LP_logic_graphic_pos_sync()
    local obj = obj_char_game_scene_char_LP
    obj[1] = obj["x"]+(obj["hurtstop_wiggle_x"]*(math.random()-0.5)*2)-obj[5]*obj["anchor_pos"][1]
    obj[2] = obj["y"]+(obj["hurtstop_wiggle_y"]*(math.random()-0.5)*2)-obj[6]*obj["anchor_pos"][2]
end

function draw_game_scene_char_LP()
    local obj = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj["sprite_sheet_state"]]

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

        -- local hazama_hat_image_table = image_table_char_game_scene_LP_hazama_hat[obj["state"]]
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

function draw_game_scene_char_LP_shadow()
    local obj = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera
    local light_obj = obj_stage_game_scene_glow

    local light_x = light_obj["glow_3d_pos"][1]
    local light_y = light_obj["glow_3d_pos"][2]
    local light_z = light_obj["glow_3d_pos"][3]

    local camera_x = camera[1]
    local camera_y = camera[2]
    local camera_z = camera[3]

    local scale = draw_resolution_correction(800)/(light_z-camera_z)

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local cood_res = {
        scale * (light_x - camera_x) + draw_resolution_correction(800),
        scale * (light_y - camera_y) + draw_resolution_correction(450)
    }
    local dx_light_char_2d = math.abs((light_x - camera_x))

    local character_canvas = love.graphics.newCanvas(width,height)
    local shadow_canvas = love.graphics.newCanvas(width,height)
    love.graphics.setCanvas(character_canvas)
    draw_game_scene_char_LP()
    love.graphics.setCanvas()

    local center_blur_start = 0.5
    local side_blur_start = 0.85
    local blur_start = side_blur_start - ((width-dx_light_char_2d)/width*(side_blur_start-center_blur_start))
    local blur_width = (1.0 - blur_start)*0.85
    love.graphics.setCanvas(shadow_canvas)
    love.graphics.setShader(shader_game_scene_shadow_radial_blur)
    shader_game_scene_shadow_radial_blur:send("start_coods", cood_res)
    shader_game_scene_shadow_radial_blur:send("input_screen_coords", {width, height})
    shader_game_scene_shadow_radial_blur:send("blur_start", blur_start)
    shader_game_scene_shadow_radial_blur:send("blur_width", blur_width)
    love.graphics.draw(character_canvas, 0, 0)
    love.graphics.setShader()
    love.graphics.setCanvas()

    local opacity = math.max(0,(obj["y"] - 345)/20)*0.5
    love.graphics.setColor(0,0,0,opacity)
    love.graphics.draw(shadow_canvas)
    love.graphics.setColor(1,1,1,1)

end

function draw_game_scene_char_LP_hurtbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
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

function draw_game_scene_char_LP_hitbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
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

function draw_game_scene_char_LP_pushbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
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





function update_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["projectile_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["draw"](object)
    end
end






function update_game_scene_char_LP_VFX()
    for i = #obj_char_game_scene_char_LP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_HUD_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_front_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_back_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_LP_VFX_HUD()
    for i = #obj_char_game_scene_char_LP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["draw"](object)
    end
end

function draw_game_scene_char_LP_VFX_front()
    for i = #obj_char_game_scene_char_LP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["draw"](object)
    end
end

function draw_game_scene_char_LP_VFX_back()
    for i = #obj_char_game_scene_char_LP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["draw"](object)
    end
end

function update_game_scene_char_LP_black_overlay()
    for i = #obj_char_game_scene_char_LP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["black_overlay_table"][i]
        object["life"] = object["life"] - 1 -- 减少寿命
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["black_overlay_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end

function draw_game_scene_char_LP_black_overlay()
    for i = #obj_char_game_scene_char_LP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["black_overlay_table"][i]
        object["draw"](object)
    end
end




function update_game_scene_char_LP_hitstop_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["hit_hurt_blockstop_countdown"] > 1 then
        obj_char["hit_hurt_blockstop_countdown"] = obj_char["hit_hurt_blockstop_countdown"] - 1
    else
        obj_char["game_speed_abnormal_realtime_countdown"] = obj_char["hit_hurt_block_slowdown_countdown"]
        obj_char["hit_hurt_blockstop_countdown"] = 0 
        obj_char["hit_hurt_block_slowdown_countdown"] = 0
        obj_char["game_speed"] = 1
    end
end

function update_game_scene_char_LP_hurtstop_countdown()
    local obj_char = obj_char_game_scene_char_LP
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

function update_game_scene_char_LP_overdrive_countdown()
    local obj_char = obj_char_game_scene_char_LP
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

function update_game_scene_char_LP_inv_state_countdown()
    local obj_char = obj_char_game_scene_char_LP
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

function update_game_scene_char_LP_global_countdown()
    update_game_scene_char_LP_overdrive_countdown()
    update_game_scene_char_LP_inv_state_countdown()
end




function state_gate_game_scene_char_LP_from_stand_idle(input,obj_char)
    obj_char["input_sys_state"] = "load" -- none save load
    state_machine_char_game_scene_char_LP_input_sys_cache()
    if common_game_scene_get_input_direction(obj_char) == 7 
    or common_game_scene_get_input_direction(obj_char) == 8
    or common_game_scene_get_input_direction(obj_char) == 9 then
        -- to pre_jump

    elseif test_input_sys_press(input["Burst"]) and obj_char["overdrive"][1] == obj_char["overdrive"][2] then
        -- to over_drive
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_LP_overdrive
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_game_scene_overdrive_load_camera_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        obj_char["state"] = "overdrive"
    elseif test_input_sys_press(input["P"]) then
        -- to 5P
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_LP_5P
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

function state_gate_game_scene_char_LP_from_6_and_4_walk(input,obj_char)
    obj_char["input_sys_state"] = "load" -- none save load
    state_machine_char_game_scene_char_LP_input_sys_cache()
    if common_game_scene_get_input_direction(obj_char) == 7 
    or common_game_scene_get_input_direction(obj_char) == 8
    or common_game_scene_get_input_direction(obj_char) == 9 then
        -- to pre_jump
        obj_char["idle_cancel"] = true
    elseif test_input_sys_press(input["Burst"]) and obj_char["overdrive"][1] == obj_char["overdrive"][2] then
        -- to over_drive
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_LP_overdrive
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "overdrive"
    elseif test_input_sys_press(input["P"]) then
        -- to 5P
        obj_char["idle_cancel"] = false
        obj_char["current_animation"] = anim_char_LP_5P
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5P"
    elseif common_game_scene_get_input_direction(obj_char) == 5 then
        -- to 6_walk_to_stand_idle or 4_walk_to_stand_idle
        obj_char["idle_cancel"] = true
        if obj_char["sprite_sheet_state"] == "4_walk" then
            obj_char["current_animation"] = anim_char_LP_4_walk_to_stand_idle
        elseif obj_char["sprite_sheet_state"] == "6_walk" then
            obj_char["current_animation"] = anim_char_LP_6_walk_to_stand_idle
        end
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["velocity"] = {0,0}
        obj_char["state"] = "walk_to_stand_idle"
    end
end
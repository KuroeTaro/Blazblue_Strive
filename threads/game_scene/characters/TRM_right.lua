local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}

-- 待机状态
image_data["2_crouch_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_2_crouch.dds")
image_data["4_walk_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_4_walk.dds")
image_data["4_walk_to_stand_idle_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_4_walk_to_stand_idle.dds")
image_data["5_stand_idle_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_5_stand_idle.dds")
image_data["6_walk_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_6_walk.dds")
image_data["6_walk_to_stand_idle_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_6_walk_to_stand_idle.dds")
image_data["8_jump_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_8_jump.dds")
image_data["7_8_9_pre_jump_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_7_8_9_pre_jump.dds")

-- 通用机制
image_data["burst_overdrive_rc_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_burst_overdrive_rc.dds")

-- 拳脚
image_data["5P_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_5P.dds")

-- 必杀技

-- 超必杀技

-- 起身动画

-- 受伤类
image_data["stand_hurt_high_sprite_batch"] = compress_module("asset/game_scene/characters/TRM/_character/TRM_stand_hurt_high.dds")

-- 受身类

-- 特效类
image_data["5P_whiff_VFX_sprite_batch"] = compress_module("asset/game_scene/VFX/whiff_VFX/TRM/5P.dds")
image_data["overdrive_badge_sprite_batch"] = compress_module("asset/game_scene/VFX/overdrive_badge/TRM_overdrive_badge.dds")

love.thread.getChannel( 'image_3' ):push( image_data )
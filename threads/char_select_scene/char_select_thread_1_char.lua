local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}

-- global use shape image
image_data[1] = compress_module("asset/char_select_scene/bar_mark.dds")
image_data[2] = compress_module("asset/char_select_scene/char_select_left_alpha.dds")
image_data[3] = compress_module("asset/char_select_scene/char_select_right_alpha.dds")
image_data[4] = compress_module("asset/char_select_scene/control_method_L.dds")
image_data[5] = compress_module("asset/char_select_scene/control_method_R.dds")
image_data[6] = compress_module("asset/char_select_scene/ring.dds")

image_data["char_icon_alpha"] = {}
image_data["char_icon_alpha"][1] = compress_module("asset/char_select_scene/char_icon_alpha/1.dds")
image_data["char_icon_alpha"][2] = compress_module("asset/char_select_scene/char_icon_alpha/2.dds")
image_data["char_icon_alpha"][3] = compress_module("asset/char_select_scene/char_icon_alpha/3.dds")
image_data["char_icon_alpha"][4] = compress_module("asset/char_select_scene/char_icon_alpha/4.dds")
image_data["char_icon_alpha"][5] = compress_module("asset/char_select_scene/char_icon_alpha/5.dds")
image_data["char_icon_alpha"][6] = compress_module("asset/char_select_scene/char_icon_alpha/6.dds")
image_data["char_icon_alpha"][7] = compress_module("asset/char_select_scene/char_icon_alpha/7.dds")
image_data["char_icon_alpha"][8] = compress_module("asset/char_select_scene/char_icon_alpha/8.dds")

-- char_select
image_data["char_select_char"] = {}
image_data["char_select_char"][1] = compress_module("asset/char_select_scene/char_select/PLT.dds")
image_data["char_select_char"][2] = compress_module("asset/char_select_scene/char_select/AZR.dds")
image_data["char_select_char"][3] = compress_module("asset/char_select_scene/char_select/SSN.dds")
image_data["char_select_char"][4] = compress_module("asset/char_select_scene/char_select/TRM.dds")
image_data["char_select_char"][5] = compress_module("asset/char_select_scene/char_select/RGN.dds")
image_data["char_select_char"][6] = compress_module("asset/char_select_scene/char_select/SRK.dds")
image_data["char_select_char"][7] = compress_module("asset/char_select_scene/char_select/KGR.dds")
image_data["char_select_char"][8] = compress_module("asset/char_select_scene/char_select/TGR.dds")

image_data["char_select_char_txt"] = {}
image_data["char_select_char_txt"][1] = compress_module("asset/char_select_scene/char_select/PLT_text.dds")
image_data["char_select_char_txt"][2] = compress_module("asset/char_select_scene/char_select/AZR_text.dds")
image_data["char_select_char_txt"][3] = compress_module("asset/char_select_scene/char_select/SSN_text.dds")
image_data["char_select_char_txt"][4] = compress_module("asset/char_select_scene/char_select/TRM_text.dds")
image_data["char_select_char_txt"][5] = compress_module("asset/char_select_scene/char_select/RGN_text.dds")
image_data["char_select_char_txt"][6] = compress_module("asset/char_select_scene/char_select/SRK_text.dds")
image_data["char_select_char_txt"][7] = compress_module("asset/char_select_scene/char_select/KGR_text.dds")
image_data["char_select_char_txt"][8] = compress_module("asset/char_select_scene/char_select/TGR_text.dds")

image_data["number"] = {}
image_data["number"][0] = compress_module("asset/char_select_scene/number/0.dds")
image_data["number"][1] = compress_module("asset/char_select_scene/number/1.dds")
image_data["number"][2] = compress_module("asset/char_select_scene/number/2.dds")
image_data["number"][3] = compress_module("asset/char_select_scene/number/3.dds")
image_data["number"][4] = compress_module("asset/char_select_scene/number/4.dds")
image_data["number"][5] = compress_module("asset/char_select_scene/number/5.dds")
image_data["number"][6] = compress_module("asset/char_select_scene/number/6.dds")
image_data["number"][7] = compress_module("asset/char_select_scene/number/7.dds")
image_data["number"][8] = compress_module("asset/char_select_scene/number/8.dds")
image_data["number"][9] = compress_module("asset/char_select_scene/number/9.dds")

love.thread.getChannel( 'image_1' ):push( image_data )
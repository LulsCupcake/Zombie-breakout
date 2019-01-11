function safe_spawn_unit(unit_name, ...)

    local arg = {...}
    local pos = arg[1]

    local function vector_to_string(vec)
        local dataString = "x:{1}|y:{2}|z:{3}"
        dataString = dataString:gsub("{1}", math.round_with_precision(vec.x, 4))
        dataString = dataString:gsub("{2}", math.round_with_precision(vec.y, 4))
        dataString = dataString:gsub("{3}", math.round_with_precision(vec.z, 4))

        return dataString
    end

    if managers and managers.wdu then
        if unit_name == Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1") or unit_name == Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1") or unit_name == Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2") or unit_name == Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3") or unit_name == Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween") or unit_name == Idstring("units/pd2_dlc_uno/characters/ene_shadow_cloaker_1/ene_shadow_cloaker_1") then
            if Network:is_server() and not managers.wdu:_is_solo() then
                LuaNetworking:SendToPeers("SpecialWave_SpawnPosition", vector_to_string(pos))
            end

            if pos then
                World:effect_manager():spawn({
                    effect = Idstring("effects/zm/zm_special_spawn"),
                    position = pos
                })
            end

            if unit_name == Idstring("units/pd2_dlc_uno/characters/ene_shadow_cloaker_1/ene_shadow_cloaker_1") then
                if Network:is_server() and not managers.wdu:_is_solo() then
                    LuaNetworking:SendToPeers("SpecialWave_PlayShadowSpook", vector_to_string(pos))
                end
                managers.wdu:_element_play_sound({
                    name = "play_shadow_spook",
                    custom_dir = "sound/shadowow",
                    file_name = "post_mortem.ogg",
                    is_loop = false,
                    is_relative = false,
                    is_3d = true,
                    position = pos
                })
            end

            managers.wdu:_element_play_sound({
                name = "play_sound_spawn",
                custom_dir = "sound",
                file_name = "special_spawn.ogg",
                is_loop = false,
                is_relative = false
            })

            DelayedCalls:Add("zm_shake_little_delay", 1.6, function()
                if alive(managers.player:player_unit()) then
                    local feedback = managers.feedback:create("mission_triggered")
                    feedback:set_unit(managers.player:player_unit())
                    feedback:set_enabled("camera_shake", true)
                    feedback:set_enabled("rumble", true)
                    feedback:set_enabled("above_camera_effect", false)

                    local params = {
                        "camera_shake",
                        "multiplier",
                        1,
                        "camera_shake",
                        "amplitude",
                        0.5,
                        "camera_shake",
                        "attack",
                        0.05,
                        "camera_shake",
                        "sustain",
                        0.15,
                        "camera_shake",
                        "decay",
                        0.5,
                        "rumble",
                        "multiplier_data",
                        1,
                        "rumble",
                        "peak",
                        0.5,
                        "rumble",
                        "attack",
                        0.05,
                        "rumble",
                        "sustain",
                        0.15,
                        "rumble",
                        "release",
                        0.5
                    }

                    feedback:play(unpack(params))
                end
            end)
        end
    end

	if editor_load_unit(unit_name) then
		return World:spawn_unit(unit_name:id(), ...)
	end
end
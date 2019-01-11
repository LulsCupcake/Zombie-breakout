WDUPowerUps = WDUPowerUps or class(WDUManager)
WDUPowerUps._CURRENT_SECRET_STEP = 1

function WDUPowerUps:init()
    self._default_color_grading = "color_payday"

    self._zombie_blood_obj = {
        Idstring("Spine1"),
        Idstring("Head"),
        Idstring("Spine2"),
        Idstring("Spine"),
        Idstring("Neck")
    }

    self._zombie_blood_obj_small = {
        Idstring("LeftShoulder"),
        Idstring("LeftArm"),
        Idstring("LeftForeArm"),
        Idstring("LeftForeArmRoll"),
        Idstring("LeftHand"),
        Idstring("RightShoulder"),
        Idstring("RightArm"),
        Idstring("RightForeArm"),
        Idstring("RightForeArmRoll"),
        Idstring("RightHand"),
        Idstring("LeftUpLeg"),
        Idstring("LeftLeg"),
        Idstring("LeftFoot"),
        Idstring("RightUpLeg"),
        Idstring("RightLeg"),
        Idstring("RightFoot")
    }

    self._zombie_blood_obj_trails = {
        Idstring("LeftHand"),
        Idstring("RightHand"),
        Idstring("LeftFoot"),
        Idstring("RightFoot")
    }

    self._hint_said_for_step = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
    }

    self._hint_subtitles_durations = {
        [1] = { duration = 0 },
        [2] = { duration = 4 },
        [3] = { duration = 8 },
        [4] = { duration = 4 },
        [5] = { duration = 6 },
        [6] = { duration = 4 },
    }
end

function WDUPowerUps:execute_max_ammo()
    local player_unit = managers.player:player_unit()

    if player_unit then
        for id,weapon in pairs( player_unit:inventory():available_selections() ) do
            if alive(weapon.unit) then
                weapon.unit:base():soft_replenish()
                managers.hud:set_ammo_amount( id, weapon.unit:base():ammo_info() )
            end
            
            managers.player:add_grenade_amount(10, true)
            managers.player:add_cable_ties(2)
        end
    end

    if managers.hud then
        managers.hud:show_hint( { text = "Max Ammo!" } )
    end

    self._source = SoundDevice:create_source("max_ammo_announcer")
    self._source:post_event("zm_announcer_max_ammo")
end

function WDUPowerUps:execute_double_points()
    managers.hud._hud_zm_waves:_set_gift_visible("icon_double_points", true) 
    managers.wdu:_setup_event_state("double_points", true)

    self._source = SoundDevice:create_source("double_points_announcer")
    self._source:post_event("zm_announcer_double_points")

    managers.wdu:_element_play_sound({
        name = "double_points_loop",
        file_name = "double_points_loop.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "double_points_timer_wait", function()
        managers.wdu:_setup_event_state("double_points", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_double_points", false)
    end)
end

function WDUPowerUps:execute_firesale()
    if managers.hud then
        managers.hud._hud_zm_waves:_set_gift_visible("icon_firesale", true) 
    end

    self._source = SoundDevice:create_source("firesale_announcer")
    self._source:post_event("zm_announcer_firesale")
    managers.wdu:_setup_event_state("firesale", true)

    managers.wdu:_element_play_sound({
        name = "firesale_inbound",
        file_name = "firesale.ogg",
        sound_type = "music",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "firesale_timer_wait", function()
        managers.wdu:_setup_event_state("firesale", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_firesale", false)
        managers.wdu.level.active_events.firesale_box_swap = false
    end)
end

function WDUPowerUps:execute_instakill()
    managers.hud._hud_zm_waves:_set_gift_visible("icon_instakill", true)
    managers.wdu:_setup_event_state("instakill", true)
    self._source = SoundDevice:create_source("instakill_announcer")
    self._source:post_event("zm_announcer_instakill")

    managers.wdu:_element_play_sound({
        name = "instakill_loop",
        file_name = "instakill_loop.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "instakill_wait", function()
        managers.wdu:_setup_event_state("instakill", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_instakill", false)
    end)
end

function WDUPowerUps:execute_kaboom()
    local overlay_effect = {
        blend_mode = "normal",
        sustain = 0,
        play_paused = true,
        fade_in = 0,
        fade_out = 3,
        color = Color(0.65, 1, 1, 1),
        timer = TimerManager:main()
    }
    
    self._source = SoundDevice:create_source("announcer_kaboom")
    self._source:post_event("zm_announcer_kaboom")

    self._source_boom = SoundDevice:create_source("kaboom_boom")
    self._source_boom:post_event("zm_boom")

    managers.overlay_effect:play_effect(overlay_effect)

    local double_point_effect = managers.wdu:_is_event_active("double_points") and 2 or 1

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

    managers.wdu:wait(1, "kaboom_wait", function()
        local function nukeunit(pawn)
            local col_ray = { }
            col_ray.ray = Vector3(1, 0, 0)
            col_ray.position = pawn.unit:position()
        
            local action_data = {}
            action_data.variant = "explosion"
            action_data.damage = 1000000
            action_data.attacker_unit = nil
            action_data.col_ray = col_ray
        
            pawn.unit:character_damage():damage_explosion(action_data)
        end

        for u_key,u_data in pairs(managers.enemy:all_enemies()) do
            nukeunit(u_data)
        end

        managers.wdu:_add_money_to(managers.wdu:_peer_id(), 400 * double_point_effect)
    end)
end

function WDUPowerUps:execute_blood_money()
    managers.wdu:_element_play_sound({
        name = "blood_money_pickup",
        file_name = "gift_taken.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    self._source = SoundDevice:create_source("bloodmoney_announcer")
    self._source:post_event("zm_announcer_blood_money")

    local cash_table = {
        50,
        100,
        150,
        200,
        250,
        300,
        500
    }

    local double_points = managers.wdu.level.active_events.double_points and 2 or 1
    local random_cash = cash_table[math.random(#cash_table)] * double_points
    local peer_id = managers.wdu:_peer_id()
    managers.wdu:_add_money_to(peer_id, random_cash)
end

function WDUPowerUps:execute_zombie_blood()
    local previous_grading = self._default_color_grading
    local zb_grading = "color_sin_classic"
    local zb_duration = 30
    local team_data_player = managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("player"))
    local team_data_enemy = managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("non_combatant"))
    local my_peer_id = managers.wdu:_peer_id()

    managers.wdu:_element_play_sound({
        name = "zombie_blood_pickup",
        file_name = "gift_taken.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    self._source_ambiance = SoundDevice:create_source("zombieblood_ambiance")
    self._source_ambiance:post_event("zm_blood_ambiance")
--[[
    managers.wdu:wait(5, "zombie_blood_secret_hint", function()
        local steps_hints = {
            "",
            "zm_hint_step_2",
            "zm_hint_step_3",
            "zm_hint_step_4",
            "zm_hint_step_5",
            "zm_hint_step_6",
            "zm_hint_step_7"
        }

        local current_step = WDUPowerUps._CURRENT_SECRET_STEP


    end)
]]
    self._source = SoundDevice:create_source("zombieblood_announcer")
    self._source:post_event("zm_announcer_zombie_blood")

    managers.hud._hud_zm_waves:_set_gift_visible("icon_zombie_blood", true)
    managers.wdu:_setup_event_state("zombie_blood", true)

    -- Set Grading
    managers.environment_controller:set_default_color_grading(zb_grading)
    managers.environment_controller:refresh_render_settings()

    -- Set Default Team
    local unit = managers.criminals:character_unit_by_peer_id(my_peer_id)
    
    if alive(unit) then
        unit:movement():set_team(team_data_enemy)
    end

    managers.wdu:wait(10, "zombie_blood_secret_hint", function()
        local current_secret_step = WDUPowerUps._CURRENT_SECRET_STEP
        if current_secret_step > 1 then
            if not self._hint_said_for_step[current_secret_step] then
                local hint_name = "hint_blood_" .. tostring(current_secret_step)
                local hint_subtitle_id = "zm_hint_blood_sub_" .. tostring(current_secret_step)
                local duration = self._hint_subtitles_durations[current_secret_step].duration

                managers.wdu:_element_play_sound({
                    name = "zombie_blood_hint",
                    file_name = hint_name .. ".ogg",
                    sound_type = "sfx",
                    custom_dir = "sound/deamon/sora",
                    is_relative = false,
                    is_loop = false,
                    is_3d = false,
                    use_velocity = false
                })

                DramaExt:play_subtitle(hint_subtitle_id, duration)
                self._hint_said_for_step[current_secret_step] = true
            end
        end
    end)

    managers.wdu:wait(31, "zombie_blood_duration", function()
        -- Revert changes
        managers.environment_controller:set_default_color_grading(previous_grading)
        managers.environment_controller:refresh_render_settings()

        if alive(unit) then
            unit:movement():set_team(team_data_player)
        end

        LuaNetworking:SendToPeers( "ZombieBloodEnded", "1" )
        managers.wdu:_setup_event_state("zombie_blood", false)
    end)
end

function WDUPowerUps:execute_zombie_blood_on(unit)
    if not unit then
        return
    end

    for id, obj in pairs(self._zombie_blood_obj) do
        World:effect_manager():spawn({
            effect = Idstring("effects/zm/zm_blood_smoke_distorted"),
            parent = unit:get_object(obj)
        })
    end

    for id_small, obj_small in pairs(self._zombie_blood_obj_small) do
        World:effect_manager():spawn({
            effect = Idstring("effects/zm/zm_blood_smoke_distorted_small"),
            parent = unit:get_object(obj_small)
        })
    end

    for id_trail, obj_trail in pairs(self._zombie_blood_obj_trails) do
        World:effect_manager():spawn({
            effect = Idstring("effects/zm/zm_blood_smoke_trail_small"),
            parent = unit:get_object(obj_trail)
        })
    end
end
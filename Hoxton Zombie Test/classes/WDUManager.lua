WDUManager = WDUManager or class()

function WDUManager:init()
    if not self:_on_wdu_map() then
        return
    end

    self:_init_variables()
    self:_setup_xaudio()
    self:_setup_video_panel()
    self._played_video = false

    self._power_ups = WDUPowerUps:new()
    
    if LocalizationManager then
        LocalizationManager:load_localization_file( self:_get_mod_path() .. "loc/unique_lines.txt" )
    end
end

function WDUManager:_init_variables()
    self.project_name = "Hox"
    self.extension = "shovel"
    self.wave_highscore_file = SavePath .. self.project_name .. "_Highscore." .. self.extension
    self.xaudio_initialized = false
    self.players = {
        [1] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            steam_id = 0
        },
        [2] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            steam_id = 0
        },
        [3] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            steam_id = 0
        },
        [4] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            steam_id = 0
        }
    }
    self.level = {
        zombies = {
            currently_spawned = 0,
            total_alive = 0,
            max_spawns = 8,
            max_special_wave_total_spawns = 10,
            killed = 0,
            add_on_end_wave = 2,
            max_special_wave_spawns = 2,
            added_contour = false
        },
        wave = {
            current = 0,
            delay_timeout = 15,
            is_special_wave = false
        },
        active_events = {
            double_points = false,
            instakill = false,
            firesale = false,
            firesale_box_swap = false,
            zombie_blood = false
        },
        power_up_chance = 2,
        power_up_table = {
            "max_ammo",
            "double_points",
            "firesale",
            "instakill",
            "nuke",
            "blood_money",
            "zombie_blood"
        },
        teleporter = {
            active = true
        },
        scale = 0,
        scale_value_max = 0
    }

    self.points = {
        default = 50,
        on_kill = {
            shield = 80,
            spooc = 120,
            tank = 150,
            tank_green = 160,
            tank_black = 175,
            tank_skull = 190,
            tank_hw = 200,
            taser = 100,
            medic = 80,
            sniper = 95
        },
        on_hit = 10,
        on_headshot = 50,
        on_melee_kill = 130
    }

    self._sound_buffers = {}
    self._sound_sources = {}

    self._hud_hidden = false
end

function WDUManager:_init_new_player(data)
    if not data then
        return
    end

    self:_set_player_name(data.id, data.name)
    self:_set_start_money(data.id, 500)
end

function WDUManager:_number_of_players()
    return managers.network:session() and managers.network:session():amount_of_players() or 1
end

function WDUManager:_get_max_special_wave_spawns()
    local nb_players = self:_number_of_players()

    return self.level.zombies.max_special_wave_spawns * nb_players
end

function WDUManager:_get_total_cops_alive()
    return self.level.zombies.total_alive
end

function WDUManager:change_cops_alive(nb)
    self.level.zombies.total_alive = self.level.zombies.total_alive + nb
end

function WDUManager:_is_solo()
    if Global.game_settings.single_player then
        return true
    end

    local nb_players = self:_number_of_players()
    
    if nb_players == 1 then
        return true
    end

    return false
end

function WDUManager:_increase_scale_value()
    self.level.scale = self.level.scale + 1
end

function WDUManager:_get_scale()
    return self.level.scale
end

function WDUManager:_scale_required()
    if self.level.scale >= self.level.scale_value_max then
        return true
    end

    return false
end

function WDUManager:_reset_scale()
    self.level.scale = 0
end

function WDUManager:_init_wave_highscore()
    local function SaveFirstTime()
        if file.DirectoryExists( SavePath ) then	
            local file = io.open( self.wave_highscore_file , "w+")
            if file then
                file:write("0")
                file:close()
            end
        end
    end

    local file = io.open( self.wave_highscore_file , "r")
	if file then
		self.players[self:_peer_id()].max_waves_survived = tonumber(file:read("*all"))
        file:close()
    else
        SaveFirstTime()
        self.players[self:_peer_id()].max_waves_survived = 0
    end
    
    LuaNetworking:SendToPeers( "ZMWavesHighScore", tostring(self.players[self:_peer_id()].max_waves_survived) )
end

function WDUManager:_save_new_highscore(wave)
    if file.DirectoryExists( SavePath ) then	
        local file = io.open( self.wave_highscore_file , "w+")
        if file then
            file:write(tostring(wave))
            file:close()
        end
    end

    self.players[self:_peer_id()].max_waves_survived = wave
    LuaNetworking:SendToPeers("ZMWavesHighScore", tostring(wave))
end

function WDUManager:_get_current_highscore_of(id)
    return self.players[id].max_waves_survived
end

function WDUManager:_set_player_name(id, name)
    self.players[id].player_name = name
end

function WDUManager:_set_start_money(id, money)
    self.players[id].money = money
    self.players[id].total_score = money
end

function WDUManager:_peer_id()
    return Global.game_settings.single_player and 1 or managers.network:session() and managers.network:session():local_peer():id() or 1
end

function WDUManager:_multiply_zombies_by_wave(current_wave)
    if self:_is_solo() then
        self.level.zombies.max_spawns = self.level.zombies.max_spawns + 2
        return
    end

    self.level.zombies.max_spawns = self.level.zombies.max_spawns + (self.level.zombies.add_on_end_wave + 2)
end

function WDUManager:_get_own_money()
    local my_id = self:_peer_id()
    return self.players[my_id].money
end

function WDUManager:_add_money_to(peer_id, amount, skip_score)
    if amount and type(amount) == "number" then
        local additional_amount = math.floor(amount)
        self.players[peer_id].money = self.players[peer_id].money + additional_amount

        if self.players[peer_id].money < 0 then
            self.players[peer_id].money = 0
        end

        if not self:_is_solo() then
            local tbl = { 
                cm = tostring(self:_get_own_money()),
                pg = tostring(amount)
            }
            LuaNetworking:SendToPeers( "UpdPts", LuaNetworking:TableToString(tbl) )
        end

        local positive = true

        if amount < 0 then
            positive = false
        end

        if positive and not skip_score then
            self.players[peer_id].total_score = self.players[peer_id].total_score + additional_amount
        end

        managers.hud._hud_zm_points:_animate_points_gained_v2(peer_id, amount, positive)
        self:_update_hud_element()
    end
end

function WDUManager:_update_hud_element()
    if not Global.game_settings.single_player then
        if managers and managers.network and managers.network:session() then
            for _, peer in pairs(managers.network:session():all_peers()) do

                    local me = peer:id() == self:_peer_id()

                    self.players[peer:id()].steam_id = peer:user_id()

                    Steam:friend_avatar(2, peer:user_id(), function (texture)
                        local avatar = texture or "guis/textures/pd2/none_icon"
                        managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_image(avatar)
                        managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_visible(true)
                    end)

                    self:wait(1, "steam_avatar_try_again_" .. peer:id(), function()
                        Steam:friend_avatar(2, peer:user_id(), function (texture)
                            local avatar = texture or "guis/textures/pd2/none_icon"
                            managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_image(avatar)
                            managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_visible(true)
                        end)
                    end)

                    managers.hud._hud_zm_points._zmp_points[peer:id()]:set_text(tostring(self.players[peer:id()].money))
                    managers.hud._hud_zm_points._zmp_points[peer:id()]:set_visible(true)
                    managers.hud._hud_zm_points._zmp_points_bg[peer:id()]:set_visible(true)

                    if not me then
                        managers.hud._hud_zm_points._zmp_points_bg[peer:id()]:set_image("ui/bloodtrail_other")
                    end
            end
        end
    else
        self.players[1].steam_id = Steam:userid()

        Steam:friend_avatar(2, Steam:userid(), function (texture)
            local avatar = texture or "guis/textures/pd2/none_icon"
            managers.hud._hud_zm_points._zmp_avatars[1]:set_image(avatar)
            managers.hud._hud_zm_points._zmp_avatars[1]:set_visible(true)
        end)
        managers.hud._hud_zm_points._zmp_points[1]:set_text(tostring(self.players[1].money))
        managers.hud._hud_zm_points._zmp_points[1]:set_visible(true)
        managers.hud._hud_zm_points._zmp_points_bg[1]:set_visible(true)
    end
end

function WDUManager:_update_total_score(peer_id, add)
    if not peer_id then
        return
    end

    self.players[peer_id].total_score = self.players[peer_id].total_score + add
end

function WDUManager:_get_points_amount(category, unit)
    local double_point_effect = self.level.active_events.double_points and 2 or 1
    
    if not unit then
        return self.points[category]
    end

    if not self.points[category][unit] then
        return self.points["default"] * double_point_effect
    end

    return self.points[category][unit]
end

function WDUManager:_on_wdu_map()
    if Global.editor_mode then
        return true
    end

    if not managers.job then
        return false
    end
    
    if managers.job:current_level_id() == "hox_2_zombie" then
        return true
    end

    return false
end

function WDUManager:_setup_event_state(event, state)
    self.level.active_events[event] = state
end

function WDUManager:_is_event_active(event)
    return self.level.active_events[event]
end

function WDUManager:_get_current_wave()
    return self.level.wave.current
end

function WDUManager:_setup_xaudio()
    blt.xaudio.setup()
    self.xaudio_initialized = true
end

function WDUManager:_element_play_sound(data)
    if not self.xaudio_initialized then
        return
    end

    if not self._sound_sources[data.name] then
        table.insert(self._sound_buffers, data.name)
        table.insert(self._sound_sources, data.name)
    end

    if self._sound_sources[data.name] then
        self._sound_buffers[data.name]:close()
        self._sound_sources[data.name]:close()
        self._sound_sources[data.name] = nil
    end

    local directory = ""

    if data.custom_dir and data.custom_dir ~= "" then
        directory = data.custom_dir .. "/"
    end

    if not XAudio then
        error("SuperBLT is NOT installed properly. Refer to the step 1 in the installation guide for more details.")
    end

    self._sound_buffers[data.name] = XAudio.Buffer:new(self:_get_mod_path() .. "assets/" .. directory .. data.file_name)
    self._sound_sources[data.name] = XAudio.Source:new(self._sound_buffers[data.name])

    if not data.sound_type then
        data.sound_type = "sfx"
    end

    self._sound_sources[data.name]:set_type(data.sound_type)
    self._sound_sources[data.name]:set_relative(data.is_relative)
    self._sound_sources[data.name]:set_looping(data.is_loop)

    if data.is_3d then
        self._sound_sources[data.name]:set_position(data.position)
    end

    if data.use_velocity then
        self._sound_sources[data.name]:set_velocity(data.position)
    end

    if data.override_volume and data.override_volume > 0 then
        if data.override_volume > 1 then
            data.override_volume = 1
        end

        self._sound_sources[data.name]:set_volume(data.override_volume)
    end
end

function WDUManager:_destroy_source(id)
    if self._sound_sources[id] then
		self._sound_buffers[id]:close()
        self._sound_sources[id]:close()
        self._sound_sources[id] = nil
    end
end

function WDUManager:_get_mod_path()
    return zm_hox.ModPath
end

function WDUManager:_setup_video_panel()
    self._full_workspace = managers.gui_data:create_fullscreen_workspace()
end

function WDUManager:_play_teleporter_transition()

    if self._played_video then
        return
    end

    local res = RenderSettings.resolution
	local src_width = 1280
	local src_height = 720
	local dest_width, dest_height = nil

	if res.x / res.y < src_width / src_height then
		dest_width = res.x
		dest_height = (src_height * dest_width) / src_width
	else
		dest_height = res.y
		dest_width = (src_width * dest_height) / src_height
    end
    
    local x = (res.x - dest_width) / 2
    local y = (res.y - dest_height) / 2
    
    self.video_panel = managers.wdu._full_workspace:panel():video({
		video = "movies/ascension",
		x = x,
		y = y,
		layer = -10
    })
    
    self._played_video = true

    self:wait(8, "zm_wait_video_reenable", function()
        managers.wdu._played_video = false
    end)
end

function WDUManager:_set_teleporter_state(state)
    self.level.teleporter.active = state
end

function WDUManager:_is_teleporter_available()
    return self.level.teleporter.active
end

function WDUManager:_is_special_wave()
    return self.level.wave.is_special_wave
end

function WDUManager:_set_special_wave(state)
    self.level.wave.is_special_wave = state
end

function WDUManager:_start_new_wave(t, was_special_wave)
    if not t then
        t = self.level.wave.delay_timeout
    end

    local special_wave = was_special_wave

    DelayedCalls:Add("zm_delay_between_waves", t, function()
        if special_wave then
            managers.wdu:_set_special_wave(false)
        end

        self.level.zombies.killed = 0
        self.level.zombies.currently_spawned = 0
        self:_multiply_zombies_by_wave(self:_get_current_wave())
    end)
end

function WDUManager:_is_apocalypse()
    if not self:_is_special_wave() then
        if self:_get_current_wave() > 11 then
            if math.random(0, 100) > 91 then
                return true
            end
        end
    end

    return false
end

function WDUManager:_get_weapons_in_mystery_box()
    return {
        "wpn_fps_spe_wunderwaffe",
		"wpn_fps_ass_m14",
		"wpn_fps_shot_b682",
		"wpn_fps_smg_mp9",
		"wpn_fps_snp_m95",
		"wpn_fps_ass_fal",
		"wpn_fps_pis_deagle",
		"wpn_fps_ass_aug",
		"wpn_fps_smg_p90",
		"wpn_fps_sho_striker",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_ass_scar",
		"wpn_fps_pis_judge",
		"wpn_fps_smg_thompson",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_pis_rage",
		"wpn_fps_snp_mosin",
		"wpn_fps_ass_flint",
		"wpn_fps_pis_breech",
		"wpn_fps_spe_rpg7",
        "wpn_fps_smg_tec9",
        "wpn_fps_sho_deamon",
        "wpn_fps_bow_elastic",
        "wpn_fps_pis_1911",
        "wpn_fps_ass_contraband_rifle",
        "wpn_fps_ass_tar21",
        "wpn_fps_lmg_par",
        "wpn_fps_pis_packrat",
		"wpn_fps_pis_g22c"
    }
end

function WDUManager:_convert_factory_to_upgrade()
    return {
		wpn_fps_spe_wunderwaffe_primary = "wpn_fps_spe_wunderwaffe_dg3_primary",
		wpn_fps_spe_wunderwaffe_secondary = "wpn_fps_spe_wunderwaffe_dg3_secondary",
		wpn_fps_ass_m14_primary = "wpn_fps_ass_m14_upg_primary",
		wpn_fps_ass_m14_secondary = "wpn_fps_ass_m14_upg_secondary",
		wpn_fps_snp_m95_primary = "wpn_fps_snp_m95_upg_primary",
		wpn_fps_snp_m95_secondary = "wpn_fps_snp_m95_upg_secondary",
		wpn_fps_smg_mp9_primary = "wpn_fps_smg_mp9_upg_primary",
		wpn_fps_smg_mp9_secondary = "wpn_fps_smg_mp9_upg_secondary",
		wpn_fps_shot_b682_primary = "wpn_fps_shot_b682_upg_primary",
		wpn_fps_shot_b682_secondary = "wpn_fps_shot_b682_upg_secondary",
		wpn_fps_pis_1911_primary = "wpn_fps_pis_1911_upg_primary",
		wpn_fps_pis_1911_secondary = "wpn_fps_pis_1911_upg_secondary",
		wpn_fps_ass_fal_primary = "wpn_fps_ass_fal_upg_primary",
		wpn_fps_ass_fal_secondary = "wpn_fps_ass_fal_upg_secondary",
		wpn_fps_pis_deagle_primary = "wpn_fps_pis_deagle_upg_primary",
		wpn_fps_pis_deagle_secondary = "wpn_fps_pis_deagle_upg_secondary",
		wpn_fps_ass_aug_primary = "wpn_fps_ass_aug_upg_primary",
		wpn_fps_ass_aug_secondary = "wpn_fps_ass_aug_upg_secondary",
		wpn_fps_smg_p90_primary = "wpn_fps_smg_p90_upg_primary",
		wpn_fps_smg_p90_secondary = "wpn_fps_smg_p90_upg_secondary",
		wpn_fps_sho_striker_primary = "wpn_fps_sho_striker_upg_primary",
		wpn_fps_sho_striker_secondary = "wpn_fps_sho_striker_upg_secondary",
		wpn_fps_ass_amcar_primary = "wpn_fps_ass_amcar_upg_primary",
		wpn_fps_ass_amcar_secondary = "wpn_fps_ass_amcar_upg_secondary",
		wpn_fps_ass_m16_primary = "wpn_fps_ass_m16_upg_primary",
		wpn_fps_ass_m16_secondary = "wpn_fps_ass_m16_upg_secondary",
		wpn_fps_ass_scar_primary = "wpn_fps_ass_scar_upg_primary",
		wpn_fps_ass_scar_secondary = "wpn_fps_ass_scar_upg_secondary",
		wpn_fps_pis_judge_primary = "wpn_fps_pis_judge_upg_primary",
		wpn_fps_pis_judge_secondary = "wpn_fps_pis_judge_upg_secondary",
		wpn_fps_smg_thompson_primary = "wpn_fps_smg_thompson_upg_primary",
		wpn_fps_smg_thompson_secondary = "wpn_fps_smg_thompson_upg_secondary",
		wpn_fps_lmg_hk21_primary = "wpn_fps_lmg_hk21_upg_primary",
		wpn_fps_lmg_hk21_secondary = "wpn_fps_lmg_hk21_upg_secondary",
		wpn_fps_lmg_m249_primary = "wpn_fps_lmg_m249_upg_primary",
		wpn_fps_lmg_m249_secondary = "wpn_fps_lmg_m249_upg_secondary",
		wpn_fps_pis_rage_primary = "wpn_fps_pis_rage_upg_primary",
		wpn_fps_pis_rage_secondary = "wpn_fps_pis_rage_upg_secondary",
		wpn_fps_pis_peacemaker_primary = "wpn_fps_pis_peacemaker_upg_primary",
		wpn_fps_pis_peacemaker_secondary = "wpn_fps_pis_peacemaker_upg_secondary",
		wpn_fps_ass_flint_primary = "wpn_fps_ass_flint_upg_primary",
		wpn_fps_ass_flint_secondary = "wpn_fps_ass_flint_upg_secondary",
		wpn_fps_pis_breech_primary = "wpn_fps_pis_breech_upg_primary",
		wpn_fps_pis_breech_secondary = "wpn_fps_pis_breech_upg_secondary",
		wpn_fps_ass_74_primary = "wpn_fps_ass_akrocket_upg_primary",
		wpn_fps_ass_74_secondary = "wpn_fps_ass_akrocket_upg_secondary",
		wpn_fps_ass_ching_primary = "wpn_fps_ass_ching_upg_primary",
		wpn_fps_ass_ching_secondary = "wpn_fps_ass_ching_upg_secondary",
		wpn_fps_pis_lemming_primary = "wpn_fps_pis_lemming_upg_primary",
		wpn_fps_pis_lemming_secondary = "wpn_fps_pis_lemming_upg_secondary",
		wpn_fps_shot_m37_primary = "wpn_fps_shot_m37_upg_primary",
		wpn_fps_shot_m37_secondary = "wpn_fps_shot_m37_upg_secondary",
		wpn_fps_shot_r870_primary = "wpn_fps_shot_r870_upg_primary",
		wpn_fps_shot_r870_secondary = "wpn_fps_shot_r870_upg_secondary",
		wpn_fps_smg_erma_primary = "wpn_fps_smg_erma_upg_primary",
		wpn_fps_smg_erma_secondary = "wpn_fps_smg_erma_upg_secondary",
		wpn_fps_smg_schakal_primary = "wpn_fps_smg_schakal_upg_primary",
		wpn_fps_smg_schakal_secondary = "wpn_fps_smg_schakal_upg_secondary",
		wpn_fps_smg_tec9_primary = "wpn_fps_smg_tec9_upg_primary",
        wpn_fps_smg_tec9_secondary = "wpn_fps_smg_tec9_upg_secondary",
        wpn_fps_spe_rpg7_primary = "wpn_fps_spe_rpg7_upg_primary",
        wpn_fps_spe_rpg7_secondary = "wpn_fps_spe_rpg7_upg_secondary",
        wpn_fps_special_roach_primary = "wpn_fps_special_roach_upg_primary",
        wpn_fps_special_roach_secondary = "wpn_fps_special_roach_upg_secondary",
        wpn_fps_snp_mosin_primary = "wpn_fps_snp_mosin_upg_primary",
        wpn_fps_snp_mosin_secondary = "wpn_fps_snp_mosin_upg_secondary",
        wpn_fps_ass_nothing2_primary = "wpn_fps_spe_vulcan_upg_primary",
        wpn_fps_sho_deamon_primary = "wpn_fps_sho_deamon_upg_primary",
        wpn_fps_sho_deamon_secondary = "wpn_fps_sho_deamon_upg_secondary",
        wpn_fps_bow_elastic_primary = "wpn_fps_bow_elastic_upg_primary",
        wpn_fps_bow_elastic_secondary = "wpn_fps_bow_elastic_upg_secondary",
		wpn_fps_pis_g22c_primary = "wpn_fps_pis_stryk_upg_primary",
        wpn_fps_pis_g22c_secondary = "wpn_fps_pis_stryk_upg_secondary",
        wpn_fps_ass_contraband_rifle_primary = "wpn_fps_ass_contraband_rifle_upg_primary",
        wpn_fps_ass_contraband_rifle_secondary = "wpn_fps_ass_contraband_rifle_upg_secondary",
        wpn_fps_ass_tar21_primary = "wpn_fps_ass_tar21_upg_primary",
        wpn_fps_ass_tar21_secondary = "wpn_fps_ass_tar21_upg_secondary",
        wpn_fps_lmg_par_primary = "wpn_fps_lmg_par_upg_primary",
        wpn_fps_lmg_par_secondary = "wpn_fps_lmg_par_upg_secondary",
        wpn_fps_pis_packrat_primary = "wpn_fps_pis_packrat_upg_primary",
        wpn_fps_pis_packrat_secondary = "wpn_fps_pis_packrat_upg_secondary"
	}
end

function WDUManager:preload_weapons()
end

function WDUManager:power_ups()
    return self._power_ups
end

function WDUManager:wait(t, uniqid, ect)
    DelayedCalls:Add(uniqid, t, ect)
end

function WDUManager:_respawn()
    for i = 1, 4, 1 do
        if managers.trade:is_peer_in_custody(i) then
            IngameWaitingForRespawnState.request_player_spawn(i)
        end
    end
end

function WDUManager:_was_last_cop_alive()
    local current_total_spawned = self.level.zombies.currently_spawned
    local supposed_last_zm = self.level.zombies.max_special_wave_total_spawns * self:_number_of_players()

    if current_total_spawned == supposed_last_zm then
        return true
    end
    
    return false
end

function WDUManager:_zm_auto_respawn()
    return
end
--[[
    if not Network:is_server() then
        return
    end

    local threshold = 4
    local time_before_respawn = 20
    local current_total_spawned = self.level.zombies.currently_spawned
    local total_killed = self.level.zombies.killed
    local max_spawns = managers.wdu:_is_special_wave() and self.level.zombies.max_spawns or managers.wdu.level.zombies.max_special_wave_total_spawns

    if (max_spawns - total_killed) <= threshold then
        log("auto respawn initialized")
        DelayedCalls:Add( "zm_auto_respawn_in", time_before_respawn, function()
            if current_total_spawned > 0 then
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
            end

            log("nuked")

            managers.wdu:_zm_auto_respawn()
        end)
    end
end--]]

function WDUManager:_remove_auto_respawn()
    return
end
--[[    log("auto respawn removed.")
    DelayedCalls:Remove( "zm_auto_respawn_in" )
end--]]

function WDUManager:points_round(points)
    local mult = 10^(-1)
    return math.floor(points * mult + 0.5) / mult
end

function WDUManager:_player_connected(id)
    if self.players[id] and self.players[id].steam_id == 0 then
        return false
    end

    return true
end

function WDUManager:set_disconnected_state(id)
    if id then
        self.players[id].steam_id = 0
    end
end

function WDUManager:create_good_end()
    managers.hud:init_ending_screen()
    self:wait(2, "zm_wait_init_score_good", function()
        managers.statistics:send_zm_stats()
    end)
end

function WDUManager:_create_last_enemies_outline()
    if not Network:is_server() then
        return
    end

    self:wait(0.5, "zm_wait_create_outline", function()
        for u_k, u_d in pairs(managers.enemy:all_enemies()) do
            u_d.unit:contour():add("highlight_character", true)
        end
    end)

    self.level.zombies.added_contour = true
end

function WDUManager:check_ee_state()
    local keys = {
        "finsternis_easteregg_completed",
        "broken_arrow2_easteregg_completed"
    }

    local secret_completed = 0

    for _, key in pairs(keys) do
        local secret_key = managers.mission:get_saved_job_value(key)

        if not secret_key then
            return false
        end

        if secret_key ~= 1 then
            return false
        end

        secret_completed = secret_completed + 1
    end

    if secret_completed < #keys then
        return false
    end

    return true
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_WDUManager_Sync", function(sender, id, data)
    if id == "UpdPts" then
        local tbl_data = LuaNetworking:StringToTable(data)
        managers.wdu.players[sender].money = tonumber(tbl_data.cm)
        local positive = tonumber(tbl_data.pg) > 0 and true or false

        if managers.hud then
            managers.wdu:_update_hud_element()
            managers.hud._hud_zm_points:_animate_points_gained_v2(sender, tonumber(tbl_data.pg), positive)
        end

        managers.wdu:_update_total_score(sender, tonumber(tbl_data.pg))
    end
--[[
    if id == "ZMUpdatePointsGained" then
        local points = tonumber(data)
        local positive = points > 0 and true or false

        if managers.hud then
            managers.hud._hud_zm_points:_animate_points_gained_v2(sender, points, positive)
        end
    end
--]]
    if id == "ZMWavesHighScore" then
        local max_waves = tonumber(data)
        managers.wdu.players[sender].max_waves_survived = max_waves
    end

    local function string_to_vector(str)
        local data = string.split( str, "[|]" )
        if #data < 3 then
            return nil
        end
        local split_str = "[:]"

        local x = tonumber(string.split(data[1], split_str)[2])
        local y = tonumber(string.split(data[2], split_str)[2])
        local z = tonumber(string.split(data[3], split_str)[2])

        return Vector3(x, y, z)
    end

    local function string_to_vector_wilko_sucks(str)
        local data = string.split( str, "[;]" )
        if #data < 3 then
            return nil
        end
        local split_str = "[:]"

        local x = tonumber(string.split(data[1], split_str)[2])
        local y = tonumber(string.split(data[2], split_str)[2])
        local z = tonumber(string.split(data[3], split_str)[2])

        return Vector3(x, y, z)
    end

    if id == "PWUP_EXECUTE" then
        local power_up = tonumber(data)

        if power_up == 1 then
            managers.wdu:power_ups():execute_max_ammo()
        elseif power_up == 2 then
            managers.wdu:power_ups():execute_double_points()
        elseif power_up == 3 then
            managers.wdu:power_ups():execute_instakill()
        elseif power_up == 4 then
            managers.wdu:power_ups():execute_firesale()
        elseif power_up == 5 then
            managers.wdu:power_ups():execute_kaboom()
        elseif power_up == 7 then
            local unit_by_peer = managers.criminals:character_unit_by_peer_id(sender)
            if alive(unit_by_peer) then
                unit_by_peer:movement():set_team(managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("non_combatant")))
            end

            managers.wdu:power_ups():execute_zombie_blood_on(unit_by_peer)
        end
    end

    if id == "ZombieBloodEnded" then
        local unit_by_peer = managers.criminals:character_unit_by_peer_id(sender)
        if alive(unit_by_peer) then
            unit_by_peer:movement():set_team(managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("player")))
        end
    end

    if id == "SpecialWave_PlayShadowSpook" then
        local pos = string_to_vector(data)

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

    if id == "SpecialWave_SpawnPosition" then
        --if managers.wdu:_is_special_wave() then
            local pos = string_to_vector(data)

            if pos then
                World:effect_manager():spawn({
                    effect = Idstring("effects/zm/zm_special_spawn"),
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
        --end
    end

    if id == "ZMStatsEndGame" then
        local player_id = sender
        local panel_endgame = managers.hud._zm_result_panel[player_id]
        local kills_text = panel_endgame:child("total_kills")
        local downs_text = panel_endgame:child("total_downs")
        local revives_text = panel_endgame:child("total_revives")
        local total_score = panel_endgame:child("total_score")

        local stats = LuaNetworking:StringToTable(data)

        kills_text:set_text(stats.kills)
        downs_text:set_text(stats.downs)
        revives_text:set_text(stats.revives)
        total_score:set_text(stats.total_score)
    end

    if id == "ShareCashTo" then
        local player_id = tonumber(data)
        managers.wdu:_add_money_to(player_id, 1000, true)
    end

    if id == "SecretsCompleted" then
        if Network:is_server() then
            local unit_by_peer = managers.criminals:character_unit_by_peer_id(sender)
            if alive(unit_by_peer) then
                local rpc_params = {
                    "give_equipment",
                    "perk_god",
                    1,
                    false
                }
    
                unit_by_peer:network():send_to_unit(rpc_params)
            end
        end
    end
end)

Hooks:Add("GameSetupUpdate", "VideoPanelUpdate", function(t, dt)
    if not alive(managers.wdu.video_panel) then
        return
    end

	if managers.wdu.video_panel and managers.wdu.video_panel:current_frame() >= managers.wdu.video_panel:frames() then
		managers.wdu.video_panel:parent():remove(managers.wdu.video_panel)
	end
end)
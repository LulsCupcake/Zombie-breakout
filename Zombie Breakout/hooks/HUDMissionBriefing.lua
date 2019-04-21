Hooks:PostHook(HUDMissionBriefing, "init", "zm_postinit_music", function(self, hud, workspace)
    DelayedCalls:Add("zm_remove_current_song", 0.1, function()
        managers.music:post_event("stop_all_music")
    end)

    managers.wdu:_element_play_sound({
        name = "pregame_music",
        file_name = "pregame.ogg",
        sound_type = "music",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })
end)

Hooks:PostHook(HUDMissionBriefing, "set_player_slot", "zm_postinit_set_player", function(self, nr, params)
    local current_name = params.name
    local peer_id = params.peer_id

    local data = {
        id = peer_id,
        name = current_name
    }

    managers.wdu:_init_new_player(data)
    managers.wdu:_init_wave_highscore()
end)

function HUDMissionBriefing:set_slot_outfit(peer_id, criminal_name, outfit)
	local slot = self._ready_slot_panel:child("slot_" .. tostring(peer_id))

	if not slot or not alive(slot) then
		return
	end

	if managers.network:session() and not managers.network:session():peer(peer_id) then
		return
	end

	local detection_panel = slot:child("detection")

	detection_panel:child("detection_left"):set_visible(false)
	detection_panel:child("detection_right"):set_visible(false)
	detection_panel:set_visible(false)
	slot:child("detection_value"):set_visible(true)
    slot:child("detection_value"):set_text("MAX: " .. tostring(managers.wdu.players[peer_id].max_waves_survived))
    slot:child("detection_value"):set_color(Color(1, 0, 1))
end

Hooks:PostHook(HUDStageEndScreen, "set_success", "zm_modify_header", function(self, success, server_left)
    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
	self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)

Hooks:PostHook(HUDStageEndScreen, "set_statistics", "zm_modify_header2", function(self, criminals_completed, success)
    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
    self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)

Hooks:PostHook(HUDStageEndScreen, "stage_money_counter_init", "zm_music_over", function(self, t, dt)
    --Global.music_manager.source:post_event("stop_all_music")
    --managers.wdu:_play_music("ded")

    local peer_id = managers.wdu:_peer_id()
    local total = managers.wdu.level.wave.current
    local s = ""

    if total > 1 then
        s = "s"
    end

    local wave_survived = self._package_forepanel:text({
        text = "You Survived " .. total .. " Round" .. s,
        font = tweak_data.menu.pd2_large_font,
        font_size = tweak_data.menu.pd2_large_font_size,
        color = Color.white,
        y = 10,
        x = 10
    })

    managers.hud:make_fine_text(wave_survived)

    local current_wave = managers.wdu.level.wave.current
    local my_id = managers.wdu:_peer_id()

    local function get_player_data(id, data_wanted)
        return managers.wdu.players[id][data_wanted]
    end

    if current_wave > get_player_data(my_id, "max_waves_survived") then
        managers.wdu:_save_new_highscore(current_wave)
    end

    DelayedCalls:Add( "Delayed_Call_For_Sync_ZMScore", 1, function()
        local player_1 = self._package_forepanel:text({
            name = "highscore_1",
            text = get_player_data(1, "player_name") .. "'s record is " .. get_player_data(1, "max_waves_survived") .. " rounds",
            font = tweak_data.menu.pd2_large_font,
            font_size = tweak_data.menu.pd2_large_font_size - 16,
            color = Color.white,
            visible = true
        })
        managers.hud:make_fine_text(player_1)

        player_1:set_top(wave_survived:bottom() + 10)
        player_1:set_left(wave_survived:left())

        local player_2 = self._package_forepanel:text({
            name = "highscore_2",
            text = get_player_data(2, "player_name") .. "'s record is " .. get_player_data(2, "max_waves_survived") .. " rounds",
            font = tweak_data.menu.pd2_large_font,
            font_size = tweak_data.menu.pd2_large_font_size - 16,
            color = Color.white,
            visible = get_player_data(2, "player_name") ~= "" and true or false
        })
        managers.hud:make_fine_text(player_2)

        player_2:set_top(player_1:bottom() + 5)
        player_2:set_left(wave_survived:left())

        local player_3 = self._package_forepanel:text({
            name = "highscore_3",
            text = get_player_data(3, "player_name") .. "'s record is " .. get_player_data(3, "max_waves_survived") .. " rounds",
            font = tweak_data.menu.pd2_large_font,
            font_size = tweak_data.menu.pd2_large_font_size - 16,
            color = Color.white,
            visible = get_player_data(3, "player_name") ~= "" and true or false
        })
        managers.hud:make_fine_text(player_3)

        player_3:set_top(player_2:bottom() + 5)
        player_3:set_left(wave_survived:left())

        local player_4 = self._package_forepanel:text({
            name = "highscore_4",
            text = get_player_data(4, "player_name") .. "'s record is " .. get_player_data(4, "max_waves_survived") .. " rounds",
            font = tweak_data.menu.pd2_large_font,
            font_size = tweak_data.menu.pd2_large_font_size - 16,
            color = Color.white,
            visible = get_player_data(4, "player_name") ~= "" and true or false
        })
        managers.hud:make_fine_text(player_4)

        player_4:set_top(player_3:bottom() + 5)
        player_4:set_left(wave_survived:left())
    end)

    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
	self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)

core:import("CoreMissionScriptElement")
ElementWave = ElementWave or class(CoreMissionScriptElement.MissionScriptElement)

function ElementWave:init(...)
	ElementWave.super.init(self, ...)
end
function ElementWave:client_on_executed(...)
	self:on_executed(...)
end

function ElementWave:on_executed(instigator)

	if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
    end

    if not self._values.ending_check then
        managers.wdu:_respawn()
        managers.wdu.level.zombies.added_contour = false
        managers.wdu:_remove_auto_respawn()

        if not managers.wdu._hud_hidden then
            if NepgearsyHUDReborn then
                managers.hud:hide_panels("assault_panel_v2", "custody_panel", "hostages_panel", "heist_timer_panel")
            else
                managers.hud:hide_panels("assault_panel", "custody_panel", "hostages_panel", "heist_timer_panel")
            end
    
            managers.wdu._hud_hidden = true
        end
    end

    local current_wave = managers.wdu:_get_current_wave()

    if self._values.special_wave then
        managers.wdu:_set_special_wave(true)
    end

    if self._values.ending_check then
        managers.wdu.level.zombies.killed = managers.wdu.level.zombies.killed + 1

        managers.wdu:_remove_auto_respawn()
        managers.wdu:_zm_auto_respawn()

        if managers.wdu:_is_special_wave() then
            if (managers.wdu.level.zombies.killed) == math.floor((managers.wdu.level.zombies.max_special_wave_total_spawns * managers.wdu:_number_of_players()) - 3) then
                managers.wdu:_create_last_enemies_outline()
            end 

            if managers.wdu.level.zombies.killed == math.floor((managers.wdu.level.zombies.max_special_wave_total_spawns * managers.wdu:_number_of_players())) then
                managers.wdu:_start_new_wave(13, true)
                ElementWave.super.on_executed(self, instigator)
                return
            end
        else
            if (managers.wdu.level.zombies.killed) == math.floor(managers.wdu.level.zombies.max_spawns - 3) then
                managers.wdu:_create_last_enemies_outline()
            end

            if managers.wdu.level.zombies.killed == math.floor(managers.wdu.level.zombies.max_spawns) then
                managers.wdu:_start_new_wave(13)
                ElementWave.super.on_executed(self, instigator)
                return
            end
        end

        return
    end

    if current_wave > 0 then
        managers.hud._hud_zm_waves:_new_animation_wave_start()
        managers.player:add_grenade_amount(2, true)
        managers.wdu:_increase_scale_value()

        if managers.wdu:_scale_required() then
            tweak_data.character:_multiply_by_wave_nb(current_wave)
            managers.wdu:_reset_scale()
        end
    else
        managers.hud._hud_zm_waves:_animate_text_blinking()
    end

    
	ElementWave.super.on_executed(self, instigator)
end

function ElementWave:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementWave:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementWave:load(data)
    self:set_enabled(data.enabled)
end

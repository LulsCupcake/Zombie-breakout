Hooks:PostHook(HUDAssaultCorner, "_start_assault", "zm_post_init_ac", function(self, text_list)
    self:_update_assault_hud_color(Color.red)
end)

function HUDAssaultCorner:_get_assault_strings()
	if self._assault_mode == "normal" then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")

			return {
				"hud_assault_zombie",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line",
				"hud_assault_zombie",
				"hud_assault_end_line",
				ids_risk,
				"hud_assault_end_line"
			}
		else
			return {
				"hud_assault_zombie",
				"hud_assault_end_line",
				"hud_assault_zombie",
				"hud_assault_end_line",
				"hud_assault_zombie",
				"hud_assault_end_line"
			}
        end
	end
end
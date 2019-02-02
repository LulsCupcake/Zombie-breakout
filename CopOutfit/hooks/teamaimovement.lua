Hooks:PostHook(TeamAIMovement, "check_visual_equipment", "HoxCopOutfitTeamAIMovement", function(self)
	if managers.job and managers.job:current_level_id() == "hox_2_zombie" then
		if not alive(self._unit) then
			return
		end

		local unit_damage = self._unit:damage()
		if unit_damage and unit_damage:has_sequence("spawn_cop_outfit") then
			unit_damage:run_sequence_simple("spawn_cop_outfit")
		end
	end
end)
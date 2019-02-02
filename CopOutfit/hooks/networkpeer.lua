Hooks:PostHook(NetworkPeer, "_update_equipped_armor", "HoxCopOutfitNetworkPeer", function(self)
	if managers.job and managers.job:current_level_id() == "hox_2_zombie" then
		if not alive(self._unit) then
			return
		end

		local unit_damage = self._unit:damage() or self._unit:camera() and self._unit:camera():camera_unit():damage()
		if unit_damage and unit_damage:has_sequence("spawn_cop_outfit") then
			unit_damage:run_sequence_simple("spawn_cop_outfit")
		end
	end
end)
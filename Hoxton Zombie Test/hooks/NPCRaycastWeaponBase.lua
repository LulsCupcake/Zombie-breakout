Hooks:PostHook(NewNPCRaycastWeaponBase, "_sound_autofire_start", "zm_post_auto_shot_npc", function(self)
    if string.find(self._factory_id, "_upg_") then
		self._sound_fire:post_event("zm_pew_global_npc")
	end
end)

Hooks:PostHook(NewNPCRaycastWeaponBase, "_sound_singleshot", "zm_post_single_shot_npc", function(self)
    if string.find(self._factory_id, "_upg_") then
		self._sound_fire:post_event("zm_pew_global_npc")
	end
end)
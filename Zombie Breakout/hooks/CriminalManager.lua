if SystemFS:exists("mods/CopOutfit/main.xml") then
function CriminalsManager:add_character(name, unit, peer_id, ai)
	print("[CriminalsManager:add_character]", name, unit, peer_id, ai)
	for id, data in pairs(self._characters) do
		if data.name == name then
			if data.taken then
				Application:error("[CriminalsManager:set_character] Error: Trying to take a unit slot that has already been taken!")
				Application:stack_dump()
				Application:error("[CriminalsManager:set_character] -----")
				self:_remove(id)
			end
			data.taken = true
			data.unit = unit
			data.peer_id = peer_id
			data.data.ai = ai or false
			data.data.mask_obj = tweak_data.blackmarket.masks["nomask"].unit --data.static_data.ai_mask_id
			data.data.mask_id = "nomask" --data.static_data.ai_mask_id
			data.data.mask_blueprint = nil
			if not ai and unit then
				local mask_id = managers.network:session():peer(peer_id):mask_id()
				--data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(mask_id, peer_id)
				--data.data.mask_id = managers.blackmarket:get_real_mask_id(mask_id, peer_id)
				data.data.mask_blueprint = managers.network:session():peer(peer_id):mask_blueprint()
			end
			managers.hud:remove_mugshot_by_character_name(name)
			if unit then
				data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
				if unit:base().is_local_player then
					self._local_character = name
					managers.hud:reset_player_hpbar()
				end
				unit:sound():set_voice(data.static_data.voice) --data.static_data.voice
				unit:inventory():set_mask_visibility(unit:inventory()._mask_visibility)
			else
				if not ai or not managers.localization:text("menu_" .. name) then
				end
				data.data.mugshot_id = managers.hud:add_mugshot_without_unit(name, ai, peer_id, (managers.network:session():peer(peer_id):name()))
			end
		else
		end
	end
end
end
function ArrowBase:_on_collision(col_ray)
	local damage_mult = self._weapon_damage_mult or 1
	local loose_shoot = self._weapon_charge_fail

	if not loose_shoot and alive(col_ray.unit) then
		local client_damage = self._damage_class_string == "InstantExplosiveBulletBase" or alive(col_ray.unit) and col_ray.unit:id() ~= -1

		--if Network:is_server() or client_damage then
            self._damage_class:on_collision(col_ray, self._weapon_unit or self._unit, self._thrower_unit, self._damage * damage_mult, false, false)
			
			local weapon_unit = self:weapon_unit()

				if weapon_unit then
					local is_upg_bow = string.find(weapon_unit:base()._name_id, "elastic_upg_")
					if is_upg_bow then
						if alive(col_ray.unit:body("mover_blocker")) then
							local action_data = {}

							if math.random(0, 1) == 0 then
								local fire_dot_data = {
									dot_damage = 100,
									dot_trigger_max_distance = 9000,
									dot_trigger_chance = 100,
									dot_length = 10,
									dot_tick_period = 0.25
								}
								action_data.variant = "fire"
								action_data.damage = self._damage * damage_mult
								action_data.attacker_unit = self._thrower_unit
								action_data.col_ray = col_ray
								action_data.fire_dot_data = fire_dot_data
								col_ray.unit:character_damage():damage_fire(action_data)
								self._unit:set_slot(0)
								return
							else
								action_data.damage_effect = 2
								action_data.name_id = "zeus"
								action_data.damage = 200
								action_data.attacker_unit = self._thrower_unit
								action_data.col_ray = col_ray
								action_data.variant = "taser_tased"
								col_ray.unit:character_damage():damage_melee(action_data)
								self._unit:set_slot(0)
								return
							end
						end
					end
				end
			--end
		--end
	end

	if not loose_shoot and tweak_data.projectiles[self._tweak_projectile_entry].remove_on_impact then
		self._unit:set_slot(0)

		return
	end

	self._unit:body("dynamic_body"):set_deactivate_tag(Idstring())

	self._col_ray = col_ray

	self:_attach_to_hit_unit(nil, loose_shoot)
end
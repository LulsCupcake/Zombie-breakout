function ElementSpawnEnemyDummy:produce(params)
	if not managers.groupai:state():is_AI_enabled() then
		return
	end

	if not managers.wdu:_is_special_wave() then
		if managers.wdu.level.zombies.currently_spawned >= math.floor(managers.wdu.level.zombies.max_spawns) then
			return
		end
	else
		local total_spe_spawns = managers.wdu.level.zombies.max_special_wave_total_spawns * managers.wdu:_number_of_players()
		if managers.wdu.level.zombies.currently_spawned >= math.floor(total_spe_spawns) then
			return
		end
	end
	
	local units_special_wave = {}

	if managers.wdu:_is_special_wave() then
		if (managers.wdu.level.zombies.killed) == math.floor((managers.wdu.level.zombies.max_special_wave_total_spawns * managers.wdu:_number_of_players()) - 3) then
			managers.wdu:_create_last_enemies_outline()
		end
		if managers.player.totalCopAlive >= managers.wdu:_get_max_special_wave_spawns() then
			return
		end
	else
		if (managers.wdu.level.zombies.killed) == math.floor(managers.wdu.level.zombies.max_spawns - 3) then
			managers.wdu:_create_last_enemies_outline()
		end
	end

	managers.wdu.level.zombies.currently_spawned = managers.wdu.level.zombies.currently_spawned + 1

	if params and params.name then
		local unit

		if managers.wdu:_is_apocalypse() or managers.wdu:_is_special_wave() then
			units_special_wave = {
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
				Idstring("units/pd2_dlc_uno/characters/ene_shadow_cloaker_1/ene_shadow_cloaker_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
				Idstring("units/pd2_dlc_uno/characters/ene_shadow_cloaker_1/ene_shadow_cloaker_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
			}

			unit = safe_spawn_unit(units_special_wave[ math.random( #units_special_wave ) ], self:get_orientation())
		else
			unit = safe_spawn_unit(params.name, self:get_orientation())
		end

		unit:base():add_destroy_listener(self._unit_destroy_clbk_key, callback(self, self, "clbk_unit_destroyed"))

		unit:unit_data().mission_element = self
		local spawn_ai = self:_create_spawn_AI_parametric(params.stance, params.objective, self._values)

		unit:brain():set_spawn_ai(spawn_ai)
		table.insert(self._units, unit)
		self:event("spawn", unit)

		local power_up_table = managers.wdu.level.power_up_table
		local random_power_up_chance = managers.wdu.level.power_up_chance
		local random_number = math.random(0, 100)

		if not managers.wdu:_is_special_wave() then
			if random_number < random_power_up_chance then
				local pickup_name = power_up_table[ math.random(#power_up_table) ]
				unit:character_damage():set_pickup(pickup_name)
			end
		else
			if managers.wdu:_was_last_cop_alive() then
				unit:character_damage():set_pickup("max_ammo")
			end
		end
	else
		local enemy_name

		if managers.wdu:_is_apocalypse() or managers.wdu:_is_special_wave() then
			enemy_name = units_special_wave[ math.random( #units_special_wave ) ]
		else
			enemy_name = self:value("enemy") or self._enemy_name
		end

		local unit = safe_spawn_unit(enemy_name, self:get_orientation())

		unit:base():add_destroy_listener(self._unit_destroy_clbk_key, callback(self, self, "clbk_unit_destroyed"))

		unit:unit_data().mission_element = self
		local objective = nil
		local action = self._create_action_data(CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action])
		local stance = managers.groupai:state():enemy_weapons_hot() and "cbt" or "ntl"

		if action.type == "act" then
			objective = {
				type = "act",
				action = action,
				stance = stance
			}
		end

		local spawn_ai = {
			init_state = "idle",
			objective = objective
		}

		unit:brain():set_spawn_ai(spawn_ai)

		local team_id = params and params.team or self._values.team or tweak_data.levels:get_default_team_ID(unit:base():char_tweak().access == "gangster" and "gangster" or "combatant")

		if self._values.participate_to_group_ai then
			managers.groupai:state():assign_enemy_to_group_ai(unit, team_id)
		else
			managers.groupai:state():set_char_team(unit, team_id)
		end

		if self._values.voice then
			unit:sound():set_voice_prefix(self._values.voice)
		end

		table.insert(self._units, unit)
		self:event("spawn", unit)

		local power_up_table = managers.wdu.level.power_up_table
		local random_power_up_chance = managers.wdu.level.power_up_chance
		local random_number = math.random(0, 100)

		if not managers.wdu:_is_special_wave() then
			if random_number < random_power_up_chance then
				local pickup_name = power_up_table[ math.random(#power_up_table) ]
				unit:character_damage():set_pickup(pickup_name)
			end
		else
			if managers.wdu:_was_last_cop_alive() then
				unit:character_damage():set_pickup("max_ammo")
			end
		end
	end

	return self._units[#self._units]
end
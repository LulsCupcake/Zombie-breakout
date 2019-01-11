Hooks:PostHook(CopDamage, "init", "zm_disable_ammo_drop", function(self, unit)
    self._pickup = nil
end)

local mvec_1 = Vector3()

function CopDamage:drop_pickup(extra)
	if self._pickup then
		local tracker = self._unit:movement():nav_tracker()
		local position = tracker:lost() and tracker:field_position() or tracker:position()
		local rotation = self._unit:rotation()

		mvector3.set(mvec_1, position)

		managers.game_play_central:spawn_pickup({
			name = self._pickup,
			position = mvec_1,
			rotation = rotation
		})

		managers.wdu:_element_play_sound({
			name = "power_up_spawn",
			file_name = "power_up_spawn.ogg",
			sound_type = "sfx",
			custom_dir = "sound",
			is_relative = false,
			is_loop = false,
			is_3d = true,
			position = position,
			use_velocity = false
		})
	end
end

function CopDamage:_dismember_condition(attack_data)
	return true
end

function CopDamage:_sync_dismember(attacker_unit)
	return true
end

function CopDamage:_check_special_death_conditions(variant, body, attacker_unit, weapon_unit)
	local special_deaths = self._unit:base():char_tweak().special_deaths

	if not special_deaths or not special_deaths[variant] then
		return
	end

	local body_data = special_deaths[variant][body:name():key()]

	if not body_data then
		return
	end

    if self._unit:damage():has_sequence(body_data.sequence) then
        self._unit:damage():run_sequence_simple(body_data.sequence)
    end

    if body_data.special_comment and attacker_unit == managers.player:player_unit() then
        return body_data.special_comment
    end
end

Hooks:PreHook(CopDamage, "damage_explosion", "zm_instakill_explosion", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
	end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_fire", "zm_instakill_fire", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
	end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_tase", "zm_instakill_tase", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
	end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_simple", "zm_instakill_simple", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
	end
	
	if (attack_data.knock_down and "knock_down") then
		return
	end


    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_melee", "zm_instakill_melee", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
	end

	if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end
	
	if attack_data.shield_knock and self._char_tweak.damage.shield_knocked and "shield_knock" or attack_data.variant == "counter_tased" and "counter_tased" or attack_data.variant == "taser_tased" and "taser_tased" or attack_data.variant == "counter_spooc" and "expl_hurt" or "fire_hurt" then
		return
	end

    if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.knock_down then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

function CopDamage:_spawn_head_gadget(params)
	if not self._head_gear then
		return
	end

	if self._head_gear_object then
		if self._head_gear_decal_mesh then
			local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

			self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
		end
    end
    
	self._head_gear = false
end

function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if (attack_data.knock_down and "knock_down") then
		return
	end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.knock_down or attack_data.stagger then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end

	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

	if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name and not attack_data.armor_piercing then
		local armor_pierce_roll = math.rand(1)
		local armor_pierce_value = 0

		if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.weapon_unit:base().thrower_unit then
			armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)

			if attack_data.weapon_unit:base():got_silencer() then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
			end

			if attack_data.weapon_unit:base():is_category("saw") then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
			end
		elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			local owner = attack_data.attacker_unit:base():get_owner()

			if alive(owner) then
				if owner == managers.player:player_unit() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
				else
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
				end
			end
		end

		if armor_pierce_value <= armor_pierce_roll then
			return
		end
	end

	local result = nil
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage

	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end

	damage = damage * (self._marked_dmg_mul or 1)

	if self._marked_dmg_mul and self._marked_dmg_dist_mul then
		local dst = mvector3.distance(attack_data.origin, self._unit:position())
		local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

		if spott_dst[1] < dst then
			damage = damage * spott_dst[2]
		end
	end

	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end

	local headshot = false
	local headshot_multiplier = 1

	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(attack_data)

		if critical_hit then
			managers.hud:on_crit_confirmed()

			damage = crit_damage
			attack_data.critical_hit = true
		else
			managers.hud:on_hit_confirmed()
		end

        headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
        
        if managers.player:has_special_equipment("perk_deadshot") then
            headshot_multiplier = headshot_multiplier * 1.33
        end

		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end

		if head then
			managers.player:on_headshot_dealt()

			headshot = true
		end
	end

	if not self._char_tweak.ignore_headshot and not self._damage_reduction_multiplier and head then
		damage = self._char_tweak.headshot_dmg_mul and damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier or self._health * 10
	end

	if attack_data.weapon_unit:base().get_add_head_shot_mul then
		local add_head_shot_mul = attack_data.weapon_unit:base():get_add_head_shot_mul()

		if not head and add_head_shot_mul and self._char_tweak and self._char_tweak.access ~= "tank" then
			local tweak_headshot_mul = math.max(0, self._char_tweak.headshot_dmg_mul - 1)
			local mul = tweak_headshot_mul * add_head_shot_mul + 1
			damage = damage * mul
		end
	end

	damage = self:_apply_damage_reduction(damage)
	attack_data.raw_damage = damage
	attack_data.headshot = head
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if self._health <= damage then
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
		else
			if head then
				managers.player:on_lethal_headshot_dealt(attack_data.attacker_unit, attack_data)

				if math.random(10) < damage then
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
                end
			end

			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "bullet", headshot)
		end
	else
		attack_data.damage = damage
		local result_type = not self._char_tweak.immune_to_knock_down and (attack_data.knock_down and "knock_down" or attack_data.stagger and not self._has_been_stagdown and "knock_down" or attack_data.stagger and not self._has_been_staggered and "stagger") or self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}

		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end

		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)

			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			self:_show_death_hint(self._unit:base()._tweak_table)

			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state

			managers.statistics:killed(data)
			self:_check_damage_achievements(attack_data, head)

			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
				managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
			end

			if is_civilian then
				managers.money:civilian_killed()
			end
		elseif attack_data.attacker_unit:in_slot(managers.slot:get_mask("criminals_no_deployables")) then
			self:_AI_comment_death(attack_data.attacker_unit, self._unit)
		elseif attack_data.attacker_unit:base().sentry_gun then
			if Network:is_server() then
				local server_info = attack_data.weapon_unit:base():server_information()

				if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
					local owner_peer = managers.network:session():peer(server_info.owner_peer_id)

					if owner_peer then
						owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant, data.stats_name)
					end
				else
					data.attacker_state = managers.player:current_state()

					managers.statistics:killed(data)
				end
			end

			local sentry_attack_data = deep_clone(attack_data)
			sentry_attack_data.attacker_unit = attack_data.attacker_unit:base():get_owner()

			if sentry_attack_data.attacker_unit == managers.player:player_unit() then
				self:_check_damage_achievements(sentry_attack_data, head)
			else
				self._unit:network():send("sync_damage_achievements", sentry_attack_data.weapon_unit, sentry_attack_data.attacker_unit, sentry_attack_data.damage, sentry_attack_data.col_ray and sentry_attack_data.col_ray.distance, head)
			end
		end
	end

	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local attacker = attack_data.attacker_unit

	if attacker:id() == -1 then
		attacker = self._unit
	end

	local weapon_unit = attack_data.weapon_unit

	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, result.type == "death", attacker, damage_percent)
	end

	local variant = nil

	if result.type == "knock_down" then
		variant = 1
	elseif result.type == "stagger" then
		variant = 2
		self._has_been_staggered = true
	else
		variant = result.type == "healed" and 3 or 0
	end

	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height, variant)
	self:_on_damage_received(attack_data)

	if not is_civilian then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	result.attack_data = attack_data

	return result
end

function CopDamage:chk_killshot(attacker_unit, variant, headshot, weapon_id)
    if headshot then
        local table_sound_headshots = {
            "zm_hs_1",
            "zm_hs_2",
            "zm_hs_3"
        }
        
        local hs_sound = SoundDevice:create_source("boom_headshot")
        hs_sound:set_position(self._unit:position())
        hs_sound:post_event(table_sound_headshots[math.random(#table_sound_headshots)])
    end

	if attacker_unit and attacker_unit == managers.player:player_unit() then
		managers.player:on_killshot(self._unit, variant, headshot, weapon_id)
	end
end

Hooks:PostHook(CopDamage, "die", "post_init_die_cop", function(self)
	if Network:is_server() then
		self._unit:contour():remove("highlight_character", true)
	end
end)
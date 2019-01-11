local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_div = mvector3.divide
local mvec3_norm = mvector3.normalize
local mvec3_len = mvector3.length
local mvec3_dot = mvector3.dot
local mvec3_set_z = mvector3.set_z
local mvec3_z = mvector3.z
local mvec3_set_len = mvector3.set_length
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_rot1 = Rotation()
local tmp_rot2 = Rotation()
local tmp_rot3 = Rotation()

function HuskPlayerMovement:sync_start_auto_fire_sound()
	if self._state == "mask_off" or self._state == "clean" or self._state == "civilian" then
		return
	end

	if self._auto_firing <= 0 then
		local delay = self._stance.values[3] < 0.7

		if delay then
			self._auto_firing = 1

			local function f(t)
				local equipped_weapon = self._unit:inventory():equipped_unit()
				local start_auto_fire = equipped_weapon:base().start_autofire

				local name = equipped_weapon:base():get_name_id()

				if equipped_weapon then
					if start_auto_fire then
						equipped_weapon:base():start_autofire()
					end
                end

				self._auto_firing = 2
			end

			self:_change_stance(3, f)
		else
			local equipped_weapon = self._unit:inventory():equipped_unit()
			local start_auto_fire = equipped_weapon:base().start_autofire

            if equipped_weapon then
			    if start_auto_fire then
					equipped_weapon:base():start_autofire()
				end
             end

			self:_change_stance(3, false)

			self._auto_firing = 2
		end

		self._aim_up_expire_t = TimerManager:game():time() + 2
	end
end

function HuskPlayerMovement:sync_stop_auto_fire_sound()
	if self._state == "mask_off" or self._state == "clean" or self._state == "civilian" then
		return
	end

	if self._auto_firing > 0 then
		local equipped_weapon = self._unit:inventory():equipped_unit()
		local stop_autofire = equipped_weapon:base().stop_autofire

		local name = equipped_weapon:base():get_name_id()

		if equipped_weapon then
			if stop_autofire then
				equipped_weapon:base():stop_autofire()
			end
		end
		
		self._auto_firing = 0
		local stance = self._stance

		if stance.transition then
			stance.transition.delayed_shot = nil
		end
	end
end

function HuskPlayerMovement:anim_clbk_show_magazine_in_hand(unit, name)
	if not self:allow_dropped_magazines() then
		return
	end

	self:destroy_magazine_in_hand()

	local w_td_crew = self:_equipped_weapon_crew_tweak_data()

	if not w_td_crew or not w_td_crew.pull_magazine_during_reload then
		return
	end

	local equipped_weapon = self._unit:inventory():equipped_unit()

	if alive(equipped_weapon) then
		if not equipped_weapon:base()._assembly_complete then
			return
		end

		for part_id, part_data in pairs(equipped_weapon:base()._parts) do
			local part = tweak_data.weapon.factory.parts[part_id]

			if part and part.type == "magazine" then
				part_data.unit:set_visible(false)

				self._magazine_data = {
					id = part_id,
					name = part_data.name,
					bullets = part.bullet_objects,
					weapon_data = w_td_crew,
					part_unit = part_data.unit,
					unit = self:_spawn_magazine_unit(part_id, part_data.name, part_data.unit:position(), part_data.unit:rotation())
				}

				if self._magazine_data and self._magazine_data.unit then
					self:_set_unit_bullet_objects_visible(self._magazine_data.unit, part.bullet_objects, false)
					self._unit:link(Idstring("LeftHandMiddle2"), self._magazine_data.unit)
				end

				break
			end
		end
	end
end

function HuskPlayerMovement:anim_clbk_spawn_dropped_magazine()
	if not self:allow_dropped_magazines() then
		return
	end

	if not self._magazine_data then
		return
	end

	local equipped_weapon = self._unit:inventory():equipped_unit()

	if alive(equipped_weapon) and not equipped_weapon:base()._assembly_complete then
		return
	end

	local ref_unit = nil
	local allow_throw = true

	if not self._magazine_data then
		local w_td_crew = self:_equipped_weapon_crew_tweak_data()

		if not w_td_crew or not w_td_crew.pull_magazine_during_reload then
			return
		end

		local attach_bone = Idstring("LeftHandMiddle2")
		local bone_hand = self._unit:get_object(attach_bone)

		self:anim_clbk_show_magazine_in_hand()

		if bone_hand then
			mvec3_set(tmp_vec1, self._magazine_data.unit:position())
			mvec3_sub(tmp_vec1, self._magazine_data.unit:oobb():center())
			mvec3_add(tmp_vec1, bone_hand:position())
			self._magazine_data.unit:set_position(tmp_vec1)
		end

		ref_unit = self._magazine_data.part_unit
		allow_throw = false
	end

	if self._magazine_data and alive(self._magazine_data.unit) then
		ref_unit = ref_unit or self._magazine_data.unit

		self._magazine_data.unit:set_visible(false)

		local pos = ref_unit:position()
		local rot = ref_unit:rotation()
		local dropped_mag = self:_spawn_magazine_unit(self._magazine_data.id, self._magazine_data.name, pos, rot)

		self:_set_unit_bullet_objects_visible(dropped_mag, self._magazine_data.bullets, false)

		local mag_size = self._magazine_data.weapon_data.pull_magazine_during_reload

		if type(mag_size) ~= "string" then
			mag_size = "medium"
		end

		mvec3_set(tmp_vec1, ref_unit:oobb():center())
		mvec3_sub(tmp_vec1, pos)
		mvec3_set(tmp_vec2, pos)
		mvec3_add(tmp_vec2, tmp_vec1)

		local dropped_col = World:spawn_unit(HuskPlayerMovement.magazine_collisions[mag_size][1], tmp_vec2, rot)

		dropped_col:link(HuskPlayerMovement.magazine_collisions[mag_size][2], dropped_mag)

		if allow_throw then
			if self._left_hand_direction then
				local throw_force = 10

				mvec3_set(tmp_vec1, self._left_hand_direction)
				mvec3_mul(tmp_vec1, self._left_hand_velocity or 3)
				mvec3_mul(tmp_vec1, math.random(25, 45))
				mvec3_mul(tmp_vec1, -1)
				dropped_col:push(throw_force, tmp_vec1)
			end
		else
			local throw_force = 10
			local _t = (self._reload_speed_multiplier or 1) - 1

			mvec3_set(tmp_vec1, equipped_weapon:rotation():z())
			mvec3_mul(tmp_vec1, math.lerp(math.random(65, 80), math.random(140, 160), _t))
			mvec3_mul(tmp_vec1, math.random() < 0.0005 and 10 or -1)
			dropped_col:push(throw_force, tmp_vec1)
		end

		managers.enemy:add_magazine(dropped_mag, dropped_col)
	end
end

function HuskPlayerMovement:anim_clbk_show_new_magazine_in_hand(unit, name)
	if not self:allow_dropped_magazines() then
		return
	end

	if not self._magazine_data then
		return
	end

	local equipped_weapon = self._unit:inventory():equipped_unit()

	if alive(equipped_weapon) and not equipped_weapon:base()._assembly_complete then
		return
	end

	if self._magazine_data and alive(self._magazine_data.unit) then
		self._magazine_data.unit:set_visible(true)

		local equipped_weapon = self._unit:inventory():equipped_unit()

		if alive(equipped_weapon) then
			for part_id, part_data in pairs(equipped_weapon:base()._parts) do
				local part = tweak_data.weapon.factory.parts[part_id]

				if part and part.type == "magazine" then
					self:_set_unit_bullet_objects_visible(self._magazine_data.unit, part.bullet_objects, true)
				end
			end
		end
	end
end

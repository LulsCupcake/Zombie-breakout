ManageSpawnedUnits._linked_units = {}

Hooks:PostHook( ManageSpawnedUnits, "spawn_and_link_unit", "NoSyncUnitLinking_UpdateOriginal", function( self )
	self:_update_linked_units()
end)

function ManageSpawnedUnits:spawn_unit_nosync(unit_id, align_obj_name, unit)
	local align_obj = self._unit:get_object(Idstring(align_obj_name))
	local spawn_unit = nil

	if type_name(unit) == "string" then
		local spawn_pos = align_obj:position()
		local spawn_rot = align_obj:rotation()
		spawn_unit = safe_spawn_unit(Idstring(unit), spawn_pos, spawn_rot)
		spawn_unit:unit_data().parent_unit = self._unit
	else
		spawn_unit = unit
	end

	if not spawn_unit then
		return
	end

	self._unit:link(Idstring(align_obj_name), spawn_unit, spawn_unit:orientation_object():name())

	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawn_unit
	}
	self._spawned_units[unit_id] = unit_entry
end

function ManageSpawnedUnits:spawn_and_link_unit_nosync(joint_table, unit_id, unit)
	if self._spawned_units[unit_id] then
		return
	end

	if not self[joint_table] then
		return
	end

	if not unit_id then
		return
	end

	if not unit then
		return
	end

	self:spawn_unit_nosync(unit_id, self[joint_table][1], unit)

	self._nosync_spawn_and_link = self._nosync_spawn_and_link or {}
	self._nosync_spawn_and_link[unit_id] = {
		unit = unit,
		joint_table = joint_table
	}

	self:_update_linked_units()

	self:_link_joints(unit_id, joint_table)
end

function ManageSpawnedUnits:spawn_and_link_unit_nosync_load(joint_table, unit_id, unit)
	if not managers.dyn_resource then return end
	managers.dyn_resource:load(Idstring("unit"), Idstring(unit), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)

	self:spawn_and_link_unit_nosync( joint_table, unit_id, unit )
end

function ManageSpawnedUnits:spawn_unit_nosync_return(unit_id, align_obj_name, unit)
	local align_obj = self._unit:get_object(Idstring(align_obj_name))
	local spawn_unit = nil

	if type_name(unit) == "string" then
		local spawn_pos = align_obj:position()
		local spawn_rot = align_obj:rotation()
		spawn_unit = safe_spawn_unit(Idstring(unit), spawn_pos, spawn_rot)
		spawn_unit:unit_data().parent_unit = self._unit
	else
		spawn_unit = unit
	end

	if not spawn_unit then
		return
	end

	self._unit:link(Idstring(align_obj_name), spawn_unit, spawn_unit:orientation_object():name())

	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawn_unit
	}
	self._spawned_units[unit_id] = unit_entry

	return spawn_unit
end

function ManageSpawnedUnits:spawn_and_link_unit_nosync_return(joint_table, unit_id, unit)
	if self._spawned_units[unit_id] then
		return
	end

	if not self[joint_table] then
		return
	end

	if not unit_id then
		return
	end

	if not unit then
		return
	end

	local spawn_unit = self:spawn_unit_nosync_return(unit_id, self[joint_table][1], unit)

	self._nosync_spawn_and_link = self._nosync_spawn_and_link or {}
	self._nosync_spawn_and_link[unit_id] = {
		unit = unit,
		joint_table = joint_table
	}

	self:_link_joints(unit_id, joint_table)

	self:_update_linked_units()

	return spawn_unit
end

function ManageSpawnedUnits:remove_unit_nosync(unit_id)
	local entry = self._spawned_units[unit_id]
	if entry then
		if entry.unit and entry.unit:alive() then
			World:delete_unit(entry.unit)
		end

		self._spawned_units[unit_id] = nil
	end

	self:_update_linked_units()
end

function ManageSpawnedUnits:_update_linked_units()
	local linked_units = deep_clone(self._nosync_spawn_and_link or {})

	for k,v in pairs(self._sync_spawn_and_link or {}) do linked_units[k] = v end

	self._linked_units = linked_units
end

function ManageSpawnedUnits:linked_units()
	return self._linked_units
end
function DynamicResourceManager:unload(resource_type, resource_name, package_name, keep_using)
	if keep_using then
		debug_pause("[DynamicResourceManager:unload] keep_using should be false!", resource_type, resource_name, package_name, keep_using)
	end

    local key = self._get_resource_key(resource_type, resource_name, package_name)

    if not key then
        return
    end

    local entry = self._dyn_resources[key]
    
    if not entry then
        return
    end

	entry.ref_c = entry.ref_c - 1

	if entry.ref_c ~= 0 then
		return
	end

	self._to_unload = self._to_unload or {}
	self._to_unload[key] = entry
	entry.keep_using = keep_using
	entry.callbacks = nil
	self._dyn_resources[key] = nil
end
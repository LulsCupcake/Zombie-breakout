Hooks:PostHook(PlayerInventory, "set_mask_visibility", "zm_player_inventory_spawn", function(self)
	self._mask_visibility = false
    return
end)
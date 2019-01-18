Hooks:PostHook(BlackMarketTweakData, "_init_masks", "zm_init_new_mask", function(self)

	self.masks.unmasked = {
		unit = "units/pmods/masks/msk_unmasked/unmasked_mask",
		name_id = "bm_msk_unmasked",
		pcs = {},
		value = 0,
		sort_number = 0
		custom = true
		global_value ="unmasked"
		texture_bundle_folder="mods"
		type = "helmet"
	}
	
	self.masks["unmasked"] = data
end)
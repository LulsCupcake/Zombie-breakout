Hooks:PostHook(AssetsTweakData, "_init_assets", "zm_init_assets", function(self, tweak_data)
    self.hox_2_zombie_perks = {
		name_id = "hox_2_zombie_perks_name",
		texture = "map_assets/perks",
		stages = {"hox_2_zombie"},
		no_mystery = true
	}
end)

Hooks:PostHook(AssetsTweakData, "_init_risk_assets", "zm_ignore_risk_asset", function(self, tweak_data)
    table.insert(self.risk_pd.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_swat.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_fbi.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_death_squad.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_easy_wish.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_death_wish.exclude_stages, "hox_2_zombie")
    table.insert(self.risk_sm_wish.exclude_stages, "hox_2_zombie")
end)

Hooks:PostHook(AssetsTweakData, "_init_gage_assets", "zm_ignore_gage_asset", function(self, tweak_data)
    table.insert(self.gage_assignment.exclude_stages, "hox_2_zombie")
end)
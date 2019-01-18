Hooks:PostHook(UpgradesTweakData, "init", "zm_add_upgrade_data", function(self)
    self.definitions["zdann"] = {
        category = "melee_weapon"
    }
end)

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "zm_explosive_bullet_tweak", function(self)
	--Cause screw you if you want to tweak it on a per weapon basis
	self.explosive_bullet.player_dmg_mul = 0.01
	self.explosive_bullet.range = 400
end)
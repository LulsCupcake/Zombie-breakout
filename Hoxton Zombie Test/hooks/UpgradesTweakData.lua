Hooks:PostHook(UpgradesTweakData, "init", "zm_add_upgrade_data", function(self)
    self.definitions["zdann"] = {
        category = "melee_weapon"
    }
end)
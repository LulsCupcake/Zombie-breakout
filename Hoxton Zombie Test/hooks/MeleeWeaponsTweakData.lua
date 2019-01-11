Hooks:PostHook(BlackMarketTweakData, "_init_melee_weapons", "zm_init_new_melee_wep", function(self)

    local data = table.merge(deep_clone(self.melee_weapons["shovel"]), table.merge({
        name_id = "wpn_melee_zdann",
        dlc = "infamy",
        texture_bundle_folder = "kurumi",
        custom = true,
        unit = "units/mods/weapons/wpn_fps_mel_zdann/wpn_fps_mel_zdann",
        third_unit = "units/mods/weapons/wpn_third_mel_zdann/wpn_third_mel_zdann",
        stats = {
            min_damage = 30,
            max_damage = 40,
            min_damage_effect = 0,
            max_damage_effect = 0,
            charge_time = 2.5,
            range = 275,
            weapon_type = "blunt"
        }
    }))

    self.melee_weapons["zdann"] = data
end)
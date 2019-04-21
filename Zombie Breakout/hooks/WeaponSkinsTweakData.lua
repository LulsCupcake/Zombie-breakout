Hooks:PostHook(BlackMarketTweakData, "_init_weapon_skins", "zm_init_new_weapon_camos", function(self)
    self.weapon_skins.pap = {
        name_id = "none",
		desc_id = "none",
		weapon_id = "none",
		rarity = "common",
		bonus = "spread_p1",
		reserve_quality = true,
		base_gradient = "units/skins/pap_1/base_gradient/base_pack-a-punch",
        cubemap_pattern_control = Vector3(1, 1, 1),
        types = {
			barrel = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            vertical_grip = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            lower_reciever = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            sight = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            foregrip = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            upper_receiver = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            grip = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            stock = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            barrel_ext = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            magazine = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            },
            slide = {
                pattern = "units/skins/pap_1/pattern/pat_pack-a-punch",
                pattern_gradient = "units/skins/pap_1/pattern_gradient/patgra_pack-a-punch"
            }
        }
    }
end)

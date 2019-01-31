Hooks:PostHook(WeaponFactoryTweakData, "init", "zm_init_weapon_data_factory", function(self)
    self:_init_no_weapon()
    self:_init_wunderwaffe()
    self:_init_wunderwaffe_dg3()
    self:_init_alcat_akrocket()
    self:_init_shovigun()

    self:_init_multiplix()
    self:_init_upgraded_multiplix()

    self:_define_sights()
end)

function WeaponFactoryTweakData:_init_no_weapon()
    self.parts.wpn_fps_pis_nothing_sight = deep_clone(self.parts.wpn_fps_m4_uupg_o_flipup)
    self.parts.wpn_fps_pis_nothing_sight.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_pis_nothing_body_standard = deep_clone(self.parts.wpn_fps_pis_p226_body_standard)
    self.parts.wpn_fps_pis_nothing_body_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_pis_nothing_body_standard.stats.damage = -10
    self.parts.wpn_fps_pis_nothing_body_standard.stats.concealment = 10
    self.parts.wpn_fps_pis_nothing_body_standard.stats.recoil = -24
    self.parts.wpn_fps_pis_nothing_body_standard.stats.spread = -8

    self.wpn_fps_ass_nothing2_primary = {
        unit = "units/mods/weapons/wpn_fps_ass_nothing2/wpn_fps_ass_nothing2",
		optional_types = {
			"gadget",
			"barrel_ext"
		},
		default_blueprint = {
			"wpn_fps_pis_nothing_sight",
			"wpn_fps_pis_nothing_body_standard"
		},
		uses_parts = {
            "wpn_fps_pis_nothing_sight",
			"wpn_fps_pis_nothing_body_standard"
		}
    }

    self.wpn_fps_ass_nothing2_primary.override = {
		wpn_fps_pis_nothing_sight = {
			stats = {
				zoom = 0
			},
			stance_mod = {
				wpn_fps_ass_nothing2 = {
					translation = Vector3( 9999999999, 99999999, 999999)
				}
			}
        }
    }
end

function WeaponFactoryTweakData:_init_wunderwaffe()
    self.parts.wpn_fps_spe_wunderwaffe_body = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_body.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_body"
    self.parts.wpn_fps_spe_wunderwaffe_body.type = "barrel"
    self.parts.wpn_fps_spe_wunderwaffe_body.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_body"
	
    self.parts.wpn_fps_spe_wunderwaffe_illum = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_illum.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_illum"
    self.parts.wpn_fps_spe_wunderwaffe_illum.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_illum.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_illum"
	
    self.parts.wpn_fps_spe_wunderwaffe_mag = deep_clone(self.parts.wpn_fps_ass_m14_m_standard)
    self.parts.wpn_fps_spe_wunderwaffe_mag.animations = nil
    self.parts.wpn_fps_spe_wunderwaffe_mag.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_mag"
    self.parts.wpn_fps_spe_wunderwaffe_mag.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_mag"
	
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_bulb_outer"
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_bulb_outer"
	
    self.parts.wpn_fps_spe_wunderwaffe_center_glow = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_glow"
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_glow"
	
    self.parts.wpn_fps_spe_wunderwaffe_center_tube = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_tube"
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_tube"
   
    self.parts.wpn_fps_spe_wunderwaffe_metal = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_metal.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_metal"
    self.parts.wpn_fps_spe_wunderwaffe_metal.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_metal.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_metal"
	
    self.parts.wpn_fps_spe_wunderwaffe_pipes = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_pipes.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_pipes"
    self.parts.wpn_fps_spe_wunderwaffe_pipes.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_pipes.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_pipes"
	
    self.parts.wpn_fps_spe_wunderwaffe_wood = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_wood.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_wood"
    self.parts.wpn_fps_spe_wunderwaffe_wood.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_wood.third_unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_wood"
 
    self.wpn_fps_spe_wunderwaffe_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_spe_wunderwaffe_primary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe"
    self.wpn_fps_spe_wunderwaffe_primary.default_blueprint = {
        "wpn_fps_spe_wunderwaffe_body",
        "wpn_fps_spe_wunderwaffe_illum",
        "wpn_fps_spe_wunderwaffe_mag",
        "wpn_fps_spe_wunderwaffe_bulb_outer",
        "wpn_fps_spe_wunderwaffe_center_glow",
        "wpn_fps_spe_wunderwaffe_center_tube",
        "wpn_fps_spe_wunderwaffe_metal",
        "wpn_fps_spe_wunderwaffe_pipes",
        "wpn_fps_spe_wunderwaffe_wood"
    }
    self.wpn_fps_spe_wunderwaffe_primary.uses_parts = self.wpn_fps_spe_wunderwaffe_primary.default_blueprint
 
    self.wpn_fps_spe_wunderwaffe_secondary = deep_clone(self.wpn_fps_spe_wunderwaffe_primary)
    self.wpn_fps_spe_wunderwaffe_secondary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_secondary"

    self.wpn_fps_spe_wunderwaffe_primary_npc = deep_clone(self.wpn_fps_spe_wunderwaffe_primary)
    self.wpn_fps_spe_wunderwaffe_primary_npc.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_npc"
    self.wpn_fps_spe_wunderwaffe_secondary_npc = deep_clone(self.wpn_fps_spe_wunderwaffe_secondary)
	self.wpn_fps_spe_wunderwaffe_secondary_npc.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_secondary_npc"
end
 
function WeaponFactoryTweakData:_init_wunderwaffe_dg3()
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_body"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.type = "barrel"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_illum"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag = deep_clone(self.parts.wpn_fps_ass_m14_m_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.animations = nil
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_mag"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_bulb_outer"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
   
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_metal"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_pipes"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_wood"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
 
    self.wpn_fps_spe_wunderwaffe_dg3_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_spe_wunderwaffe_dg3_primary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3"
    self.wpn_fps_spe_wunderwaffe_dg3_primary.default_blueprint = {
        "wpn_fps_spe_wunderwaffe_dg3_body",
        "wpn_fps_spe_wunderwaffe_dg3_illum",
        "wpn_fps_spe_wunderwaffe_dg3_mag",
        "wpn_fps_spe_wunderwaffe_dg3_bulb_outer",
        "wpn_fps_spe_wunderwaffe_center_glow",
        "wpn_fps_spe_wunderwaffe_center_tube",
        "wpn_fps_spe_wunderwaffe_dg3_metal",
        "wpn_fps_spe_wunderwaffe_dg3_pipes",
        "wpn_fps_spe_wunderwaffe_dg3_wood"
    }
    self.wpn_fps_spe_wunderwaffe_dg3_primary.uses_parts = self.wpn_fps_spe_wunderwaffe_dg3_primary.default_blueprint

    self.wpn_fps_spe_wunderwaffe_dg3_secondary = deep_clone(self.wpn_fps_spe_wunderwaffe_dg3_primary)
    self.wpn_fps_spe_wunderwaffe_dg3_secondary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3_secondary"

    self.wpn_fps_spe_wunderwaffe_dg3_primary_npc = deep_clone(self.wpn_fps_spe_wunderwaffe_dg3_primary)
    self.wpn_fps_spe_wunderwaffe_dg3_primary_npc.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3_npc"
    self.wpn_fps_spe_wunderwaffe_dg3_secondary_npc = deep_clone(self.wpn_fps_spe_wunderwaffe_dg3_secondary)
	self.wpn_fps_spe_wunderwaffe_dg3_secondary_npc.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3_secondary_npc"
end

function WeaponFactoryTweakData:_init_alcat_akrocket()

    self.parts.wpn_fps_ass_akrocket_barrel = deep_clone(self.parts.wpn_fps_ass_ak5_b_std)
    self.parts.wpn_fps_ass_akrocket_barrel.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_barrel"
    self.parts.wpn_fps_ass_akrocket_barrel.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_barrel"
    self.parts.wpn_fps_ass_akrocket_barrel.adds = {
        "wpn_fps_ass_akrocket_barrel_moving",
        "wpn_fps_ass_akrocket_frontsight",
        "wpn_fps_ass_akrocket_frontsight-tritium"
    }

    self.parts.wpn_fps_ass_akrocket_barrel_moving = deep_clone(self.parts.wpn_fps_ak_bolt)
    self.parts.wpn_fps_ass_akrocket_barrel_moving.type = "barrel_actual"
    self.parts.wpn_fps_ass_akrocket_barrel_moving.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_barrel_moving"
    self.parts.wpn_fps_ass_akrocket_barrel_moving.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_barrel_moving"

    self.parts.wpn_fps_ass_akrocket_frontsight = deep_clone(self.parts.wpn_fps_ak_bolt)
    self.parts.wpn_fps_ass_akrocket_frontsight.type = "barrel_sight"
    self.parts.wpn_fps_ass_akrocket_frontsight.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_frontsight"
    self.parts.wpn_fps_ass_akrocket_frontsight.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_frontsight"

    self.parts["wpn_fps_ass_akrocket_frontsight-tritium"] = deep_clone(self.parts.wpn_fps_ak_bolt)
    self.parts["wpn_fps_ass_akrocket_frontsight-tritium"].type = "barrel_sight_tritium"
    self.parts["wpn_fps_ass_akrocket_frontsight-tritium"].unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_frontsight-tritium"
    self.parts["wpn_fps_ass_akrocket_frontsight-tritium"].third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_frontsight-tritium"

    self.parts.wpn_fps_ass_akrocket_body = deep_clone(self.parts.wpn_fps_smg_akmsu_body_lowerreceiver)
    self.parts.wpn_fps_ass_akrocket_body.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_body"
    self.parts.wpn_fps_ass_akrocket_body.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_body"
    self.parts.wpn_fps_ass_akrocket_body.adds = {
        "wpn_fps_ass_akrocket_bolt"
    }

    self.parts.wpn_fps_ass_akrocket_body2 = deep_clone(self.parts.wpn_fps_ass_akm_body_upperreceiver)
    self.parts.wpn_fps_ass_akrocket_body2.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_body2"
    self.parts.wpn_fps_ass_akrocket_body2.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_body2"
    self.parts.wpn_fps_ass_akrocket_bolt = deep_clone(self.parts.wpn_fps_ak_bolt)
    self.parts.wpn_fps_ass_akrocket_bolt.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_bolt"
    self.parts.wpn_fps_ass_akrocket_bolt.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_bolt"
    self.parts.wpn_fps_ass_akrocket_bolt.a_obj = "a_bolt"
    self.parts.wpn_fps_ass_akrocket_mag = deep_clone(self.parts.wpn_upg_ak_m_akm)
    self.parts.wpn_fps_ass_akrocket_mag.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_mag"
    self.parts.wpn_fps_ass_akrocket_mag.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_mag"
    self.parts.wpn_fps_ass_akrocket_fg = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard)
    self.parts.wpn_fps_ass_akrocket_fg.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_fg"
    self.parts.wpn_fps_ass_akrocket_fg.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_fg"
    self.parts.wpn_fps_ass_akrocket_grip = deep_clone(self.parts.wpn_upg_ak_g_standard)
    self.parts.wpn_fps_ass_akrocket_grip.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_grip"
    self.parts.wpn_fps_ass_akrocket_grip.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_grip"
    self.parts.wpn_fps_ass_akrocket_stock = deep_clone(self.parts.wpn_upg_ak_s_folding)
    self.parts.wpn_fps_ass_akrocket_stock.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_stock"
    self.parts.wpn_fps_ass_akrocket_stock.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_stock"
    self.parts.wpn_fps_ass_akrocket_backsight = deep_clone(self.parts.wpn_fps_m4_uupg_o_flipup)
    self.parts.wpn_fps_ass_akrocket_backsight.a_obj = "a_o_back"
    self.parts.wpn_fps_ass_akrocket_backsight.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_backsight"
    self.parts.wpn_fps_ass_akrocket_backsight.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_backsight"
    self.parts.wpn_fps_ass_akrocket_backsight.adds = {
        "wpn_fps_ass_akrocket_backsight-tritium"
    }
    self.parts["wpn_fps_ass_akrocket_backsight-tritium"] = deep_clone(self.parts.wpn_fps_m4_uupg_o_flipup)
    self.parts["wpn_fps_ass_akrocket_backsight-tritium"].unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_backsight-tritium"
    self.parts["wpn_fps_ass_akrocket_backsight-tritium"].third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_backsight-tritium"
    self.parts["wpn_fps_ass_akrocket_backsight-tritium"].a_obj = "a_o_back"

    self.parts.wpn_fps_ass_akrocket_o_rail = deep_clone(self.parts.wpn_fps_shot_r870_ris_special)
    self.parts.wpn_fps_ass_akrocket_o_rail.a_obj = "a_g"
    self.parts.wpn_fps_ass_akrocket_o_rail.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_o_rail-irons"
    self.parts.wpn_fps_ass_akrocket_o_rail.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_o_rail-irons"

    self.parts.wpn_fps_ass_akrocket_o_rail_irons = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount)
    self.parts.wpn_fps_ass_akrocket_o_rail_irons.unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_o_rail-irons"
    self.parts.wpn_fps_ass_akrocket_o_rail_irons.third_unit = "units/mods/weapons/wpn_fps_ass_akrocket_pts/wpn_fps_ass_akrocket_o_rail-irons"
    
    --[[Ironsight Stance/Angle view]]
	self.parts.wpn_fps_ass_akrocket_backsight.stance_mod = {
		wpn_fps_ass_akrocket = {
			translation = Vector3(0, -4, -1.6),
			rotation = Rotation(0, 0, 0)
		}
	}
	self.parts.wpn_fps_ass_akrocket_o_rail.stance_mod = {
		wpn_fps_ass_akrocket = {
			translation = Vector3(0, -11, 1),
			rotation = Rotation(0, 0, 0)
		}
	}
	
	self.parts.wpn_fps_ass_akrocket_stock.adds = nil
	self.parts.wpn_fps_ass_akrocket_stock.stats = nil
	self.parts.wpn_fps_ass_akrocket_stock.pcs = nil
	
	
	--[[Add Optic Sight Railing]]
	self.parts.wpn_fps_ass_akrocket_fg.override = nil
    
    self.wpn_fps_ass_akrocket_upg_primary = deep_clone(self.wpn_fps_smg_akmsu)
    self.wpn_fps_ass_akrocket_upg_primary.unit = "units/mods/weapons/wpn_fps_ass_akrocket/wpn_fps_ass_akrocket_primary"
    self.wpn_fps_ass_akrocket_upg_primary.animations = {
        fire = "recoil",
        reload = "reload",
        reload_not_empty = "reload_not_empty",
        fire_steelsight = "recoil"
    }
    self.wpn_fps_ass_akrocket_upg_primary.default_blueprint = {
        "wpn_fps_ass_akrocket_barrel",
        "wpn_fps_ass_akrocket_body",
        "wpn_fps_ass_akrocket_body2",
        "wpn_fps_ass_akrocket_mag",
        "wpn_fps_ass_akrocket_fg",
        "wpn_fps_ass_akrocket_grip",
        "wpn_fps_ass_akrocket_stock",
        "wpn_fps_ass_akrocket_backsight",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_akrocket_upg_primary.uses_parts = self.wpn_fps_ass_akrocket_upg_primary.default_blueprint

    self.wpn_fps_ass_akrocket_upg_primary.adds = {
		wpn_fps_ass_akrocket_backsight = {
			"wpn_fps_ass_akrocket_o_rail_irons"
		}
	}

    self.wpn_fps_ass_akrocket_upg_secondary = deep_clone(self.wpn_fps_ass_akrocket_upg_primary)
    self.wpn_fps_ass_akrocket_upg_secondary.unit = "units/mods/weapons/wpn_fps_ass_akrocket/wpn_fps_ass_akrocket_secondary"

    self.wpn_fps_ass_akrocket_upg_primary_npc = deep_clone(self.wpn_fps_smg_akmsu)
    self.wpn_fps_ass_akrocket_upg_primary_npc.unit = "units/mods/weapons/wpn_fps_ass_akrocket/wpn_fps_ass_akrocket_npc"
    self.wpn_fps_ass_akrocket_upg_secondary_npc = deep_clone(self.wpn_fps_smg_akmsu)
    self.wpn_fps_ass_akrocket_upg_secondary_npc.unit = "units/mods/weapons/wpn_fps_ass_akrocket/wpn_fps_ass_akrocket_npc"
end

function WeaponFactoryTweakData:_init_shovigun()
    self.parts.wpn_fps_spe_raygun_body = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_body.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_body"
    self.parts.wpn_fps_spe_raygun_metal = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_metal.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_metal_static"
    self.parts.wpn_fps_spe_raygun_reticle = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_reticle.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_reticle"
    self.parts.wpn_fps_spe_raygun_glass = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_glass.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_glass"
    self.parts.wpn_fps_spe_raygun_power = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_power.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_power"
    self.parts.wpn_fps_spe_raygun_meter = deep_clone(self.parts.wpn_fps_pis_breech_body)
    self.parts.wpn_fps_spe_raygun_meter.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_meter"
    self.parts.wpn_fps_spe_raygun_b_dummy = deep_clone(self.parts.wpn_fps_pis_breech_b_standard)
    self.parts.wpn_fps_spe_raygun_b_dummy.unit = "units/mods/weapons/wpn_fps_spe_raygun_pts/wpn_fps_spe_raygun_b_dummy"

    self.wpn_fps_spe_raygun_primary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_spe_raygun_primary.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_primary"
    self.wpn_fps_spe_raygun_primary.default_blueprint = {
        "wpn_fps_spe_raygun_body",
        "wpn_fps_spe_raygun_b_dummy",
        "wpn_fps_spe_raygun_metal",
        "wpn_fps_spe_raygun_glass",
        "wpn_fps_spe_raygun_power",
        "wpn_fps_spe_raygun_meter",
        "wpn_fps_spe_raygun_reticle"
    }
    self.wpn_fps_spe_raygun_primary_npc = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_primary_npc.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_npc"
    self.wpn_fps_spe_raygun_secondary = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_secondary.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_secondary"
    self.wpn_fps_spe_raygun_secondary_npc = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_secondary_npc.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_npc"
end

function WeaponFactoryTweakData:_init_multiplix()    
    self.wpn_fps_pis_1911_primary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_primary.unit = "new_weapon_units/wpn_fps_pis_1911_primary"
    self.wpn_fps_pis_1911_primary_npc = deep_clone(self.wpn_fps_pis_1911_primary)
	self.wpn_fps_pis_1911_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_npc"
    self.wpn_fps_pis_1911_secondary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_secondary.unit = "new_weapon_units/wpn_fps_pis_1911_secondary"
    self.wpn_fps_pis_1911_secondary_npc = deep_clone(self.wpn_fps_pis_1911_secondary)
	self.wpn_fps_pis_1911_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_npc"
	
	self.wpn_fps_pis_g22c_primary = deep_clone(self.wpn_fps_pis_g22c)
    self.wpn_fps_pis_g22c_primary.unit = "new_weapon_units/wpn_fps_pis_g22c_primary"
    self.wpn_fps_pis_g22c_primary_npc = deep_clone(self.wpn_fps_pis_g22c_primary)
	self.wpn_fps_pis_g22c_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_g22c/wpn_fps_pis_g22c_npc"
    self.wpn_fps_pis_g22c_secondary = deep_clone(self.wpn_fps_pis_g22c)
    self.wpn_fps_pis_g22c_secondary.unit = "new_weapon_units/wpn_fps_pis_g22c_secondary"
    self.wpn_fps_pis_g22c_secondary_npc = deep_clone(self.wpn_fps_pis_g22c_secondary)
	self.wpn_fps_pis_g22c_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_g22c/wpn_fps_pis_g22c_npc"
	
    self.wpn_fps_ass_m14_primary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_primary.unit = "new_weapon_units/wpn_fps_ass_m14_primary"
    self.wpn_fps_ass_m14_primary_npc = deep_clone(self.wpn_fps_ass_m14_primary)
	self.wpn_fps_ass_m14_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"
    self.wpn_fps_ass_m14_secondary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_secondary.unit = "new_weapon_units/wpn_fps_ass_m14_secondary"
    self.wpn_fps_ass_m14_secondary_npc = deep_clone(self.wpn_fps_ass_m14_secondary)
	self.wpn_fps_ass_m14_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"

    self.wpn_fps_shot_b682_primary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_primary.unit = "new_weapon_units/wpn_fps_shot_b682_primary"
    self.wpn_fps_shot_b682_secondary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_secondary.unit = "new_weapon_units/wpn_fps_shot_b682_secondary"
    self.wpn_fps_shot_b682_primary_npc = deep_clone(self.wpn_fps_shot_b682_primary)
    self.wpn_fps_shot_b682_primary_npc.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682/wpn_fps_shot_b682_npc"
    self.wpn_fps_shot_b682_secondary_npc = deep_clone(self.wpn_fps_shot_b682_secondary)
	self.wpn_fps_shot_b682_secondary_npc.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682/wpn_fps_shot_b682_npc"

    self.wpn_fps_smg_mp9_primary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_primary.unit = "new_weapon_units/wpn_fps_smg_mp9_primary"
    self.wpn_fps_smg_mp9_secondary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_secondary.unit = "new_weapon_units/wpn_fps_smg_mp9_secondary"
    self.wpn_fps_smg_mp9_primary_npc = deep_clone(self.wpn_fps_smg_mp9_primary)
    self.wpn_fps_smg_mp9_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9_npc"
    self.wpn_fps_smg_mp9_secondary_npc = deep_clone(self.wpn_fps_smg_mp9_secondary)
	self.wpn_fps_smg_mp9_secondary_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9_npc"

    self.wpn_fps_snp_m95_primary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_primary.unit = "new_weapon_units/wpn_fps_snp_m95_primary"
    self.wpn_fps_snp_m95_secondary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_secondary.unit = "new_weapon_units/wpn_fps_snp_m95_secondary"
    self.wpn_fps_snp_m95_primary_npc = deep_clone(self.wpn_fps_snp_m95_primary)
    self.wpn_fps_snp_m95_primary_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95_npc"
    self.wpn_fps_snp_m95_secondary_npc = deep_clone(self.wpn_fps_snp_m95_secondary)
	self.wpn_fps_snp_m95_secondary_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95_npc"
	
	--kurumi send help
    self.wpn_fps_ass_fal_primary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_primary.unit = "new_weapon_units/wpn_fps_ass_fal_primary"
    self.wpn_fps_ass_fal_secondary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_secondary.unit = "new_weapon_units/wpn_fps_ass_fal_secondary"
    self.wpn_fps_ass_fal_primary_npc = deep_clone(self.wpn_fps_ass_fal_primary)
    self.wpn_fps_ass_fal_primary_npc.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal_npc"
    self.wpn_fps_ass_fal_secondary_npc = deep_clone(self.wpn_fps_ass_fal_secondary)
	self.wpn_fps_ass_fal_secondary_npc.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal_npc"
	
    self.wpn_fps_pis_deagle_primary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_primary.unit = "new_weapon_units/wpn_fps_pis_deagle_primary"
    self.wpn_fps_pis_deagle_secondary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_secondary.unit = "new_weapon_units/wpn_fps_pis_deagle_secondary"
    self.wpn_fps_pis_deagle_primary_npc = deep_clone(self.wpn_fps_pis_deagle_primary)
    self.wpn_fps_pis_deagle_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_npc"
    self.wpn_fps_pis_deagle_secondary_npc = deep_clone(self.wpn_fps_pis_deagle_secondary)
	self.wpn_fps_pis_deagle_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_npc"
	
    self.wpn_fps_ass_aug_primary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_primary.unit = "new_weapon_units/wpn_fps_ass_aug_primary"
    self.wpn_fps_ass_aug_secondary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_secondary.unit = "new_weapon_units/wpn_fps_ass_aug_secondary"
    self.wpn_fps_ass_aug_primary_npc = deep_clone(self.wpn_fps_ass_aug_primary)
    self.wpn_fps_ass_aug_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_npc"
    self.wpn_fps_ass_aug_secondary_npc = deep_clone(self.wpn_fps_ass_aug_secondary)
	self.wpn_fps_ass_aug_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_npc"
	
    self.wpn_fps_smg_p90_primary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_primary.unit = "new_weapon_units/wpn_fps_smg_p90_primary"
    self.wpn_fps_smg_p90_secondary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_secondary.unit = "new_weapon_units/wpn_fps_smg_p90_secondary"
    self.wpn_fps_smg_p90_primary_npc = deep_clone(self.wpn_fps_smg_p90_primary)
    self.wpn_fps_smg_p90_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90_npc"
    self.wpn_fps_smg_p90_secondary_npc = deep_clone(self.wpn_fps_smg_p90_secondary)
	self.wpn_fps_smg_p90_secondary_npc.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90_npc"
	
    self.wpn_fps_sho_striker_primary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_primary.unit = "new_weapon_units/wpn_fps_sho_striker_primary"
    self.wpn_fps_sho_striker_secondary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_secondary.unit = "new_weapon_units/wpn_fps_sho_striker_secondary"
    self.wpn_fps_sho_striker_primary_npc = deep_clone(self.wpn_fps_sho_striker_primary)
    self.wpn_fps_sho_striker_primary_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker_npc"
    self.wpn_fps_sho_striker_secondary_npc = deep_clone(self.wpn_fps_sho_striker_secondary)
	self.wpn_fps_sho_striker_secondary_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker_npc"
	
    self.wpn_fps_ass_amcar_primary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_primary.unit = "new_weapon_units/wpn_fps_ass_amcar_primary"
    self.wpn_fps_ass_amcar_secondary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_secondary.unit = "new_weapon_units/wpn_fps_ass_amcar_secondary"
    self.wpn_fps_ass_amcar_primary_npc = deep_clone(self.wpn_fps_ass_amcar_primary)
    self.wpn_fps_ass_amcar_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"
    self.wpn_fps_ass_amcar_secondary_npc = deep_clone(self.wpn_fps_ass_amcar_secondary)
	self.wpn_fps_ass_amcar_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"
	
    self.wpn_fps_ass_m16_primary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_primary.unit = "new_weapon_units/wpn_fps_ass_m16_primary"
    self.wpn_fps_ass_m16_secondary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_secondary.unit = "new_weapon_units/wpn_fps_ass_m16_secondary"
    self.wpn_fps_ass_m16_primary_npc = deep_clone(self.wpn_fps_ass_m16_primary)
    self.wpn_fps_ass_m16_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"
    self.wpn_fps_ass_m16_secondary_npc = deep_clone(self.wpn_fps_ass_m16_secondary)
	self.wpn_fps_ass_m16_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"
	
    self.wpn_fps_ass_scar_primary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_primary.unit = "new_weapon_units/wpn_fps_ass_scar_primary"
    self.wpn_fps_ass_scar_secondary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_secondary.unit = "new_weapon_units/wpn_fps_ass_scar_secondary"
    self.wpn_fps_ass_scar_primary_npc = deep_clone(self.wpn_fps_ass_scar_primary)
    self.wpn_fps_ass_scar_primary_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar_npc"
    self.wpn_fps_ass_scar_secondary_npc = deep_clone(self.wpn_fps_ass_scar_secondary)
	self.wpn_fps_ass_scar_secondary_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar_npc"
	
    self.wpn_fps_pis_judge_primary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_primary.unit = "new_weapon_units/wpn_fps_pis_judge_primary"
    self.wpn_fps_pis_judge_secondary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_secondary.unit = "new_weapon_units/wpn_fps_pis_judge_secondary"
    self.wpn_fps_pis_judge_primary_npc = deep_clone(self.wpn_fps_pis_judge_primary)
    self.wpn_fps_pis_judge_primary_npc.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge_npc"
    self.wpn_fps_pis_judge_secondary_npc = deep_clone(self.wpn_fps_pis_judge_secondary)
	self.wpn_fps_pis_judge_secondary_npc.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge_npc"
	
    self.wpn_fps_smg_thompson_primary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_primary.unit = "new_weapon_units/wpn_fps_smg_thompson_primary"
    self.wpn_fps_smg_thompson_secondary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_secondary.unit = "new_weapon_units/wpn_fps_smg_thompson_secondary"
    self.wpn_fps_smg_thompson_primary_npc = deep_clone(self.wpn_fps_smg_thompson_primary)
    self.wpn_fps_smg_thompson_primary_npc.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928/wpn_fps_smg_thompson_npc"
    self.wpn_fps_smg_thompson_secondary_npc = deep_clone(self.wpn_fps_smg_thompson_secondary)
	self.wpn_fps_smg_thompson_secondary_npc.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928/wpn_fps_smg_thompson_npc"
	
    self.wpn_fps_lmg_hk21_primary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_primary.unit = "new_weapon_units/wpn_fps_lmg_hk21_primary"
    self.wpn_fps_lmg_hk21_secondary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_secondary.unit = "new_weapon_units/wpn_fps_lmg_hk21_secondary"
    self.wpn_fps_lmg_hk21_primary_npc = deep_clone(self.wpn_fps_lmg_hk21_primary)
    self.wpn_fps_lmg_hk21_primary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"
    self.wpn_fps_lmg_hk21_secondary_npc = deep_clone(self.wpn_fps_lmg_hk21_secondary)
	self.wpn_fps_lmg_hk21_secondary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"
    
    self.wpn_fps_lmg_m249_primary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_primary.unit = "new_weapon_units/wpn_fps_lmg_m249_primary"
    self.wpn_fps_lmg_m249_secondary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_secondary.unit = "new_weapon_units/wpn_fps_lmg_m249_secondary"
    self.wpn_fps_lmg_m249_primary_npc = deep_clone(self.wpn_fps_lmg_m249_primary)
    self.wpn_fps_lmg_m249_primary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249_npc"
    self.wpn_fps_lmg_m249_secondary_npc = deep_clone(self.wpn_fps_lmg_m249_secondary)
	self.wpn_fps_lmg_m249_secondary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249_npc"
	
    self.wpn_fps_pis_rage_primary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_primary.unit = "new_weapon_units/wpn_fps_pis_rage_primary"
    self.wpn_fps_pis_rage_secondary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_secondary.unit = "new_weapon_units/wpn_fps_pis_rage_secondary"
    self.wpn_fps_pis_rage_primary_npc = deep_clone(self.wpn_fps_pis_rage_primary)
    self.wpn_fps_pis_rage_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_npc"
    self.wpn_fps_pis_rage_secondary_npc = deep_clone(self.wpn_fps_pis_rage_secondary)
	self.wpn_fps_pis_rage_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_npc"
	
    self.wpn_fps_pis_peacemaker_primary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_primary.unit = "new_weapon_units/wpn_fps_pis_peacemaker_primary"
    self.wpn_fps_pis_peacemaker_secondary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_secondary.unit = "new_weapon_units/wpn_fps_pis_peacemaker_secondary"
    self.wpn_fps_pis_peacemaker_primary_npc = deep_clone(self.wpn_fps_pis_peacemaker_primary)
    self.wpn_fps_pis_peacemaker_primary_npc.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker/wpn_fps_pis_peacemaker_npc"
    self.wpn_fps_pis_peacemaker_secondary_npc = deep_clone(self.wpn_fps_pis_peacemaker_secondary)
	self.wpn_fps_pis_peacemaker_secondary_npc.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker/wpn_fps_pis_peacemaker_npc"
	
    self.wpn_fps_ass_flint_primary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_primary.unit = "new_weapon_units/wpn_fps_ass_flint_primary"
    self.wpn_fps_ass_flint_secondary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_secondary.unit = "new_weapon_units/wpn_fps_ass_flint_secondary"
    self.wpn_fps_ass_flint_primary_npc = deep_clone(self.wpn_fps_ass_flint_primary)
    self.wpn_fps_ass_flint_primary_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint_npc"
    self.wpn_fps_ass_flint_secondary_npc = deep_clone(self.wpn_fps_ass_flint_secondary)
	self.wpn_fps_ass_flint_secondary_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint_npc"
	
    self.wpn_fps_pis_breech_primary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_primary.unit = "new_weapon_units/wpn_fps_pis_breech_primary"
    self.wpn_fps_pis_breech_secondary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_secondary.unit = "new_weapon_units/wpn_fps_pis_breech_secondary"
    self.wpn_fps_pis_breech_primary_npc = deep_clone(self.wpn_fps_pis_breech_primary)
    self.wpn_fps_pis_breech_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech_npc"
    self.wpn_fps_pis_breech_secondary_npc = deep_clone(self.wpn_fps_pis_breech_secondary)
	self.wpn_fps_pis_breech_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech_npc"

    self.wpn_fps_spe_rpg7_primary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_primary.unit = "new_weapon_units/wpn_fps_spe_rpg7_primary"
    self.wpn_fps_spe_rpg7_secondary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_secondary.unit = "new_weapon_units/wpn_fps_spe_rpg7_secondary"
    self.wpn_fps_spe_rpg7_primary_npc = deep_clone(self.wpn_fps_spe_rpg7_primary)
    self.wpn_fps_spe_rpg7_primary_npc.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_rpg7/wpn_fps_rpg7_npc"
    self.wpn_fps_spe_rpg7_secondary_npc = deep_clone(self.wpn_fps_spe_rpg7_secondary)
	self.wpn_fps_spe_rpg7_secondary_npc.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_rpg7/wpn_fps_rpg7_npc"
	
	--I should go make more Nepgear shovel pics
	self.wpn_fps_ass_74_primary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_primary.unit = "new_weapon_units/wpn_fps_ass_74_primary"
    self.wpn_fps_ass_74_primary_npc = deep_clone(self.wpn_fps_ass_74_primary)
	self.wpn_fps_ass_74_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"
    self.wpn_fps_ass_74_secondary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_secondary.unit = "new_weapon_units/wpn_fps_ass_74_secondary"
    self.wpn_fps_ass_74_secondary_npc = deep_clone(self.wpn_fps_ass_74_secondary)
	self.wpn_fps_ass_74_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"
	
	self.wpn_fps_ass_ching_primary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_primary.unit = "new_weapon_units/wpn_fps_ass_ching_primary"
    self.wpn_fps_ass_ching_primary_npc = deep_clone(self.wpn_fps_ass_ching_primary)
	self.wpn_fps_ass_ching_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching_npc"
    self.wpn_fps_ass_ching_secondary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_secondary.unit = "new_weapon_units/wpn_fps_ass_ching_secondary"
    self.wpn_fps_ass_ching_secondary_npc = deep_clone(self.wpn_fps_ass_ching_secondary)
	self.wpn_fps_ass_ching_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching_npc"
	
	self.wpn_fps_pis_lemming_primary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_primary.unit = "new_weapon_units/wpn_fps_pis_lemming_primary"
    self.wpn_fps_pis_lemming_secondary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_secondary.unit = "new_weapon_units/wpn_fps_pis_lemming_secondary"
    self.wpn_fps_pis_lemming_primary_npc = deep_clone(self.wpn_fps_pis_lemming_primary)
    self.wpn_fps_pis_lemming_primary_npc.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming_npc"
    self.wpn_fps_pis_lemming_secondary_npc = deep_clone(self.wpn_fps_pis_lemming_secondary)
	self.wpn_fps_pis_lemming_secondary_npc.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming_npc"
	
	self.wpn_fps_shot_m37_primary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_primary.unit = "new_weapon_units/wpn_fps_shot_m37_primary"
    self.wpn_fps_shot_m37_secondary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_secondary.unit = "new_weapon_units/wpn_fps_shot_m37_secondary"
    self.wpn_fps_shot_m37_primary_npc = deep_clone(self.wpn_fps_shot_m37_primary)
    self.wpn_fps_shot_m37_primary_npc.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37/wpn_fps_shot_m37_npc"
    self.wpn_fps_shot_m37_secondary_npc = deep_clone(self.wpn_fps_shot_m37_secondary)
	self.wpn_fps_shot_m37_secondary_npc.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37/wpn_fps_shot_m37_npc"
	
	self.wpn_fps_shot_r870_primary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_primary.unit = "new_weapon_units/wpn_fps_shot_r870_primary"
    self.wpn_fps_shot_r870_secondary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_secondary.unit = "new_weapon_units/wpn_fps_shot_r870_secondary"
    self.wpn_fps_shot_r870_primary_npc = deep_clone(self.wpn_fps_shot_r870_primary)
    self.wpn_fps_shot_r870_primary_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"
    self.wpn_fps_shot_r870_secondary_npc = deep_clone(self.wpn_fps_shot_r870_secondary)
	self.wpn_fps_shot_r870_secondary_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"
	
	self.wpn_fps_smg_erma_primary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_primary.unit = "new_weapon_units/wpn_fps_smg_erma_primary"
    self.wpn_fps_smg_erma_secondary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_secondary.unit = "new_weapon_units/wpn_fps_smg_erma_secondary"
    self.wpn_fps_smg_erma_primary_npc = deep_clone(self.wpn_fps_smg_erma_primary)
    self.wpn_fps_smg_erma_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma_npc"
    self.wpn_fps_smg_erma_secondary_npc = deep_clone(self.wpn_fps_smg_erma_secondary)
	self.wpn_fps_smg_erma_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma_npc"
	
	self.wpn_fps_smg_schakal_primary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_primary.unit = "new_weapon_units/wpn_fps_smg_schakal_primary"
    self.wpn_fps_smg_schakal_secondary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_secondary.unit = "new_weapon_units/wpn_fps_smg_schakal_secondary"
    self.wpn_fps_smg_schakal_primary_npc = deep_clone(self.wpn_fps_smg_schakal_primary)
    self.wpn_fps_smg_schakal_primary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal_npc"
    self.wpn_fps_smg_schakal_secondary_npc = deep_clone(self.wpn_fps_smg_schakal_secondary)
	self.wpn_fps_smg_schakal_secondary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal_npc"
	
	self.wpn_fps_smg_tec9_primary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_primary.unit = "new_weapon_units/wpn_fps_smg_tec9_primary"
    self.wpn_fps_smg_tec9_secondary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_secondary.unit = "new_weapon_units/wpn_fps_smg_tec9_secondary"
    self.wpn_fps_smg_tec9_primary_npc = deep_clone(self.wpn_fps_smg_tec9_primary)
    self.wpn_fps_smg_tec9_primary_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9_npc"
    self.wpn_fps_smg_tec9_secondary_npc = deep_clone(self.wpn_fps_smg_tec9_secondary)
	self.wpn_fps_smg_tec9_secondary_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9_npc"

    self.wpn_fps_snp_mosin_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_snp_mosin_primary.unit = "new_weapon_units/wpn_fps_snp_mosin_primary"
	self.wpn_fps_snp_mosin_primary.default_blueprint = {
        "wpn_fps_snp_mosin_iron_sight",
		"wpn_fps_snp_mosin_body_standard",
		"wpn_fps_snp_mosin_b_standard",
		"wpn_fps_snp_mosin_m_standard"
    }
    self.wpn_fps_snp_mosin_secondary = deep_clone(self.wpn_fps_snp_mosin_primary)
    self.wpn_fps_snp_mosin_secondary.unit = "new_weapon_units/wpn_fps_snp_mosin_secondary"
    self.wpn_fps_snp_mosin_primary_npc = deep_clone(self.wpn_fps_snp_mosin_primary)
    self.wpn_fps_snp_mosin_primary_npc.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin/wpn_fps_snp_mosin_npc"
    self.wpn_fps_snp_mosin_secondary_npc = deep_clone(self.wpn_fps_snp_mosin_secondary)
	self.wpn_fps_snp_mosin_secondary_npc.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin/wpn_fps_snp_mosin_npc"

    self.wpn_fps_sho_deamon_primary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_primary.unit = "new_weapon_units/wpn_fps_sho_deamon_primary"
    self.wpn_fps_sho_deamon_secondary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_secondary.unit = "new_weapon_units/wpn_fps_sho_deamon_secondary"
    self.wpn_fps_sho_deamon_primary_npc = deep_clone(self.wpn_fps_sho_deamon_primary)
    self.wpn_fps_sho_deamon_primary_npc.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot_npc"
    self.wpn_fps_sho_deamon_secondary_npc = deep_clone(self.wpn_fps_sho_deamon_secondary)
	self.wpn_fps_sho_deamon_secondary_npc.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot_npc"

    self.wpn_fps_bow_elastic_primary = deep_clone(self.wpn_fps_bow_elastic)
    self.wpn_fps_bow_elastic_primary.unit = "new_weapon_units/wpn_fps_bow_elastic_primary"
    self.wpn_fps_bow_elastic_primary_npc = deep_clone(self.wpn_fps_bow_elastic_primary)
	self.wpn_fps_bow_elastic_primary_npc.unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic_npc"
	self.wpn_fps_bow_elastic_primary_npc.skip_thq_parts = true
    self.wpn_fps_bow_elastic_secondary = deep_clone(self.wpn_fps_bow_elastic)
    self.wpn_fps_bow_elastic_secondary.unit = "new_weapon_units/wpn_fps_bow_elastic_secondary"
    self.wpn_fps_bow_elastic_secondary_npc = deep_clone(self.wpn_fps_bow_elastic_secondary)
	self.wpn_fps_bow_elastic_secondary_npc.unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic_npc"
    self.wpn_fps_bow_elastic_secondary_npc.skip_thq_parts = true
    
    self.wpn_fps_ass_g3_primary = deep_clone(self.wpn_fps_ass_g3)
    self.wpn_fps_ass_g3_primary.unit = "new_weapon_units/wpn_fps_ass_g3_primary"
    self.wpn_fps_ass_g3_primary.default_blueprint = {
			"wpn_fps_ass_g3_b_sniper",
			"wpn_fps_ass_g3_body_lower",
			"wpn_fps_ass_g3_body_upper",
			"wpn_fps_ass_g3_fg_bipod",
			"wpn_fps_lmg_hk21_g_standard",
			"wpn_fps_ass_g3_m_mag",
			"wpn_fps_lmg_hk21_s_standard",
			"wpn_fps_upg_i_singlefire"
    }
    self.wpn_fps_ass_g3_primary_npc = deep_clone(self.wpn_fps_ass_g3_primary)
    self.wpn_fps_ass_g3_primary_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"
    self.wpn_fps_ass_g3_secondary = deep_clone(self.wpn_fps_ass_g3_primary)
    self.wpn_fps_ass_g3_secondary.unit = "new_weapon_units/wpn_fps_ass_g3_secondary"
    self.wpn_fps_ass_g3_secondary_npc = deep_clone(self.wpn_fps_ass_g3_secondary)
    self.wpn_fps_ass_g3_secondary_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"
    
    self.wpn_fps_ass_tar21_primary = deep_clone(self.wpn_fps_ass_komodo)
    self.wpn_fps_ass_tar21_primary.unit = "new_weapon_units/wpn_fps_ass_tar21_primary"
    self.wpn_fps_ass_tar21_secondary = deep_clone(self.wpn_fps_ass_komodo)
    self.wpn_fps_ass_tar21_secondary.unit = "new_weapon_units/wpn_fps_ass_tar21_secondary"
    self.wpn_fps_ass_tar21_primary_npc = deep_clone(self.wpn_fps_ass_tar21_primary)
    self.wpn_fps_ass_tar21_primary_npc.unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo_npc"
    self.wpn_fps_ass_tar21_secondary_npc = deep_clone(self.wpn_fps_ass_tar21_secondary)
    self.wpn_fps_ass_tar21_secondary_npc.unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo_npc"
    
    self.wpn_fps_lmg_par_primary = deep_clone(self.wpn_fps_lmg_par)
    self.wpn_fps_lmg_par_primary.unit = "new_weapon_units/wpn_fps_lmg_par_primary"
    self.wpn_fps_lmg_par_secondary = deep_clone(self.wpn_fps_lmg_par)
    self.wpn_fps_lmg_par_secondary.unit = "new_weapon_units/wpn_fps_lmg_par_secondary"
    self.wpn_fps_lmg_par_primary_npc = deep_clone(self.wpn_fps_lmg_par_primary)
    self.wpn_fps_lmg_par_primary_npc.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par_npc"
    self.wpn_fps_lmg_par_secondary_npc = deep_clone(self.wpn_fps_lmg_par_secondary)
    self.wpn_fps_lmg_par_secondary_npc.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par_npc"
    
    self.wpn_fps_pis_packrat_primary = deep_clone(self.wpn_fps_pis_packrat)
    self.wpn_fps_pis_packrat_primary.unit = "new_weapon_units/wpn_fps_pis_packrat_primary"
    self.wpn_fps_pis_packrat_secondary = deep_clone(self.wpn_fps_pis_packrat)
    self.wpn_fps_pis_packrat_secondary.unit = "new_weapon_units/wpn_fps_pis_packrat_secondary"
    self.wpn_fps_pis_packrat_primary_npc = deep_clone(self.wpn_fps_pis_packrat_primary)
    self.wpn_fps_pis_packrat_primary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat/wpn_fps_pis_packrat_npc"
    self.wpn_fps_pis_packrat_secondary_npc = deep_clone(self.wpn_fps_pis_packrat_secondary)
	self.wpn_fps_pis_packrat_secondary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_pis_packrat/wpn_fps_pis_packrat_npc"
end

function WeaponFactoryTweakData:_init_upgraded_multiplix()

    self.parts.wpn_fps_spe_storm_bow_base = {
		a_obj = "a_body",
		type = "barrel",
		name_id = "bm_wp_elastic_body_standard",
        unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_base",
        third_unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_base",
		stats = {
			value = 1
		},
		animations = {
			reload = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			charge = "charge"
		}
    }
    
    self.parts.wpn_fps_spe_storm_bow_bone_base = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_elastic_body_standard",
        unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_bone_base",
        third_unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_bone_base",
		stats = {
			value = 1
		}
    }
    
    self.parts.wpn_fps_spe_storm_bow_elec_base = {
		a_obj = "a_body",
		type = "lower_reciever",
		name_id = "bm_wp_elastic_body_standard",
        unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_elec_base",
        third_unit = "units/mods/weapons/wpn_fps_spe_storm_bow_pts/wpn_fps_spe_storm_bow_elec_base",
		stats = {
			value = 1
		}
	}
    
    self.wpn_fps_ass_m14_upg_primary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m14_upg_primary"
    self.wpn_fps_ass_m14_upg_primary.default_blueprint = {
        "wpn_fps_ass_m14_b_legendary",
        "wpn_fps_ass_m14_body_lower_legendary",
        "wpn_fps_ass_m14_body_upper_legendary",
        "wpn_fps_ass_m14_m_standard",
        "wpn_fps_ass_m14_body_legendary",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_m14_scopemount"
    }
    self.wpn_fps_ass_m14_upg_secondary = deep_clone(self.wpn_fps_ass_m14_upg_primary)
    self.wpn_fps_ass_m14_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m14_upg_secondary"
    self.wpn_fps_ass_m14_upg_primary_npc = deep_clone(self.wpn_fps_ass_m14_upg_primary)
    self.wpn_fps_ass_m14_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"
    self.wpn_fps_ass_m14_upg_secondary_npc = deep_clone(self.wpn_fps_ass_m14_upg_secondary)
	self.wpn_fps_ass_m14_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"

    self.wpn_fps_snp_m95_upg_primary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_snp_m95_upg_primary"
    self.wpn_fps_snp_m95_upg_primary.default_blueprint = {
        "wpn_fps_snp_m95_barrel_long",
        "wpn_fps_snp_m95_bipod",
        "wpn_fps_snp_m95_lower_reciever",
        "wpn_fps_snp_m95_upper_reciever",
        "wpn_fps_snp_m95_magazine",
        "wpn_fps_upg_o_acog",
        "wpn_fps_upg_m4_g_standard_vanilla"
    }
    self.wpn_fps_snp_m95_upg_secondary = deep_clone(self.wpn_fps_snp_m95_upg_primary)
    self.wpn_fps_snp_m95_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_snp_m95_upg_secondary"
    self.wpn_fps_snp_m95_upg_primary_npc = deep_clone(self.wpn_fps_snp_m95_upg_primary)
    self.wpn_fps_snp_m95_upg_primary_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95_npc"
    self.wpn_fps_snp_m95_upg_secondary_npc = deep_clone(self.wpn_fps_snp_m95_upg_secondary)
	self.wpn_fps_snp_m95_upg_secondary_npc.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_snp_m95/wpn_fps_snp_m95_npc"

    self.wpn_fps_pis_1911_upg_primary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_1911_upg_primary"
    self.wpn_fps_pis_1911_upg_primary.default_blueprint = {
        "wpn_fps_pis_1911_body_standard",
        "wpn_fps_pis_1911_b_long",
        "wpn_fps_pis_1911_g_engraved",
        "wpn_fps_pis_1911_m_standard",
        "wpn_upg_o_marksmansight_rear",
        "wpn_fps_upg_fl_pis_laser"
    }
    self.wpn_fps_pis_1911_upg_secondary = deep_clone(self.wpn_fps_pis_1911_upg_primary)
    self.wpn_fps_pis_1911_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_1911_upg_secondary"
    self.wpn_fps_pis_1911_upg_primary_npc = deep_clone(self.wpn_fps_pis_1911_upg_primary)
    self.wpn_fps_pis_1911_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_npc"
    self.wpn_fps_pis_1911_upg_secondary_npc = deep_clone(self.wpn_fps_pis_1911_upg_secondary)
	self.wpn_fps_pis_1911_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_1911/wpn_fps_pis_1911_npc"

    self.wpn_fps_shot_b682_upg_primary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_b682_upg_primary"
    self.wpn_fps_shot_b682_upg_primary.default_blueprint = {
        "wpn_fps_shot_b682_body_standard",
        "wpn_fps_shot_b682_b_long",
        "wpn_fps_shot_b682_s_ammopouch",
        "wpn_fps_upg_a_dragons_breath"
    }
    self.wpn_fps_shot_b682_upg_secondary = deep_clone(self.wpn_fps_shot_b682_upg_primary)
    self.wpn_fps_shot_b682_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_b682_upg_secondary"
    self.wpn_fps_shot_b682_upg_primary_npc = deep_clone(self.wpn_fps_shot_b682_upg_primary)
    self.wpn_fps_shot_b682_upg_primary_npc.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682/wpn_fps_shot_b682_npc"
    self.wpn_fps_shot_b682_upg_secondary_npc = deep_clone(self.wpn_fps_shot_b682_upg_secondary)
	self.wpn_fps_shot_b682_upg_secondary_npc.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682/wpn_fps_shot_b682_npc"

    self.wpn_fps_smg_mp9_upg_primary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_mp9_upg_primary"
    self.wpn_fps_smg_mp9_upg_primary.default_blueprint = {
        "wpn_fps_smg_mp9_body_mp9",
        "wpn_fps_smg_mp9_s_skel",
        "wpn_fps_smg_mp9_m_extended",
        "wpn_fps_smg_mp9_b_dummy",
        "wpn_fps_upg_ass_ns_battle",
        "wpn_fps_upg_vg_ass_smg_verticalgrip",
        "wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_reflex"
    }
    self.wpn_fps_smg_mp9_upg_secondary = deep_clone(self.wpn_fps_smg_mp9_upg_primary)
    self.wpn_fps_smg_mp9_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_mp9_upg_secondary"
    self.wpn_fps_smg_mp9_upg_primary_npc = deep_clone(self.wpn_fps_smg_mp9_upg_primary)
    self.wpn_fps_smg_mp9_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9_npc"
    self.wpn_fps_smg_mp9_upg_secondary_npc = deep_clone(self.wpn_fps_smg_mp9_upg_secondary)
	self.wpn_fps_smg_mp9_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_smg_mp9/wpn_fps_smg_mp9_npc"
	

	--upgrade my shovel
    self.wpn_fps_ass_fal_upg_primary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_fal_upg_primary"
    self.wpn_fps_ass_fal_upg_primary.default_blueprint = {
        "wpn_fps_ass_fal_body_standard",
        "wpn_fps_ass_fal_fg_04",
        "wpn_fps_ass_fal_g_01",
        "wpn_fps_ass_fal_m_01",
        "wpn_fps_ass_fal_s_wood",
        "wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_acog"
    }
    self.wpn_fps_ass_fal_upg_secondary = deep_clone(self.wpn_fps_ass_fal_upg_primary)
    self.wpn_fps_ass_fal_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_fal_upg_secondary"
    self.wpn_fps_ass_fal_upg_primary_npc = deep_clone(self.wpn_fps_ass_fal_upg_primary)
    self.wpn_fps_ass_fal_upg_primary_npc.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal_npc"
    self.wpn_fps_ass_fal_upg_secondary_npc = deep_clone(self.wpn_fps_ass_fal_upg_secondary)
	self.wpn_fps_ass_fal_upg_secondary_npc.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal/wpn_fps_ass_fal_npc"
	
    self.wpn_fps_pis_deagle_upg_primary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_deagle_upg_primary"
    self.wpn_fps_pis_deagle_upg_primary.default_blueprint = {
        "wpn_fps_pis_deagle_body_standard",
        "wpn_fps_pis_deagle_m_standard",
        "wpn_fps_pis_deagle_b_legend",
        "wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_pis_deagle_extra",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_fl_pis_laser"
    }
    self.wpn_fps_pis_deagle_upg_secondary = deep_clone(self.wpn_fps_pis_deagle_upg_primary)
    self.wpn_fps_pis_deagle_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_deagle_upg_secondary"
    self.wpn_fps_pis_deagle_upg_primary_npc = deep_clone(self.wpn_fps_pis_deagle_upg_primary)
    self.wpn_fps_pis_deagle_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_npc"
    self.wpn_fps_pis_deagle_upg_secondary_npc = deep_clone(self.wpn_fps_pis_deagle_upg_secondary)
	self.wpn_fps_pis_deagle_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_deagle/wpn_fps_pis_deagle_npc"
	
    self.wpn_fps_ass_aug_upg_primary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_aug_upg_primary"
    self.wpn_fps_ass_aug_upg_primary.default_blueprint = {
        "wpn_fps_aug_body_f90",
        "wpn_fps_aug_b_long",
        "wpn_fps_aug_fg_a3",
        "wpn_fps_upg_vg_ass_smg_verticalgrip",
        "wpn_fps_aug_m_pmag",
        "wpn_fps_upg_o_reflex",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_aug_upg_secondary = deep_clone(self.wpn_fps_ass_aug_upg_primary)
    self.wpn_fps_ass_aug_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_aug_upg_secondary"
    self.wpn_fps_ass_aug_upg_primary_npc = deep_clone(self.wpn_fps_ass_aug_upg_primary)
    self.wpn_fps_ass_aug_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_npc"
    self.wpn_fps_ass_aug_upg_secondary_npc = deep_clone(self.wpn_fps_ass_aug_upg_secondary)
	self.wpn_fps_ass_aug_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_aug/wpn_fps_ass_aug_npc"
	
    self.wpn_fps_smg_p90_upg_primary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_p90_upg_primary"
    self.wpn_fps_smg_p90_upg_primary.default_blueprint = {
        "wpn_fps_smg_p90_body_boxy",
        "wpn_fps_smg_p90_b_legend",
        "wpn_fps_smg_p90_m_strap",
        "wpn_fps_upg_o_reflex",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_smg_p90_upg_secondary = deep_clone(self.wpn_fps_smg_p90_upg_primary)
    self.wpn_fps_smg_p90_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_p90_upg_secondary"
    self.wpn_fps_smg_p90_upg_primary_npc = deep_clone(self.wpn_fps_smg_p90_upg_primary)
    self.wpn_fps_smg_p90_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90_npc"
    self.wpn_fps_smg_p90_upg_secondary_npc = deep_clone(self.wpn_fps_smg_p90_upg_secondary)
	self.wpn_fps_smg_p90_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_smg_p90/wpn_fps_smg_p90_npc"
	
    self.wpn_fps_sho_striker_upg_primary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_sho_striker_upg_primary"
    self.wpn_fps_sho_striker_upg_primary.default_blueprint = {
        "wpn_fps_sho_striker_b_long",
        "wpn_fps_sho_striker_body_standard",
        "wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_a_dragons_breath",
		"wpn_fps_upg_o_reflex",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_sho_striker_upg_secondary = deep_clone(self.wpn_fps_sho_striker_upg_primary)
    self.wpn_fps_sho_striker_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_sho_striker_upg_secondary"
    self.wpn_fps_sho_striker_upg_primary_npc = deep_clone(self.wpn_fps_sho_striker_upg_primary)
    self.wpn_fps_sho_striker_upg_primary_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker_npc"
    self.wpn_fps_sho_striker_upg_secondary_npc = deep_clone(self.wpn_fps_sho_striker_upg_secondary)
	self.wpn_fps_sho_striker_upg_secondary_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_striker/wpn_fps_sho_striker_npc"
	
    self.wpn_fps_ass_amcar_upg_primary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_amcar_upg_primary"
    self.wpn_fps_ass_amcar_upg_primary.default_blueprint = {
        "wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_m4_uupg_fg_rail",
		"wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_amcar_upg_secondary = deep_clone(self.wpn_fps_ass_amcar_upg_primary)
    self.wpn_fps_ass_amcar_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_amcar_upg_secondary"
    self.wpn_fps_ass_amcar_upg_primary_npc = deep_clone(self.wpn_fps_ass_amcar_upg_primary)
    self.wpn_fps_ass_amcar_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"
    self.wpn_fps_ass_amcar_upg_secondary_npc = deep_clone(self.wpn_fps_ass_amcar_upg_secondary)
	self.wpn_fps_ass_amcar_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"
	
    self.wpn_fps_ass_m16_upg_primary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m16_upg_primary"
    self.wpn_fps_ass_m16_upg_primary.default_blueprint = {
        "wpn_fps_m4_uupg_draghandle",
        "wpn_fps_upg_m4_m_pmag",
        "wpn_fps_upg_o_acog",
        "wpn_fps_ass_m16_b_legend",
        "wpn_fps_ass_m16_fg_legend",
        "wpn_fps_ass_m16_s_legend",
        "wpn_fps_upg_m4_g_mgrip",
        "wpn_fps_upg_ass_m4_lower_reciever_core",
        "wpn_fps_upg_ass_m4_upper_reciever_core",
        "wpn_fps_amcar_bolt_standard"
    }
    self.wpn_fps_ass_m16_upg_secondary = deep_clone(self.wpn_fps_ass_m16_upg_primary)
    self.wpn_fps_ass_m16_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m16_upg_secondary"
    self.wpn_fps_ass_m16_upg_primary_npc = deep_clone(self.wpn_fps_ass_m16_upg_primary)
    self.wpn_fps_ass_m16_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"
    self.wpn_fps_ass_m16_upg_secondary_npc = deep_clone(self.wpn_fps_ass_m16_upg_secondary)
	self.wpn_fps_ass_m16_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"
	
    self.wpn_fps_ass_scar_upg_primary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_scar_upg_primary"
    self.wpn_fps_ass_scar_upg_primary.default_blueprint = {
        "wpn_fps_ass_scar_m_standard",
        "wpn_fps_ass_scar_b_long",
        "wpn_fps_ass_scar_body_standard",
        "wpn_fps_ass_scar_s_sniper",
        "wpn_fps_upg_o_reflex",
        "wpn_fps_upg_m4_g_sniper",
        "wpn_fps_upg_vg_ass_smg_afg",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_scar_upg_secondary = deep_clone(self.wpn_fps_ass_scar_upg_primary)
    self.wpn_fps_ass_scar_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_scar_upg_secondary"
    self.wpn_fps_ass_scar_upg_primary_npc = deep_clone(self.wpn_fps_ass_scar_upg_primary)
    self.wpn_fps_ass_scar_upg_primary_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar_npc"
    self.wpn_fps_ass_scar_upg_secondary_npc = deep_clone(self.wpn_fps_ass_scar_upg_secondary)
	self.wpn_fps_ass_scar_upg_secondary_npc.unit = "units/pd2_dlc_dec5/weapons/wpn_fps_ass_scar/wpn_fps_ass_scar_npc"
	
    self.wpn_fps_pis_judge_upg_primary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_judge_upg_primary"
    self.wpn_fps_pis_judge_upg_primary.default_blueprint = {
        "wpn_fps_pis_judge_body_standard",
        "wpn_fps_pis_judge_b_legend",
        "wpn_fps_pis_judge_g_legend",
        "wpn_fps_upg_a_custom",
		"wpn_fps_upg_o_reflex"
    }
    self.wpn_fps_pis_judge_upg_secondary = deep_clone(self.wpn_fps_pis_judge_upg_primary)
    self.wpn_fps_pis_judge_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_judge_upg_secondary"
    self.wpn_fps_pis_judge_upg_primary_npc = deep_clone(self.wpn_fps_pis_judge_upg_primary)
    self.wpn_fps_pis_judge_upg_primary_npc.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge_npc"
    self.wpn_fps_pis_judge_upg_secondary_npc = deep_clone(self.wpn_fps_pis_judge_upg_secondary)
	self.wpn_fps_pis_judge_upg_secondary_npc.unit = "units/pd2_million/weapons/wpn_fps_pis_judge/wpn_fps_pis_judge_npc"
	
    self.wpn_fps_smg_thompson_upg_primary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_thompson_upg_primary"
	self.wpn_fps_smg_thompson_upg_primary.default_blueprint = {
        "wpn_fps_smg_thompson_body",
        "wpn_fps_smg_thompson_barrel_long",
        "wpn_fps_smg_thompson_grip",
        "wpn_fps_smg_thompson_foregrip",
		"wpn_fps_smg_thompson_stock",
		"wpn_fps_smg_thompson_drummag",
		"wpn_fps_smg_thompson_ns_standard",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_o_reflex"
    }
    self.wpn_fps_smg_thompson_upg_secondary = deep_clone(self.wpn_fps_smg_thompson_upg_primary)
    self.wpn_fps_smg_thompson_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_thompson_upg_secondary"
    self.wpn_fps_smg_thompson_upg_primary_npc = deep_clone(self.wpn_fps_smg_thompson_upg_primary)
    self.wpn_fps_smg_thompson_upg_primary_npc.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928/wpn_fps_smg_thompson_npc"
    self.wpn_fps_smg_thompson_upg_secondary_npc = deep_clone(self.wpn_fps_smg_thompson_upg_secondary)
	self.wpn_fps_smg_thompson_upg_secondary_npc.unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928/wpn_fps_smg_thompson_npc"
	
    self.wpn_fps_lmg_hk21_upg_primary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_hk21_upg_primary"
    self.wpn_fps_lmg_hk21_upg_primary.default_blueprint = {
        "wpn_fps_lmg_hk21_b_long",
        "wpn_fps_lmg_hk21_body_lower",
        "wpn_fps_lmg_hk21_body_upper",
        "wpn_fps_lmg_hk21_fg_long",
        "wpn_fps_lmg_hk21_g_ergo",
        "wpn_fps_lmg_hk21_m_standard",
        "wpn_fps_lmg_hk21_s_standard",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_lmg_hk21_upg_secondary = deep_clone(self.wpn_fps_lmg_hk21_upg_primary)
    self.wpn_fps_lmg_hk21_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_hk21_upg_secondary"
    self.wpn_fps_lmg_hk21_upg_primary_npc = deep_clone(self.wpn_fps_lmg_hk21_upg_primary)
    self.wpn_fps_lmg_hk21_upg_primary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"
    self.wpn_fps_lmg_hk21_upg_secondary_npc = deep_clone(self.wpn_fps_lmg_hk21_upg_secondary)
	self.wpn_fps_lmg_hk21_upg_secondary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"
	
    self.wpn_fps_lmg_m249_upg_primary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_m249_upg_primary"
    self.wpn_fps_lmg_m249_upg_primary.default_blueprint = {
        "wpn_fps_lmg_m249_b_long",
        "wpn_fps_lmg_m249_body_standard",
        "wpn_fps_lmg_m249_fg_mk46",
        "wpn_fps_lmg_m249_m_standard",
        "wpn_fps_lmg_m249_s_solid",
        "wpn_fps_lmg_m249_upper_reciever",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_lmg_m249_upg_secondary = deep_clone(self.wpn_fps_lmg_m249_upg_primary)
    self.wpn_fps_lmg_m249_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_m249_upg_secondary"
    self.wpn_fps_lmg_m249_upg_primary_npc = deep_clone(self.wpn_fps_lmg_m249_upg_primary)
    self.wpn_fps_lmg_m249_upg_primary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249_npc"
    self.wpn_fps_lmg_m249_upg_secondary_npc = deep_clone(self.wpn_fps_lmg_m249_upg_secondary)
	self.wpn_fps_lmg_m249_upg_secondary_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_m249/wpn_fps_lmg_m249_npc"
	
    self.wpn_fps_pis_rage_upg_primary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_rage_upg_primary"
    self.wpn_fps_pis_rage_upg_primary.default_blueprint = {
        "wpn_fps_pis_rage_body_standard",
        "wpn_fps_pis_rage_b_long",
        "wpn_fps_pis_rage_g_ergo"
    }
    self.wpn_fps_pis_rage_upg_secondary = deep_clone(self.wpn_fps_pis_rage_upg_primary)
    self.wpn_fps_pis_rage_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_rage_upg_secondary"
    self.wpn_fps_pis_rage_upg_primary_npc = deep_clone(self.wpn_fps_pis_rage_upg_primary)
    self.wpn_fps_pis_rage_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_npc"
    self.wpn_fps_pis_rage_upg_secondary_npc = deep_clone(self.wpn_fps_pis_rage_upg_secondary)
	self.wpn_fps_pis_rage_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_rage/wpn_fps_pis_rage_npc"
	
    self.wpn_fps_pis_peacemaker_upg_primary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_peacemaker_upg_primary"
	self.wpn_fps_pis_peacemaker_upg_primary.default_blueprint = {
        "wpn_fps_pis_peacemaker_body_standard",
		"wpn_fps_pis_peacemaker_b_long",
		"wpn_fps_pis_peacemaker_m_standard",
		"wpn_fps_pis_peacemaker_g_standard",
		"wpn_fps_pis_peacemaker_s_skeletal"
    }
    self.wpn_fps_pis_peacemaker_upg_secondary = deep_clone(self.wpn_fps_pis_peacemaker_upg_primary)
    self.wpn_fps_pis_peacemaker_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_peacemaker_upg_secondary"
    self.wpn_fps_pis_peacemaker_upg_primary_npc = deep_clone(self.wpn_fps_pis_peacemaker_upg_primary)
    self.wpn_fps_pis_peacemaker_upg_primary_npc.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker/wpn_fps_pis_peacemaker_npc"
    self.wpn_fps_pis_peacemaker_upg_secondary_npc = deep_clone(self.wpn_fps_pis_peacemaker_upg_secondary)
	self.wpn_fps_pis_peacemaker_upg_secondary_npc.unit = "units/pd2_dlc_west/weapons/wpn_fps_pis_peacemaker/wpn_fps_pis_peacemaker_npc"
	
    self.wpn_fps_ass_flint_upg_primary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_flint_upg_primary"
    self.wpn_fps_ass_flint_upg_primary.default_blueprint = {
        "wpn_fps_ass_flint_b_standard",
        "wpn_fps_ass_flint_body_upperreceiver",
        "wpn_fps_upg_ak_m_uspalm",
        "wpn_fps_ass_flint_fg_standard",
        "wpn_fps_ass_flint_dh_standard",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_o_reflex",
        "wpn_fps_snp_tti_s_vltor",
        "wpn_fps_upg_ak_g_pgrip",
        "wpn_fps_ass_flint_m_release_standard"
    }
    self.wpn_fps_ass_flint_upg_secondary = deep_clone(self.wpn_fps_ass_flint_upg_primary)
    self.wpn_fps_ass_flint_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_flint_upg_secondary"
    self.wpn_fps_ass_flint_upg_primary_npc = deep_clone(self.wpn_fps_ass_flint_upg_primary)
    self.wpn_fps_ass_flint_upg_primary_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint_npc"
    self.wpn_fps_ass_flint_upg_secondary_npc = deep_clone(self.wpn_fps_ass_flint_upg_secondary)
	self.wpn_fps_ass_flint_upg_secondary_npc.unit = "units/pd2_dlc_grv/weapons/wpn_fps_ass_flint/wpn_fps_ass_flint_npc"
	
    self.wpn_fps_pis_breech_upg_primary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_breech_upg_primary"
	self.wpn_fps_pis_breech_upg_primary.default_blueprint = {
        "wpn_fps_pis_breech_b_reinforced",
			"wpn_fps_pis_breech_body",
			"wpn_fps_pis_breech_dh",
			"wpn_fps_pis_breech_g_standard",
			"wpn_fps_pis_breech_mag"
    }
    self.wpn_fps_pis_breech_upg_secondary = deep_clone(self.wpn_fps_pis_breech_upg_primary)
    self.wpn_fps_pis_breech_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_breech_upg_secondary"
    self.wpn_fps_pis_breech_upg_primary_npc = deep_clone(self.wpn_fps_pis_breech_upg_primary)
    self.wpn_fps_pis_breech_upg_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech_npc"
    self.wpn_fps_pis_breech_upg_secondary_npc = deep_clone(self.wpn_fps_pis_breech_upg_secondary)
	self.wpn_fps_pis_breech_upg_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_pis_breech/wpn_fps_pis_breech_npc"
	
	--shovel upgrade mkII
    self.wpn_fps_ass_74_upg_primary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_74_upg_primary"
	self.wpn_fps_ass_74_upg_primary.default_blueprint = {
			"wpn_fps_ass_74_b_legend",
			"wpn_fps_ass_74_body_upperreceiver",
			"wpn_fps_ass_ak_body_lowerreceiver",
			"wpn_fps_ass_74_m_standard",
			"wpn_upg_ak_fl_legend",
			"wpn_upg_ak_fg_legend",
			"wpn_upg_ak_g_legend",
			"wpn_upg_ak_s_legend",
			"wpn_fps_upg_o_ak_scopemount",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_o_reflex"
	}
    self.wpn_fps_ass_74_upg_secondary = deep_clone(self.wpn_fps_ass_74_upg_primary)
    self.wpn_fps_ass_74_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_74_upg_secondary"
    self.wpn_fps_ass_74_upg_primary_npc = deep_clone(self.wpn_fps_ass_74_upg_primary)
    self.wpn_fps_ass_74_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"
    self.wpn_fps_ass_74_upg_secondary_npc = deep_clone(self.wpn_fps_ass_74_upg_secondary)
	self.wpn_fps_ass_74_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"
	
    self.wpn_fps_ass_ching_upg_primary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_ching_upg_primary"
	self.wpn_fps_ass_ching_upg_primary.default_blueprint = {
			"wpn_fps_ass_ching_b_standard",
			"wpn_fps_ass_ching_body_standard",
			"wpn_fps_ass_ching_bolt_standard",
			"wpn_fps_ass_ching_dh_standard",
			"wpn_fps_ass_ching_extra_swiwel",
			"wpn_fps_ass_ching_extra1_swiwel",
			"wpn_fps_ass_ching_fg_railed",
			"wpn_fps_ass_ching_m_standard",
			"wpn_fps_ass_ching_s_standard",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_o_acog"
	}
    self.wpn_fps_ass_ching_upg_secondary = deep_clone(self.wpn_fps_ass_ching_upg_primary)
    self.wpn_fps_ass_ching_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_ching_upg_secondary"
    self.wpn_fps_ass_ching_upg_primary_npc = deep_clone(self.wpn_fps_ass_ching_upg_primary)
    self.wpn_fps_ass_ching_upg_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching_npc"
    self.wpn_fps_ass_ching_upg_secondary_npc = deep_clone(self.wpn_fps_ass_ching_upg_secondary)
	self.wpn_fps_ass_ching_upg_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_ass_ching/wpn_fps_ass_ching_npc"
    
    self.wpn_fps_pis_lemming_upg_primary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_lemming_upg_primary"
	self.wpn_fps_pis_lemming_upg_primary.default_blueprint = {
			"wpn_fps_pis_lemming_b_standard",
			"wpn_fps_pis_lemming_body",
			"wpn_fps_pis_lemming_m_ext",
			"wpn_fps_pis_lemming_mag_release",
			"wpn_fps_pis_lemming_sl_standard",
			"wpn_fps_upg_fl_pis_laser",
			"wpn_fps_upg_fl_pis_laser"
	}
    self.wpn_fps_pis_lemming_upg_secondary = deep_clone(self.wpn_fps_pis_lemming_upg_primary)
    self.wpn_fps_pis_lemming_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_lemming_upg_secondary"
    self.wpn_fps_pis_lemming_upg_primary_npc = deep_clone(self.wpn_fps_pis_lemming_upg_primary)
    self.wpn_fps_pis_lemming_upg_primary_npc.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming_npc"
    self.wpn_fps_pis_lemming_upg_secondary_npc = deep_clone(self.wpn_fps_pis_lemming_upg_secondary)
	self.wpn_fps_pis_lemming_upg_secondary_npc.unit = "units/pd2_dlc_fi7/weapons/wpn_fps_pis_lemming/wpn_fps_pis_lemming_npc"
    
    self.wpn_fps_shot_m37_upg_primary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_m37_upg_primary"
	self.wpn_fps_shot_m37_upg_primary.default_blueprint = {
			"wpn_fps_shot_m37_b_standard",
			"wpn_fps_shot_m37_s_standard",
			"wpn_fps_shot_m37_m_standard",
			"wpn_fps_shot_m37_body_standard",
			"wpn_fps_shot_m37_fg_standard",
			"wpn_fps_upg_fl_ass_laser"
	}
    self.wpn_fps_shot_m37_upg_secondary = deep_clone(self.wpn_fps_shot_m37_upg_primary)
    self.wpn_fps_shot_m37_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_m37_upg_secondary"
    self.wpn_fps_shot_m37_upg_primary_npc = deep_clone(self.wpn_fps_shot_m37_upg_primary)
    self.wpn_fps_shot_m37_upg_primary_npc.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37/wpn_fps_shot_m37_npc"
    self.wpn_fps_shot_m37_upg_secondary_npc = deep_clone(self.wpn_fps_shot_m37_upg_secondary)
	self.wpn_fps_shot_m37_upg_secondary_npc.unit = "units/pd2_dlc_peta/weapons/wpn_fps_shot_m37/wpn_fps_shot_m37_npc"
    
    self.wpn_fps_shot_r870_upg_primary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_r870_upg_primary"
    self.wpn_fps_shot_r870_upg_primary.default_blueprint = {
        "wpn_fps_shot_r870_body_standard",
        "wpn_fps_shot_r870_b_legendary",
        "wpn_fps_shot_r870_fg_legendary",
        "wpn_fps_shot_r870_s_legendary",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_shot_r870_upg_secondary = deep_clone(self.wpn_fps_shot_r870_upg_primary)
    self.wpn_fps_shot_r870_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_r870_upg_secondary"
    self.wpn_fps_shot_r870_upg_primary_npc = deep_clone(self.wpn_fps_shot_r870_upg_primary)
    self.wpn_fps_shot_r870_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"
    self.wpn_fps_shot_r870_upg_secondary_npc = deep_clone(self.wpn_fps_shot_r870_upg_secondary)
	self.wpn_fps_shot_r870_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"
    
    self.wpn_fps_smg_erma_upg_primary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_erma_upg_primary"
	self.wpn_fps_smg_erma_upg_primary.default_blueprint = {
			"wpn_fps_smg_erma_b_standard",
			"wpn_fps_smg_erma_body_standard",
			"wpn_fps_smg_erma_bolt_standard",
			"wpn_fps_smg_erma_mag_standard",
			"wpn_fps_smg_erma_ns_standard",
			"wpn_fps_upg_o_reflex",
			"wpn_fps_smg_erma_s_unfolded",
			"wpn_fps_upg_fl_ass_laser"
	}
    self.wpn_fps_smg_erma_upg_secondary = deep_clone(self.wpn_fps_smg_erma_upg_primary)
    self.wpn_fps_smg_erma_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_erma_upg_secondary"
    self.wpn_fps_smg_erma_upg_primary_npc = deep_clone(self.wpn_fps_smg_erma_upg_primary)
    self.wpn_fps_smg_erma_upg_primary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma_npc"
    self.wpn_fps_smg_erma_upg_secondary_npc = deep_clone(self.wpn_fps_smg_erma_upg_secondary)
	self.wpn_fps_smg_erma_upg_secondary_npc.unit = "units/pd2_dlc_old/weapons/wpn_fps_smg_erma/wpn_fps_smg_erma_npc"
    
    self.wpn_fps_smg_schakal_upg_primary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_schakal_upg_primary"
	self.wpn_fps_smg_schakal_upg_primary.default_blueprint = {
			"wpn_fps_smg_schakal_b_standard",
			"wpn_fps_smg_schakal_body_lower",
			"wpn_fps_smg_schakal_body_upper",
			"wpn_fps_smg_schakal_m_standard",
			"wpn_fps_smg_schakal_s_civil",
			"wpn_fps_smg_schakal_dh_standard",
			"wpn_fps_smg_schakal_bolt_standard",
			"wpn_fps_smg_schakal_vg_surefire",
			"wpn_fps_smg_schakal_extra_magrelease",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_o_reflex"
	}
    self.wpn_fps_smg_schakal_upg_secondary = deep_clone(self.wpn_fps_smg_schakal_upg_primary)
    self.wpn_fps_smg_schakal_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_schakal_upg_secondary"
    self.wpn_fps_smg_schakal_upg_primary_npc = deep_clone(self.wpn_fps_smg_schakal_upg_primary)
    self.wpn_fps_smg_schakal_upg_primary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal_npc"
    self.wpn_fps_smg_schakal_upg_secondary_npc = deep_clone(self.wpn_fps_smg_schakal_upg_secondary)
	self.wpn_fps_smg_schakal_upg_secondary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_smg_schakal/wpn_fps_smg_schakal_npc"
    
    self.wpn_fps_smg_tec9_upg_primary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_tec9_upg_primary"
	self.wpn_fps_smg_tec9_upg_primary.default_blueprint = {
			"wpn_fps_smg_tec9_m_standard",
			"wpn_fps_smg_tec9_ns_ext",
			"wpn_fps_smg_tec9_s_unfolded",
			"wpn_fps_smg_tec9_body_standard",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_o_reflex"
	}
    self.wpn_fps_smg_tec9_upg_secondary = deep_clone(self.wpn_fps_smg_tec9_upg_primary)
    self.wpn_fps_smg_tec9_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_tec9_upg_secondary"
    self.wpn_fps_smg_tec9_upg_primary_npc = deep_clone(self.wpn_fps_smg_tec9_upg_primary)
    self.wpn_fps_smg_tec9_upg_primary_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9_npc"
    self.wpn_fps_smg_tec9_upg_secondary_npc = deep_clone(self.wpn_fps_smg_tec9_upg_secondary)
	self.wpn_fps_smg_tec9_upg_secondary_npc.unit = "units/pd2_dlc_miami/weapons/wpn_fps_smg_tec9/wpn_fps_smg_tec9_npc"

    self.wpn_fps_spe_rpg7_upg_primary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_spe_rpg7_upg_primary"
	self.wpn_fps_spe_rpg7_upg_primary.default_blueprint = {
			"wpn_fps_rpg7_body",
			"wpn_fps_rpg7_m_grinclown",
			"wpn_fps_rpg7_barrel",
			"wpn_fps_rpg7_sight"
	}
    self.wpn_fps_spe_rpg7_upg_secondary = deep_clone(self.wpn_fps_spe_rpg7_upg_primary)
    self.wpn_fps_spe_rpg7_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_spe_rpg7_upg_secondary"
    self.wpn_fps_spe_rpg7_upg_primary_npc = deep_clone(self.wpn_fps_spe_rpg7_upg_primary)
    self.wpn_fps_spe_rpg7_upg_primary_npc.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_rpg7/wpn_fps_rpg7_npc"
    self.wpn_fps_spe_rpg7_upg_secondary_npc = deep_clone(self.wpn_fps_spe_rpg7_upg_secondary)
	self.wpn_fps_spe_rpg7_upg_secondary_npc.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_fps_rpg7/wpn_fps_rpg7_npc"

    self.wpn_fps_snp_mosin_upg_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_snp_mosin_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_snp_mosin_upg_primary"
    self.wpn_fps_snp_mosin_upg_primary.default_blueprint = {
        "wpn_fps_upg_o_acog",
		"wpn_fps_snp_mosin_body_standard",
		"wpn_fps_snp_mosin_b_standard",
		"wpn_fps_snp_mosin_m_standard",
		"wpn_fps_snp_mosin_rail",
		"wpn_fps_upg_fl_ass_laser"
		
    }
    self.wpn_fps_snp_mosin_upg_secondary = deep_clone(self.wpn_fps_snp_mosin_upg_primary)
    self.wpn_fps_snp_mosin_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_snp_mosin_upg_secondary"
    self.wpn_fps_snp_mosin_upg_primary_npc = deep_clone(self.wpn_fps_snp_mosin_upg_primary)
    self.wpn_fps_snp_mosin_upg_primary_npc.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin/wpn_fps_snp_mosin_npc"
    self.wpn_fps_snp_mosin_upg_secondary_npc = deep_clone(self.wpn_fps_snp_mosin_upg_secondary)
	self.wpn_fps_snp_mosin_upg_secondary_npc.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_snp_mosin/wpn_fps_snp_mosin_npc"

    self.wpn_fps_spe_vulcan_upg_primary = deep_clone(self.wpn_fps_lmg_shuno)
    self.wpn_fps_spe_vulcan_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_spe_vulcan_upg_primary"
	self.wpn_fps_spe_vulcan_upg_primary.default_blueprint = {
        "wpn_fps_lmg_shuno_body_standard",
			"wpn_fps_lmg_shuno_b_heat_long",
			"wpn_fps_lmg_shuno_m_standard",
			"wpn_fps_lmg_shuno_s_standard",
			"wpn_fps_lmg_shuno_b_dummy_long",
			"wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_spe_vulcan_upg_primary_npc = deep_clone(self.wpn_fps_spe_vulcan_upg_primary)
	self.wpn_fps_spe_vulcan_upg_primary_npc.unit = "units/pd2_dlc_dmg/weapons/wpn_fps_lmg_shuno/wpn_fps_lmg_shuno_npc"

    self.wpn_fps_sho_deamon_upg_primary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_sho_deamon_upg_primary"
    self.wpn_fps_sho_deamon_upg_primary.default_blueprint = {
        "wpn_fps_sho_boot_b_legendary",
        "wpn_fps_sho_boot_fg_legendary",
        "wpn_fps_sho_boot_o_legendary",
        "wpn_fps_sho_boot_s_legendary",
        "wpn_fps_sho_boot_body_standard",
        "wpn_fps_sho_boot_em_extra",
		"wpn_fps_upg_fl_ass_laser",
        "wpn_fps_sho_boot_m_standard",
        "wpn_fps_upg_a_custom_free"
    }
    self.wpn_fps_sho_deamon_upg_secondary = deep_clone(self.wpn_fps_sho_deamon_upg_primary)
    self.wpn_fps_sho_deamon_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_sho_deamon_upg_secondary"
    self.wpn_fps_sho_deamon_upg_primary_npc = deep_clone(self.wpn_fps_sho_deamon_upg_primary)
    self.wpn_fps_sho_deamon_upg_primary_npc.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot_npc"
    self.wpn_fps_sho_deamon_upg_secondary_npc = deep_clone(self.wpn_fps_sho_deamon_upg_secondary)
	self.wpn_fps_sho_deamon_upg_secondary_npc.unit = "units/pd2_dlc_wild/weapons/wpn_fps_sho_boot/wpn_fps_sho_boot_npc"

    self.wpn_fps_bow_elastic_upg_primary = deep_clone(self.wpn_fps_bow_elastic)
    self.wpn_fps_bow_elastic_upg_primary.unit = "units/mods/weapons/wpn_fps_spe_storm_bow/wpn_fps_spe_storm_bow"
    self.wpn_fps_bow_elastic_upg_primary.default_blueprint = {
        "wpn_fps_spe_storm_bow_base",
        "wpn_fps_spe_storm_bow_bone_base",
        "wpn_fps_spe_storm_bow_elec_base",
        "wpn_fps_bow_elastic_m_standard",
    }
    self.wpn_fps_bow_elastic_upg_primary.uses_parts = self.wpn_fps_bow_elastic_upg_primary.default_blueprint
    self.wpn_fps_bow_elastic_upg_secondary = deep_clone(self.wpn_fps_bow_elastic_upg_primary)
    self.wpn_fps_bow_elastic_upg_secondary.unit = "units/mods/weapons/wpn_fps_spe_storm_bow/wpn_fps_spe_storm_bow_secondary"
    self.wpn_fps_bow_elastic_upg_primary_npc = deep_clone(self.wpn_fps_bow_elastic_upg_primary)
	self.wpn_fps_bow_elastic_upg_primary_npc.unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic_npc"
    self.wpn_fps_bow_elastic_upg_primary_npc.skip_thq_parts = true
    self.wpn_fps_bow_elastic_upg_secondary_npc = deep_clone(self.wpn_fps_bow_elastic_upg_secondary)
	self.wpn_fps_bow_elastic_upg_secondary_npc.unit = "units/pd2_dlc_ram/weapons/wpn_fps_bow_elastic/wpn_fps_bow_elastic_npc"
	self.wpn_fps_bow_elastic_upg_secondary_npc.skip_thq_parts = true


	self.wpn_fps_pis_stryk_upg_primary = deep_clone(self.wpn_fps_pis_g18c)
    self.wpn_fps_pis_stryk_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_stryk_upg_primary"
	self.wpn_fps_pis_stryk_upg_primary.default_blueprint = {
		"wpn_fps_pis_g18c_body_frame",
		"wpn_fps_pis_g18c_b_standard",
		"wpn_fps_pis_g18c_m_mag_17rnd",
		"wpn_fps_pis_g18c_s_stock",
		"wpn_fps_upg_fl_pis_laser"
    }
	self.wpn_fps_pis_stryk_upg_secondary = deep_clone(self.wpn_fps_pis_stryk_upg_primary)
    self.wpn_fps_pis_stryk_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_stryk_upg_secondary"
	self.wpn_fps_pis_stryk_upg_primary_npc = deep_clone(self.wpn_fps_pis_stryk_upg_primary)
	self.wpn_fps_pis_stryk_upg_primary_npc.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c_npc"
    self.wpn_fps_pis_stryk_upg_secondary_npc = deep_clone(self.wpn_fps_pis_stryk_upg_secondary)
	self.wpn_fps_pis_stryk_upg_secondary_npc.unit = "units/payday2/weapons/wpn_fps_pis_g18c/wpn_fps_pis_g18c_npc"


    self.wpn_fps_ass_g3_upg_primary = deep_clone(self.wpn_fps_ass_g3_primary)
    self.wpn_fps_ass_g3_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_g3_upg_primary"
    self.wpn_fps_ass_g3_upg_primary.default_blueprint = {
			"wpn_fps_ass_g3_b_sniper",
			"wpn_fps_ass_g3_body_lower",
			"wpn_fps_ass_g3_body_upper",
			"wpn_fps_ass_g3_fg_retro_plastic",
			"wpn_fps_ass_g3_g_sniper",
			"wpn_fps_ass_g3_m_mag",
			"wpn_fps_ass_g3_s_sniper",
			"wpn_fps_upg_fl_ass_laser",
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_o_acog"
    }
    self.wpn_fps_ass_g3_upg_primary_npc = deep_clone(self.wpn_fps_ass_g3_upg_primary)
    self.wpn_fps_ass_g3_upg_primary_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"
    self.wpn_fps_ass_g3_upg_secondary = deep_clone(self.wpn_fps_ass_g3_upg_primary)
    self.wpn_fps_ass_g3_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_g3_upg_secondary"
    self.wpn_fps_ass_g3_upg_secondary_npc = deep_clone(self.wpn_fps_ass_g3_upg_secondary)
    self.wpn_fps_ass_g3_upg_secondary_npc.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3/wpn_fps_ass_g3_npc"

    self.wpn_fps_ass_tar21_upg_primary = deep_clone(self.wpn_fps_ass_tar21_primary)
    self.wpn_fps_ass_tar21_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_tar21_upg_primary"
    self.wpn_fps_ass_tar21_upg_primary.default_blueprint = {
        "wpn_fps_ass_komodo_b_standard",
        "wpn_fps_ass_komodo_body",
        "wpn_fps_ass_komodo_grip_standard",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_fl_ass_laser",
        "wpn_fps_ass_komodo_dh",
        "wpn_fps_upg_m4_m_quad",
        "wpn_fps_upg_o_reflex"
    }
    self.wpn_fps_ass_tar21_upg_primary_npc = deep_clone(self.wpn_fps_ass_tar21_upg_primary)
    self.wpn_fps_ass_tar21_upg_primary_npc.unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo_npc"
    self.wpn_fps_ass_tar21_upg_secondary = deep_clone(self.wpn_fps_ass_tar21_upg_primary)
    self.wpn_fps_ass_tar21_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_tar21_upg_secondary"
    self.wpn_fps_ass_tar21_upg_secondary_npc = deep_clone(self.wpn_fps_ass_tar21_upg_secondary)
    self.wpn_fps_ass_tar21_upg_secondary_npc.unit = "units/pd2_dlc_tar/weapons/wpn_fps_ass_komodo/wpn_fps_ass_komodo_npc"

    self.wpn_fps_lmg_par_upg_primary = deep_clone(self.wpn_fps_ass_tar21_primary)
    self.wpn_fps_lmg_par_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_par_upg_primary"
    self.wpn_fps_lmg_par_upg_primary.default_blueprint = {
        "wpn_fps_lmg_svinet_b_standard",
        "wpn_fps_lmg_par_body_standard",
        "wpn_fps_lmg_par_m_standard",
        "wpn_fps_lmg_svinet_s_legend",
        "wpn_fps_lmg_par_upper_reciever",
        "wpn_fps_upg_bp_lmg_lionbipod",
        "wpn_fps_upg_fl_ass_utg"
    }
    self.wpn_fps_lmg_par_upg_primary_npc = deep_clone(self.wpn_fps_lmg_par_upg_primary)
    self.wpn_fps_lmg_par_upg_primary_npc.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par_npc"
    self.wpn_fps_lmg_par_upg_secondary = deep_clone(self.wpn_fps_lmg_par_upg_primary)
    self.wpn_fps_lmg_par_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_par_upg_secondary"
    self.wpn_fps_lmg_par_upg_secondary_npc = deep_clone(self.wpn_fps_lmg_par_upg_secondary)
    self.wpn_fps_lmg_par_upg_secondary_npc.unit = "units/pd2_dlc_par/weapons/wpn_fps_lmg_par/wpn_fps_lmg_par_npc"

    self.wpn_fps_pis_packrat_upg_primary = deep_clone(self.wpn_fps_pis_packrat_primary)
    self.wpn_fps_pis_packrat_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_packrat_upg_primary"
	self.wpn_fps_pis_packrat_upg_primary.default_blueprint = {
        "wpn_fps_pis_packrat_b_standard",
		"wpn_fps_pis_packrat_body_standard",
		"wpn_fps_pis_packrat_bolt_standard",
		"wpn_fps_pis_packrat_m_standard",
		"wpn_fps_pis_packrat_o_standard",
		"wpn_fps_pis_packrat_sl_standard",
		"wpn_fps_pis_packrat_o_expert",
		"wpn_fps_upg_fl_pis_laser"
    }
    self.wpn_fps_pis_packrat_upg_secondary = deep_clone(self.wpn_fps_pis_packrat_primary)
    self.wpn_fps_pis_packrat_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_packrat_upg_secondary"
    self.wpn_fps_pis_packrat_upg_primary_npc = deep_clone(self.wpn_fps_pis_packrat_upg_primary)
    self.wpn_fps_pis_packrat_upg_primary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_x_packrat/wpn_fps_x_packrat_npc"
    self.wpn_fps_pis_packrat_upg_secondary_npc = deep_clone(self.wpn_fps_pis_packrat_upg_secondary)
	self.wpn_fps_pis_packrat_upg_secondary_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_x_packrat/wpn_fps_x_packrat_npc"
	
	self.wpn_fps_spe_raygun_upg_primary = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_upg_primary.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_upg_primary"
    self.wpn_fps_spe_raygun_upg_secondary = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_upg_secondary.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_upg_secondary"
    self.wpn_fps_spe_raygun_upg_primary_npc = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_upg_primary_npc.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_npc"
    self.wpn_fps_spe_raygun_upg_secondary_npc = deep_clone(self.wpn_fps_spe_raygun_primary)
    self.wpn_fps_spe_raygun_upg_secondary_npc.unit = "units/mods/weapons/wpn_fps_spe_raygun/wpn_fps_spe_raygun_npc"
end

function WeaponFactoryTweakData:_define_sights()
    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m16_upg_primary = {
        translation = Vector3(0, 0, -0.12)
    }
    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m16_upg_secondary = {
        translation = Vector3(0, 0, -0.12)
    }
	
	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin_upg_primary = {
        translation = Vector3(0, -28, -4.3)
    }
    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin_upg_secondary = {
        translation = Vector3(0, -28, -4.3)
    }
    
    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m14_upg_primary = {
        translation = Vector3(-0.02, -15, -3.85)
    }

    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_m14_upg_secondary = {
        translation = Vector3(-0.02, -15, -3.85)
    }

    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g3_upg_primary = {
        translation = Vector3(0, 0, -3),
    }

    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_g3_upg_secondary = {
        translation = Vector3(0, 0, -3),
    }

	self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_m95_upg_primary = {
        translation = Vector3(0, -1, -3.8),
    }
	
    self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_m95_upg_secondary = {
        translation = Vector3(0, -1, -3.85),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_mp9_upg_primary = {
        translation = Vector3(0, 0, -3.47),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_mp9_upg_secondary = {
        translation = Vector3(0, 0, -3.47),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_aug_upg_primary = {
        translation = Vector3(0, 0, -2.8),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_aug_upg_secondary = {
        translation = Vector3(0, 0, -2.8),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_p90_upg_primary = {
        translation = Vector3(0, 0, -2.97),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_p90_upg_secondary = {
        translation = Vector3(0, 0, -2.97),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_scar_upg_primary = {
        translation = Vector3(0, 0, -0.25),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_scar_upg_secondary = {
        translation = Vector3(0, 0, -0.25),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_thompson_upg_primary = {
        translation = Vector3(0, -24, -4.2),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_thompson_upg_secondary = {
        translation = Vector3(0, -24, -4.2),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_flint_upg_primary = {
        translation = Vector3(0, 5, -2.65),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_flint_upg_secondary = {
        translation = Vector3(0, 5, -2.65),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_74_upg_primary = {
        translation = Vector3(0, 0, -3.1),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_74_upg_secondary = {
        translation = Vector3(0, 0, -3.1),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_ching_upg_primary = {
        translation = Vector3(0, 5, -2.77),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_ching_upg_secondary = {
        translation = Vector3(0, 5, -2.77),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_shot_r870_upg_primary = {
        translation = Vector3(0.01, 0, -3.3),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_shot_r870_upg_secondary = {
        translation = Vector3(0.01, 0, -3.3),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_erma_upg_primary = {
        translation = Vector3(0, 5, -3.85),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_erma_upg_secondary = {
        translation = Vector3(0, 5, -3.85),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_fal_upg_primary = {
        translation = Vector3(0, 7, -3.5),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_ass_fal_upg_secondary = {
        translation = Vector3(0, 7, -3.5),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_schakal_upg_primary = {
        translation = Vector3(0, 0, -2.8),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_schakal_upg_secondary = {
        translation = Vector3(0, 0, -2.8),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_tec9_upg_primary = {
        translation = Vector3(0, 0, -4.9),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_smg_tec9_upg_secondary = {
        translation = Vector3(0, 0, -4.9),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_pis_judge_upg_primary = {
        translation = Vector3(-0.02, -10, -5.406),
    }
	
	self.parts.wpn_fps_upg_o_reflex.stance_mod.wpn_fps_pis_judge_upg_secondary = {
        translation = Vector3(-0.02, -10, -5.406),
    }
	
end
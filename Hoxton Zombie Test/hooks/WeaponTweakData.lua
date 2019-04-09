local PRIMARY = 2
local SECONDARY = 1
local UNDERBARREL = 3

Hooks:PostHook(WeaponTweakData, "_init_new_weapons", "zm_init_new_weapons", function(self, weapon_data)
    self.nothing2_primary = deep_clone(self.m134)
    self.nothing2_primary.AMMO_PICKUP = {0, 0}
    self.nothing2_primary.timers.reload_not_empty = 0
    self.nothing2_primary.timers.reload_empty = 0
    self.nothing2_primary.timers.unequip = 0
    self.nothing2_primary.timers.equip = 0
    self.nothing2_primary.CLIP_AMMO_MAX = 0
    self.nothing2_primary.NR_CLIPS_MAX = 1
    self.nothing2_primary.fire_mode_data = {fire_rate = 10000}
    self.nothing2_primary.sounds.fire = nil
    self.nothing2_primary.sounds.fire_single = nil
    self.nothing2_primary.sounds.fire_auto = nil
    self.nothing2_primary.sounds.dryfire = nil
    self.nothing2_primary.sounds.enter_steelsight = nil
    self.nothing2_primary.sounds.leave_steelsight = nil
    self.nothing2_primary.stats = {
        zoom = 1,
		total_ammo_mod = 1,
		damage = 0,
		alert_size = 7,
		spread = 0,
		spread_moving = 0,
		recoil = 0,
		value = 1,
		extra_ammo = 51,
		reload = 11,
		suppression = 5,
		concealment = 30
    }

    self.wunderwaffe_primary = deep_clone(self.wa2000)
    self.wunderwaffe_primary.name_id = "wpn_waffe_name"
    self.wunderwaffe_primary.AMMO_PICKUP = {0, 0}
    self.wunderwaffe_primary.CLIP_AMMO_MAX = 3
    self.wunderwaffe_primary.NR_CLIPS_MAX = 6
    self.wunderwaffe_primary.AMMO_MAX = self.wunderwaffe_primary.CLIP_AMMO_MAX * self.wunderwaffe_primary.NR_CLIPS_MAX
    self.wunderwaffe_primary.FIRE_MODE = "single"
    self.wunderwaffe_primary.CAN_TOGGLE_FIREMODE = false
    self.wunderwaffe_primary.single = {fire_rate = 1}
    self.wunderwaffe_primary.fire_mode_data = {fire_rate = 1}
    self.wunderwaffe_primary.stats_modifiers = {damage = 1500}
    self.wunderwaffe_primary.muzzleflash = "effects/particles/weapons/wunder_fire"
    self.wunderwaffe_primary.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
    self.wunderwaffe_primary.sounds.fire = "wunderwaffe_fire"
    self.wunderwaffe_primary.sounds.fire_single = "wunderwaffe_fire"
    self.wunderwaffe_primary.sounds.dryfire = nil
    self.wunderwaffe_primary.timers = {
		reload_not_empty = 6,
		reload_empty = 6,
		unequip = 1,
		equip = 1
	}
    self.wunderwaffe_primary.animations.reload_name_id = "wa2000"
    self.wunderwaffe_primary.weapon_hold = "wa2000"
    self.wunderwaffe_primary.can_shoot_through_wall = false
    self.wunderwaffe_primary.can_shoot_through_enemy = false

    self.wunderwaffe_secondary = deep_clone(self.wunderwaffe_primary)
    self.wunderwaffe_secondary.use_data = {selection_index = 1}

    self.wunderwaffe_dg3_primary = deep_clone(self.wunderwaffe_primary)
    self.wunderwaffe_dg3_primary.name_id = "wpn_waffe_upg_name"
    self.wunderwaffe_dg3_primary.CLIP_AMMO_MAX = 6
    self.wunderwaffe_dg3_primary.muzzleflash = "effects/particles/weapons/wunder_dg3_fire"
    self.wunderwaffe_dg3_primary.NR_CLIPS_MAX = 6
    self.wunderwaffe_dg3_primary.AMMO_MAX = self.wunderwaffe_dg3_primary.CLIP_AMMO_MAX * self.wunderwaffe_dg3_primary.NR_CLIPS_MAX
    self.wunderwaffe_dg3_primary.timers = {
		reload_not_empty = 4.7,
		reload_empty = 4.7,
		unequip = 1,
		equip = 1
	}
    self.wunderwaffe_dg3_secondary = deep_clone(self.wunderwaffe_dg3_primary)
    self.wunderwaffe_dg3_secondary.use_data = {selection_index = 1}

    self.waffle_prim_crew = {
        usage = "is_sniper",
		anim_usage = "is_bullpup",
		sounds = {},
		use_data = {},
		auto = {}
    }
    self.waffle_prim_crew.categories = clone(self.wa2000.categories)
	self.waffle_prim_crew.sounds.prefix = "lakner_npc"
	self.waffle_prim_crew.use_data.selection_index = PRIMARY
	self.waffle_prim_crew.DAMAGE = 1
	self.waffle_prim_crew.muzzleflash = "effects/particles/weapons/wunder_fire"
	self.waffle_prim_crew.muzzleflash_silenced = "effects/particles/weapons/wunder_fire"
	self.waffle_prim_crew.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.waffle_prim_crew.CLIP_AMMO_MAX = 3
	self.waffle_prim_crew.NR_CLIPS_MAX = 6
	self.waffle_prim_crew.auto.fire_rate = 0.5
	self.waffle_prim_crew.hold = {
		"bullpup",
		"rifle"
	}
	self.waffle_prim_crew.alert_size = 5000
	self.waffle_prim_crew.suppression = 1
    self.waffle_prim_crew.FIRE_MODE = "single"
    
    self.waffle_seco_crew = clone(self.waffle_prim_crew)
    self.waffle_seco_crew.use_data.selection_index = SECONDARY

    self.waffle_dg3_prim_crew = clone(self.waffle_prim_crew)
    self.waffle_dg3_prim_crew.muzzleflash = "effects/particles/weapons/wunder_dg3_fire"
    self.waffle_dg3_prim_crew.muzzleflash_silenced = "effects/particles/weapons/wunder_dg3_fire"
    self.waffle_dg3_prim_crew.CLIP_AMMO_MAX = 6
    self.waffle_dg3_prim_crew.NR_CLIPS_MAX = 6
    
    self.waffle_dg3_seco_crew = clone(self.waffle_dg3_prim_crew)
    self.waffle_dg3_seco_crew.use_data.selection_index = SECONDARY

    self:_init_zm_new_weapons()
end)

function WeaponTweakData:_init_zm_new_weapons()
    self.colt_1911_primary = deep_clone(self.colt_1911)
    self.colt_1911_primary.name_id = "wpn_m1911_name"
    self.colt_1911_primary.animations.reload_name_id = "colt_1911"
    self.colt_1911_primary.weapon_hold = "colt_1911"
    self.colt_1911_primary.CLIP_AMMO_MAX = 7
    self.colt_1911_primary.NR_CLIPS_MAX = 10
    self.colt_1911_primary.AMMO_MAX = self.colt_1911_primary.CLIP_AMMO_MAX * self.colt_1911_primary.NR_CLIPS_MAX
    self.colt_1911_primary.stats_modifiers = {damage = 3}
    self.colt_1911_primary.use_data = {selection_index = PRIMARY}
    self.colt_1911_secondary = deep_clone(self.colt_1911_primary)
    self.colt_1911_secondary.use_data = {selection_index = SECONDARY}

    self.new_m14_primary = deep_clone(self.new_m14)
    self.new_m14_primary.animations.reload_name_id = "new_m14"
    self.new_m14_primary.weapon_hold = "new_m14"
    self.new_m14_primary.stats_modifiers = {damage = 2}
    self.new_m14_secondary = deep_clone(self.new_m14_primary)
    self.new_m14_secondary.use_data = {selection_index = SECONDARY}

    self.b682_primary = deep_clone(self.b682)
    self.b682_primary.animations.reload_name_id = "b682"
    self.b682_primary.weapon_hold = "b682"
    self.b682_primary.stats_modifiers = {damage = 2}
    self.b682_primary.NR_CLIPS_MAX = self.b682_primary.NR_CLIPS_MAX * 2
    self.b682_primary.AMMO_MAX = self.b682_primary.CLIP_AMMO_MAX * self.b682_primary.NR_CLIPS_MAX
    self.b682_secondary = deep_clone(self.b682_primary)
    self.b682_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.mp9_primary = deep_clone(self.mp9)
    self.mp9_primary.animations.reload_name_id = "mp9"
    self.mp9_primary.weapon_hold = "mp9"
    self.mp9_primary.stats_modifiers = {damage = 2}
    self.mp9_primary.use_data = {selection_index = PRIMARY}
    self.mp9_secondary = deep_clone(self.mp9_primary)
    self.mp9_secondary.use_data = {selection_index = SECONDARY}

    self.m95_primary = deep_clone(self.m95)
    self.m95_primary.animations.reload_name_id = "m95"
    self.m95_primary.weapon_hold = "m95"
    self.m95_primary.NR_CLIPS_MAX = self.m95_primary.NR_CLIPS_MAX * 2
    self.m95_primary.AMMO_MAX = self.m95_primary.CLIP_AMMO_MAX * self.m95_primary.NR_CLIPS_MAX
    self.m95_primary.stats_modifiers = {damage = 50}
    self.m95_secondary = deep_clone(self.m95_primary)
    self.m95_secondary.use_data = {selection_index = SECONDARY}
	
	
--ENTERING A WORLD OF PAIN AND SUFFERING
    self.amcar_primary = deep_clone(self.amcar)
    self.amcar_primary.animations.reload_name_id = "amcar"
    self.amcar_primary.weapon_hold = "m4"
    self.amcar_primary.stats_modifiers = {damage = 2}
    self.amcar_secondary = deep_clone(self.amcar_primary)
    self.amcar_secondary.use_data = {selection_index = SECONDARY}
	
    self.aug_primary = deep_clone(self.aug)
    self.aug_primary.animations.reload_name_id = "aug"
    self.aug_primary.weapon_hold = "aug"
    self.aug_primary.NR_CLIPS_MAX = self.aug_primary.NR_CLIPS_MAX * 2
    self.aug_primary.stats_modifiers = {damage = 2}
    self.aug_primary.AMMO_MAX = self.aug_primary.CLIP_AMMO_MAX * self.aug_primary.NR_CLIPS_MAX
    self.aug_secondary = deep_clone(self.aug_primary)
    self.aug_secondary.use_data = {selection_index = SECONDARY}
	
    self.fal_primary = deep_clone(self.fal)
    self.fal_primary.animations.reload_name_id = "fal"
    self.fal_primary.weapon_hold = "fal"
    self.fal_primary.stats_modifiers = {damage = 2}
    self.fal_primary.NR_CLIPS_MAX = self.fal_primary.NR_CLIPS_MAX * 2
    self.fal_primary.AMMO_MAX = self.fal_primary.CLIP_AMMO_MAX * self.fal_primary.NR_CLIPS_MAX
    self.fal_secondary = deep_clone(self.fal_primary)
    self.fal_secondary.use_data = {selection_index = SECONDARY}
	
    self.flint_primary = deep_clone(self.flint)
    self.flint_primary.animations.reload_name_id = "flint"
    self.flint_primary.weapon_hold = "flint"
    self.flint_primary.stats_modifiers = {damage = 2}
    self.flint_primary.NR_CLIPS_MAX = self.flint_primary.NR_CLIPS_MAX * 3
    self.flint_primary.AMMO_MAX = self.flint_primary.CLIP_AMMO_MAX * self.flint_primary.NR_CLIPS_MAX
    self.flint_secondary = deep_clone(self.flint_primary)
    self.flint_secondary.use_data = {selection_index = SECONDARY}
	
    self.m16_primary = deep_clone(self.m16)
    self.m16_primary.animations.reload_name_id = "m16"
    self.m16_primary.weapon_hold = "m4"
    self.m16_primary.stats_modifiers = {damage = 2}
    self.m16_primary.NR_CLIPS_MAX = self.m16_primary.NR_CLIPS_MAX * 3
    self.m16_primary.AMMO_MAX = self.m16_primary.CLIP_AMMO_MAX * self.m16_primary.NR_CLIPS_MAX
    self.m16_secondary = deep_clone(self.m16_primary)
    self.m16_secondary.use_data = {selection_index = SECONDARY}
	
    self.scar_primary = deep_clone(self.scar)
    self.scar_primary.animations.reload_name_id = "scar"
    self.scar_primary.weapon_hold = "m4"
    self.scar_primary.stats_modifiers = {damage = 2}
    self.scar_primary.NR_CLIPS_MAX = self.scar_primary.NR_CLIPS_MAX * 2
    self.scar_primary.AMMO_MAX = self.scar_primary.CLIP_AMMO_MAX * self.scar_primary.NR_CLIPS_MAX
    self.scar_secondary = deep_clone(self.scar_primary)
    self.scar_secondary.use_data = {selection_index = SECONDARY}
	
    self.hk21_primary = deep_clone(self.hk21)
    self.hk21_primary.animations.reload_name_id = "hk21"
    self.hk21_primary.weapon_hold = "hk21"
    self.hk21_primary.stats_modifiers = {damage = 2}
    self.hk21_secondary = deep_clone(self.hk21_primary)
    self.hk21_secondary.use_data = {selection_index = SECONDARY}
	
    self.m249_primary = deep_clone(self.m249)
    self.m249_primary.animations.reload_name_id = "m249"
    self.m249_primary.weapon_hold = "m249"
    self.m249_primary.stats_modifiers = {damage = 2}
    self.m249_secondary = deep_clone(self.m249_primary)
    self.m249_secondary.use_data = {selection_index = SECONDARY}
	
    self.breech_primary = deep_clone(self.breech)
    self.breech_primary.animations.reload_name_id = "breech"
    self.breech_primary.weapon_hold = "breech"
    self.breech_primary.stats_modifiers = {damage = 2}
    self.breech_primary.NR_CLIPS_MAX = self.breech_primary.NR_CLIPS_MAX * 2
    self.breech_primary.AMMO_MAX = self.breech_primary.CLIP_AMMO_MAX * self.breech_primary.NR_CLIPS_MAX
    self.breech_primary.use_data = {selection_index = PRIMARY}
    self.breech_secondary = deep_clone(self.breech_primary)
    self.breech_secondary.use_data = {selection_index = SECONDARY}
	
    self.deagle_primary = deep_clone(self.deagle)
    self.deagle_primary.animations.reload_name_id = "deagle"
    self.deagle_primary.weapon_hold = "deagle"
    self.deagle_primary.stats_modifiers = {damage = 2}
    self.deagle_primary.NR_CLIPS_MAX = self.deagle_primary.NR_CLIPS_MAX * 2
    self.deagle_primary.AMMO_MAX = self.deagle_primary.CLIP_AMMO_MAX * self.deagle_primary.NR_CLIPS_MAX
    self.deagle_primary.use_data = {selection_index = PRIMARY}
    self.deagle_secondary = deep_clone(self.deagle_primary)
    self.deagle_secondary.use_data = {selection_index = SECONDARY}
	
    self.judge_primary = deep_clone(self.judge)
    self.judge_primary.animations.reload_name_id = "judge"
    self.judge_primary.weapon_hold = "raging_bull"
    self.judge_primary.stats_modifiers = {damage = 2}
    self.judge_primary.NR_CLIPS_MAX = self.judge_primary.NR_CLIPS_MAX * 2
    self.judge_primary.AMMO_MAX = self.judge_primary.CLIP_AMMO_MAX * self.judge_primary.NR_CLIPS_MAX
    self.judge_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.judge_secondary = deep_clone(self.judge_primary)
    self.judge_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.peacemaker_primary = deep_clone(self.peacemaker)
    self.peacemaker_primary.animations.reload_name_id = "peacemaker"
    self.peacemaker_primary.weapon_hold = "peacemaker"
    self.peacemaker_primary.NR_CLIPS_MAX = self.peacemaker_primary.NR_CLIPS_MAX
    self.peacemaker_primary.AMMO_MAX = self.peacemaker_primary.CLIP_AMMO_MAX * self.peacemaker_primary.NR_CLIPS_MAX
    self.peacemaker_primary.use_data = {selection_index = PRIMARY}    
    self.peacemaker_primary.stats_modifiers = {damage = 2} -- it was 1 before; wtf?
    self.peacemaker_secondary = deep_clone(self.peacemaker_primary)
    self.peacemaker_secondary.use_data = {selection_index = SECONDARY}

    self.new_raging_bull_primary = deep_clone(self.new_raging_bull)
    self.new_raging_bull_primary.animations.reload_name_id = "raging_bull"
    self.new_raging_bull_primary.weapon_hold = "raging_bull"
    self.new_raging_bull_primary.stats_modifiers = {damage = 2}
    self.new_raging_bull_primary.NR_CLIPS_MAX = self.new_raging_bull_primary.NR_CLIPS_MAX
    self.new_raging_bull_primary.AMMO_MAX = self.new_raging_bull_primary.CLIP_AMMO_MAX * self.new_raging_bull_primary.NR_CLIPS_MAX
    self.new_raging_bull_primary.use_data = {selection_index = PRIMARY}    
    self.new_raging_bull_secondary = deep_clone(self.new_raging_bull_primary)
    self.new_raging_bull_secondary.use_data = {selection_index = SECONDARY}
	
    self.striker_primary = deep_clone(self.striker)
    self.striker_primary.animations.reload_name_id = "striker"
    self.striker_primary.weapon_hold = "striker"
    self.striker_primary.NR_CLIPS_MAX = self.striker_primary.NR_CLIPS_MAX
    self.striker_primary.AMMO_MAX = self.striker_primary.CLIP_AMMO_MAX * self.striker_primary.NR_CLIPS_MAX
    self.striker_primary.stats.damage = 120
    self.striker_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.striker_secondary = deep_clone(self.striker_primary)
    self.striker_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}
	
    self.p90_primary = deep_clone(self.p90)
    self.p90_primary.animations.reload_name_id = "p90"
    self.p90_primary.weapon_hold = "p90"
    self.p90_primary.stats_modifiers = {damage = 2}
    self.p90_primary.NR_CLIPS_MAX = self.p90_primary.NR_CLIPS_MAX * 2
    self.p90_primary.AMMO_MAX = self.p90_primary.CLIP_AMMO_MAX * self.p90_primary.NR_CLIPS_MAX
    self.p90_primary.use_data = {selection_index = PRIMARY}
    self.p90_secondary = deep_clone(self.p90_primary)
    self.p90_secondary.use_data = {selection_index = SECONDARY}
	
    self.m1928_primary = deep_clone(self.m1928)
    self.m1928_primary.animations.reload_name_id = "m1928"
    self.m1928_primary.weapon_hold = "tommy"
    self.m1928_primary.stats_modifiers = {damage = 2}
    self.m1928_primary.NR_CLIPS_MAX = self.m1928_primary.NR_CLIPS_MAX * 2
    self.m1928_primary.AMMO_MAX = self.m1928_primary.CLIP_AMMO_MAX * self.m1928_primary.NR_CLIPS_MAX
    self.m1928_primary.use_data = {selection_index = PRIMARY}
    self.m1928_secondary = deep_clone(self.m1928_primary)
    self.m1928_secondary.use_data = {selection_index = SECONDARY}

    -- Nepgear best waifu

    self.rpg7_primary = deep_clone(self.rpg7)
    self.rpg7_primary.animations.reload_name_id = "rpg7"
    self.rpg7_primary.weapon_hold = "rpg7"
    self.rpg7_primary.stats_modifiers = {damage = 2}
    self.rpg7_primary.CLIP_AMMO_MAX = 1
	self.rpg7_primary.NR_CLIPS_MAX = 8
	self.rpg7_primary.AMMO_MAX = self.rpg7_primary.CLIP_AMMO_MAX * self.rpg7_primary.NR_CLIPS_MAX
    self.rpg7_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.rpg7_secondary = deep_clone(self.rpg7_primary)
    self.rpg7_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.roach_primary = deep_clone(self.b682)
    self.roach_primary.name_id = "wpn_roach_name"
    self.roach_primary.animations.reload_name_id = "b682"
    self.roach_primary.sounds.fire = "roach_fire"
    self.roach_primary.sounds.fire_single = "roach_fire"
    self.roach_primary.weapon_hold = "siltstone"
    self.roach_primary.rays = 1
    self.roach_primary.CLIP_AMMO_MAX = 1
    self.roach_primary.NR_CLIPS_MAX = 20
    self.roach_primary.AMMO_MAX = self.roach_primary.CLIP_AMMO_MAX * self.roach_primary.NR_CLIPS_MAX
    self.roach_primary.damage_near = 100000
    self.roach_primary.damage_far = 100000
    self.roach_primary.ignore_damage_upgrades = true
    self.roach_primary.armor_piercing_chance = 1
    self.roach_primary.can_shoot_through_enemy = true
    self.roach_primary.can_shoot_through_wall = true
    self.roach_primary.can_shoot_through_shield = true
    self.roach_primary.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
    self.roach_primary.stats.damage = 90
    self.roach_primary.stats.spread = 26
    self.roach_primary.stats.spread_moving = 25
    self.roach_primary.stats.recoil = 5
    self.roach_primary.stats.concealment = 1
    self.roach_primary.stats_modifiers = {damage = 1000}
    self.roach_primary.fire_mode_data = {fire_rate = 2}
    self.roach_primary.kick = {
    standing = {
		6.0,
		4.0,
		4.0,
		-4.0
    }, 
    crouching = {
        6.0,
		4.0,
		4.0,
		-4.0
    },
    steelsight = {
        6.0,
		4.0,
		4.0,
		-4.0
    }}
    self.roach_secondary = deep_clone(self.roach_primary)
    self.roach_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	-- What about Nepgear with a shovel? :shovelthinking:
	
    self.ak74_primary = deep_clone(self.ak74)
    self.ak74_primary.animations.reload_name_id = "ak74"
    self.ak74_primary.weapon_hold = "ak47"    --gee, that's not confusing at all
    self.ak74_primary.stats_modifiers = {damage = 2}
    self.ak74_primary.NR_CLIPS_MAX = self.ak74_primary.NR_CLIPS_MAX * 2
    self.ak74_primary.AMMO_MAX = self.ak74_primary.CLIP_AMMO_MAX * self.ak74_primary.NR_CLIPS_MAX
    self.ak74_primary.use_data = {selection_index = PRIMARY}
    self.ak74_secondary = deep_clone(self.ak74_primary)
    self.ak74_secondary.use_data = {selection_index = SECONDARY}
    
    self.ching_primary = deep_clone(self.ching)
    self.ching_primary.animations.reload_name_id = "ching"
    self.ching_primary.weapon_hold = "ching"
    self.ching_primary.stats_modifiers = {damage = 2}
    self.ching_primary.NR_CLIPS_MAX = self.ching_primary.NR_CLIPS_MAX
    self.ching_primary.AMMO_MAX = self.ching_primary.CLIP_AMMO_MAX * self.ching_primary.NR_CLIPS_MAX
    self.ching_primary.use_data = {selection_index = PRIMARY}
    self.ching_secondary = deep_clone(self.ching_primary)
    self.ching_secondary.use_data = {selection_index = SECONDARY}
    
    self.lemming_primary = deep_clone(self.lemming)
    self.lemming_primary.name_id = "wpn_lemming_name"
    self.lemming_primary.animations.reload_name_id = "lemming"
    self.lemming_primary.weapon_hold = "packrat"
    self.lemming_primary.stats_modifiers = {damage = 2}
    self.lemming_primary.NR_CLIPS_MAX = self.lemming_primary.NR_CLIPS_MAX * 2
    self.lemming_primary.AMMO_MAX = self.lemming_primary.CLIP_AMMO_MAX * self.lemming_primary.NR_CLIPS_MAX
    self.lemming_primary.armor_piercing_chance = 0
    self.lemming_primary.can_shoot_through_enemy = false 
    self.lemming_primary.can_shoot_through_wall = false 
    self.lemming_primary.can_shoot_through_shield = false 
    self.lemming_primary.use_data = {selection_index = PRIMARY}
    self.lemming_secondary = deep_clone(self.lemming_primary)
    self.lemming_secondary.use_data = {selection_index = SECONDARY}
    
    self.m37_primary = deep_clone(self.m37)
    self.m37_primary.animations.reload_name_id = "m37"
    self.m37_primary.weapon_hold = "m37"
    self.m37_primary.stats_modifiers = {damage = 2}
    self.m37_primary.NR_CLIPS_MAX = self.m37_primary.NR_CLIPS_MAX * 2
    self.m37_primary.AMMO_MAX = self.m37_primary.CLIP_AMMO_MAX * self.m37_primary.NR_CLIPS_MAX
    self.m37_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.m37_secondary = deep_clone(self.m37_primary)
    self.m37_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
    
    self.r870_primary = deep_clone(self.r870)
    self.r870_primary.animations.reload_name_id = "r870_shotgun"
    self.r870_primary.weapon_hold = "r870_shotgun"
    self.r870_primary.stats_modifiers = {damage = 2}
    self.r870_primary.NR_CLIPS_MAX = self.r870_primary.NR_CLIPS_MAX * 2
    self.r870_primary.AMMO_MAX = self.r870_primary.CLIP_AMMO_MAX * self.r870_primary.NR_CLIPS_MAX
    self.r870_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.r870_secondary = deep_clone(self.r870_primary)
    self.r870_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
    
    self.erma_primary = deep_clone(self.erma)
    self.erma_primary.animations.reload_name_id = "erma"
    self.erma_primary.weapon_hold = "erma"
    self.erma_primary.stats_modifiers = {damage = 2}
    self.erma_primary.NR_CLIPS_MAX = self.erma_primary.NR_CLIPS_MAX * 3
    self.erma_primary.AMMO_MAX = self.erma_primary.CLIP_AMMO_MAX * self.erma_primary.NR_CLIPS_MAX
    self.erma_primary.use_data = {selection_index = PRIMARY}
    self.erma_secondary = deep_clone(self.erma_primary)
    self.erma_secondary.use_data = {selection_index = SECONDARY}
    
    self.schakal_primary = deep_clone(self.schakal)
    self.schakal_primary.animations.reload_name_id = "schakal"
    self.schakal_primary.weapon_hold = "schakal"
    self.schakal_primary.NR_CLIPS_MAX = self.schakal_primary.NR_CLIPS_MAX * 2
    self.schakal_primary.AMMO_MAX = self.schakal_primary.CLIP_AMMO_MAX * self.schakal_primary.NR_CLIPS_MAX
    self.schakal_primary.use_data = {selection_index = PRIMARY}
    self.schakal_secondary = deep_clone(self.schakal_primary)
    self.schakal_secondary.use_data = {selection_index = SECONDARY}
    
    self.tec9_primary = deep_clone(self.tec9)
    self.tec9_primary.animations.reload_name_id = "tec9"
    self.tec9_primary.weapon_hold = "tec9"
    self.tec9_primary.stats_modifiers = {damage = 2}
    self.tec9_primary.use_data = {selection_index = PRIMARY}
    self.tec9_secondary = deep_clone(self.tec9_primary)
    self.tec9_secondary.use_data = {selection_index = SECONDARY}

    self.mosin_primary = deep_clone(self.mosin)
    self.mosin_primary.animations.reload_name_id = "mosin"
    self.mosin_primary.weapon_hold = "mosin"
	self.mosin_primary.can_shoot_through_enemy = false 
    self.mosin_primary.can_shoot_through_wall = false 
    self.mosin_primary.can_shoot_through_shield = false 
    self.mosin_primary.stats_modifiers = {damage = 0.75}
    self.mosin_primary.NR_CLIPS_MAX = self.mosin_primary.NR_CLIPS_MAX * 2
    self.mosin_primary.AMMO_MAX = self.mosin_primary.CLIP_AMMO_MAX * self.mosin_primary.NR_CLIPS_MAX
    self.mosin_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.mosin_secondary = deep_clone(self.mosin_primary)
    self.mosin_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}
	
	self.g22c_primary = deep_clone(self.g22c)
    self.g22c_primary.animations.reload_name_id = "glock"
    self.g22c_primary.weapon_hold = "glock"
    self.g22c_primary.CLIP_AMMO_MAX = 16
    self.g22c_primary.NR_CLIPS_MAX = 5
    self.g22c_primary.AMMO_MAX = self.g22c_primary.CLIP_AMMO_MAX * self.g22c_primary.NR_CLIPS_MAX
    self.g22c_primary.stats_modifiers = {damage = 1}
	self.g22c_primary.use_data = {selection_index = PRIMARY}
	self.g22c_secondary = deep_clone(self.g22c_primary)
    self.g22c_secondary.use_data = {selection_index = SECONDARY}

    self.deamon_primary = deep_clone(self.boot)
    self.deamon_primary.animations.reload_name_id = "boot"
    self.deamon_primary.weapon_hold = "boot"
    self.deamon_primary.stats_modifiers = {damage = 2}
    self.deamon_primary.NR_CLIPS_MAX = self.deamon_primary.NR_CLIPS_MAX * 2
    self.deamon_primary.AMMO_MAX = self.deamon_primary.CLIP_AMMO_MAX * self.deamon_primary.NR_CLIPS_MAX
    self.deamon_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.deamon_secondary= deep_clone(self.deamon_primary)
    self.deamon_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.elastic_primary = deep_clone(self.elastic)
    self.elastic_primary.animations.reload_name_id = "elastic"
    self.elastic_primary.weapon_hold = "elastic"
    self.elastic_primary.stats_modifiers = {damage = 3}
    self.elastic_primary.NR_CLIPS_MAX = self.elastic_primary.NR_CLIPS_MAX * 2
    self.elastic_primary.AMMO_MAX = self.elastic_primary.CLIP_AMMO_MAX * self.elastic_primary.NR_CLIPS_MAX
    self.elastic_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.elastic_primary.timers = {
        reload_not_empty = 1,
        reload_empty = 1
    }
    self.elastic_primary.charge_data = {
		max_t = 1
    }
    self.elastic_primary.bow_reload_speed_multiplier = 3
    self.elastic_secondary = deep_clone(self.elastic_primary)
    self.elastic_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}

    self.g3_primary = deep_clone(self.g3)
    self.g3_primary.animations.reload_name_id = "g3"
	self.g3_primary.animations.reload_name_id = "g3"
    self.g3_primary.weapon_hold = "g3"
    self.g3_primary.stats_modifiers = {damage = 1}
    self.g3_primary.NR_CLIPS_MAX = 8
    self.g3_primary.AMMO_MAX = self.g3_primary.CLIP_AMMO_MAX * self.g3_primary.NR_CLIPS_MAX
    self.g3_secondary = deep_clone(self.g3_primary)
    self.g3_secondary.use_data = {selection_index = SECONDARY}

    self.tar21_primary = deep_clone(self.komodo)
    self.tar21_primary.animations.reload_name_id = "komodo"
    self.tar21_primary.weapon_hold = "komodo"
    self.tar21_primary.stats_modifiers = {damage = 4}
    self.tar21_primary.NR_CLIPS_MAX = self.tar21_primary.NR_CLIPS_MAX * 2
    self.tar21_primary.AMMO_MAX = self.tar21_primary.CLIP_AMMO_MAX * self.tar21_primary.NR_CLIPS_MAX
    self.tar21_primary.use_data = {selection_index = PRIMARY}
    self.tar21_secondary = deep_clone(self.tar21_primary)
    self.tar21_secondary.use_data = {selection_index = SECONDARY}

    self.par_primary = deep_clone(self.par)
    self.par_primary.animations.reload_name_id = "par"
    self.par_primary.weapon_hold = "par"
    self.par_primary.stats_modifiers = {damage = 2}
    self.par_primary.use_data = {selection_index = PRIMARY}
    self.par_secondary = deep_clone(self.par_primary)
    self.par_secondary.use_data = {selection_index = SECONDARY}

    self.packrat_primary = deep_clone(self.packrat)
    self.packrat_primary.animations.reload_name_id = "packrat"
    self.packrat_primary.weapon_hold = "packrat"
    self.packrat_primary.stats_modifiers = {damage = 2}
    self.packrat_primary.use_data = {selection_index = PRIMARY}
    self.packrat_secondary = deep_clone(self.packrat_primary)
    self.packrat_secondary.use_data = {selection_index = SECONDARY}

    self.raygun_primary = deep_clone(self.breech)
    self.raygun_primary.name_id = "wpn_raygun"
    self.raygun_primary.sounds = {
        fire = "raygun_fire",
        fire_single = "raygun_fire",
        fire_auto = "raygun_fire",
        magazine_empty = "",
        use_fix = true,
        reload = {
            wp_breech_clip_slide_out = "raygun_out",
            wp_breech_clip_slide_in = "raygun_in",
            wp_breech_clip_take_new = "raygun_eject"
        }
    }
    self.raygun_primary.animations.reload_name_id = "breech"
    self.raygun_primary.ignore_damage_upgrades = true
    self.raygun_primary.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
    self.raygun_primary.muzzleflash = "effects/raygun_fire"
    self.raygun_primary.animations.ignore_fullreload = true
    self.raygun_primary.timers.reload_empty = 1.33
    self.raygun_primary.weapon_hold = "breech"
    self.raygun_primary.projectile_type = "raygun_blast"
    self.raygun_primary.CLIP_AMMO_MAX = 20
    self.raygun_primary.NR_CLIPS_MAX = 9
    self.raygun_primary.AMMO_MAX = self.raygun_primary.CLIP_AMMO_MAX * self.raygun_primary.NR_CLIPS_MAX
    self.raygun_primary.stats.spread = 24
    self.raygun_primary.upgrade_blocks = {
        weapon = {
            "clip_ammo_increase"
        }
    }
    self.raygun_primary.stats_modifiers = {damage = 10}
    self.raygun_primary.fire_mode_data = {
		fire_rate = 0.331
    }
    self.raygun_primary.use_data = {selection_index = PRIMARY}

    self.raygun_secondary = deep_clone(self.raygun_primary)
    self.raygun_secondary.use_data = {selection_index = SECONDARY}

    self:_init_upgraded_zm_weapons()
end

function WeaponTweakData:_init_upgraded_zm_weapons()
    self.new_m14_upg_primary = deep_clone(self.new_m14_primary)
    self.new_m14_upg_primary.name_id = "wpn_m308_upg_name"
    self.new_m14_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.new_m14_upg_primary.CLIP_AMMO_MAX = 30
    self.new_m14_upg_primary.NR_CLIPS_MAX = 7
    self.new_m14_upg_primary.AMMO_MAX = self.new_m14_upg_primary.CLIP_AMMO_MAX * self.new_m14_upg_primary.NR_CLIPS_MAX
    self.new_m14_upg_primary.stats_modifiers = {damage = 8}
    self.new_m14_upg_primary.armor_piercing_chance = 1
    self.new_m14_upg_primary.can_shoot_through_enemy = true
    self.new_m14_upg_secondary = deep_clone(self.new_m14_upg_primary)
    self.new_m14_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m95_upg_primary = deep_clone(self.m95_primary)
    self.m95_upg_primary.name_id = "wpn_m95_upg_name"
    self.m95_upg_primary.CLIP_AMMO_MAX = 10
    self.m95_upg_primary.NR_CLIPS_MAX = 4
    self.m95_upg_primary.AMMO_MAX = self.m95_upg_primary.CLIP_AMMO_MAX * self.m95_upg_primary.NR_CLIPS_MAX
    self.m95_upg_primary.stats_modifiers = {damage = 100}
    self.m95_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m95_upg_secondary = deep_clone(self.m95_upg_primary)
    self.m95_upg_secondary.use_data = {selection_index = SECONDARY}

    self.colt_1911_upg_primary = deep_clone(self.arbiter)
    self.colt_1911_upg_primary.weapon_hold = "colt_1911"
    self.colt_1911_upg_primary.timers = {
		reload_not_empty = 1.47,
		reload_empty = 2.12,
		unequip = 0.5,
		equip = 0.35
	}
    self.colt_1911_upg_primary.animations = {
		fire = "recoil",
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		equip_id = "equip_glock",
		recoil_steelsight = true,
		magazine_empty = "last_recoil",
        reload_name_id = "colt_1911"
    }
    self.colt_1911_upg_primary.fire_mode_data = {fire_rate = 0.166}
    self.colt_1911_upg_primary.name_id = "wpn_m1911_upg_name"
    self.colt_1911_upg_primary.CLIP_AMMO_MAX = 12
    self.colt_1911_upg_primary.NR_CLIPS_MAX = 4
    self.colt_1911_upg_primary.AMMO_MAX = self.colt_1911_upg_primary.CLIP_AMMO_MAX * self.colt_1911_upg_primary.NR_CLIPS_MAX
    self.colt_1911_upg_primary.stats_modifiers = {damage = 20}
    self.colt_1911_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.colt_1911_upg_primary.use_data = {selection_index = PRIMARY}
    self.colt_1911_upg_secondary = deep_clone(self.colt_1911_upg_primary)
    self.colt_1911_upg_secondary.use_data = {selection_index = SECONDARY}

    self.b682_upg_primary = deep_clone(self.b682_primary)
    self.b682_upg_primary.name_id = "wpn_jocy_upg_name"
    self.b682_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.b682_upg_primary.stats_modifiers = {damage = 8}
    self.b682_upg_primary.CLIP_AMMO_MAX = 4
    self.b682_upg_primary.NR_CLIPS_MAX = 16
    self.b682_upg_primary.AMMO_MAX = self.b682_upg_primary.CLIP_AMMO_MAX * self.b682_upg_primary.NR_CLIPS_MAX
    self.b682_upg_secondary = deep_clone(self.b682_upg_primary)
    self.b682_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.mp9_upg_primary = deep_clone(self.mp9_primary)
    self.mp9_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.mp9_upg_primary.name_id = "wpn_mp9_upg_name"
    self.mp9_upg_primary.CLIP_AMMO_MAX = 64
    self.mp9_upg_primary.NR_CLIPS_MAX = 8
    self.mp9_upg_primary.AMMO_MAX = self.mp9_upg_primary.CLIP_AMMO_MAX * self.mp9_upg_primary.NR_CLIPS_MAX
    self.mp9_upg_primary.stats_modifiers = {damage = 8}
    self.mp9_upg_primary.use_data = {selection_index = PRIMARY}
    self.mp9_upg_secondary = deep_clone(self.mp9_upg_primary)
    self.mp9_upg_secondary.use_data = {selection_index = SECONDARY}

    self.rpg7_upg_primary = deep_clone(self.rpg7_primary)
    self.rpg7_upg_primary.name_id = "wpn_rpg7_upg_name"
    self.rpg7_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.rpg7_upg_primary.stats_modifiers = {damage = 10}
    self.rpg7_upg_primary.fire_mode_data = {fire_rate = 0.11}
    self.rpg7_upg_primary.CLIP_AMMO_MAX = 5
    self.rpg7_upg_primary.NR_CLIPS_MAX = 5
    self.rpg7_upg_primary.AMMO_MAX = self.rpg7_upg_primary.CLIP_AMMO_MAX * self.rpg7_upg_primary.NR_CLIPS_MAX
    self.rpg7_upg_secondary = deep_clone(self.rpg7_upg_primary)
    self.rpg7_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	
--for whom the shovel tolls
    self.amcar_upg_primary = deep_clone(self.amcar_primary)
    self.amcar_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.amcar_upg_primary.name_id = "wpn_amcar_upg_name"
    self.amcar_upg_primary.stats_modifiers = {damage = 10}
    self.amcar_upg_primary.CLIP_AMMO_MAX = 40
    self.amcar_upg_primary.NR_CLIPS_MAX = 9
    self.amcar_upg_primary.AMMO_MAX = self.amcar_upg_primary.CLIP_AMMO_MAX * self.amcar_upg_primary.NR_CLIPS_MAX
    self.amcar_upg_secondary = deep_clone(self.amcar_upg_primary)
    self.amcar_upg_secondary.use_data = {selection_index = SECONDARY}

    self.aug_upg_primary = deep_clone(self.aug_primary)
    self.aug_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.aug_upg_primary.stats_modifiers = {damage = 9}
    self.aug_upg_primary.CLIP_AMMO_MAX = 35
    self.aug_upg_primary.NR_CLIPS_MAX = 10
    self.aug_upg_primary.AMMO_MAX = self.aug_upg_primary.CLIP_AMMO_MAX * self.aug_upg_primary.NR_CLIPS_MAX
    self.aug_upg_secondary = deep_clone(self.aug_upg_primary)
    self.aug_upg_secondary.use_data = {selection_index = SECONDARY}

    self.fal_upg_primary = deep_clone(self.fal_primary)
    self.fal_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.fal_upg_primary.stats_modifiers = {damage = 8}
    self.fal_upg_primary.CLIP_AMMO_MAX = 30
    self.fal_upg_primary.NR_CLIPS_MAX = 7
    self.fal_upg_primary.AMMO_MAX = self.fal_upg_primary.CLIP_AMMO_MAX * self.fal_upg_primary.NR_CLIPS_MAX
    self.fal_upg_secondary = deep_clone(self.fal_upg_primary)
    self.fal_upg_secondary.use_data = {selection_index = SECONDARY}

    self.flint_upg_primary = deep_clone(self.flint_primary)
    self.flint_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.flint_upg_primary.stats_modifiers = {damage = 8}
    self.flint_upg_primary.CLIP_AMMO_MAX = 35
    self.flint_upg_primary.NR_CLIPS_MAX = 10
    self.flint_upg_primary.AMMO_MAX = self.flint_upg_primary.CLIP_AMMO_MAX * self.flint_upg_primary.NR_CLIPS_MAX
    self.flint_upg_secondary = deep_clone(self.flint_upg_primary)
    self.flint_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m16_upg_primary = deep_clone(self.m16_primary)
    self.m16_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m16_upg_primary.stats_modifiers = {damage = 8}
    self.m16_upg_primary.CLIP_AMMO_MAX = 50
    self.m16_upg_primary.NR_CLIPS_MAX = 8
    self.m16_upg_primary.AMMO_MAX = self.m16_upg_primary.CLIP_AMMO_MAX * self.m16_upg_primary.NR_CLIPS_MAX
    self.m16_upg_secondary = deep_clone(self.m16_upg_primary)
    self.m16_upg_secondary.use_data = {selection_index = SECONDARY}

    self.scar_upg_primary = deep_clone(self.scar_primary)
    self.scar_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.scar_upg_primary.stats_modifiers = {damage = 10}
    self.scar_upg_primary.CLIP_AMMO_MAX = 35
    self.scar_upg_primary.NR_CLIPS_MAX = 9
    self.scar_upg_primary.AMMO_MAX = self.scar_upg_primary.CLIP_AMMO_MAX * self.scar_upg_primary.NR_CLIPS_MAX
    self.scar_upg_secondary = deep_clone(self.scar_upg_primary)
    self.scar_upg_secondary.use_data = {selection_index = SECONDARY}

    self.hk21_upg_primary = deep_clone(self.hk21_primary)
    self.hk21_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.hk21_upg_primary.stats_modifiers = {damage = 8}
    self.hk21_upg_primary.CLIP_AMMO_MAX = 150
    self.hk21_upg_primary.NR_CLIPS_MAX = 6
    self.hk21_upg_primary.AMMO_MAX = self.hk21_upg_primary.CLIP_AMMO_MAX * self.hk21_upg_primary.NR_CLIPS_MAX
    self.hk21_upg_secondary = deep_clone(self.hk21_upg_primary)
    self.hk21_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m249_upg_primary = deep_clone(self.m249_primary)
    self.m249_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m249_upg_primary.stats_modifiers = {damage = 10}
    self.m249_upg_primary.CLIP_AMMO_MAX = 125
    self.m249_upg_primary.NR_CLIPS_MAX = 5
    self.m249_upg_primary.AMMO_MAX = self.m249_upg_primary.CLIP_AMMO_MAX * self.m249_upg_primary.NR_CLIPS_MAX
    self.m249_upg_secondary = deep_clone(self.m249_upg_primary)
    self.m249_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.breech_upg_primary = deep_clone(self.breech_primary)
    self.breech_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.breech_upg_primary.stats_modifiers = {damage = 14}
    self.breech_upg_primary.use_data = {selection_index = PRIMARY}
    self.breech_upg_primary.CLIP_AMMO_MAX = 16
    self.breech_upg_primary.NR_CLIPS_MAX = 6
    self.breech_upg_primary.AMMO_MAX = self.breech_upg_primary.CLIP_AMMO_MAX * self.breech_upg_primary.NR_CLIPS_MAX
    self.breech_upg_secondary = deep_clone(self.breech_upg_primary)
    self.breech_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.deagle_upg_primary = deep_clone(self.deagle_primary)
    self.deagle_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.deagle_upg_primary.stats_modifiers = {damage = 15}
    self.deagle_upg_primary.CLIP_AMMO_MAX = 10
    self.deagle_upg_primary.NR_CLIPS_MAX = 8
    self.deagle_upg_primary.use_data = {selection_index = PRIMARY}
    self.deagle_upg_primary.AMMO_MAX = self.deagle_upg_primary.CLIP_AMMO_MAX * self.deagle_upg_primary.NR_CLIPS_MAX
    self.deagle_upg_secondary = deep_clone(self.deagle_upg_primary)
    self.deagle_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.judge_upg_primary = deep_clone(self.judge_primary)
    self.judge_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.judge_upg_primary.name_id = "wpn_judge_upg_name"
    self.judge_upg_primary.stats_modifiers = {damage = 10}
    self.judge_upg_primary.CLIP_AMMO_MAX = 5
    self.judge_upg_primary.NR_CLIPS_MAX = 12
    self.judge_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.judge_upg_primary.AMMO_MAX = self.judge_upg_primary.CLIP_AMMO_MAX * self.judge_upg_primary.NR_CLIPS_MAX
    self.judge_upg_secondary = deep_clone(self.judge_upg_primary)
    self.judge_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.peacemaker_upg_primary = deep_clone(self.peacemaker_primary)
    self.peacemaker_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.peacemaker_upg_primary.stats_modifiers = {damage = 14}
    self.peacemaker_upg_primary.CLIP_AMMO_MAX = 6
    self.peacemaker_upg_primary.NR_CLIPS_MAX = 14
    self.peacemaker_upg_primary.armor_piercing_chance = 1
    self.peacemaker_upg_primary.can_shoot_through_enemy = true
    self.peacemaker_upg_primary.can_shoot_through_shield = true
    self.peacemaker_upg_primary.AMMO_MAX = self.peacemaker_upg_primary.CLIP_AMMO_MAX * self.peacemaker_upg_primary.NR_CLIPS_MAX
    self.peacemaker_upg_primary.use_data = {selection_index = PRIMARY}
    self.peacemaker_upg_secondary = deep_clone(self.peacemaker_upg_primary)
    self.peacemaker_upg_secondary.use_data = {selection_index = SECONDARY}

    self.new_raging_bull_upg_primary = deep_clone(self.new_raging_bull_primary)
    self.new_raging_bull_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.new_raging_bull_upg_primary.stats_modifiers = {damage = 16}
    self.new_raging_bull_upg_primary.CLIP_AMMO_MAX = 6
    self.new_raging_bull_upg_primary.NR_CLIPS_MAX = 10
    self.new_raging_bull_upg_primary.armor_piercing_chance = 1
    self.new_raging_bull_upg_primary.can_shoot_through_enemy = true
    self.new_raging_bull_upg_primary.can_shoot_through_shield = true
    self.new_raging_bull_upg_primary.AMMO_MAX = self.new_raging_bull_upg_primary.CLIP_AMMO_MAX * self.new_raging_bull_upg_primary.NR_CLIPS_MAX
    self.new_raging_bull_upg_primary.use_data = {selection_index = PRIMARY}
    self.new_raging_bull_upg_secondary = deep_clone(self.new_raging_bull_upg_primary)
    self.new_raging_bull_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.striker_upg_primary = deep_clone(self.striker_primary)
    self.striker_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.striker_upg_primary.stats_modifiers = {damage = 10}
    self.striker_upg_primary.CLIP_AMMO_MAX = 24
    self.striker_upg_primary.NR_CLIPS_MAX = 5
    self.striker_upg_primary.AMMO_MAX = self.striker_upg_primary.CLIP_AMMO_MAX * self.striker_upg_primary.NR_CLIPS_MAX
    self.striker_upg_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.striker_upg_secondary = deep_clone(self.striker_upg_primary)
    self.striker_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}
	
    self.p90_upg_primary = deep_clone(self.p90_primary)
    self.p90_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.p90_upg_primary.name_id = "wpn_p90_upg_name"
    self.p90_upg_primary.stats_modifiers = {damage = 10}
    self.p90_upg_primary.CLIP_AMMO_MAX = 50
    self.p90_upg_primary.NR_CLIPS_MAX = 9
    self.p90_upg_primary.AMMO_MAX = self.p90_upg_primary.CLIP_AMMO_MAX * self.p90_upg_primary.NR_CLIPS_MAX
    self.p90_upg_primary.use_data = {selection_index = PRIMARY}
    self.p90_upg_secondary = deep_clone(self.p90_upg_primary)
    self.p90_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.m1928_upg_primary = deep_clone(self.m1928_primary)
    self.m1928_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m1928_upg_primary.stats_modifiers = {damage = 10}
    self.m1928_upg_primary.CLIP_AMMO_MAX = 100
    self.m1928_upg_primary.NR_CLIPS_MAX = 4
    self.m1928_upg_primary.AMMO_MAX = self.m1928_upg_primary.CLIP_AMMO_MAX * self.m1928_upg_primary.NR_CLIPS_MAX
    self.m1928_upg_primary.use_data = {selection_index = PRIMARY}
    self.m1928_upg_secondary = deep_clone(self.m1928_upg_primary)
    self.m1928_upg_secondary.use_data = {selection_index = SECONDARY}
	
	--more pew for the shovel gods
	
	self.ak74_upg_primary = deep_clone(self.ak74_primary)
    self.ak74_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.ak74_upg_primary.name_id = "wpn_ak_upg_name"
    self.ak74_upg_primary.stats_modifiers = {damage = 10}
    self.ak74_upg_primary.CLIP_AMMO_MAX = 45
    self.ak74_upg_primary.NR_CLIPS_MAX = 8
    self.ak74_upg_primary.AMMO_MAX = self.ak74_upg_primary.CLIP_AMMO_MAX * self.ak74_upg_primary.NR_CLIPS_MAX
    self.ak74_upg_primary.use_data = {selection_index = PRIMARY}
    self.ak74_upg_secondary = deep_clone(self.ak74_upg_primary)
    self.ak74_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.ching_upg_primary = deep_clone(self.ching_primary)
    self.ching_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.ching_upg_primary.name_id = "wpn_garand_upg_name"
    self.ching_upg_primary.stats_modifiers = {damage = 8}
    self.ching_upg_primary.CLIP_AMMO_MAX = 20
    self.ching_upg_primary.NR_CLIPS_MAX = 7
    self.ching_upg_primary.can_shoot_through_shield = true
    self.ching_upg_primary.AMMO_MAX = self.ching_upg_primary.CLIP_AMMO_MAX * self.ching_upg_primary.NR_CLIPS_MAX
    self.ching_upg_primary.use_data = {selection_index = PRIMARY}
    self.ching_upg_secondary = deep_clone(self.ching_upg_primary)
    self.ching_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.lemming_upg_primary = deep_clone(self.lemming_primary)
    self.lemming_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.lemming_upg_primary.name_id = "wpn_57_upg_name"
    self.lemming_upg_primary.stats_modifiers = {damage = 13}
    self.lemming_upg_primary.CLIP_AMMO_MAX = 20
    self.lemming_upg_primary.NR_CLIPS_MAX = 7
    self.lemming_upg_primary.armor_piercing_chance = 1
    self.lemming_upg_primary.can_shoot_through_enemy = true 
    self.lemming_upg_primary.can_shoot_through_wall = true 
    self.lemming_upg_primary.can_shoot_through_shield = true 
    self.lemming_upg_primary.AMMO_MAX = self.lemming_upg_primary.CLIP_AMMO_MAX * self.lemming_upg_primary.NR_CLIPS_MAX
    self.lemming_upg_primary.use_data = {selection_index = PRIMARY}
    self.lemming_upg_secondary = deep_clone(self.lemming_upg_primary)
    self.lemming_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.m37_upg_primary = deep_clone(self.m37_primary)
    self.m37_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m37_upg_primary.stats_modifiers = {damage = 12}
    self.m37_upg_primary.CLIP_AMMO_MAX = 16
    self.m37_upg_primary.NR_CLIPS_MAX = 6
    self.m37_upg_primary.AMMO_MAX = self.m37_upg_primary.CLIP_AMMO_MAX * self.m37_upg_primary.NR_CLIPS_MAX
    self.m37_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.m37_upg_secondary = deep_clone(self.m37_upg_primary)
    self.m37_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.r870_upg_primary = deep_clone(self.r870_primary)
    self.r870_upg_primary.name_id = "wpn_r870_upg_name"
    self.r870_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.r870_upg_primary.stats_modifiers = {damage = 10}
    self.r870_upg_primary.CLIP_AMMO_MAX = 12
    self.r870_upg_primary.NR_CLIPS_MAX = 9
    self.r870_upg_primary.AMMO_MAX = self.r870_upg_primary.CLIP_AMMO_MAX * self.r870_upg_primary.NR_CLIPS_MAX
    self.r870_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.r870_upg_secondary = deep_clone(self.r870_upg_primary)
    self.r870_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	self.erma_upg_primary = deep_clone(self.erma_primary)
    self.erma_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.erma_upg_primary.name_id = "wpn_mp40_upg_name"
    self.erma_upg_primary.stats_modifiers = {damage = 14}
    self.erma_upg_primary.CLIP_AMMO_MAX = 64
    self.erma_upg_primary.NR_CLIPS_MAX = 4
    self.erma_upg_primary.AMMO_MAX = self.erma_upg_primary.CLIP_AMMO_MAX * self.erma_upg_primary.NR_CLIPS_MAX
    self.erma_upg_primary.use_data = {selection_index = PRIMARY}
    self.erma_upg_secondary = deep_clone(self.erma_upg_primary)
    self.erma_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.schakal_upg_primary = deep_clone(self.schakal_primary)
    self.schakal_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.schakal_upg_primary.name_id = "wpn_ump45_upg_name"
    self.schakal_upg_primary.stats_modifiers = {damage = 10}
    self.schakal_upg_primary.CLIP_AMMO_MAX = 48
    self.schakal_upg_primary.NR_CLIPS_MAX = 6
    self.schakal_upg_primary.AMMO_MAX = self.schakal_upg_primary.CLIP_AMMO_MAX * self.schakal_upg_primary.NR_CLIPS_MAX
    self.schakal_upg_primary.use_data = {selection_index = PRIMARY}
    self.schakal_upg_secondary = deep_clone(self.schakal_upg_primary)
    self.schakal_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.tec9_upg_primary = deep_clone(self.tec9_primary)
    self.tec9_upg_primary.name_id = "wpn_tec9_upg_name"
    self.tec9_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.tec9_upg_primary.stats_modifiers = {damage = 15}
    self.tec9_upg_primary.CLIP_AMMO_MAX = 25
    self.tec9_upg_primary.NR_CLIPS_MAX = 10
    self.tec9_upg_primary.AMMO_MAX = self.tec9_upg_primary.CLIP_AMMO_MAX * self.tec9_upg_primary.NR_CLIPS_MAX
    self.tec9_upg_primary.use_data = {selection_index = PRIMARY}
    self.tec9_upg_secondary = deep_clone(self.tec9_upg_primary)
    self.tec9_upg_secondary.use_data = {selection_index = SECONDARY}

    self.mosin_upg_primary = deep_clone(self.mosin_primary)
    self.mosin_upg_primary.name_id = "wpn_mosin_upg_name"
    self.mosin_upg_primary.CLIP_AMMO_MAX = 10
    self.mosin_upg_primary.NR_CLIPS_MAX = 12
	self.mosin_upg_primary.can_shoot_through_enemy = true 
    self.mosin_upg_primary.can_shoot_through_wall = true 
    self.mosin_upg_primary.can_shoot_through_shield = true 
    self.mosin_upg_primary.AMMO_MAX = self.mosin_upg_primary.CLIP_AMMO_MAX * self.mosin_upg_primary.NR_CLIPS_MAX
    self.mosin_upg_primary.stats_modifiers = {damage = 85}
    self.mosin_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.mosin_upg_secondary = deep_clone(self.mosin_upg_primary)
    self.mosin_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}

	self.stryk_upg_primary = deep_clone(self.glock_18c)
    self.stryk_upg_primary.name_id = "wpn_stryk_upg_name"
    self.stryk_upg_primary.animations.reload_name_id = "glock_18c"
    self.stryk_upg_primary.weapon_hold = "glock"
    self.stryk_upg_primary.CLIP_AMMO_MAX = 47
    self.stryk_upg_primary.NR_CLIPS_MAX = 7
    self.stryk_upg_primary.AMMO_MAX = self.stryk_upg_primary.CLIP_AMMO_MAX * self.stryk_upg_primary.NR_CLIPS_MAX
    self.stryk_upg_primary.stats_modifiers = {damage = 12}
    self.stryk_upg_primary.stats.recoil = 99
    self.stryk_upg_primary.stats.spread = 99
    self.stryk_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
	self.stryk_upg_primary.use_data = {selection_index = PRIMARY}
    self.stryk_upg_secondary = deep_clone(self.stryk_upg_primary)
    self.stryk_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.roach_upg_primary = deep_clone(self.roach_primary)
    self.roach_upg_primary.name_id = "wpn_roach_upg_name"
    self.roach_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.roach_upg_primary.fire_mode_data = {fire_rate = 0.11}
    self.roach_upg_primary.CLIP_AMMO_MAX = 6
    self.roach_upg_primary.NR_CLIPS_MAX = 5
    self.roach_upg_primary.AMMO_MAX = self.roach_upg_primary.CLIP_AMMO_MAX * self.roach_upg_primary.NR_CLIPS_MAX
    self.roach_upg_primary.sounds.fire = "zm_pew_roach"
    self.roach_upg_primary.sounds.fire_single = "zm_pew_roach"
    self.roach_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.roach_upg_secondary = deep_clone(self.roach_upg_primary)
    self.roach_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.vulcan_upg = deep_clone(self.shuno)
    self.vulcan_upg.name_id = "wpn_minigun_upg_name"
    self.vulcan_upg.animations.reload_name_id = "shuno"
    self.vulcan_upg.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.vulcan_upg.CLIP_AMMO_MAX = 999
    self.vulcan_upg.NR_CLIPS_MAX = 1
    self.vulcan_upg.AMMO_MAX = self.vulcan_upg.CLIP_AMMO_MAX * self.vulcan_upg.NR_CLIPS_MAX
    self.vulcan_upg.stats_modifiers = {damage = 10}
	self.vulcan_upg.sounds.fire_single = "shuno_fire"
    self.vulcan_upg.use_data = {selection_index = PRIMARY, align_place = "right_hand"}

    self.deamon_upg_primary = deep_clone(self.deamon_primary)
    self.deamon_upg_primary.name_id = "wpn_deamon_upg_name"
    self.deamon_upg_primary.CLIP_AMMO_MAX = 14
    self.deamon_upg_primary.NR_CLIPS_MAX = 6
    self.deamon_upg_primary.AMMO_MAX = self.deamon_upg_primary.CLIP_AMMO_MAX * self.deamon_upg_primary.NR_CLIPS_MAX
    self.deamon_upg_primary.stats_modifiers = {damage = 14}
    self.deamon_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.deamon_upg_secondary = deep_clone(self.deamon_upg_primary)
    self.deamon_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.elastic_upg_primary = deep_clone(self.elastic_primary)
    self.elastic_upg_primary.name_id = "wpn_elastic_upg_name"
    self.elastic_upg_primary.stats_modifiers = {damage = 16}
    self.elastic_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.elastic_upg_secondary = deep_clone(self.elastic_upg_primary)
    self.elastic_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}

    self.g3_upg_primary = deep_clone(self.g3_primary)
	self.g3_upg_primary.animations.reload_name_id = "g3"
    self.g3_upg_primary.weapon_hold = "g3"
    self.g3_upg_primary.name_id = "wpn_g3_upg_name"
    self.g3_upg_primary.CLIP_AMMO_MAX = 40
    self.g3_upg_primary.NR_CLIPS_MAX = 8
    self.g3_upg_primary.AMMO_MAX = self.g3_upg_primary.CLIP_AMMO_MAX * self.g3_upg_primary.NR_CLIPS_MAX
    self.g3_upg_primary.stats_modifiers = {damage = 10}
    self.g3_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.g3_upg_secondary = deep_clone(self.g3_upg_primary)
    self.g3_upg_secondary.use_data = {selection_index = SECONDARY}

    self.tar21_upg_primary = deep_clone(self.tar21_primary)
    self.tar21_upg_primary.name_id = "wpn_tar_upg_name"
    self.tar21_upg_primary.CLIP_AMMO_MAX = 50
    self.tar21_upg_primary.NR_CLIPS_MAX = 10
    self.tar21_upg_primary.AMMO_MAX = self.tar21_upg_primary.CLIP_AMMO_MAX * self.tar21_upg_primary.NR_CLIPS_MAX
    self.tar21_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.tar21_upg_primary.stats_modifiers = {damage = 8}
    self.tar21_upg_primary.stats.recoil = 17
    self.tar21_upg_primary.stats.spread = 17
    self.tar21_upg_primary.fire_mode_data = {fire_rate = 0.035}
    self.tar21_upg_primary.auto = {fire_rate = 0.035}
    self.tar21_upg_secondary = deep_clone(self.tar21_upg_primary)
    self.tar21_upg_secondary.use_data = {selection_index = SECONDARY}

    self.akrocket_upg_primary = deep_clone(self.akmsu)
    self.akrocket_upg_primary.name_id = "wpn_ak_upg_name"
    self.akrocket_upg_primary.weapon_hold = "ak47"
    self.akrocket_upg_primary.CLIP_AMMO_MAX = 30
    self.akrocket_upg_primary.NR_CLIPS_MAX = 15
    self.akrocket_upg_primary.stats.recoil = 19
    self.akrocket_upg_primary.stats.spread = 18
    self.akrocket_upg_primary.stats_modifiers = {damage = 14}
    self.akrocket_upg_primary.AMMO_MAX = self.akrocket_upg_primary.CLIP_AMMO_MAX * self.akrocket_upg_primary.NR_CLIPS_MAX
    self.akrocket_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.akrocket_upg_primary.use_data = {selection_index = PRIMARY}
    self.akrocket_upg_primary.fire_mode_data = {fire_rate = 0.1}
    self.akrocket_upg_primary.animations.reload_name_id = "akmsu"
    self.akrocket_upg_primary.animations.equip_id = "akmsu"
    self.akrocket_upg_primary.sounds = {
        fire = "akrocket_fire_single",
        fire_single = "akrocket_fire_single",
        stop_fire = "akrocket_stop",
        use_fix = true
    }
    self.akrocket_upg_secondary = deep_clone(self.akrocket_upg_primary)
    self.akrocket_upg_secondary.use_data = {selection_index = SECONDARY}

    self.par_upg_primary = deep_clone(self.par_primary)
    self.par_upg_primary.name_id = "wpn_par_upg_name"
    self.par_upg_primary.CLIP_AMMO_MAX = 200
    self.par_upg_primary.NR_CLIPS_MAX = 4
    self.par_upg_primary.AMMO_MAX = self.par_upg_primary.CLIP_AMMO_MAX * self.par_upg_primary.NR_CLIPS_MAX
    self.par_upg_primary.stats.recoil = 19
    self.par_upg_primary.stats.spread = 18
    self.par_upg_primary.stats_modifiers = {damage = 14}
    self.par_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.par_upg_primary.use_data = {selection_index = PRIMARY}
    self.par_upg_secondary = deep_clone(self.par_upg_primary)
    self.par_upg_secondary.use_data = {selection_index = SECONDARY}

    self.packrat_upg_primary = deep_clone(self.x_packrat)
    self.packrat_upg_primary.name_id = "wpn_packrat_upg_name"
    self.packrat_upg_primary.animations = {
		second_gun_versions = {
			reload_not_empty = "reload_not_empty_left",
			reload = "reload_left"
		},
		has_steelsight_stance = true,
		recoil_steelsight = true,
        magazine_empty = "last_recoil",
        reload_name_id = "x_packrat"
    }
    self.packrat_upg_primary.CLIP_AMMO_MAX = 30
    self.packrat_upg_primary.NR_CLIPS_MAX = 8
    self.packrat_upg_primary.AMMO_MAX = self.packrat_upg_primary.CLIP_AMMO_MAX * self.packrat_upg_primary.NR_CLIPS_MAX
    self.packrat_upg_primary.stats_modifiers = {damage = 14}
    self.packrat_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.packrat_upg_primary.use_data = {selection_index = PRIMARY}
    self.packrat_upg_secondary = deep_clone(self.packrat_upg_primary)
    self.packrat_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.raygun_upg_primary = deep_clone(self.raygun_primary)
    self.raygun_upg_primary.name_id = "wpn_raygun_upg_name"
    self.raygun_upg_primary.muzzleflash = "effects/raygun_fire_pap"
    self.raygun_upg_primary.projectile_type = "raygun_blast_pap"
    self.raygun_upg_primary.CLIP_AMMO_MAX = 40
    self.raygun_upg_primary.NR_CLIPS_MAX = 4.5
    self.raygun_upg_primary.AMMO_MAX = self.raygun_upg_primary.CLIP_AMMO_MAX * self.raygun_upg_primary.NR_CLIPS_MAX
    self.raygun_upg_primary.use_data = {selection_index = PRIMARY}
    self.raygun_upg_secondary = deep_clone(self.raygun_upg_primary)
    self.raygun_upg_secondary.use_data = {selection_index = SECONDARY}
end

Hooks:PostHook(WeaponTweakData, "_init_data_swat_van_turret_module_npc", "zm_tweak_swat_turret", function(self)
    self.swat_van_turret_module.DAMAGE = 15
    self.swat_van_turret_module.CLIP_SIZE = 1000
    self.swat_van_turret_module.FIRE_RANGE = 20000
    self.swat_van_turret_module.alert_size = 10000
    self.swat_van_turret_module.DETECTION_DELAY = {
		{
			900,
			0.3
		},
		{
			self.swat_van_turret_module.FIRE_RANGE,
			0.3
		}
    }
    self.swat_van_turret_module.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
    self.swat_van_turret_module.DETECTION_RANGE = self.swat_van_turret_module.FIRE_RANGE
    self.swat_van_turret_module.MAX_VEL_SPIN = 72 * 2
	self.swat_van_turret_module.MIN_VEL_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 0.05
	self.swat_van_turret_module.SLOWDOWN_ANGLE_SPIN = 30 * 2
	self.swat_van_turret_module.ACC_SPIN = self.swat_van_turret_module.MAX_VEL_SPIN * 5
	self.swat_van_turret_module.MAX_VEL_PITCH = 60 * 2
	self.swat_van_turret_module.MIN_VEL_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 0.05
	self.swat_van_turret_module.SLOWDOWN_ANGLE_PITCH = 20 * 2
	self.swat_van_turret_module.ACC_PITCH = self.swat_van_turret_module.MAX_VEL_PITCH * 5
end)

Hooks:PostHook(WeaponTweakData, "_set_normal", "zm_td__set_normal", function(self)
    self.swat_van_turret_module.DAMAGE = 4
end)

Hooks:PostHook(WeaponTweakData, "_set_hard", "zm_td__set_hard", function(self)
    self.swat_van_turret_module.DAMAGE = 7
end)

Hooks:PostHook(WeaponTweakData, "_set_overkill", "zm_td__set_overkill", function(self)
    self.swat_van_turret_module.DAMAGE = 7
end)

Hooks:PostHook(WeaponTweakData, "_set_overkill_145", "zm_td__set_overkill_145", function(self)
    self.swat_van_turret_module.DAMAGE = 9
end)

Hooks:PostHook(WeaponTweakData, "_set_easy_wish", "zm_td__set_easy_wish", function(self)
    self.swat_van_turret_module.DAMAGE = 10
end)

Hooks:PostHook(WeaponTweakData, "_set_overkill_290", "zm_td__set_overkill_290", function(self)
    self.swat_van_turret_module.DAMAGE = 12
end)

Hooks:PostHook(WeaponTweakData, "_set_sm_wish", "zm_td_smwish", function(self)
    self.swat_van_turret_module.DAMAGE = 15
end)

Hooks:PostHook(WeaponTweakData, "_init_data_smoke_npc", "zm_reduce_shadow_cockers_damage", function(self)
    self.smoke_npc.DAMAGE = 1
end)
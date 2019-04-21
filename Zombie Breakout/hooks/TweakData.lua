 --shovi
	tweak_data.projectiles.launcher_frag_arbiter.damage = 600	--M2018 Neru
	tweak_data.projectiles.launcher_frag_arbiter.player_damage = 10
	tweak_data.projectiles.launcher_rocket.player_damage = 10	--RPG player damage
	tweak_data.projectiles.fir_com.damage = 15	--Incendiary Grenade
--[[
	tweak_data.projectiles.launcher_incendiary_arbiter = {	-- Broken Arrow
		damage = 50,
		launch_speed = 7000,
		curve_pow = 0.1,
		player_damage = 15,
		fire_dot_data = {
			dot_trigger_chance = 100,
			dot_damage = 100,
			dot_length = 10,
			dot_trigger_max_distance = 5000,
			dot_tick_period = 0.25
		},
		range = 350,
		init_timer = 2.5,
		mass_look_up_modifier = 1,
		sound_event = "white_explosion",
		sound_event_impact_duration = 0.25,
		name_id = "bm_launcher_incendiary",
		burn_duration = 6,
		burn_tick_period = 0.25
	}
--]]
 	tweak_data.pickups.max_ammo = {
		unit = Idstring("power_ups/max_ammo/max_ammo")
	}

	tweak_data.pickups.double_points = {
		unit = Idstring("power_ups/double_points/double_points")
	}

	tweak_data.pickups.instakill = {
		unit = Idstring("power_ups/instakill/instakill")
	}

	tweak_data.pickups.firesale = {
		unit = Idstring("power_ups/firesale/firesale")
	}

	tweak_data.pickups.nuke = {
		unit = Idstring("power_ups/nuke/nuke")
	}

	tweak_data.pickups.blood_money = {
		unit = Idstring("power_ups/blood_money/blood_money")
	}

	tweak_data.pickups.zombie_blood = {
		unit = Idstring("power_ups/zombie_blood/zombie_blood")
	}

	tweak_data.projectiles.raygun_blast = deep_clone(tweak_data.projectiles.ecp_arrow_exp)
	tweak_data.projectiles.raygun_blast.damage = 300
	tweak_data.projectiles.raygun_blast.adjust_z = 0
	tweak_data.projectiles.raygun_blast.push_at_body_index = 0
	
	tweak_data.projectiles.raygun_blast_pap = deep_clone(tweak_data.projectiles.ecp_arrow_exp)
	tweak_data.projectiles.raygun_blast_pap.damage = 350
	tweak_data.projectiles.raygun_blast_pap.adjust_z = 0
	tweak_data.projectiles.raygun_blast_pap.push_at_body_index = 0
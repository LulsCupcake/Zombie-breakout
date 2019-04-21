--[[function EnvEffectTweakData:incendiary_fire_arbiter()
	local params = {
		sound_event = "gl_explode",
		range = 100,
		curve_pow = 3,
		damage = 25,
		fire_alert_radius = 1500,
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 4,
		sound_event_impact_duration = 10,
		burn_tick_period = 0.25,
		burn_duration = 10,
		effect_name = "effects/zm/pinkhaze",
		fire_dot_data = {
			dot_trigger_chance = 100,
			dot_damage = 100,
			dot_length = 10,
			dot_trigger_max_distance = 3000,
			dot_tick_period = 0.25
		}
	}

	return params
end]]
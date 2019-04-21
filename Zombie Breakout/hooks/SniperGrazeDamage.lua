local TRAIL_EFFECT = Idstring("effects/particles/weapons/sniper_trail")
local idstr_trail = Idstring("trail")
local idstr_simulator_length = Idstring("simulator_length")
local idstr_size = Idstring("size")
local trail_length
local new_trail = Idstring("effects/particles/weapons/shovel")

function SniperGrazeDamage:on_wunderwaffe_fired(weapon_unit, result)
    if not alive(weapon_unit) then
        return
    end

    local player_unit = managers.player:player_unit()
    if not player_unit then
      return
    end

    if weapon_unit ~= managers.player:equipped_weapon_unit() then 
      return
    end

    if weapon_unit:base():get_name_id() ~= "wunderwaffe_primary" and weapon_unit:base():get_name_id() ~= "wunderwaffe_secondary" and weapon_unit:base():get_name_id() ~= "wunderwaffe_dg3_primary" and weapon_unit:base():get_name_id() ~= "wunderwaffe_dg3_secondary" then 
        return
    end

    local bumps = 10
    local timer_between = 0.5

    if weapon_unit:base():get_name_id() == "wunderwaffe_dg3_primary" or weapon_unit:base():get_name_id() == "wunderwaffe_dg3_secondary" then
      new_trail = Idstring("effects/particles/weapons/super_shovel")
      bumps = 15
      timer_between = 0.25
    end

    local upgrade_value = managers.player:upgrade_value("snp", "graze_damage")
    local sentry_mask = managers.slot:get_mask("sentry_gun")
    local ally_mask = managers.slot:get_mask("all_criminals")
    local enemy_mask = managers.slot:get_mask("enemies")
    local geometry_mask = managers.slot:get_mask("world_geometry")
    local hit_enemies = {}
    local ignored_enemies = {}

    for _, hit in ipairs(result.rays) do
      local is_turret = hit.unit:in_slot(sentry_mask)
      local is_ally = hit.unit:in_slot(ally_mask)

      local result = hit.damage_result
      local attack_data = result and result.attack_data
      if attack_data and not is_turret and not is_ally then
        local multiplier = 1
        local key = hit.unit:key()
        hit_enemies[key] = {
          position = hit.position,
          damage = 125000
        }
        ignored_enemies[key] = true
      end
    end
    
    local radius = 800
    for _, hit in pairs(hit_enemies) do
      self:find_wunderwaffe_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, bumps, timer_between)
    end
    
end

function SniperGrazeDamage:find_wunderwaffe_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, times, timer_between)
    if times <= 0 then
      return
    end

    if times == 7 or times == 12 then
        local tbl_spree_soundbank = {
            "wunderwaffe_spree",
            "wunderwaffe_spree2"
        }

        if alive(managers.player:player_unit()) then
          local sound_wunderspree = SoundDevice:create_source("WunderwaffeSpree")
          sound_wunderspree:set_position(managers.player:player_unit():position())
          sound_wunderspree:post_event(tbl_spree_soundbank [ math.random( #tbl_spree_soundbank ) ])
        end
    end
    
    local hit_units = World:find_units_quick("sphere", hit.position, 800, enemy_mask)
    local closest
    local closest_d_sq
    for _, unit in ipairs(hit_units) do
      if not ignored_enemies[unit:key()] then
        local d_s = mvector3.distance_sq(hit.position, unit:movement():m_head_pos())
        if not closest_d_sq or d_s < closest_d_sq then
          if not World:raycast("ray", hit.position, unit:movement():m_head_pos(), "slot_mask", geometry_mask) then
            closest = unit
            closest_d_sq = d_s
          end
        end
      end
    end
    if closest then
      ignored_enemies[closest:key()] = true

      local hit_pos = Vector3()
      mvector3.set(hit_pos, closest:movement():m_head_pos())

      if not trail_length then
        trail_length = World:effect_manager():get_initial_simulator_var_vector2(TRAIL_EFFECT, idstr_trail, idstr_simulator_length, idstr_size)
      end
      local trail = World:effect_manager():spawn({
        effect = new_trail,
        position = hit.position,
        normal = hit_pos - hit.position
      })
        
      local sound_wunderhit = SoundDevice:create_source("WunderwaffeHit")
      sound_wunderhit:set_position(hit.position)
      sound_wunderhit:post_event("wunderwaffe_hit")

      mvector3.set_y(trail_length, math.sqrt(closest_d_sq))
      World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, trail_length)

      DelayedCalls:Add("grazehit" .. tostring(closest), timer_between, function ()
        if not alive(closest) or not alive(player_unit) then
          return
        end
        
        local result = closest:character_damage():damage_simple({
          variant = "graze",
          damage = hit.damage,
          attacker_unit = player_unit,
          pos = hit_pos,
          attack_dir = hit_pos - hit.position
        })

        hit = {
          position = hit_pos,
          damage = result and result.damage or hit.damage
        }
      
        self:find_wunderwaffe_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, times - 1, timer_between)
      end)

    end
  
end
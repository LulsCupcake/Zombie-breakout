local PowerUps = AmmoClip

function PowerUps:init(unit)
	PowerUps.super.init(self, unit)
    self._power_up_id = self._power_up_id or nil

    if self._power_up_id then
        managers.wdu:_element_play_sound({
            name = "power_up_loop" .. self._power_up_id,
            file_name = "power_up_loop.ogg",
            sound_type = "sfx",
            custom_dir = "sound",
            is_relative = false,
            is_loop = false,
            is_3d = true,
            position = unit:position(),
            use_velocity = false
        })

        self:init_lifetime()
    end
end

function PowerUps:reload_contour()
end

function PowerUps:init_lifetime()
    managers.wdu:wait(30, "lifetime_power_up_" .. self._power_up_id .. "_" .. math.random(0,10000), function()
        if alive(self._unit) then
            self:consume()
        end
    end)
end

function PowerUps:_pickup(unit)
	if self._picked_up then
		return
	end

	local player_manager = managers.player
	local inventory = unit:inventory()

    if not unit:character_damage():dead() and inventory then
        local picked_up = false

        if not self._power_up_id then
            if self._projectile_id then
                if managers.blackmarket:equipped_projectile() == self._projectile_id and not player_manager:got_max_grenades() then
                    player_manager:add_grenade_amount(self._ammo_count or 1)
                    picked_up = true
                end
            else
                local available_selections = {}
    
                for i, weapon in pairs(inventory:available_selections()) do
                    if inventory:is_equipped(i) then
                        table.insert(available_selections, 1, weapon)
                    else
                        table.insert(available_selections, weapon)
                    end
                end
    
                local success, add_amount = nil
    
                for _, weapon in ipairs(available_selections) do
                    if not self._weapon_category or self._weapon_category == weapon.unit:base():weapon_tweak_data().categories[1] then
                        success, add_amount = weapon.unit:base():add_ammo(1, self._ammo_count)
                        picked_up = success or picked_up
    
                        if self._ammo_count then
                            self._ammo_count = math.max(math.floor(self._ammo_count - add_amount), 0)
                        end
    
                        if picked_up and tweak_data.achievement.pickup_sticks and self._weapon_category == tweak_data.achievement.pickup_sticks.weapon_category then
                            managers.achievment:award_progress(tweak_data.achievement.pickup_sticks.stat)
                        end
                    end
                end
            end

            if picked_up then
                managers.player:register_grenade(managers.network:session():local_peer():id())
				managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", 16)

                if Network:is_client() then
                    managers.network:session():send_to_host("sync_pickup", self._unit)
                end
    
                unit:sound():play(self._pickup_event or "pickup_ammo", nil, true)

                self:consume()
                return true
            end
        end

        self._picked_up = true

        if self._power_up_id == 1 then  -- MAX AMMO
            managers.wdu:power_ups():execute_max_ammo()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "1" )
        elseif self._power_up_id == 2 then -- DOUBLE POINTS
            managers.wdu:power_ups():execute_double_points()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "2" )
        elseif self._power_up_id == 3 then -- INSTAKILL
            managers.wdu:power_ups():execute_instakill()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "3" )
        elseif self._power_up_id == 4 then -- FIRESALE
            managers.wdu:power_ups():execute_firesale()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "4" )
        elseif self._power_up_id == 5 then -- KABOOM
            managers.wdu:power_ups():execute_kaboom()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "5" )
        elseif self._power_up_id == 6 then -- BLOOD MONEY
            managers.wdu:power_ups():execute_blood_money()
        elseif self._power_up_id == 7 then -- ZOMBIE BLOOD
            managers.wdu:power_ups():execute_zombie_blood()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "7" )
        end

        if Network:is_client() then
            managers.network:session():send_to_host("sync_pickup", self._unit)
        end

        if self._power_up_id then
            managers.wdu:_element_play_sound({
                name = "power_up_taken",
                file_name = "gift_taken.ogg",
                sound_type = "sfx",
                custom_dir = "sound",
                is_relative = false,
                is_loop = false,
                is_3d = true,
                position = unit:position(),
                use_velocity = false
            })
        end

        self:consume()

        --if self._ammo_box then
        --	player_manager:send_message(Message.OnAmmoPickup, nil, unit)
        --end
        
        -- ^ unsure what this does.

        return true
	end

	return false
end

function PowerUps:sync_net_event(event, peer)
end

Hooks:PostHook(AmmoClip, "consume", "post_init_consume_zm", function(self)
    if self._power_up_id then
        managers.wdu:_destroy_source("power_up_loop" .. self._power_up_id)
    end
end)
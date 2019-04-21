Hooks:PostHook(FPCameraPlayerBase, "init", "zm_zmblood_smoke_init", function(self)
    self._zm_blood_effect_active = false
end)

Hooks:PostHook(FPCameraPlayerBase, "update", "zm_upd_zm_blood_smoke", function(self, unit, t, dt)    
    if managers.wdu:_is_event_active("zombie_blood") then
        self._zm_blood_effect_active = true
        local effect_smoke = Idstring("effects/payday2/particles/smoke_trail/smoke_distorted_small")

        if not self._zm_blood_effect_1 then
            self._zm_blood_effect_1 = World:effect_manager():spawn({
                effect = effect_smoke,
                parent = self._parent_unit:camera()._camera_unit:get_object(Idstring("a_weapon_left"))
            })
        end

        if not self._zm_blood_effect_2 then
            self._zm_blood_effect_2 = World:effect_manager():spawn({
                effect = effect_smoke,
                parent = self._parent_unit:camera()._camera_unit:get_object(Idstring("a_weapon_right"))
            })
        end
    else
        self:_destroy_zm_blood_effect()
    end
end)

function FPCameraPlayerBase:_destroy_zm_blood_effect()
    if self._zm_blood_effect_active then
        if self._zm_blood_effect_1 then
            World:effect_manager():fade_kill(self._zm_blood_effect_1)
            self._zm_blood_effect_1 = nil
        end

        if self._zm_blood_effect_2 then
            World:effect_manager():fade_kill(self._zm_blood_effect_2)
            self._zm_blood_effect_2 = nil
        end

        self._zm_blood_effect_active = false
    end
end
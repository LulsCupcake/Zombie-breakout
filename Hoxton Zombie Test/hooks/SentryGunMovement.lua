function SentryGunMovement:_upd_hacking(t, dt)
    self._is_hacked = true

    if Network:is_server() then
        local original_team = self._team

        self:set_team(managers.groupai:state():team_data("hacked_turret"))

        self._original_team = original_team
    end
    
    if Network:is_server() then
        --self._unit:brain():on_hacked_start()
    end
end
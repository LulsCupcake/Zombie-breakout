function HUDManager:start_assault(assault_number)
	self._hud.in_assault = true
	managers.network:session():send_to_peers_synched("sync_start_assault", math.min(assault_number, HUDManager.ASSAULTS_MAX))
end

Hooks:PostHook(HUDManager, "remove_teammate_panel", "post_rtp_hud_zm", function(self, id)
	local prev_peer_id_disconnected = self._teammate_panels[id]._peer_id

	if self._hud_zm_points and prev_peer_id_disconnected then
		self._hud_zm_points._zmp_avatars[prev_peer_id_disconnected]:set_visible(false)
		self._hud_zm_points._zmp_points[prev_peer_id_disconnected]:set_visible(false)

		managers.wdu:set_disconnected_state(id)
	end
end)
local Path = zm_hox.ModPath

dofile(Path .. "hooks/ElementWeaponSwitch.lua")
dofile(Path .. "hooks/ElementPointChecker.lua")
dofile(Path .. "hooks/ElementWave.lua")
dofile(Path .. "hooks/ElementAnnouncerGift.lua")
dofile(Path .. "hooks/ElementDynamicEnvironment.lua")
dofile(Path .. "hooks/ElementPlayVideo.lua")
dofile(Path .. "hooks/ElementSpawnSafeEnemyDummy.lua")
dofile(Path .. "hooks/ElementSoraCinematicCamera.lua")
dofile(Path .. "hooks/ElementReviveInstigator.lua")
dofile(Path .. "hooks/ElementCheckSecret.lua")

function MissionManager:get_mission_element(element_id)
	for _, data in pairs(self._scripts) do
		for id, element in pairs(data:elements()) do
			if element:id() == element_id then
				return element
			end
		end
	end
end
--[[
function MissionManager:set_fading_debug_enabled(enabled)
	self._fading_debug_output:show()
end

function MissionManager:add_fading_debug_output(debug, color, as_subtitle)
	if as_subtitle then
		self:_show_debug_subtitle(debug, color)
	else
		local stuff = {
			" -",
			" \\",
			" |",
			" /"
		}
		self._fade_index = (self._fade_index or 0) + 1
		self._fade_index = self._fade_index > #stuff and self._fade_index and 1 or self._fade_index

		self._fading_debug_output:script().log(stuff[self._fade_index] .. " " .. debug, color, nil)
	end
end--]]
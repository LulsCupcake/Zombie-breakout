dofile(ModPath .. "classes/WDUManager.lua")
dofile(ModPath .. "classes/WDUPowerUps.lua")

Hooks:PostHook(GameSetup, "init_managers", "zm_init_wdumanager", function(self, managers)
	managers.wdu = WDUManager:new()
	managers.wdu:preload_weapons()
end)
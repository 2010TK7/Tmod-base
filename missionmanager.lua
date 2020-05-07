local OldFunc = MissionManager.init
function MissionManager:init(...)
	OldFunc(self, ...)
	if SpawnSupporter then
		SpawnSupporter:Reload()
	end
end
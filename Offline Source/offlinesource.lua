local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.OfflineSource = _G.OfflineSource or {}
OfflineSource._path = ModPath
OfflineSource._data_path = SavePath .. 'Tmod_TOS.txt'
OfflineSource.settings = OfflineSource.settings or {
	OS_pd2 = true,
	OS_dbd = false,
	OS_solus = false,
	OS_raidww2 = false
}

function OfflineSource:Save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function OfflineSource:Load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end

function OfflineSource:Checker(id)
	OfflineSource:Load()
	if id == "103582791433980119" then
		return OfflineSource.settings.OS_pd2
	elseif id == "103582791441335905" then
		return OfflineSource.settings.OS_dbd
	elseif id == "103582791438562929" then
		return OfflineSource.settings.OS_solus
	elseif id == "103582791460014708" then
		return OfflineSource.settings.OS_raidww2
	end
end
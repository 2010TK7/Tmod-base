Hooks:Add('LocalizationManagerPostInit', 'OS_LocalizationManagerPostInit', function(loc)
	loc:load_localization_file(OfflineSource._path .. 'loc.json', false)
end)

Hooks:Add('MenuManagerInitialize', 'OS_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.OSCheck = function(this, item)
		OfflineSource.settings[item:name()] = item:value() == 'on'
		OfflineSource:Save()
	end

	MenuCallbackHandler.OSSave = function(this, item)
		OfflineSource:Save()
	end

	OfflineSource:Load()
	MenuHelper:LoadFromJsonFile(OfflineSource._path .. 'menu.json', OfflineSource, OfflineSource.settings)
end)
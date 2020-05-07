local OldFunc = WINDLCManager._check_dlc_data
function WINDLCManager:_check_dlc_data(dlc_data)
	return OfflineSource and dlc_data.source_id and OfflineSource:Checker(dlc_data.source_id) or OldFunc(self, dlc_data)
end
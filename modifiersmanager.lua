local OldFunc1 = ModifiersManager.modify_value
function ModifiersManager:modify_value(id, value, ...)
	if CommonModifiers and CommonModifiers.Checker then
		return CommonModifiers:modify_value(id, value, ...)
	else
		return OldFunc1(self, id, value, ...)
	end
end

local OldFunc2 = ModifiersManager.run_func
function ModifiersManager:run_func(func_name, ...)
	if CommonModifiers and CommonModifiers.Checker then
		CommonModifiers:run_func(func_name, ...)
	else
		OldFunc2(self, func_name, ...)
	end
end
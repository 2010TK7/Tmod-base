local NewFunc = function(categories, difficulty_index)
	if difficulty_index < 4 then
		categories.FBI_swat_M4 = categories.CS_swat_MP5
		categories.FBI_swat_R870 = categories.CS_swat_R870
		categories.FBI_heavy_G36 = categories.CS_heavy_M4
		categories.FBI_heavy_R870 = categories.CS_heavy_R870
		categories.FBI_shield = categories.CS_shield
	else
		categories.CS_swat_MP5 = categories.FBI_swat_M4
		categories.CS_swat_R870 = categories.FBI_swat_R870
		categories.CS_heavy_M4 = categories.FBI_heavy_G36
		categories.CS_heavy_R870 = categories.FBI_heavy_R870
		categories.CS_shield = categories.FBI_shield
	end
	categories.FBI_heavy_G36_w.unit_types = categories.FBI_heavy_G36.unit_types
	categories.CS_heavy_M4_w = categories.FBI_heavy_G36_w
end

local OldFunc1 = GroupAITweakData._init_unit_categories
function GroupAITweakData:_init_unit_categories(difficulty_index)
	OldFunc1(self, difficulty_index)
	NewFunc(self.unit_categories, difficulty_index)
	if UnitedOffensive then
		UnitedOffensive:group_ai(self.unit_categories, difficulty_index)
	end
	if CommonModifiers and CommonModifiers.Checker then
		CommonModifiers:special_unit_spawn_limits(self.special_unit_spawn_limits, difficulty_index)
		CommonModifiers:unit_categories(self.unit_categories, difficulty_index)
	end
	if UnitedForces then
		UnitedForces:zeal_unit(difficulty_index)
	end
end

local OldFunc2 = GroupAITweakData._init_enemy_spawn_groups
function GroupAITweakData:_init_enemy_spawn_groups(difficulty_index)
	if CommonModifiers and CommonModifiers.Checker then
		OldFunc2(self, CommonModifiers:Difficulty(difficulty_index))
	else
		OldFunc2(self, difficulty_index)
	end
end

local OldFunc3 = GroupAITweakData._init_task_data
function GroupAITweakData:_init_task_data(difficulty_index)
	if CommonModifiers and CommonModifiers.Checker then
		OldFunc3(self, CommonModifiers:Difficulty(difficulty_index))
		CommonModifiers:ReCaptain(self.phalanx.spawn_chance)
	else
		OldFunc3(self, difficulty_index)
	end
end
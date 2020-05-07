local OldFunc = PlayerTweakData.init

function PlayerTweakData:init()
	OldFunc(self)
	if CommonModifiers and CommonModifiers.checker then
		CommonModifiers:LessPagers(self.alarm_pager.bluff_success_chance)
	end
end
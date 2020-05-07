local OldFunc = PlayerTweakData.init

function PlayerTweakData:init()
	OldFunc(self)
	if CommonModifiers and CommonModifiers.Checker then
		CommonModifiers:LessPagers(self.alarm_pager.bluff_success_chance)
	end
end
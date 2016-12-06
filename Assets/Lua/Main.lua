class = require "Framework/3rd/middleclass"

require "Logic/Facade/AppFacade"

--主入口函数。从这里开始lua逻辑
function Main()					
	print("main!!!")
	local appFacade = AppFacade:GetInstance(AppFacade.KEY)
end

--场景切换通知
function OnLevelWasLoaded(level)
	Time.timeSinceLevelLoad = 0
end
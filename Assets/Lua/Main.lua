-- 引入middleclass
class = require "Framework/3rd/middleclass"
GameObject = UnityEngine.GameObject
Transform = UnityEngine.Transform
UnityAction = UnityEngine.Events.UnityAction
Button = UnityEngine.UI.Button
Text = UnityEngine.UI.Text
Image = UnityEngine.UI.Image

require "Logic/Facade/AppFacade"
require "Framework/Util"

--主入口函数。从这里开始lua逻辑
function Main()					
	print("main!!!")
	appFacade = AppFacade:GetInstance(AppFacade.KEY)
	appFacade:SendNotification(AppFacade.MSG_STARTUP)
end

--场景切换通知
function OnLevelWasLoaded(level)
	Time.timeSinceLevelLoad = 0
end
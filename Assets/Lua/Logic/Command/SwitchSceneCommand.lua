SwitchSceneCommand = class("SwitchSceneCommand", SimpleCommand)

-- 逻辑初始化可以放到这里
function SwitchSceneCommand:Execute(notification)
 	local sceneName = notification:GetBody()
 	SceneMgr.Instance():LoadScene(sceneName, function(name)
 		print("on load done " .. name)
 	end, nil);
end 
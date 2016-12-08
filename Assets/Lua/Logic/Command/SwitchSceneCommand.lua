SwitchSceneCommand = class("SwitchSceneCommand", SimpleCommand)

function SwitchSceneCommand:Execute(notification)
 	local sceneName = notification:GetBody()
 	SceneMgr.Instance():LoadScene(sceneName, function(name)
 		print("on load done " .. name)
 	end, nil);
end 
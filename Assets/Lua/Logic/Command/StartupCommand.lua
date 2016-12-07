StartupCommand = class("StartupCommand", SimpleCommand)

-- 逻辑初始化可以放到这里
function StartupCommand:Execute(notification)
 	print("StartupCommand:Execute")
 	local appFacade = AppFacade:GetInstance(AppFacade.KEY)
 	appFacade:SendNotification(AppFacade.SWITCH_SCENE, "Main")
end 
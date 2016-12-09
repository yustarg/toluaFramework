require "Logic/Mediator/Main/MainMediator"
require "Logic/Mediator/Main/MainWnd"

InitMainCommand = class("InitMainCommand", SimpleCommand)

function InitMainCommand:Execute(notification)
	local root = notification:GetBody()
	local appFacade = AppFacade:GetInstance(AppFacade.KEY)
	local mainMediator = MainMediator:new("MainMediator", MainWnd:new(root.transform:FindChild("Canvas/Panel_Main")))
	appFacade:RegisterMediator(mainMediator)
end 
require "Logic/Mediator/Main/MainMediator"
require "Logic/Mediator/Main/MainWnd"
require "Logic/Command/Main/AddCountCommand"
require "Logic/Model/UserVO"
require "Logic/Proxy/UserProxy"

InitMainCommand = class("InitMainCommand", SimpleCommand)

function InitMainCommand:Execute(notification)
	local root = notification:GetBody()
	local mainMediator = MainMediator:new("MainMediator", MainWnd:new(root, "Canvas/Panel_Main"))
	-- mediator
	appFacade:RegisterMediator(mainMediator)
	-- command
	appFacade:RegisterCommand(MainMediator.MSG_CLICK_ADD_BTN, AddCountCommand:new())
	-- proxy
	appFacade:RegisterProxy(UserProxy:new("UserProxy", UserVO:new()))
end 
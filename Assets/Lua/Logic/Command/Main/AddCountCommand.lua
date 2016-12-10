require "Logic/Mediator/Main/MainMediator"
require "Logic/Mediator/Main/MainWnd"

AddCountCommand = class("AddCountCommand", SimpleCommand)

function AddCountCommand:Execute(notification)
	local proxy = appFacade:RetrieveProxy("UserProxy")
	proxy:IncreaseCountNum()
end 
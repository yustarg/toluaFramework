MainMediator = class("MainMediator", Mediator)

function MainMediator:initialize(mediatorName, viewComponent)
	Mediator.initialize(self, mediatorName, viewComponent)
end

function MainMediator:ListNotificationInterests()
	return {}
end

function MainMediator:HandleNotification(notification)
	local name = notification:GetName()
	local body = notification:GetBody()
	
end

MainMediator = class("MainMediator", Mediator)

MainMediator.static.MSG_CLICK_ADD_BTN = "MSG_CLICK_ADD_BTN"
MainMediator.static.MSG_UPDATE_COUNT_TEXT = "MSG_UPDATE_COUNT_TEXT"

function MainMediator:initialize(mediatorName, viewComponent)
	Mediator.initialize(self, mediatorName, viewComponent)
end

function MainMediator:ListNotificationInterests()
	return {
		MainMediator.MSG_UPDATE_COUNT_TEXT
	}
end

function MainMediator:HandleNotification(notification)
	local name = notification:GetName()
	local body = notification:GetBody()
	if name == MainMediator.MSG_UPDATE_COUNT_TEXT then
		self:UpdateCountText(body)
	end
end

function MainMediator:UpdateCountText(count)
	self.viewComponent:UpdateText(count)
end

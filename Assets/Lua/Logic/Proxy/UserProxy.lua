
UserProxy = class("UserProxy", Proxy)

function UserProxy:initialze(proxyName, data)
	Proxy.initialze(self, proxyName, data)
end

function UserProxy:IncreaseCountNum()
	self.data.countNum = self.data.countNum + 1
	appFacade:SendNotification(MainMediator.static.MSG_UPDATE_COUNT_TEXT, self.data.countNum) 
end

function UserProxy:GetCountNum()
	return self.data.countNum
end
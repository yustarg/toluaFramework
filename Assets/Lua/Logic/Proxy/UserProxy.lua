require "Framework/3rd/puremvc/patterns/Proxy/Proxy"

UserProxy = class("UserProxy", Proxy)

function UserProxy:initialize(proxyName, data)
	Proxy.initialize(self, proxyName, data)
end

function UserProxy:IncreaseCountNum()
	self.data.countNum = self.data.countNum + 1
	self:SendNotification(MainMediator.static.MSG_UPDATE_COUNT_TEXT, self.data.countNum) 
end

function UserProxy:GetCountNum()
	return self.data.countNum
end
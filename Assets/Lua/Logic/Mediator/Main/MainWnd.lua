MainWnd = class("MainWnd")

function MainWnd:initialize(transform)
	self.transform = transform
	self:InitUI()
end

function MainWnd:InitUI()
	self.button = self.transform:FindChild("Button"):GetComponent("Button")
	self.button.onClick:AddListener(function()
		print("on onClick!!!")
	end)
end
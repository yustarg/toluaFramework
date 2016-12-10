require "Framework/BaseUI"

MainWnd = class("MainWnd", BaseUI)

function MainWnd:initialize(root, path)
	BaseUI.initialize(self, root, path)
end

function MainWnd:Awake()
	self:InitUI()
end

function MainWnd:InitUI()
	self.button = self:GetButton("Button")
	self.button.onClick:AddListener(UnityAction(self.OnClick, self))
	
	self.text = self:GetText("Text")
end

function MainWnd:OnClick()
	-- print("OnClick")
	appFacade:SendNotification(MainMediator.MSG_CLICK_ADD_BTN)
end

function MainWnd:UpdateText(text)
	self.text.text = text
end
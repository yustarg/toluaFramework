require "Framework/FSM/State"
require "Logic/Command/Main/InitMainCommand"

MainState = class("MainState", State)

MainState.static.MSG_INIT_MAIN = "MSG_INIT_MAIN"

function MainState:initialize(name)
	State.initialize(self, name)
	self.appFacade = AppFacade:GetInstance(AppFacade.KEY)
end

function MainState:OnEnter()
	SceneMgr.Instance():LoadScene("Main", SceneMgr.LoadSceneDoneCallback(self.OnLoadSceneDone, self), nil)
	self:RegisterCommand()
end 

function MainState:OnLoadSceneDone(name)
	local root = GameObject.Find("MainRoot")
	self.appFacade:SendNotification(MainState.MSG_INIT_MAIN, root)
end

function MainState:RegisterCommand()
	self.appFacade:RegisterCommand(MainState.MSG_INIT_MAIN, InitMainCommand)
end

function MainState:RemoveCommand()
	self.appFacade:RemoveCommand(MainState.MSG_INIT_MAIN)
end

function MainState:OnExit()
 	self:RemoveCommand()
end 
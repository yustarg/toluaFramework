require "Framework/FSM/State"

MainState = class("MainState", State)

function MainState:initialize(name)
	State.initialize(self, name)
end

function MainState:OnEnter()
	SceneMgr.Instance():LoadScene("Main", SceneMgr.LoadSceneDoneCallback(self.OnLoadSceneDone, self), nil)
end 

function MainState:OnLoadSceneDone(name)
	
end

function MainState:OnExit()
 	
end 
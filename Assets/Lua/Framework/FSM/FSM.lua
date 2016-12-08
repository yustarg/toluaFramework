FSM = class("FSM")

function FSM:initialize()
	self.curState = nil
	self.stateMap = {}
end

function FSM:Start()
	
end

function FSM:AddState(name, state)
 	if self.stateMap[name] ~= nil then
 		error("fsm already has a state with the same name!")
 	end
 	self.stateMap[name] = state
end 

function FSM:RemoveState(name)
 	self.stateMap[name] = nil
end

function FSM:ChangeState(name, ...)
	if self.curState ~= nil then
		self.curState:OnExit()
	end
	if self.stateMap[name] ~= nil then
		self.curState = self.stateMap[name]
		self.curState:OnEnter(...)
	end
end
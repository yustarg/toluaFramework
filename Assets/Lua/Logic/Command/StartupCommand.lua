
require "Framework/FSM/FSM"
require "Logic/State/MainState"

StartupCommand = class("StartupCommand", SimpleCommand)

-- 逻辑初始化可以放到这里
function StartupCommand:Execute(notification)
 	print("StartupCommand:Execute")

 	GameFSM = FSM:new("FSM")
 	GameFSM:AddState("MainState", MainState:new("MainState"))
 	GameFSM:ChangeState("MainState")
end 
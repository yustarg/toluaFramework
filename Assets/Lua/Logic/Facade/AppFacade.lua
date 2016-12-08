require "Framework/3rd/puremvc/patterns/Command/SimpleCommand"
require "Framework/3rd/puremvc/patterns/Command/MacroCommand"
require "Framework/3rd/puremvc/patterns/Facade/Facade"
require "Framework/3rd/puremvc/patterns/Mediator/Mediator"
require "Logic/Command/StartupCommand"
require "Logic/Command/SwitchSceneCommand"

AppFacade = class("AppFacade", Facade)

AppFacade.static.KEY = "DEFAULTKEY"
AppFacade.static.STARTUP = "STARTUP"
AppFacade.static.SWITCH_SCENE = "SWITCH_SCENE"

function AppFacade:initialize(key)
	Facade.initialize(self, key)
end

function AppFacade:InitializeController()
 	Facade.InitializeController(self)
 	self:RegisterCommand(AppFacade.STARTUP, StartupCommand)
 	self:RegisterCommand(AppFacade.SWITCH_SCENE, SwitchSceneCommand)
end
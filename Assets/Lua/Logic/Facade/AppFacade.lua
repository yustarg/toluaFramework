require "Framework/3rd/puremvc/patterns/Command/SimpleCommand"
require "Framework/3rd/puremvc/patterns/Command/MacroCommand"
require "Framework/3rd/puremvc/patterns/Facade/Facade"
require "Framework/3rd/puremvc/patterns/Mediator/Mediator"
require "Logic/Command/StartupCommand"
require "Logic/Command/SwitchSceneCommand"

AppFacade = class("AppFacade", Facade)

AppFacade.static.KEY = "DEFAULTKEY"
AppFacade.static.MSG_STARTUP = "MSG_STARTUP"

function AppFacade:initialize(key)
	Facade.initialize(self, key)
end

function AppFacade:InitializeController()
 	Facade.InitializeController(self)
 	self:RegisterCommand(AppFacade.MSG_STARTUP, StartupCommand)
end
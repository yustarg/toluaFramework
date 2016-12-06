require "Framework/3rd/puremvc/patterns/Facade/Facade"

AppFacade = class("AppFacade", Facade)

AppFacade.static.KEY = "DEFAULTKEY"
AppFacade.static.STARTUP = "STARTUP"

function AppFacade:initialize(key)
	Facade.initialize(self, key)
end

function AppFacade:InitializeController()
 	Facade:InitializeController()
 	print("AppFacade:InitializeController !!")
 	-- self:RegisterCommand( STARTUP, StartupCommand );
end
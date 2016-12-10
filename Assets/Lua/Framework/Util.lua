Util = {}

function Util.AddLuaBehaviour(gameObject, luaTable)
	local luaBehaviour = gameObject:AddComponent(typeof(LuaBehaviour))
	luaBehaviour:Init(luaTable)
end
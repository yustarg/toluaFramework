using UnityEngine;
using System.Collections;
using LuaInterface; 

public class LuaMgr : MonoSingleton<LuaMgr>
{
    private static string puremvcPath = Application.dataPath + "/Lua/Framework/3rd";
    private LuaState lua = null;

    public LuaState LuaState
    {
        get { return lua; }
    }

    // Use this for initialization
    public void Init () {
        lua = new LuaState();
        lua.AddSearchPath(puremvcPath);
        lua.Start();
        LuaBinder.Bind(lua);
    }

    public void StartLua()
    {
        lua.DoFile("Main.lua");
        LuaFunction main = lua.GetFunction("Main");
        main.Call();
        main.Dispose();
        main = null;
    }
}

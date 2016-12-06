using UnityEngine;
using System.Collections;
using LuaInterface; 

public class LuaMgr : MonoBehaviour
{

    private static LuaMgr _instance;

    public static LuaMgr Instance
    {
        get
        {
            if (_instance == null)
            {
                Debug.LogError("LuaMgr is null!!");
            }
            return _instance;
        }
    }

    LuaState lua = null;

    void Awake()
    {
        _instance = this;
    }

    // Use this for initialization
    public void Init () {
        lua = new LuaState();
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

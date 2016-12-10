using UnityEngine;
using System.Collections;
using LuaInterface;

// 封装MonoBehaviour的生命周期及事件，分发到Lua
public class LuaBehaviour : MonoBehaviour
{
    public LuaTable table = null;

    // lua慎用OnEnable, 第一次的时候table还没被传进来，会出错
    void OnEnable()
    {
        if (this.table != null)
        {
            LuaFunction func = (LuaFunction)this.table["OnEnable"];
            if (func != null)
                func.Call(this.table);
        }
    }

    void OnDisable()
    {
        if (this.table != null)
        {
            LuaFunction func = (LuaFunction)this.table["OnDisable"];
            if (func != null)
                func.Call(this.table);
        }
    }

    void Start()
    {
        LuaFunction func = (LuaFunction)this.table["Start"];
        if (func != null)
            func.Call(this.table);
    }

    void Update()
    {
        LuaFunction func = (LuaFunction)this.table["Update"];
        if (func != null)
            func.Call(this.table);
    }

    void OnCollisionEnter2D(Collision2D coll)
    {
        //Debug.logger.Log("LuaBehaviour OnTriggerEnter2D");
        LuaFunction func = (LuaFunction)this.table["OnCollisionEnter2D"];
        if (func != null)
            func.Call(this.table, coll);
    }

    void OnCollisionExit2D(Collision2D coll)
    {
        //Debug.logger.Log("LuaBehaviour OnCollisionExit2D");
        LuaFunction func = (LuaFunction)this.table["OnCollisionExit2D"];
        if (func != null)
            func.Call(this.table, coll);
    }

    void OnCollisionStay2D(Collision2D coll)
    {
        //Debug.logger.Log("LuaBehaviour OnCollisionStay2D");
        LuaFunction func = (LuaFunction)this.table["OnCollisionStay2D"];
        if (func != null)
            func.Call(this.table, coll);
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        //Debug.logger.Log("LuaBehaviour OnTriggerEnter2D");
        LuaFunction func = (LuaFunction)this.table["OnTriggerEnter2D"];
        if (func != null)
            func.Call(this.table, other);
    }

    void OnTriggerExit2D(Collider2D other)
    {
        //Debug.logger.Log("LuaBehaviour OnTriggerExit2D");
        LuaFunction func = (LuaFunction)this.table["OnTriggerExit2D"];
        if (func != null)
            func.Call(this.table, other);
    }

    void OnTriggerStay2D(Collider2D other)
    {
        //Debug.logger.Log("LuaBehaviour OnTriggerStay2D");
        LuaFunction func = (LuaFunction)this.table["OnTriggerStay2D"];
        if (func != null)
            func.Call(this.table, other);
    }

    void OnDestroy()
    {
        LuaFunction func = (LuaFunction)this.table["OnDestroy"];
        if (func != null)
            func.Call(this.table);
        this.table = null;
    }

    ////协程
    //public void RunCoroutine(YieldInstruction ins, LuaFunction func, params System.Object[] args)
    //{
    //    StartCoroutine(doCoroutine(ins, func, args));
    //}

    //public void CancelCoroutine(YieldInstruction ins, LuaFunction func, params System.Object[] args)
    //{
    //    StopCoroutine(doCoroutine(ins, func, args));
    //}

    //private IEnumerator doCoroutine(YieldInstruction ins, LuaFunction func, params System.Object[] args)
    //{
    //    yield return ins;
    //    if (args != null)
    //    {
    //        func.Call(args);
    //    }
    //    else
    //    {
    //        func.Call();
    //    }
    //}

    public void Init(LuaTable table)
    {
        this.table = table;
        this.table["this"] = this;
        this.table["transform"] = transform;
        this.table["gameObject"] = gameObject;

        // 调用Awake生命周期
        LuaFunction func = (LuaFunction)this.table["Awake"];
        if (func != null)
            func.Call(this.table);
    }
}

using UnityEngine;
using System.Collections;

public class GameMgr : MonoBehaviour {
    
	// Use this for initialization
	void Start () {
        LuaMgr.Instance.Init();
        LuaMgr.Instance.StartLua();
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}

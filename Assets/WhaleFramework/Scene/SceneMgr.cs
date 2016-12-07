using System;
using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneMgr : MonoSingleton<SceneMgr> {

    /// <summary>
    /// 场景加载完成回调
    /// </summary>
    /// <param name="sceneName">场景名</param>
    public delegate void LoadSceneDoneCallback(string sceneName);
    /// <summary>
    /// 场景加载进度回调
    /// </summary>
    /// <param name="sceneName">场景名</param>
    /// <param name="progress">进度</param>
    public delegate void LoadSceneUpdateProgressCallback(string sceneName, float progress);

    //private LoadSceneDoneCallback mLoadingSceneDoneCallback = null;
    private LoadSceneDoneCallback mLoadSceneDoneCallback = null;
    private LoadSceneUpdateProgressCallback mUpdateProgressCallback = null;

    private AsyncOperation mOperation = null;
    private string mSceneName = String.Empty;

    public void LoadScene(string sceneName, LoadSceneDoneCallback loadSceneDoneCallback, LoadSceneUpdateProgressCallback updateCallback)
    {
        this.mSceneName = sceneName;
        this.mOperation = SceneManager.LoadSceneAsync(sceneName);
        this.mLoadSceneDoneCallback = loadSceneDoneCallback;
        this.mUpdateProgressCallback = updateCallback;
    }

    public void Update()
    {
        if (this.mOperation != null)
        {
            if (this.mUpdateProgressCallback != null)
            {
                this.mUpdateProgressCallback(this.mSceneName, this.mOperation.progress);
            }
            if (this.mOperation.isDone)
            {
                if (this.mLoadSceneDoneCallback != null)
                {
                    this.mLoadSceneDoneCallback(this.mSceneName);
                    this.mOperation = null;
                }
            }
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class prot_animator : MonoBehaviour {
    public GameObject fatherObject;
    List<Transform> childrenObjects;
    int childrenCount;
    public float framerate = 30.0f;
    int frameCounter = 0;
    bool goingForwards = true;
	// Use this for initialization
	void Start () {
        childrenCount = CountChildren();
        childrenObjects = GetChildren();

        InvokeRepeating("UpdateAnimation", 2.0f, 1.0f / framerate);
	}

    void UpdateAnimation()
    {
        
        if (frameCounter == childrenCount-1)
        {
            goingForwards = false;
        }

        if (frameCounter == 0)
        {
            goingForwards = true;
        }
        print(frameCounter);
        print(goingForwards);

        if (goingForwards)
        {
            childrenObjects[frameCounter].gameObject.SetActive(false);
            childrenObjects[frameCounter + 1].gameObject.SetActive(true);
            frameCounter = frameCounter + 1;
        }
        else
        {
            childrenObjects[frameCounter].gameObject.SetActive(false);
            childrenObjects[frameCounter - 1].gameObject.SetActive(true);
            frameCounter = frameCounter - 1;
        }
        
    }


    List<Transform> GetChildren()
    {
        List<Transform> children = new List<Transform>();
        int counter = 0;
        for (counter = 0; counter < childrenCount; counter++)
        {
            Transform child = fatherObject.transform.GetChild(counter);
            children.Add(child);
            child.gameObject.SetActive(false);
        }
            
        return children;
    }

   int CountChildren()
    {
        int counter = fatherObject.transform.childCount;
            
        return counter;
    }


    // Update is called once per frame
    void Update () {
		
	}
}

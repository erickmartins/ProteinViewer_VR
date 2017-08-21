using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LowGravityScript : MonoBehaviour {
    public Rigidbody rigidbody;
    [SerializeField] float downScaler = 5f;
    void FixedUpdate()
    {
        if (rigidbody.velocity.y < 0f) // still jumping and falling
        {
            rigidbody.AddForce(Vector3.down * downScaler);
        }
    }
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}

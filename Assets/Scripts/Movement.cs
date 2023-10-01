using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{
    public Camera main;

    private float speed = 3.0f;
    
   
    void Update()
    {
        var pos = transform.position.x;
        pos += speed * Time.deltaTime;
        transform.position = new Vector2(pos, 0);

        if (Input.GetMouseButton(0))  main.GetComponent<PostProcessing>().enabled = true;
        else main.GetComponent<PostProcessing>().enabled = false;


    }
}

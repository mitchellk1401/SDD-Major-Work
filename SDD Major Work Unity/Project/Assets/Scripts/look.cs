using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class look : MonoBehaviour
{
    public float cameraMoveSpeed;
    public Rigidbody2D cameraRb;
    public Rigidbody2D player;
    Vector2 movePos;
    public static bool shiftHeld = false;

    private void Start()
    {
        cameraMoveSpeed = 4f;
    }
    void Update()
    {
        if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
        {
            shiftHeld = true;
            movePos.x = Input.GetAxis("Horizontal");
            movePos.y = Input.GetAxis("Vertical");
        }
        else
        {
            shiftHeld = false;
          
        }


    }

    private void FixedUpdate()
    {
        if (shiftHeld)
        {
            cameraRb.MovePosition(cameraRb.position + movePos * cameraMoveSpeed * Time.deltaTime);
        }
        else
        {
            movePos.x = 0;
            movePos.y = 0;
            cameraRb.position = player.position;
        }
    }
}

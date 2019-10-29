using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Look : MonoBehaviour
{
    public float cameraMoveSpeed =4f;
    public Rigidbody2D cameraRb;
    public Rigidbody2D player;
    Vector2 movePos;
    public static bool shiftHeld = false;

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
            movePos.x = 0;
            movePos.y = 0;
        }


    }

    private void FixedUpdate()
    {
        if (shiftHeld == true)
        {
            cameraRb.AddForce(movePos, 0);
        }
        else
        {
            cameraRb.position = player.position;
        }
    }
}

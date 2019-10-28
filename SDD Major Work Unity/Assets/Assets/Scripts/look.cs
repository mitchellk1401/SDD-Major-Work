using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class look : MonoBehaviour
{
    public float cameraMoveSpeed;
    public Rigidbody2D rb;
    public Rigidbody2D player;
    Vector2 movePos;
    public static bool shiftHeld;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
        {
            shiftHeld = true;
        }
        else
        {
            shiftHeld = false;
        }
        if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
        {
            shiftHeld = true;
            movePos.x = Input.GetAxisRaw("Horizontal");
            movePos.y = Input.GetAxisRaw("Vertical");
        }
        else
        {
            rb.position = player.position;
        }

    }

    private void FixedUpdate()
    {
        rb.MovePosition(rb.position + movePos * cameraMoveSpeed * Time.deltaTime);
    }
}

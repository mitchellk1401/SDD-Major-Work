using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerController : MonoBehaviour
{
    public float moveSpeed = 4f;
    public Rigidbody2D rb;
    public Camera cam;

    Vector2 movePos;
    Vector2 mousePos;

  
    void Update()
    {
        mousePos = cam.ScreenToWorldPoint(Input.mousePosition);

        if (look.shiftHeld == false)
        {
            movePos.x = Input.GetAxis("Horizontal");
            movePos.y = Input.GetAxis("Vertical");
        }

    }

    private void FixedUpdate()
    {
        if(!look.shiftHeld)
        {
            rb.MovePosition(rb.position + movePos * moveSpeed * Time.deltaTime);
        }
        
        Vector2 lookDirection = mousePos - rb.position;

        //Calculate the angle from the look directon in radians than convert to degreese, for use on the character.
        float angle = Mathf.Atan2(lookDirection.y, lookDirection.x) * Mathf.Rad2Deg - 90f;
        rb.rotation = angle;
    }
}

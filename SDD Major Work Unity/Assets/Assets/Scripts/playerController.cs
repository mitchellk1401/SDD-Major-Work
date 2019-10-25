using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerController : MonoBehaviour
{
    public float moveSpeed = 4f;
    public Rigidbody2D rb;

    Vector2 movePos;

  
    void Update()
    {
        movePos.x = Input.GetAxisRaw("Horizontal");
        movePos.y = Input.GetAxisRaw("Vertical");
    }

    private void FixedUpdate()
    {
        rb.MovePosition(rb.position + movePos * moveSpeed * Time.deltaTime);
    }
}

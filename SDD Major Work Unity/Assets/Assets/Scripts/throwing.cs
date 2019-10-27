using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class throwing : MonoBehaviour
{
    public Transform firePoint;
    public GameObject ballPrefab;

    public float throwingForce = 20f;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            launch();
        }
    }

    void launch()
    {
        GameObject ball = Instantiate(ballPrefab, firePoint.position, firePoint.rotation);
        Rigidbody2D rb =  ball.GetComponent<Rigidbody2D>();
        rb.AddForce(firePoint.up * throwingForce, ForceMode2D.Impulse);
    }

}

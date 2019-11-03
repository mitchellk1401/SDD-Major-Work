using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class throwing : MonoBehaviour
{
    public Transform firePoint;
    public GameObject ballPrefab;

    public int ammo;
    private int maxAmmo =3;
    public int throwingCooldown;
    public float throwingForce = 20f;

    private void Start()
    {
        ammo = maxAmmo;
    }
    void Update()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            Time.timeScale = 0.3f;
        }
        if (Input.GetButtonUp("Fire1"))
        {
            launch();
            Time.timeScale = 1f;
        }
    }
    

    void launch()
    {
        GameObject ball = Instantiate(ballPrefab, firePoint.position, firePoint.rotation);
        Rigidbody2D rb =  ball.GetComponent<Rigidbody2D>();
        rb.AddForce(firePoint.up * throwingForce, ForceMode2D.Impulse);
    }

}

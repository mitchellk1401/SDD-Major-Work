using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class throwing : MonoBehaviour
{
    public Transform firePoint;
    public GameObject ballPrefab;

    public static int ammo;
    private int maxAmmo =3;
    public int throwingCooldown;
    public float throwingForce = 20f;
    public Image[] ammoUI;
    

    private void Start()
    {

        ammo = maxAmmo;

    }
    void Update()
    {
        imageUiHandler();

        if(ammo > 0)
        {
            if (Input.GetButtonDown("Fire1"))
            {
                Time.timeScale = 0.5f;
            }
            if (Input.GetButtonUp("Fire1"))
            {
                launch();
                Time.timeScale = 1f;
                ammo--;
               
            }
        }



    }
    

    void launch()
    {
        GameObject ball = Instantiate(ballPrefab, firePoint.position, firePoint.rotation);
        Rigidbody2D rb =  ball.GetComponent<Rigidbody2D>();
        rb.AddForce(firePoint.up * throwingForce, ForceMode2D.Impulse);
    }

    private void imageUiHandler()
    {
        if(ammo == 3)
        {
            ammoUI[2].gameObject.SetActive(true);
            ammoUI[1].gameObject.SetActive(true);
            ammoUI[0].gameObject.SetActive(true);
        }
        else if (ammo == 2)
        {
            ammoUI[2].gameObject.SetActive(false);
            ammoUI[1].gameObject.SetActive(true);
            ammoUI[0].gameObject.SetActive(true);
        }
        else if (ammo == 1)
        {
            ammoUI[1].gameObject.SetActive(false);
            ammoUI[0].gameObject.SetActive(true);
        }
        else
        {
            ammoUI[0].gameObject.SetActive(false);
        }
    }

}

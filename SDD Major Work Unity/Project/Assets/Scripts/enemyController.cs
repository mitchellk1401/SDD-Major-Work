using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyController : MonoBehaviour
{
    public GameObject enemy;
    public GameObject player;
    public Rigidbody2D rb;

    public float speed;
    public float health;
    private float maxHealth = 100f;
    void Start()
    {
        health = maxHealth;
    }


    void Update()
    {

    }

}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyController : MonoBehaviour
{
    public Transform[] movePositions;

    public float speed;
    private float waitTime;
    private int randomPos;

     void Start()
    {
        waitTime = 2f;
        randomPos = Random.Range(0, movePositions.Length);        
        
    }

    void Update()
    {
        transform.position = Vector2.MoveTowards(transform.position, movePositions[randomPos].position, speed * Time.deltaTime);
        if (Vector2.Distance(transform.position, movePositions[randomPos].position) < 2)
        {
            if(waitTime<= 0)
            {
                randomPos = Random.Range(0, movePositions.Length);
                waitTime = 2;
            }
            else
            {
                waitTime -= Time.deltaTime;
            }
        }
    }


}   
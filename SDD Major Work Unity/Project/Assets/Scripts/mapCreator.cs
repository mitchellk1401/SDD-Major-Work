using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;

public class mapCreator : MonoBehaviour
{
    public GameObject[] tiles;
    public GameObject wall;

    public List<Vector3> createdTiles;

    public int tileAmount;
    public int tileSize;

    public float chanceUp;
    public float chanceRight;
    public float chanceDown;
    
    private void Start()
    {
        //Store levels with random.Seed 

        StartCoroutine(generateLevel());
    }

    IEnumerator generateLevel()
    {
        for (int i = 0; i < tileAmount; i++)
        {
            int tile = Random.Range(0, tiles.Length);
            float dir = Random.Range(0f, 1f);

            CreateTile(tile);

            CallMoveDecider(dir);
            yield return new WaitForSeconds(0.01f);
        }

        yield return 0;
    }

    void CallMoveDecider(float ranDir)
    {
        print(ranDir);
        if(ranDir < chanceUp)
        {
            MoveDecider(0);
        } else if(ranDir < chanceRight){
            MoveDecider(1);
        } else if (ranDir < chanceDown){
            MoveDecider(2);
        } else {
            MoveDecider(3);
        }
    }

    void MoveDecider(int dir)
    {
        switch (dir)
        {
            case 0:

                transform.position = new Vector3(transform.position.x, transform.position.y + tileSize, 0);
                break;

            case 1:

                transform.position = new Vector3(transform.position.x + tileSize, transform.position.y, 0);
                break;

            case 2:

                transform.position = new Vector3(transform.position.x, transform.position.y - tileSize, 0);
                break;
            
            case 3:

                transform.position = new Vector3(transform.position.x - tileSize, transform.position.y, 0);
                break;

        }
    }

    void CreateTile( int tileIndex)
    {
        if (!createdTiles.Contains(transform.position))
        {
            GameObject tileObject;
            tileObject = Instantiate(tiles[tileIndex], transform.position, transform.rotation) as GameObject;
            createdTiles.Add(tileObject.transform.position);
        }
        else
        {
            tileAmount++;
        }

    }
}
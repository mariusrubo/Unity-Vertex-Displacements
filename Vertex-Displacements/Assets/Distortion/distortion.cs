using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class distortion : MonoBehaviour {

    public float size; // size of the lens
    public float strength; // strength of the lens
    public float inflate; // inflation of single character
   
    public Transform[] renderers; // simply insert all transforms with renderers that should be distorted
    Renderer[] rens; // gets the renderers of these transforms

    // Use this for initialization
    void Start () {
        rens = new Renderer[renderers.Length];

        for (int i = 0; i < renderers.Length; i++)
        {
            rens[i] = renderers[i].GetComponent<Renderer>();
        }

    }
	
	// Update is called once per frame
	void Update () {

        for (int i = 0; i < rens.Length; i++) // on all renderers...
        {
            for (int j = 0; j < rens[i].materials.Length; j++) // apply distortion to all meterials associated with this renderer
            {
                rens[i].materials[j].SetFloat("centerX", transform.position.x);
                rens[i].materials[j].SetFloat("centerY", transform.position.y);
                rens[i].materials[j].SetFloat("centerZ", transform.position.z);
                rens[i].materials[j].SetFloat("strength", strength*0.01f); // divide value to make it more handy in inspector
                rens[i].materials[j].SetFloat("size", size);
                rens[i].materials[j].SetFloat("inflate", inflate*0.001f); 
            }
        }

    }
}

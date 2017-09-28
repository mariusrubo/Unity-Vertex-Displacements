# Unity-Vertex-Displacements
An example showing how to distort objects while preserving touch

# Purpose
This project contains a shader and a script to distort a scene's arrangement using vertex displacement. Unlike the distortion of meshes themselves, this technique preserves the general arrangement of the scene: Objects that are touching remain touching after distortion, and object's that aren't touching also don't touch after distortion. 
![alt tag](https://github.com/mariusrubo/Unity-IIR-Online-Filtering/blob/master/filterexample.jpeg)

# Applications
One application is the distortion of virtual bodies in virtual body illusion using virtual reality. Here, visuo-tactile congruency during touch is disrupted when the body's mesh is distorted, but preserved when a similar distortion is applied using vertex displacement. 

# Further Reading
The technique is described in more detail in my article [to be announced]. Please cite the article when using this repo for your academic work.  

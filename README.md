# Unity-Vertex-Displacements
An example showing how to distort objects while preserving touch

# Purpose
This project contains a shader and a script to dynamically distort a scene's arrangement using vertex displacement. Unlike the distortion of meshes themselves, this technique preserves the general arrangement of the scene: Objects that are touching remain touching after distortion, and objects that are not touching still don't touch. In the image, the highlighted invisible game object marks the center of a visual lens, which can be moved in the scene and changed in size and strength. 

![alt tag](https://github.com/mariusrubo/Unity-Vertex-Displacements/blob/master/UnityVertexDisplacements.gif)

# Applications
One application is the distortion of virtual bodies in virtual body illusions using virtual reality. Here, visuo-tactile congruency during touch is disrupted when the body's mesh is distorted, but preserved when a similar distortion is applied using vertex displacement. 

# Further Reading
The technique is described in more detail in my article: 

Marius Rubo & Matthias Gamer, **Using Vertex Displacements to Distort Virtual Bodies and Objects While Preserving Visuo-tactile Congruency during Touch**, In *Proceedings of the 25th IEEE Virtual Reality (VR) conference,* 2018.

Please cite this article when using this repository for your academic work.  

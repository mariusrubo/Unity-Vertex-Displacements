Shader "Unlit/Distortion"
{
    Properties {
         _Color ("Color", Color) = (1,1,1,1)
         _MainTex ("Albedo (RGB)", 2D) = "white" {}
         _Glossiness ("Smoothness", Range(0,1)) = 0.5
         _Metallic ("Metallic", Range(0,1)) = 0.0
     }
     SubShader {
         Tags { "RenderType"="Opaque" }
         LOD 200
         
         CGPROGRAM
         #pragma surface surf Standard fullforwardshadows vertex:vert addshadow
         #pragma target 3.0
         struct Input {
             float2 uv_MainTex;
             float3 vertexColor; 
         };
         
         struct v2f {
           float4 pos : SV_POSITION;
           fixed4 color : COLOR;
         };
			

		 // variables for distortion
			float inflate = 0;
			float centerX;
			float centerY;
			float centerZ;
			float strength;
			float size;

         void vert (inout appdata_full v, out Input o)
         {
             UNITY_INITIALIZE_OUTPUT(Input,o); 
             o.vertexColor = v.color; 

			 v.vertex.xyz += v.normal * inflate;

		  // lens-shaped distortion
		  float3 world_space_vertex = mul(unity_ObjectToWorld, v.vertex ); // convert to world space
		  float3 lensoffset;
		  
		  lensoffset.x = 0; // first set all distortions to 0 (could also be done in "else"-statement)
		  lensoffset.y = 0;
		  lensoffset.z = 0;
		  // simply get distance of each vertex to lens. This is equivalent to: Vector3.Distance in C#: sqrt(a^2+b^2+c^2)
		  float distance = sqrt((world_space_vertex.x - centerX) *(world_space_vertex.x - centerX) + (world_space_vertex.y - centerY) *(world_space_vertex.y - centerY) + (world_space_vertex.z - centerZ) *(world_space_vertex.z - centerZ));
		  if (distance < 3.14159265359 / size) // "Reach" of the lens is one full sinus-curve in each direction. Beyond that, there is no effect. Since integral is 0 untill that point, effect of lens is smooth while it flies through objects. 
		  {
			  float offset = strength * sin(distance * size); // get total vertex offset and ...
			  lensoffset.x = offset * (world_space_vertex.x - centerX) / distance; // simply separate this along the three axes
			  lensoffset.y = offset * (world_space_vertex.y - centerY) / distance;
			  lensoffset.z = offset * (world_space_vertex.z - centerZ) / distance;
		  }

		  lensoffset = mul( unity_WorldToObject, lensoffset); // convert back to Unity's space
		  v.vertex.xyz += lensoffset; // apply vertex offset
         }
 

         sampler2D _MainTex;
 
         half _Glossiness;
         half _Metallic;
         fixed4 _Color;
 
         void surf (Input IN, inout SurfaceOutputStandard o) 
         {
             fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
             o.Albedo = c.rgb * IN.vertexColor; // Combine normal color with vertex color
             
             o.Metallic = _Metallic;
             o.Smoothness = _Glossiness;
             o.Alpha = c.a;
         }
         ENDCG
     } 
     FallBack "Diffuse"
 }
Shader "Custom/TerrainCircle"{

	Properties{
		_MainTex("Texture", 2D) = "white" {}
		_MainColor("Main Colour", Color) = (0, 1, 0)
		_CircleColor("Circle Colour", Color) = (1, 0, 0)
		_Center("Center", Vector) = (0, 0, 0, 0)
		_Radius("Radius", Range(0, 100)) = 10
		_Thickness("Thickness", Range(0, 100)) = 5


		}

		SubShader{
			CGPROGRAM
			#pragma surface surfaceFunc Lambert

			sampler2D _MainTex;
			fixed3 _MainColor;
			fixed3 _CircleColor;
			float _Thickness;
			float _Radius;
			float3 _Center;

			struct Input {
				   float2 uv_MainTex;
				   float3 worldPos;
				};

				void surfaceFunc(Input IN, inout SurfaceOutput o){
						half4 c = tex2D(_MainTex, IN.uv_MainTex);
						float dist = distance(_Center, IN.worldPos);

						if(dist > _Radius && dist < (_Radius + _Thickness)){
								o.Albedo = _CircleColor;
							}
							else
								{
									o.Albedo = c.rgb * _MainColor;
								}

								o.Alpha = c.a;
					}
						ENDCG

			}


	}
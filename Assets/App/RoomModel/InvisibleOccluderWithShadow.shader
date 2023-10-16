Shader "Custom/InvisibleOccluderWithShadow" {
    Properties {
        _Texture0("Texture 0", 2D) = "black" {}
        [HideInInspector] _texcoord( "", 2D ) = "white" {}
        [HideInInspector] __dirty( "", Int ) = 1
    }
    SubShader {
        Tags{ "RenderType" = "Transparent" }
        Cull Off
        ZWrite On
        Blend SrcAlpha OneMinusSrcAlpha
        BlendOp Add

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target {
                return float4(0,0,0,0);
            }
            ENDCG
        }

        CGPROGRAM
        #include "UnityPBSLighting.cginc"
        #include "UnityShaderVariables.cginc"
        #pragma target 3.0
        #pragma surface surf StandardCustomLighting keepalpha

        struct Input
        {
            float2 uv_texcoord;
        };

        struct SurfaceOutputCustomLightingCustom
        {
            fixed3 Albedo;
            fixed3 Normal;
            half3 Emission;
            half Metallic;
            half Smoothness;
            half Occlusion;
            fixed Alpha;
            Input SurfInput;
            UnityGIInput GIData;
        };

        uniform sampler2D _Texture0;
        uniform float4 _Texture0_ST;

        inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
        {
            UnityGIInput data = s.GIData;
            Input i = s.SurfInput;
            half4 c = 0;
            #if DIRECTIONAL
                float ase_lightAtten = data.atten;
                if( _LightColor0.a == 0)
                ase_lightAtten = 0;
            #else
                float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
                float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
            #endif
            float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
            float4 tex2DNode1 = tex2D( _Texture0, uv_Texture0 );
            float4 appendResult8 = (float4(tex2DNode1.r , tex2DNode1.g , tex2DNode1.b , 1.0));
            c.rgb = ( ( ase_lightAtten * _LightColor0 ) * appendResult8 ).rgb;
            c.a = max( tex2DNode1.a , ( 1.0 - ase_lightAtten ) );
            return c;
        }

        inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
        {
            s.GIData = data;
        }

        void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
        {
            o.SurfInput = i;
        }

        ENDCG
    }
}

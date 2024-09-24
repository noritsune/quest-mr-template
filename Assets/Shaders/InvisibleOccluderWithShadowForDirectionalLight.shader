// MRアプリで現実のものに適用するためのシェーダー
// 透明で他の物を遮蔽しつつ影を受ける。ディレクショナルライト専用

Shader "Custom/InvisibleOccluderWithShadowForDirectionalLight" {
    SubShader {
        // Geometry-1にしないと上手く遮蔽しない時がある
        Tags { "Queue" = "Geometry-1" }
        Cull Off
        ZWrite On
        Blend SrcAlpha OneMinusSrcAlpha
        BlendOp Add

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

        inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
        {
            UnityGIInput data = s.GIData;
            half4 c = 0;

            float ase_lightAtten = data.atten;
            if( _LightColor0.a == 0)
            ase_lightAtten = 0;

            float4 appendResult8 = (float4(0, 0, 0, 1.0));
            c.rgb = ( ( ase_lightAtten * _LightColor0 ) * appendResult8 ).rgb;
            c.a = max( 0 , ( 1.0 - ase_lightAtten ) );
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

// MRアプリで現実のものに適用するためのシェーダー
// 透明で他の物を遮蔽しつつ影を受ける。ポイントライト専用
// 参考: https://stackoverflow.com/questions/52455570/unity-transparent-shadow-receiving-plane-for-ar-app-to-receive-only-shadows-and

Shader "Custom/InvisibleOccluderWithShadowForPointLight" {
    SubShader {
        // Geometry-1にしないと上手く遮蔽しない時がある
        Tags { "Queue" = "Geometry-1" "LightMode" = "ForwardAdd" }
        Cull Off
        ZWrite On
        Blend DstColor Zero

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdadd_fullshadows
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"

            struct v2f {
                float4 pos : SV_POSITION;
                UNITY_SHADOW_COORDS(0)
            };

            v2f vert(appdata_base v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW(o);
                return o;
            }

            fixed4 frag(v2f i) : COLOR
            {
                return SHADOW_ATTENUATION(i);
            }
            ENDCG
        }
    }
}
/*
MIT License

Copyright (c) 2021 Shadowriver

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

Shader "Shadowriver/ALMultiVis"
{
    Properties
    {
        _MainTex ("Background", 2D) = "white" {}
        [Enum(ALMultiVisSelectSource)]_SelectSource ("Select Mask Source", int) = 0
        _SelectMaskTex ("Select Mask Texture", 2D) = "red" {}
        _TexUV ("UV Texture", 2D) = "white" {}
        _TexA ("Texture A", 2D) = "black" {}
        _TexB ("Texture B", 2D) = "black" {}
        _TexC ("Texture C", 2D) = "black" {}
        _TexD ("Texture D", 2D) = "black" {}
        _TexE ("Texture E", 2D) = "black" {}
        _TexF ("Texture F", 2D) = "black" {}
        [Toggle]_FallbackDisapper ("Fallback Disapper", int) = 1
        
        [Space(20)]
        [Header(Visualizator A Red)]
        [Toggle()]_A_Enable ("Enable", int) = 1
        [HDR]_A_ColorA ("Color A", Color) = (1.0,1.0,1.0,1.0)
        [HDR]_A_ColorB ("Color B", Color) = (0.0,0.0,0.0,1.0)
        [HDR]_A_ColorC ("Color C", Color) = (0.0,0.0,0.0,1.0)
        [Enum(ALMultiVisBlend)]_A_LayerBlend ("Layer Blend Mode", Int) = 0
        [Enum(ALMultiVisColorSource)]_A_OnColorSource ("On Color Source", Range(0,13)) = 0
        [Enum(ALMultiVisColorSource)]_A_OffColorSource ("Off Color Source", Range(0,13)) = 1
        //[Enum(ALMultiVisColorSource)]_A_LineColorSource ("Line Color Source", Range(0,13)) = 2
        [Enum(ALMultiVisUVSource)]_A_UVSource ("UV Source", Range(0,13)) = 0
        [Enum(ALMultiVisBlend)]_A_Blend ("Color Blend Mode", Range(0,10)) = 0
        [Enum(ALMultiVisDisplayType)]_A_DisplayMode ("Display Mode", Int) = 1
        [Enum(ALMultiVisInputData)]_A_InputData ("Input Data", Int) = 0
        _A_StartRange ("Start Range", Range(0,1)) = 0
        _A_EndRange ("End Range", Range(0,1)) = 1
        [Enum(ALMultiVisUVTransform)]_A_UVTransform ("UV Transform", Range(0,3)) = 0
        [Toggle()]_A_UVDualside("Dualsided UV", float) = 0
        [Toggle()]_A_EffectColorAUV ("Effect On Color UV", int) = 0
        [Toggle()]_A_Interpolation ("Interpolation", int) = 1
        [Toggle()]_A_Abs ("Absolute", int) = 0
        _A_InputScale ("Input Scale", float) = 1

        [Space(20)]
        [Header(Visualizator B Green)]
        [Toggle()]_B_Enable ("Enable", int) = 0
        [HDR]_B_ColorA ("Color A", Color) = (1.0,1.0,1.0,1.0)
        [HDR]_B_ColorB ("Color B", Color) = (0.0,0.0,0.0,1.0)
        [HDR]_B_ColorC ("Color C", Color) = (0.0,0.0,0.0,1.0)
        [Enum(ALMultiVisBlend)]_B_LayerBlend ("Layer Blend Mode", Int) = 0
        [Enum(ALMultiVisColorSource)]_B_OnColorSource ("On Color Source", Range(0,13)) = 0
        [Enum(ALMultiVisColorSource)]_B_OffColorSource ("Off Color Source", Range(0,13)) = 1
        //[Enum(ALMultiVisColorSource)]_B_LineColorSource ("Line Color Source", Range(0,13)) = 2
        [Enum(ALMultiVisUVSource)]_B_UVSource ("UV Source", Range(0,13)) = 0
        [Enum(ALMultiVisBlend)]_B_Blend ("Color Blend Mode", Range(0,10)) = 0
        [Enum(ALMultiVisDisplayType)]_B_DisplayMode ("Display Mode", Int) = 1
        [Enum(ALMultiVisInputData)]_B_InputData ("Input Data", int) = 0
        _B_StartRange ("Start Range", Range(0,1)) = 0
        _B_EndRange ("End Range", Range(0,1)) = 1
        [Enum(ALMultiVisUVTransform)]_B_UVTransform ("UV Transform", Range(0,3)) = 0
        [Toggle()]_B_UVDualside("Dualsided UV", float) = 0
        [Toggle()]_B_EffectColorAUV ("Effect On Color UV", int) = 0
        [Toggle()]_B_Interpolation ("Interpolation", int) = 1
        [Toggle()]_B_Abs ("Absolute", int) = 0
        _B_InputScale ("Input Scale", float) = 1

        [Space(20)]
        [Header(Visualizator C Blue)]
        [Toggle()]_C_Enable ("Enable", int) = 0
        [HDR]_C_ColorA ("Color A", Color) = (1.0,1.0,1.0,1.0)
        [HDR]_C_ColorB ("Color B", Color) = (0.0,0.0,0.0,1.0)
        [HDR]_C_ColorC ("Color C", Color) = (0.0,0.0,0.0,1.0)
        [Enum(ALMultiVisBlend)]_C_LayerBlend ("Layer Blend Mode", Int) = 0
        [Enum(ALMultiVisColorSource)]_C_OnColorSource ("On Color Source", Range(0,13)) = 0
        [Enum(ALMultiVisColorSource)]_C_OffColorSource ("Off Color Source", Range(0,13)) = 1
        //[Enum(ALMultiVisColorSource)]_C_LineColorSource ("Line Color Source", Range(0,13)) = 2
        [Enum(ALMultiVisUVSource)]_C_UVSource ("UV Source", Range(0,13)) = 0
        [Enum(ALMultiVisBlend)]_C_Blend ("Color Blend Mode", Range(0,10)) = 0
        [Enum(ALMultiVisDisplayType)]_C_DisplayMode ("Display Mode", Int) = 1
        [Enum(ALMultiVisInputData)]_C_InputData ("Input Data", Range(0,24)) = 0
        _C_StartRange ("Start Range", Range(0,1)) = 0
        _C_EndRange ("End Range", Range(0,1)) = 1
        [Enum(ALMultiVisUVTransform)]_C_UVTransform ("UV Transform", Range(0,3)) = 0
        [Toggle()]_C_UVDualside("Dualsided UV", float) = 0
        [Toggle()]_C_EffectColorAUV ("Effect On Color UV", int) = 0
        [Toggle()]_C_Interpolation ("Interpolation", int) = 1
        [Toggle()]_C_Abs ("Absolute", int) = 0
        _C_InputScale ("Input Scale", float) = 1

        [Space(20)]
        [Header(Visualizator D Alpha)]
        [Toggle()]_D_Enable ("Enable", int) = 0
        [HDR]_D_ColorA ("Color A", Color) = (1.0,1.0,1.0,1.0)
        [HDR]_D_ColorB ("Color B", Color) = (0.0,0.0,0.0,1.0)
        [HDR]_D_ColorC ("Color C", Color) = (0.0,0.0,0.0,1.0)
        [Enum(ALMultiVisBlend)]_D_LayerBlend ("Layer Blend Mode", Int) = 0
        [Enum(ALMultiVisColorSource)]_D_OnColorSource ("On Color Source", Range(0,13)) = 0
        [Enum(ALMultiVisColorSource)]_D_OffColorSource ("Off Color Source", Range(0,13)) = 1
        //[Enum(ALMultiVisColorSource)]_D_LineColorSource ("Line Color Source", Range(0,13)) = 2
        [Enum(ALMultiVisUVSource)]_D_UVSource ("UV Source", Range(0,13)) = 0
        [Enum(ALMultiVisBlend)]_D_Blend ("Color Blend Mode", Range(0,10)) = 0
        [Enum(ALMultiVisDisplayType)]_D_DisplayMode ("Display Mode", Int) = 1
        [Enum(ALMultiVisInputData)]_D_InputData ("Input Data", Range(0,24)) = 0
        _D_StartRange ("Start Range", Range(0,1)) = 0
        _D_EndRange ("End Range", Range(0,1)) = 1
        [Enum(ALMultiVisUVTransform)]_D_UVTransform ("UV Transform", Range(0,3)) = 0
        [Toggle()]_D_UVDualside("Dualsided UV", float) = 0
        [Toggle()]_D_EffectColorAUV ("Effect On Color UV", int) = 0
        [Toggle()]_D_Interpolation ("Interpolation", int) = 1
        [Toggle()]_D_Abs ("Absolute", int) = 0
        _D_InputScale ("Input Scale", float) = 1

        [Space(20)]
        [Header(GeneratedUV A)]
        [IntRange]_A_UVBase("Base UV", Range(1,8)) = 1
        _A_UVOffsetX("UV Offset X", float) = 0
        _A_UVOffsetY("UV Offset Y", float) = 0
        _A_UVScaleX("UV Scale X", float) = 1
        _A_UVScaleY("UV Scale Y", float) = 1
        _A_UVRotation("UV Rotation", float) = 0
        _A_UVMirror("UV Rotation", float) = 0

        [Space(20)]
        [Header(GeneratedUV B)]
        [IntRange]_B_UVBase("Base UV", Range(1,8)) = 1
        _B_UVOffsetX("UV Offset X", float) = 0
        _B_UVOffsetY("UV Offset Y", float) = 0
        _B_UVScaleX("UV Scale X", float) = 1
        _B_UVScaleY("UV Scale Y", float) = 1
        _B_UVRotation("UV Rotation", float) = 0
        
        [Space(20)]
        [Header(GeneratedUV C)]
        [IntRange]_C_UVBase("Base UV", Range(1,8)) = 1
        _C_UVOffsetX("UV Offset X", float) = 0
        _C_UVOffsetY("UV Offset Y", float) = 0
        _C_UVScaleX("UV Scale X", float) = 1
        _C_UVScaleY("UV Scale Y", float) = 1
        _C_UVRotation("UV Rotation", float) = 0

        [Space(20)]
        [Header(GeneratedUV D)]
        [IntRange]_D_UVBase("Base UV", Range(1,8)) = 1
        _D_UVOffsetX("UV Offset X", float) = 0
        _D_UVOffsetY("UV Offset Y", float) = 0
        _D_UVScaleX("UV Scale X", float) = 1
        _D_UVScaleY("UV Scale Y", float) = 1
        _D_UVRotation("UV Rotation", float) = 0


        [Space(20)]
        [Header(Custom Render Texture Input)]
        [Toggle()]_UseRenderTexture ("Input Custom Render Texture", int) = 0
        _RenderTexture ("Render Texture", 2D) = "black" {}
        _RTScale ("Render Texture Color Scale", float) = 2
        [Toggle()]_RTNegative ("Render Texture Have Negatives", int) = 1
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            #define ALI_BAND0 0
            #define ALI_BAND1 1
            #define ALI_BAND2 2
            #define ALI_BAND3 3
            #define ALI_SPECTOGRAM 4
            #define ALI_SPECTOGRAMEQ 5
            #define ALI_SPECTOGRAMCC 6
            #define ALI_WAVEFORM 7
            #define ALI_WAVEFORM48 8
            #define ALI_WAVEFORM12 9
            #define ALI_UV_RMS 10
            #define ALI_UV_PEAK 11
            #define ALI_UV_RMS_MARKER 12
            #define ALI_UV_PEAK_MARKER 13
            #define ALI_AUTOGAIN 14
            #define ALI_AUTOGAIN_SYM 15
            #define ALI_CCSTRIP 16
            #define ALI_CCCOLOR 17
            #define ALI_AUTOCORRELATION_CENTERED 18
            #define ALI_AUTOCORRELATION_SCRAMBLED 19
            #define ALI_SMOOTH_BAND0 20
            #define ALI_SMOOTH_BAND1 21
            #define ALI_SMOOTH_BAND2 22
            #define ALI_SMOOTH_BAND3 23
            #define ALI_ALL_BANDS 24

            #define VIS_NONE 0
            #define VIS_STRIP 1
            #define VIS_BAR 2
            #define VIS_LINE 3
            #define VIS_FILL 4
            #define VIS_POLAR_FILL 5
            #define VIS_CROSS_MULTIPLY 6

            #define COL_COLOR_A 0
            #define COL_COLOR_B 1
            #define COL_COLOR_C 2
            #define COL_TEX_BG 3
            #define COL_TEX_A 4
            #define COL_TEX_B 5
            #define COL_TEX_C 6
            #define COL_TEX_D 7
            #define COL_TEX_E 8
            #define COL_TEX_F 9
            #define COL_VERTEX 10
            #define COL_CCSTRIP_X 11
            #define COL_CCSTRIP_Y 12
            #define COL_CCCOLOR_X 13
            #define COL_CCCOLOR_Y 14
            #define COL_CCCOLOR_GRID 15

            #define BLE_LERP 0
            #define BLE_ADD 1
            #define BLE_MUL 2
            #define BLE_SUB 3
            #define BLE_HUE 4
            #define BLE_HUESAT
            #define BLE_MAX 5
            #define BLE_MIN 6

            #define UVT_NONE 0
            #define UVT_VERTICLE 1
            #define UVT_CIRCLE 2
            #define UVT_CONE 3

            #define UVS_UV1 0
            #define UVS_UV2 1
            #define UVS_UV3 2
            #define UVS_UV4 3
            #define UVS_UV5 4
            #define UVS_UV6 5
            #define UVS_UV7 6
            #define UVS_UV8 7
            #define UVS_GEN_A 8
            #define UVS_GEN_B 9
            #define UVS_GEN_C 10
            #define UVS_GEN_D 11
            #define UVS_TEX_UV 12
            #define UVS_TEX_A 13
            #define UVS_TEX_B 14
            #define UVS_TEX_C 15
            #define UVS_TEX_D 16
            #define UVS_TEX_E 17
            #define UVS_TEX_F 18

            #define SES_NONE 0
            #define SES_TEXTURE 1
            #define SES_VERTEX 2
            #define SES_GENERATED_UV 3
            

            struct appdata
            {
                float4 vertex : POSITION;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                float4 uv4 : TEXCOORD4;
                float4 uv5 : TEXCOORD5;
                float4 uv6 : TEXCOORD6;
                float4 uv7 : TEXCOORD7;
                float4 color : COLOR;
            };

            struct v2f
            {
                float4 uv[8] : TEXCOORD0;
                UNITY_FOG_COORDS(8)
                float4 color : COLOR;
                float4 vertex : SV_POSITION;
            };

            Texture2D<float4> _MainTex;
            Texture2D<float4> _SelectMaskTex;
            Texture2D<float4> _TexA;
            Texture2D<float4> _TexB;
            Texture2D<float4> _TexC;
            Texture2D<float4> _TexD;
            Texture2D<float4> _TexE;
            Texture2D<float4> _TexF;
            Texture2D<float4> _TexUV;

            SamplerState sampler_MainTex;
            SamplerState sampler_SelectMaskTex;
            SamplerState sampler_TexA;
            SamplerState sampler_TexB;
            SamplerState sampler_TexC;
            SamplerState sampler_TexD;
            SamplerState sampler_TexE;
            SamplerState sampler_TexF;
            SamplerState sampler_TexUV;

            float4 _MainTex_ST;
            bool _MixingMode;
            int _SelectSource;

            #define DECLERE_VIS_VARS(_ID_) \
            bool _##_ID_##_Enable; \
            float4 _##_ID_##_ColorA; \
            float4 _##_ID_##_ColorB; \
            float4 _##_ID_##_ColorC; \
            uint _##_ID_##_LayerBlend; \
            int _##_ID_##_InputData; \
            float _##_ID_##_StartRange; \
            float _##_ID_##_EndRange; \
            int _##_ID_##_DisplayMode; \
            bool _##_ID_##_Interpolation; \
            bool _##_ID_##_Abs; \
            bool _##_ID_##_EffectColorAUV; \
            float _##_ID_##_InputScale; \
            uint _##_ID_##_OnColorSource; \
            uint _##_ID_##_OffColorSource; \
            uint _##_ID_##_Blend; \
            uint _##_ID_##_UVTransform; \
            uint _##_ID_##_UVDualside; \
            uint _##_ID_##_UVSource;

            uniform uint _Enable = 0;
            uniform float4 _ColorA = 0;
            uniform float4 _ColorB = 0;
            uniform float4 _ColorC = 0;
            uniform int _InputData = 0;
            uniform float _StartRange = 0;
            uniform float _EndRange = 0;
            uniform int _DisplayMode = 0;
            uniform uint _Interpolation = 0;
            uniform uint _Abs = 0;
            uniform uint _EffectColorAUV = 0;
            uniform float _InputScale = 0;
            uniform uint _OnColorSource = 0;
            uniform uint _OffColorSource = 0;
            uniform uint _Blend = 0;
            uniform uint _UVTransform = 0;
            uniform uint _UVDualside = 0;
            uniform uint _UVSource = 0;

            DECLERE_VIS_VARS(A)
            DECLERE_VIS_VARS(B)
            DECLERE_VIS_VARS(C)
            DECLERE_VIS_VARS(D)

            #define DECLERE_UV_VARS(_ID_) \
            int _##_ID_##_UVBase; \
            float _##_ID_##_UVOffsetX; \
            float _##_ID_##_UVOffsetY; \
            float _##_ID_##_UVScaleX; \
            float _##_ID_##_UVScaleY; \
            float _##_ID_##_UVRotation; \

            DECLERE_UV_VARS(A)
            DECLERE_UV_VARS(B)
            DECLERE_UV_VARS(C)
            DECLERE_UV_VARS(D)

            bool _UseRenderTexture;
            float _RTScale;
            float _RTNegative;
            uniform v2f vertInput;

            bool _FallbackDisapper;


            Texture2D<float4> _AudioTexture;
            SamplerState sampler_AudioTexture;

            Texture2D<float4> _RenderTexture;
            SamplerState sampler_RenderTexture;

            uniform uint2 audioSize = uint2(0,0);
            

            float linearstep(float lo,float hi,float input) {
                float diff = hi-lo;
                float offset = input-lo;
                return min(1.0, max(0.0, offset/diff));
            }

            float3 HSVtoRGB(float3 HSV)
			{
    			float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    			float3 p = abs(frac(HSV.xxx + K.xyz) * 6.0 - K.www);
    			float3 x = HSV.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), HSV.y);
    			return x;
			}

			float3 RGBtoHSV(float3 RGB)
			{
    			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    			float4 p = lerp(float4(RGB.bg, K.wz), float4(RGB.gb, K.xy), step(RGB.b, RGB.g));
    			float4 q = lerp(float4(p.xyw, RGB.r), float4(RGB.r, p.yzx), step(p.x, RGB.r));
 
    			float d = q.x - min(q.w, q.y);
    			float e = 1.0e-10;
    			return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}

            float4 ReadAudioLink(uint x, uint y) {
                uint2 pos;
                pos.x = x-(floor(x/audioSize.x)*audioSize.x);
                pos.y = y+floor(x/audioSize.x);
                if(_UseRenderTexture) return (_RenderTexture.Sample(sampler_RenderTexture,float2((pos.x+0.5)/audioSize.x,(pos.y+0.5)/audioSize.y))-(_RTNegative ? 0.5 : 0))*(_RTNegative ? _RTScale*2.0 : _RTScale); 
                else return _AudioTexture[int2(pos)];
            }

            float4 LerpAudioLink(float x, uint y) {
                float4 start = ReadAudioLink(floor(x),y);
                float4 end = ReadAudioLink(floor(x)+1,y);
                return lerp(start,end,frac(x));

            }

            float4 SampleAudioLink(float x, float y) {
                if(_UseRenderTexture) return (_RenderTexture.Sample(sampler_RenderTexture,float2(x,y))-(_RTNegative ? 0.5 : 0))*(_RTNegative ? _RTScale*2.0 : _RTScale);
                else return _AudioTexture.Sample(sampler_AudioTexture,float2(x,y));
            }

            float ReadAudioInput(int audioInput, float position, bool interpolation) {
                uint size = 1;
                uint row = 0;
                uint column = 0;
                uint color = 0;
                uint to = 0;

                switch(audioInput) {
                    case ALI_BAND0: size=128; break;
                    case ALI_BAND1: size=128; row=1; break;
                    case ALI_BAND2: size=128; row=2; break;
                    case ALI_BAND3: size=128; row=3; break;
                    case ALI_ALL_BANDS: size=4; to=1; break;
                    case ALI_SPECTOGRAM: size=256; row=4; break;
                    case ALI_SPECTOGRAMEQ: size=256; row=4; color=1; break;
                    case ALI_SPECTOGRAMCC: size=256; row=4; color=2; break;
                    case ALI_WAVEFORM: size=2046; row=6; break;
                    case ALI_WAVEFORM48: size=2048; row=6; color=1; break;
                    case ALI_WAVEFORM12: size=1023; row=6; color=2; break;
                    case ALI_UV_RMS: size=1; row=22; column=8; break;
                    case ALI_UV_PEAK: size=1; row=22; column=8; color=1; break;
                    case ALI_UV_RMS_MARKER: size=1; row=22; column=9; break;
                    case ALI_UV_PEAK_MARKER: size=1; row=22; column=9; color=1; break;
                    case ALI_AUTOGAIN: size=1; row=22; column=11; break;
                    case ALI_AUTOGAIN_SYM: size=1; row=22; column=11; color=1; break;
                    case ALI_CCSTRIP: size=128; row=24; color=4; break;
                    case ALI_CCCOLOR: size=256; row=25; color=4; break;
                    case ALI_AUTOCORRELATION_CENTERED: size=128; row=27; break;
                    case ALI_AUTOCORRELATION_SCRAMBLED: size=128; row=27; color=1; break;
                    case ALI_SMOOTH_BAND0: size=16; row=28; break;
                    case ALI_SMOOTH_BAND1: size=16; row=29; break;
                    case ALI_SMOOTH_BAND2: size=16; row=30; break;
                    case ALI_SMOOTH_BAND3: size=16; row=31; break;
                }

                float4 al;
                float4 x; 

                if(size < 2) al = ReadAudioLink(column+position,row);
                else if(interpolation) al = LerpAudioLink((column+position*(size-1))-(size*floor((position*size)*to)),row+floor((position*size)*to));
                else al = ReadAudioLink(floor(position*size)+column-(size*floor((position*size)*to)),row+floor((position*size)*to));

                switch(color) {
                    case 0: x = al.r; break;
                    case 1: x = al.g; break;
                    case 2: x = al.b; break;
                    case 3: x = al.a; break;
                    case 4: x = al.r; break;
                }

                return x*_InputScale;
            }

            float ReadAudioInput(int audioInput, float position) {
                return ReadAudioInput(audioInput, position, false);
            }

            float4 SampleColorSource(int colorSource, float2 uv) {
                switch(colorSource) {
                    case COL_COLOR_A: return _ColorA;
                    case COL_COLOR_B: return _ColorB; 
                    case COL_COLOR_C: return _ColorC; 
                    case COL_TEX_A: return _TexA.Sample(sampler_TexA,uv); 
                    case COL_TEX_B: return _TexB.Sample(sampler_TexB,uv); 
                    case COL_TEX_C: return _TexC.Sample(sampler_TexC,uv); 
                    case COL_TEX_D: return _TexD.Sample(sampler_TexD,uv); 
                    case COL_TEX_E: return _TexE.Sample(sampler_TexE,uv); 
                    case COL_TEX_F: return _TexF.Sample(sampler_TexF,uv);
                    case COL_VERTEX: return vertInput.color;
                    case COL_CCSTRIP_X: return _UseRenderTexture ? _RenderTexture.Sample(sampler_RenderTexture,float2(uv.x, 24.5/64.0)) : _AudioTexture[int2(floor(uv.x*audioSize.y),24)]; 
                    case COL_CCSTRIP_Y: return _UseRenderTexture ? _RenderTexture.Sample(sampler_RenderTexture,float2(uv.y, 24.5/64.0)) : _AudioTexture[int2(floor(uv.y*audioSize.y),24)]; 
                    case COL_CCCOLOR_X: return _UseRenderTexture ? _RenderTexture.Sample(sampler_RenderTexture,float2(uv.x, 25.5/64.0)) : _AudioTexture[int2(floor(uv.x*audioSize.y),25)]; 
                    case COL_CCCOLOR_Y: return _UseRenderTexture ? _RenderTexture.Sample(sampler_RenderTexture,float2(uv.y, 25.5/64.0)) : _AudioTexture[int2(floor(uv.y*audioSize.y),25)]; 
                    case COL_CCCOLOR_GRID: return _AudioTexture.Sample(sampler_AudioTexture,float2(uv.y,25.5/audioSize.y)); 
                }

                return 0;
            }

            float2 GenerateUVA() {
                float2 uv = vertInput.uv[_A_UVBase-1];
                float deg = (_A_UVRotation/360)*UNITY_PI;
                uv -= 0.5;
                uv = float2((uv.x*cos(deg))-(uv.y*sin(deg)),(uv.x*sin(deg))+(uv.y*cos(deg)));
                uv *= float2(_A_UVScaleX,_A_UVScaleY);
                uv += float2(_A_UVOffsetX,_A_UVOffsetY);
                uv += 0.5;
                return uv;
            }

            float2 GenerateUVB() {
                float2 uv = vertInput.uv[_B_UVBase-1];
                float deg = (_B_UVRotation/360)*UNITY_PI;
                uv -= 0.5;
                uv *= float2(_B_UVScaleX,_B_UVScaleY);
                uv = float2((uv.x*cos(deg))-(uv.y*sin(deg)),(uv.x*sin(deg))+(uv.y*cos(deg)));
                uv += float2(_B_UVOffsetX,_B_UVOffsetY);
                uv += 0.5;
                return uv;
            }

            float2 GenerateUVC() {
                float2 uv = vertInput.uv[_C_UVBase-1];
                float deg = (_C_UVRotation/360)*UNITY_PI;
                uv -= 0.5;
                uv *= float2(_C_UVScaleX,_C_UVScaleY);
                uv = float2((uv.x*cos(deg))-(uv.y*sin(deg)),(uv.x*sin(deg))+(uv.y*cos(deg)));
                uv += float2(_C_UVOffsetX,_C_UVOffsetY);
                uv += 0.5;
                return uv;
            }

            float2 GenerateUVD() {
                float2 uv = vertInput.uv[_D_UVBase-1];
                float deg = (_D_UVRotation/360)*UNITY_PI;
                uv -= 0.5;
                uv *= float2(_D_UVScaleX,_D_UVScaleY);
                uv = float2((uv.x*cos(deg))-(uv.y*sin(deg)),(uv.x*sin(deg))+(uv.y*cos(deg)));
                uv += float2(_D_UVOffsetX,_D_UVOffsetY);
                uv += 0.5;
                return uv;
            }

            float2 GetUV(int UVSource) {
                switch(UVSource) {
                    case UVS_UV1: return vertInput.uv[0];
                    case UVS_UV2: return vertInput.uv[1];
                    case UVS_UV3: return vertInput.uv[2];
                    case UVS_UV4: return vertInput.uv[3];
                    case UVS_UV5: return vertInput.uv[4];
                    case UVS_UV6: return vertInput.uv[5];
                    case UVS_UV7: return vertInput.uv[6];
                    case UVS_UV8: return vertInput.uv[7];
                    case UVS_GEN_A: return GenerateUVA();
                    case UVS_GEN_B: return GenerateUVB();
                    case UVS_GEN_C: return GenerateUVC();
                    case UVS_GEN_D: return GenerateUVD();
                    case UVS_TEX_UV: return _TexUV.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_A: return _TexA.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_B: return _TexB.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_C: return _TexC.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_D: return _TexD.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_E: return _TexE.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                    case UVS_TEX_F: return _TexF.Sample(sampler_TexUV,vertInput.uv[0]).rg;
                }
                return 0;
            }



            float4 GenerateSelect() {
                float4 sel = float4(0.0,0.0,0.0,1.0);
                float2 uv = GenerateUVA();
                if(_A_Enable && uv.x > 0.0 && uv.y > 0.0 && uv.x < 1.0 && uv.y < 1.0) sel.r = 1.0;
                uv = GenerateUVB();
                if(_B_Enable && uv.x > 0.0 && uv.y > 0.0 && uv.x < 1.0 && uv.y < 1.0) sel.g = 1.0;
                uv = GenerateUVC(); 
                if(_C_Enable && uv.x > 0.0 && uv.y > 0.0 && uv.x < 1.0 && uv.y < 1.0) sel.b = 1.0;
                uv = GenerateUVD(); 
                if(_D_Enable && uv.x > 0.0 && uv.y > 0.0 && uv.x < 1.0 && uv.y < 1.0) sel.a = 1.0;
                return sel;  
            }

            float2 TransformUV(float2 uv, uint transfromType) {


                switch(transfromType) {
                    case UVT_VERTICLE: uv = uv.yx; break;
                    case UVT_CIRCLE: uv = float2((atan2(uv.x-0.5,uv.y-0.5)+UNITY_PI)/(UNITY_PI*2),length((uv-0.5)*2.0)); break;
                    case UVT_CONE: uv = float2(length((uv-0.5)*2.0),(atan2(uv.x-0.5,uv.y-0.5)+UNITY_PI)/(UNITY_PI*2)); break;
                }

                if(_UVDualside) {
                    uv.x -= 0.5;
                    uv.x *= 2.0;
                    uv.x = abs(uv.x);
                } 

                return uv;
            }

            

            v2f vert (appdata v)
            {
                v2f o;
                _AudioTexture.GetDimensions(audioSize.x,audioSize.y);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv[0] = v.uv0;
                o.uv[1] = v.uv1;
                o.uv[2] = v.uv2;
                o.uv[3] = v.uv3;
                o.uv[4] = v.uv4;
                o.uv[5] = v.uv5;
                o.uv[6] = v.uv6;
                o.uv[7] = v.uv7;
                UNITY_TRANSFER_FOG(o,o.vertex);
                o.color = v.color;
                return o;
            }


            #define SETUP_VIS(_ID_) \
            \
            _Enable = _##_ID_##_Enable; \
            _ColorA = _##_ID_##_ColorA; \
            _ColorB = _##_ID_##_ColorB; \
            _ColorC = _##_ID_##_ColorC; \
            _InputData = _##_ID_##_InputData; \
            _StartRange = _##_ID_##_StartRange; \
            _EndRange = _##_ID_##_EndRange; \
            _DisplayMode = _##_ID_##_DisplayMode; \
            _Interpolation = _##_ID_##_Interpolation; \
            _Abs = _##_ID_##_Abs; \
            _EffectColorAUV = _##_ID_##_EffectColorAUV; \
            _InputScale = _##_ID_##_InputScale; \
            _OnColorSource = _##_ID_##_OnColorSource; \
            _OffColorSource = _##_ID_##_OffColorSource; \
            _Blend = _##_ID_##_Blend; \
            _UVTransform = _##_ID_##_UVTransform; \
            _UVDualside = _##_ID_##_UVDualside; \
            _UVSource = _##_ID_##_UVSource;

            float3 BlendColor(float3 colA, float3 colB, float weight, int mode) {
                switch(mode) { 
                    case BLE_LERP: return lerp(colA,colB,weight);
                    case BLE_ADD: return colA+(colB*(weight));  
                    case BLE_MUL: return colA*(colB*(weight)); 
                    case BLE_SUB: return colA-(colB*(weight));  
                    case BLE_HUE: 
                        colA = RGBtoHSV(colA); 
                        colB = RGBtoHSV(colB); 
                        return lerp(HSVtoRGB(colA),HSVtoRGB(float3(colB.r,colA.g,colA.b)),weight);
                    case BLE_MAX: return max(colA,colB);
                    case BLE_MIN: return min(colA,colB);  
                                
                }
                return colA;
            } 

            float4 DrawVisualization() {
                float x = 0;
                float a = 0;
                float b = 0;
                    float2 rawUV = GetUV(_UVSource);
                    float2 uv = TransformUV(rawUV,_UVTransform);
                    switch(_DisplayMode) {
                            case VIS_NONE:
                                x = 1; 
                                break; 
                            case VIS_STRIP: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,uv.x),_Interpolation); 
                                x = _Abs?abs(a):max(a,0.0f); 
                                break; 
                            case VIS_BAR: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,uv.x),_Interpolation); 
                                x = step(uv.y,_Abs?abs(a):a); 
                                break; 
                            case VIS_LINE: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,uv.x),_Interpolation);
                                x = linearstep(.0050001f,.005f,abs(uv.y-0.5-(_Abs?abs(a):a)/2));
                                break; 
                            case VIS_FILL: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,uv.x),_Interpolation);
                                x = 1-step(_Abs?abs(a):a,(uv.y-0.5)*2); 
                                break; 
                            case VIS_POLAR_FILL: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,uv.x),_Interpolation); 
                                b = (uv.y-0.5)*2; 
                                if(_Abs) x = step(abs(b),abs(a)); 
                                else x = b >= 0 ? 1-step(a,b) : 1-step(b,a); 
                                break; 
                            case VIS_CROSS_MULTIPLY: 
                                a = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,abs((uv.x-0.5)*2.0)),_Interpolation); 
                                b = ReadAudioInput(_InputData,lerp(_StartRange,_EndRange,abs((uv.y-0.5)*2.0)),_Interpolation); 
                                x = a * b; 
                                break; 
                        } 
                        
                    float4 colA = SampleColorSource(_OnColorSource,_EffectColorAUV ? uv : vertInput.uv[0]); 
                    float4 colB = SampleColorSource(_OffColorSource,vertInput.uv[0]); 
                        
                    return float4(BlendColor(colB, colA, x*colA.a, _Blend),lerp(colB.a,colA.a,x));
                    
                
               
            }

            fixed4 frag (v2f i) : SV_Target
            {

                vertInput = i;
                if(_UseRenderTexture) {audioSize.x = 128; audioSize.y = 64; } 
                else _AudioTexture.GetDimensions(audioSize.x,audioSize.y);
                if(_FallbackDisapper && audioSize.x <= 16) discard;
                fixed4 col = float4(0,0,0,1);
                fixed4 finalColor = 0;

                float4 bg = _MainTex.Sample(sampler_MainTex,i.uv[0]);
                float4 select = float4(0,0,0,1);
                switch(_SelectSource) {
                    case SES_NONE: select = float4(1,1,1,0); break;
                    case SES_TEXTURE: select = _SelectMaskTex.Sample(sampler_SelectMaskTex,i.uv[0]);break;
                    case SES_VERTEX: select = i.color;break;
                    case SES_GENERATED_UV: select = GenerateSelect(); break;
                }
                
                finalColor = bg;
                if(_A_Enable && select.r > 0.0f) {
                    SETUP_VIS(A)
                    col = DrawVisualization();
                    finalColor.rgb = BlendColor(finalColor, col, select.r*col.a, _A_LayerBlend);
                    finalColor.a = max(finalColor.a,col.a*select.r);
                    col = bg;
                    
                }
                if(_B_Enable && select.g > 0.0f) {
                    SETUP_VIS(B)
                    col = DrawVisualization();
                    finalColor.rgb = BlendColor(finalColor, col, select.g*col.a, _B_LayerBlend);
                    finalColor.a = max(finalColor.a,col.a*select.g);
                    col = bg;
                }
                if(_C_Enable && select.b > 0.0f) {
                    SETUP_VIS(C)
                    col = DrawVisualization();
                    finalColor.rgb = BlendColor(finalColor, col, select.b*col.a, _C_LayerBlend);
                    finalColor.a = max(finalColor.a,col.a*select.b);
                    col = bg;
                }
                if(_D_Enable && (1-select.a) > 0.0f) {
                    SETUP_VIS(D)
                    col = DrawVisualization();
                    finalColor.rgb = BlendColor(finalColor, col, (1-select.a)*col.a, _D_LayerBlend);
                    finalColor.a = max(finalColor.a,col.a*(1-select.a));
                    col = bg;
                }
                

                UNITY_APPLY_FOG(i.fogCoord, finalColor);
                return finalColor;
            }
            ENDCG
        }
    }
}

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

using UnityEngine;

public enum ALMultiVisInputData 
{    
    Band0 = 0,
    Band1 = 1,
    Band2 = 2,
    Band3 = 3, 
    AllBands = 24,
    Spectogram = 4,
    SpectogramEQ = 5,
    SpectogramCC = 6,
    Waveform = 7,
    Waveform48 = 8,
    Waveform12 = 9,
    UVrms = 10,
    UVpeak = 11,
    UVMarkerRMS = 12,
    UVMarketPeak = 13,
    Autogain = 14,
    AutogainSymmetric = 15,
    ColorCorrdStrip = 16,
    ColorCorrdColor = 17,
    AutoCorrelationCentered = 18,
    AutoCorrelationScrambled = 19,
    SmoothBand0 = 20,
    SmoothBand1 = 21,
    SmoothBand2 = 22,
    SmoothBand3 = 23

}

public enum ALMultiVisDisplayType
{  
    None = 0,
    Strip = 1,
    Bar = 2,
    Line = 3,
    Fill = 4,
    PolarFill = 5,
    CrossMultiply = 6
}

public enum ALMultiVisColorSource
{  
    ColorA = 0,
    ColorB = 1,
    ColorC = 2,
    Background = 3,
    TextureA = 4,
    TextureB = 5,
    TextureC = 6,
    TextureD = 7,
    TextureE = 8,
    TextureF = 9,
    VertexColor = 10,
    CCStripX = 11,
    CCStripY = 12,
    CCColorX = 13,
    CCColorY = 14,
    CCColorGrid = 15
}

public enum ALMultiVisBlend
{  
    Lerp = 0,
    Add = 1,
    Mul = 2,
    Sub = 3,
    Hue = 4,
    Max = 5,
    Min = 6
}

public enum ALMultiVisSelectSource
{  
    None = 0,
    Texture = 1,
    VertexColor = 2,
    GeneratedUV = 3
}

public enum ALMultiVisUVSource {
    UV1 = 0,
    UV2 = 1,
    UV3 = 2,
    UV4 = 3,
    UV5 = 4,
    UV6 = 5,
    UV7 = 6,
    UV8 = 7,
    GeneratedUV_A = 8,
    GeneratedUV_B = 9,
    GeneratedUV_C = 10,
    GeneratedUV_D = 11,
    UVTexture = 12,
    TextureA = 13,
    TextureB = 14,
    TextureC = 15,
    TextureD = 16,
    TextureE = 17,
    TextureF = 18
}

public enum ALMultiVisUVTransform
{  
    None = 0,
    Verticule = 1,
    Circle = 2,
    Cone = 3
}
# ALMultiVis
ALMultiVis is a 4 layer AudioLink visualization shader with one visualization per layer and ability to mix them together. Goal of shader is to give the ability to create audio visualization materials useful for many different applications in both avatars and worlds that allows use of any portion of audio information contained in AudioLink. Shaders have different color sourcing and blending, UV sourcing and transformation enriching composition options. Shader supports both AudioLink from grab pass as well as render texture.

The shader is not 100% complete. it missing things i wanted to add (and i will add in future!) as well got some in devlopment things that may not make sense it's there right now. So treat it as on devlopment shader. I also didnt have time to fully test it, it may have bugs, feel free to raport if you find any!

# How to use it?
Full documentation comming soon! (Sorry, didn't make it in time as i has lot of thing son head ;p), but here some basics:

-As said in description it's 4 layer visualiser, they can be masked using "Select mask", masking is disabled by default (all visualisers will be show on top of eachother), but you can source mask texture (dedicated slot for that) or vertex color or gernerated UV areas (read below). Each visualizer is assign to color chanell of mask Red = Visualiser A, Green = Visualiser B, Blue = Visualiser C, 1 - Alpha = Visualiser D (it inverted in Alpha as 1 is default value, so more trasparent Texture is the more Visualiser D will be visiable, if you use texture remember to enable transparency

-Generated UVs also generates select mask between there 0 and 1 values, A = Red, B = Green, C = Blue, D = Alpha

-On color is color of visualiser while Off color of background

-UV and Colors are sampled from input sources. By default it is Color A and B setting and UV1, but you can use vertex color or texture (6 texture slots + background texture) as color input as well as color data transmitted by AudioLink (like Color corrd strip). You can also read all UVs from mesh as well as generated UVs form settings (settings below) add yes you can sample UV out of texture! (just dont compress it as it introduce distortions)

-UV transfromations in visualisers dont effect color UV, but you can enable to effect On color source (useful with color corrd strip)

-There 2 color lending options, Layer effects interaction with visualiser below it, Color effects blending Off with On color

Shader includes example materials same you seen in vket6 booth, so you can learn from them ow to use the shader.

You can download package version of shader in Vket Store page: XXX

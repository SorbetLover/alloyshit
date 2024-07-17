// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

//thank for https://www.shadertoy.com/view/MdX3Rr by iq

#define PI 3.14159265359
		const vec4 _Color0 = vec4(0.2, 0.6, 0.2f, 1.0);
		const float _Scale = 2.0;
		const float _Strenght = 20.0;
		const float _Speed = 0.2;
		
		vec2 voronoihash3(vec2 p)
		{
			p = vec2(dot(p, vec2(127.1,311.7)), dot(p, vec2(269.5, 183.3)));
			return fract(sin(p) * 43758.5453);
		}
		
		float voronoi3(vec2 v, float time)
		{
			vec2 n = floor(v);
			vec2 f = fract(v);
			float F1 = 8.0; float F2 = 8.0; 
		
			for (int j = -1; j <= 1; j++)
			{
				for (int i = -1; i <= 1; i++)
				{
					vec2 g = vec2(i, j);
					vec2 o = voronoihash3(n + g);
					o = sin(time + o * 6.2831) * 0.5 + 0.5;
					vec2 r = f - g - o;
					float d = 0.5 * dot(r, r);
			
					if(d < F1) 
					{
						F2 = F1; 
						F1 = d; 
					} else if(d < F2) {
						F2 = d;
					}
				}
			}
			return F1;
		}
		
        
		vec4 surf(vec2 uv)
		{
            
			vec2 center45_g1 = vec2(0.85, 0.4);
			vec2 delta6_g1 = uv - center45_g1;
			float angle10_g1 = length(delta6_g1) * _Strenght;
			float x23_g1 = ((cos(angle10_g1) * delta6_g1.x) - (sin(angle10_g1) * delta6_g1.y));
			vec2 break40_g1 = center45_g1;
			float iTime = iTime;
			vec2 temp_cast_0 = vec2(iTime * _Speed);
			vec2 break41_g1 = temp_cast_0;
			float y35_g1 = (sin(angle10_g1) * delta6_g1.x) + (cos(angle10_g1) * delta6_g1.y);
			vec2 appendResult44_g1 = vec2((x23_g1 + break40_g1.x + break41_g1.x), (break40_g1.y + break41_g1.y + y35_g1));
			vec2 coords3 = appendResult44_g1 * _Scale;
			float time3 = 0.0;
			float voroi3 = voronoi3(coords3, time3);
			vec4 temp_output_17_0 = _Color0 * voroi3;
			temp_output_17_0.a = 1.0f; 
			
            return temp_output_17_0;
		}


void mainImage(out vec4 fragColor, in vec2 fragCoord )
{
    vec2 p0 = fragCoord.xy / iResolution.xy;
    p0.x *= iResolution.x/iResolution.y;
    p0 *= .9f;
    fragColor = surf(p0);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
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

/* "Animated loading icon" by Stanislav Pidhorskyi - 2014
 * License Creative Commons Attribution 4.0 International License.
 * Contact: stanislav@podgorskiy.com
 */

float smoothing = 1.0 / 256.0;
vec4 color = vec4(1.0);

float Union(float a, float b)
{
	return min(a, b);
}

float Substraction(float a, float b)
{
    return max(a,-b);
}

float Intersection(float a, float b)
{
    return max(a,b);
}

float Circle(vec2 p, float r)
{
	return length(p) - r;
}

float SDF(vec2 p)
{
    float t = 4.0 * (5.0 * iTime + 1.0 * sin(5.0 * iTime));
    float dt = 1.0 + 1.0 * cos(5.0 * iTime);
    
    float sm = clamp(1.5 * cos(2.5 * iTime), -1.0, 1.0);
    
    float a = atan(p.y, p.x);
    float segmentA =  sin(a * 12.0 + t) * 0.1 + 0.07;
    float segmentB = -sin(a * 12.0 - t) * 0.1 + 0.07;
    
    float ringASize = 0.4 + sm * 0.1;
    float ringBSize = 0.4 - sm * 0.1;
    float width = 0.5;
    
    float bigCircleA = Circle(p, ringASize + ringASize * width);
    
    float smallCircleA = Circle(p, ringASize);
    
    float bigCircleB = Circle(p, ringBSize + ringBSize * width);
    
    float smallCircleB = Circle(p, ringBSize);
    
    float ringA = Substraction(bigCircleA, smallCircleA);
    float ringB = Substraction(bigCircleB, smallCircleB);
    
    return Union(Intersection(ringA, segmentA), Intersection(ringB, segmentB));
}

float Render(vec2 p)
{
    float dist = SDF(p);
    return smoothstep(0.0, smoothing, -dist);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{	
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 p = uv.xy * vec2(2.0) - vec2(1.0);
    float aspect = iResolution.x / iResolution.y;
    p.x *= aspect;
    
#if 1
    vec3 color = vec3(0.1, 0.4, 0.1);
    float alphaBackground = Render(p * 0.3 + vec2(0.6, 0.5));
    color = mix(color, vec3(0.1, 0.45, 0.1), alphaBackground);
    float alphaBackground2 = Render(p * 0.3 - vec2(0.7, 0.6));
    color = mix(color, vec3(0.25, 0.4, 0.1), alphaBackground2);
    float alpha = Render(p);
    color = mix(color, vec3(0.6, 0.8, 0.6), alpha);
	fragColor = vec4(color, texture(iChannel0, uv).a);

#else
    float alpha = Render(p);
	fragColor = color * alpha;
#endif
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
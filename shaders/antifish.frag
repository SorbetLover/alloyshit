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


// -----------------------------------------------------------------------------------------------------------------
// # fisheye reference
// - https://www.shadertoy.com/view/4s2GRR
// -----------------------------------------------------------------------------------------------------------------

#define PI 3.1415

vec2 antiFisheye(vec2 p, float aspect, float rate) {
	vec2 m = vec2(.5, .5 / aspect);
	vec2 d = p - m;
	float r = sqrt(dot(d, d));
    
    float power = (.1 * PI / (2. * sqrt(dot(m, m)))) * rate;

    float bind = m.y;    
	return m + normalize(d) * atan(r * -power * 10.) * bind / atan(-power * bind * 10.);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 p = fragCoord.xy / iResolution.x;
	float prop = iResolution.x / iResolution.y;
    float power = mix(-.5, 0., iMouse.x / iResolution.x);
    
    vec2 uvR = antiFisheye(p, prop, power);
    vec2 uvG = antiFisheye(p, prop, power + .02);
    vec2 uvB = antiFisheye(p, prop, power + .04);
    
	vec4 colR = texture(iChannel0, vec2(uvR.x, uvR.y * prop));
	vec4 colG = texture(iChannel0, vec2(uvG.x, uvG.y * prop));
	vec4 colB = texture(iChannel0, vec2(uvB.x, uvB.y * prop));

    vec4 color = vec4(colR.r, colG.g, colB.b, 1.);
    
    fragColor = color;
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
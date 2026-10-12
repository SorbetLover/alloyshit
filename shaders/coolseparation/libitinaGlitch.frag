// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

uniform float glitchThing;
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 2.0 - 1.0;
}

float offset(float blocks, vec2 uv) {
	return glitchThing;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	
    fragColor = texture(iChannel0, uv);
    
	fragColor.r = texture(iChannel0, uv + vec2(offset(16.0, uv) * 0.03, 0.0)).r;	
	fragColor.g = texture(iChannel0, uv + vec2(offset(8.0, uv) * 0.03 * 0.16666666, 0.0)).g;
	fragColor.b = texture(iChannel0, uv + vec2(offset(8.0, uv) * 0.03, 0.0)).b;

}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
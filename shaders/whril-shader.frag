// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime = 0.0;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

// Whirl swirl distortion - Shadertoy
uniform float strength;
uniform float radius;
uniform float falloff;
uniform float speed;

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{


    vec2 uv = fragCoord / iResolution.xy;
    vec2 center = vec2(0.5, 0.5);

    vec2 pos = uv - center;
    pos.x *= iResolution.x / iResolution.y;

    float dist = length(pos);

    float t = iTime * speed;

    float m = smoothstep(radius, radius * (1.0 - falloff), dist);

    float angle = atan(pos.y, pos.x);
    float swirlAmount = strength * (1.0 - m) * (1.0 - dist);
    swirlAmount += 0.5 * sin(t);

    float newAngle = angle + swirlAmount;

    vec2 newPos = vec2(cos(newAngle), sin(newAngle)) * dist;

    newPos.x *= iResolution.y / iResolution.x;

    vec2 newUV = center + newPos;

    fragColor = texture(iChannel0, newUV);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
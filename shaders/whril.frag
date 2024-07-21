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

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalized coordinates (0 to 1)
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    // Center coordinates
    vec2 center = vec2(0.5, 0.5);
    
    // Distance from the center
    vec2 p = uv - center;
    float dist = length(p);
    
    // Angle based on distance and time
    float angle = atan(p.y, p.x) + iTime * 2.0 * dist;
    
    // New position after whirl
    vec2 whirlUV = center + vec2(cos(angle), sin(angle)) * dist;
    
    // Clamp whirlUV to ensure it is within texture bounds
    whirlUV = clamp(whirlUV, 0.0, 1.0);
    
    // Debug output: visualize whirlUV
    vec3 debugColor = vec3(whirlUV, 0.0);
    
    // Texture color
    vec3 color = texture(iChannel0, whirlUV).rgb;
    
    // Output color
    fragColor = vec4(color, texture(iChannel0, uv).a);
    
    // Uncomment the line below to debug whirlUV
    // fragColor = vec4(debugColor, 1.0); // Use this line for debugging
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}

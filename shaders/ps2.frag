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

#define MAX_STEPS 1000
#define MAX_DIST 100.
#define SURF_DIST .001
#define SURF_BIAS 1.0;
#define TAU 6.283185
#define PI 3.141592

#define LIGHT_RADIUS 2.

#define SCENE_OBJ_COUNT 5

mat2 Rot(float a) {
    float s=sin(a), c=cos(a);
    return mat2(c, -s, s, c);
}

float sdBox(vec3 p, vec3 s) {
    p = abs(p)-s;
	return length(max(p, 0.))+min(max(p.x, max(p.y, p.z)), 0.);
}

float Hash21(vec2 p)
{
    p = fract(p*vec2(443.53, 331.13));
    p += dot(p, p+2444.123);
    return fract(p.x*p.y);
}

struct SDF {
  float dist;
  int materialID;
};

SDF minSDF(SDF[SCENE_OBJ_COUNT] scene)
{
    SDF min_s = scene[0];
    for(int i = 1; i < SCENE_OBJ_COUNT; i++)
        if(scene[i].dist < min_s.dist)
            min_s = scene[i];
            
    return min_s;
}

vec2 pillar_id;
SDF GetDist(vec3 p, vec3 rd) {
    SDF scene[SCENE_OBJ_COUNT]; 
    
    //Glass Cubes
    vec3 new_position = p-vec3(-1.,8.0,2.);
    new_position.xz *= Rot(iTime*0.1);
    new_position.zy *= Rot(iTime*0.1);
    
    scene[0] = SDF(sdBox(new_position, vec3(0.6)), 0);
    
    new_position = p-vec3(4.,7.0,1.);
    new_position.xz *= Rot(-iTime*0.15);
    new_position.zy *= Rot(iTime*0.1);
    
    scene[1] = SDF(sdBox(new_position, vec3(0.6)), 0);
    
    new_position = p-vec3(-3.,6.0,-2);
    new_position.xz *= Rot(iTime*0.2);
    new_position.zy *= Rot(-iTime*0.12);
    
    scene[2] = SDF(sdBox(new_position, vec3(0.6)), 0);
    
    //Pillars
    pillar_id = floor(p.xz);
    p.xz = fract(p.xz)-.5;
    
    vec2 rC = ((2.0 * step(0.0, rd.xz) - 1.0) * vec2(0.5) - p.xz) / rd.xz;
    scene[3] = SDF(min(rC.x, rC.y) + 0.01, 1);
    
    if(pillar_id==vec2(0,0)) pillar_id = vec2(1.,0.); //Little fix for the missing cube at the center :D
    
    float height = Hash21(pillar_id*6.)*6.;
    scene[4] = SDF(sdBox(p, vec3(.42, height > 1. && dot(pillar_id,pillar_id) < 81.0 ? height : -1.,.42)), 1);
    
    return minSDF(scene);
}

SDF RayMarch(vec3 ro, vec3 rd, vec2 uv, float side) {
	SDF dO=SDF(0.,0);
    
    for(int i=0; i<MAX_STEPS; i++) {
    	vec3 p = ro + rd*dO.dist;
        SDF dS = GetDist(p, rd);
        dS.dist *= side;
        dO.dist += dS.dist*SURF_BIAS;
        dO.materialID = dS.materialID;
        if(dO.dist>MAX_DIST || abs(dS.dist)<SURF_DIST) break;
    }
    
    return dO;
}

vec3 GetNormal(vec3 p, vec3 rd) {
    vec2 e = vec2(.001, 0);
    vec3 n = GetDist(p, rd).dist - vec3(GetDist(p-e.xyy, rd).dist , GetDist(p-e.yxy, rd).dist,GetDist(p-e.yyx, rd).dist);
    
    return normalize(n);
}

float a = 0.2;
float b = 0.5;

vec3 applyFog(  vec3  col, float t, vec3  ro, vec3  rd, vec2 uv )
{
    float fogAmount = (a/b) * exp(-ro.y*b) * (1.0-exp(-t*rd.y*b))/rd.y;
    vec3  fogColor  = vec3(0.439,0.494,1.000) * (1.-length(uv*LIGHT_RADIUS));
    return mix( col, fogColor, fogAmount );
}

vec3 mapColor(float i, float j)
{
    if(i == 0.)
        return vec3(1.,.0,.0)*j;
    
    if(i == 1.)
        return vec3(0.,1.,.0)*j;
        
    if(i == 2.)
        return vec3(0.200,0.000,1.000)*j;
        
    return vec3(1.,.0,1.)*j;
}

vec3 Render(inout vec3 ro, inout vec3 rd, vec2 uv)
{
    vec3 col = vec3(0.020,0.043,0.239) * (1.-length(uv*LIGHT_RADIUS));
    
    SDF sdf = RayMarch(ro, rd, uv, 1.);
    
    if(sdf.dist<MAX_DIST) {
        vec3 p = ro + rd * sdf.dist;
        vec3 n = GetNormal(p, rd);
        
        float dif = dot(n, normalize(vec3(0,1,0)))*.5+.5;
        col = vec3(dif+0.1);
        
        if(sdf.materialID == 1)
        {
            col *= vec3(0.541,0.600,1.000)*clamp(Hash21(pillar_id), 0.3, 1.);
            float colXZ = texture(iChannel0, p.xz*vec2(.1,1.)).r*0.3+0.7;
            float colYZ = texture(iChannel0, p.yz*vec2(.01,1.)).r*0.3+0.7;
            float colXY = texture(iChannel0, p.xy*vec2(1.,.01)).r*0.3+0.7;
            n = abs(n);
            col *= colYZ*n.x + colXZ*n.y + colXY*n.z;
            col *= applyFog(col, sdf.dist, ro, rd, uv);
        }
        else
        {
            float IOR = 1.1;
            vec3 r = refract(rd, n, 1./IOR);
            
            vec3 rdIn = refract(rd, n, 1./IOR); // ray dir when entering
        
            vec3 pEnter = p - n*SURF_DIST*3.;
            float dIn = RayMarch(pEnter, rdIn, uv, -1.).dist; // inside the object

            vec3 pExit = pEnter + rdIn * dIn; // 3d position of exit
            vec3 nExit = -GetNormal(pExit, rdIn); 

            vec3 rdOut = refract(rdIn, nExit, IOR);
            if(dot(rdOut, rdOut)==0.) rdOut = reflect(rdIn, nExit);
            
            ro = pExit+rdOut*2.;
            rd = rdOut;
            col *= vec3(0.008,0.008,0.051);
        }
    }
    
    //Particles
    
    for(float j = 0.; j < 50.; j++)
    {
        for(float i = 0.; i < 4.; i++)
        {
            vec2 lightuv = uv + vec2(cos((iTime-j*0.02)*0.2+i*4000.)*0.8, sin((iTime-j*0.02)*0.5+i*5000.)*0.45);
            float cd = dot(lightuv, lightuv);
            float light = .000015/cd;

            col += mapColor(i,(50.-j)*0.002)*light*smoothstep(.0,.5,sdf.dist+2.*i);
        }
    }
    
    return col;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord-.5*iResolution.xy)/iResolution.y;
	vec2 m = iMouse.xy/iResolution.xy;

    vec3 ro = vec3(0.5, 14.+cos(iTime*0.1), 0.5);
    //ro.yz *= Rot(-m.y*PI+1.);
    //ro.xz *= Rot(-m.x*TAU);

    vec3 rd = normalize(vec3(uv.x, uv.y, 1.));
    
    rd.zy *= Rot(-PI/2.);
    rd.xz *= Rot(cos(iTime*0.15)*0.5);
    
    vec3 col = Render(ro, rd, uv);
    vec3 refraction = Render(ro, rd, uv);
    
    col += refraction;
    
    col = pow(col, vec3(.4545));	// gamma correction
    fragColor = vec4(col,texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
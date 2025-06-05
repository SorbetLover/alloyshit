import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;

var wiggleEffect:WiggleEffect;
import  funkin.backend.shaders.CustomShader;
import Math;
// var shader2:CustomShader;
function postCreate(){
    shader2 = new CustomShader("whril");
    FlxG.camera.addShader(shader2);
    
    // strumLines.members[0].characters[0].shader = shader2;
    // shader2.brightness = 0;
    // shader2.hue = 0;
    // shader2.contrast = 0;
    // shader2.saturation = 100;


	wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.DREAMY;
	wiggleEffect.waveAmplitude = 0.01;
	wiggleEffect.waveFrequency = 2;
	wiggleEffect.waveSpeed = 1;

	alleyway.shader = wiggleEffect.shader;
}

function postUpdate(elapsed){
	if(!	startingSong)
	wiggleEffect.update(elapsed);	
	shader2.data.intensity += elapsed;

}
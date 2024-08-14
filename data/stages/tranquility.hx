import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;

var wiggleEffect:WiggleEffect;

function postCreate(){


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
}
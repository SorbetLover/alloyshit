import flixel.addons.display.FlxBackdrop;
// import flixel.tweens.ColorTween;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;
import flixel.math.FlxMath;
import flixel.group.FlxSpriteGroup;
var wiggleEffect:WiggleEffect;

var weebSky:FlxBackdrop;
var webClouds:FlxBackdrop;
var shit:Float;
function create(){
    

	if(curSong == "damage"){	
	weebSky = new FlxBackdrop().loadGraphic(Paths.image("stages/hazbin/weebSkya"));
	insert(members.indexOf(sky), weebSky);
	weebSky.scale.set(6,6);
	weebSky.antialiasing = false;
    // weebSky.x += weebSky.width * 4;
	// weebSky.y = weebSky.height * 4;
	weebSky.x = 400;
	weebSky.y = 400;
	weebSky.repeatAxes = FlxAxes.X;
	weebSky.scrollFactor.set(0.2,1);
	
	webClouds = new FlxBackdrop().loadGraphic(Paths.image('stages/hazbin/weebClouds'));
	insert(members.indexOf(weebSky) + 1, webClouds);
	
	webClouds.repeatAxes = FlxAxes.X;
	webClouds.spacing.x = 50;
	webClouds.scale.set(6,6);
	webClouds.y = 400;
	}
}
function postCreate(){     

	   wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.DREAMY;
	wiggleEffect.waveAmplitude = 0.06;
	wiggleEffect.waveFrequency = 3;
	wiggleEffect.waveSpeed = 0.5;

    // camHUD.setFilters([wiggleEffect]);
    camHUD.addShader(wiggleEffect.shader);
    // trees.shader = wiggleEffect.shader;

	if(curSong == "damage"){
		for(i in [dad,boyfriend, sky, path, iconP1, iconP2]){
			i.color = 0xFF684242;
		}
	
		sky.loadGraphic(Paths.image("stages/hazbin/sky3"));
	
		for( e in [bench, trees, mist, roses]) alpha = 0;
	
    remove(strumLines.members[0].characters[1]);
	insert(members.indexOf(strumLines.members[0].characters[0]) - 1,strumLines.members[0].characters[1] );

 
	for(i in [strumLines.members[0].characters[1]]){
		i.color = 0x44000000;
		i.alpha = 0;

	}
	strumLines.members[0].characters[1].x -= 100;
	strumLines.members[0].characters[1].y += 100;
}
}

var __timer:Float = 0;


function postUpdate(elapsed:Float){

		wiggleEffect.update(elapsed);

	if(curSong == "damage"){
	// FlxG.camera.zoom = 0.4;
	__timer += elapsed / 2; 	

    scrollSpeed = 2;
	webClouds.x -= Conductor.crochet / 1000;
    webClouds.y = (400+50*Math.cos(__timer));
	}

}
function stepHit(curStep){
	// health += 0.01;
	// trace(health);

	if(curSong == "damage"){
    switch(curStep){
        case 32:
        for( e in [bench, trees, mist, roses]) FlxTween.tween(e, {alpha: 0}, 0.2);
	    case 540:
			weebSky.color = 0xFF990000;
			FlxTween.color(weebSky, 2, 0xFF990000, 0xFF684242);
	}	
}
}


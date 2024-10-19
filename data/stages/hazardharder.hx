import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;
import flixel.math.FlxMath;
import flixel.group.FlxSpriteGroup;
// var wiggleShader = null;
var hazardBGkb:FlxSprite;
var hazardInterlopeLaugh:FlxSprite;
var hazardBlack:FlxSprite;

var wiggleEffect:WiggleEffect;
var wiggleEffect2:WiggleEffect;
var wiggleShitShowCAMERA:WiggleEffect;
var fogOFF:Int;

var fogShitGroup:FlxTypedGroup;
function create(){
	wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.DREAMY;
	wiggleEffect.waveAmplitude = 0.02;
	wiggleEffect.waveFrequency = 3;
	wiggleEffect.waveSpeed = 1;
	
	wiggleEffect2 = new WiggleEffect();
	wiggleEffect2.effectType = WiggleEffectType.DREAMY;
	wiggleEffect2.waveAmplitude = 0.03;
	wiggleEffect2.waveFrequency = 9;
	wiggleEffect2.waveSpeed = 1;

	trace("separator ---------");
	hazardBGkb = new FlxSprite();
	hazardBGkb.frames = Paths.getSparrowAtlas('stages/hazard/inhuman-port/backPulsing'); //Before you start asking questions, yes, KB has a pulsing background in the Inhuman mod. I'm just reusing shit because I'm lazy lmao -Haz.
	hazardBGkb.animation.addByPrefix('pulse', 'kbBACK-pulse', 24, false);	
	hazardBGkb.x = -590;
	hazardBGkb.y = -265;
	hazardBGkb.scrollFactor.set(1.1,1.3);
	hazardBGkb.setGraphicSize(Std.int(hazardBGkb.width * 1.1));
	hazardBGkb.updateHitbox();
	// hazardBGkb.alpha=0;
	hazardBGkb.animation.play('pulse');
	hazardBGkb.scale.set(1,1); 
	add(hazardBGkb);
	hazardBGkb.shader = wiggleEffect.shader;


	hazardInterlopeLaugh = new FlxSprite();
	hazardInterlopeLaugh.frames = Paths.getSparrowAtlas('stages/hazard/inhuman-port/ameliaTaunt');
	hazardInterlopeLaugh.animation.addByPrefix('laugh1', 'Amelia_Chuckle', 24, true);	
	hazardInterlopeLaugh.animation.addByPrefix('laugh2', 'Amelia_Laugh', 30, true);	
	// hazardInterlopeLaugh.setGraphicSize(Std.int(hazardInterlopeLaugh.width * 1.3));				
	hazardInterlopeLaugh.screenCenter();
	// hazardInterlopeLaugh.x += 272;
	// hazardInterlopeLaugh.y += 260;
	hazardInterlopeLaugh.x = hazardBGkb.x + hazardBGkb.width / 3.7;
	hazardInterlopeLaugh.y = hazardBGkb.y + 200;
	hazardInterlopeLaugh.animation.play("laugh1");
	hazardInterlopeLaugh.alpha= 0;
	add(hazardInterlopeLaugh);
    hazardInterlopeLaugh.scale.set(0.9,0.9);	


	hazardBlack = new FlxSprite();
	hazardBlack.makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);
    hazardBlack.x = hazardBGkb.x;
	hazardBlack.y = hazardBGkb.y;
	hazardBlack.alpha = 0;
	// hazardBlack.cameras = [camOther];
	add(hazardBlack);

	// camHUD.visible=true;
	camHUD.alpha = 1;
	fogShitGroup = new FlxSpriteGroup();


	for (i in 0...20){

		addFogB(i);
	
	}
	
	for (i in 0...20){

    addFog(i);

	}
}
function postUpdate(elapsed){
	camFollow.setPosition( 830, 400);
	defaultCamZoom = 0.6;
	FlxG.camera.zoom = 0.6;
	wiggleEffect.update(elapsed);
	wiggleEffect2.update(elapsed);
	strumLines.members[0].cpu = true;

}
function addFogB(i){
    var scale:Int;
	var fog:FlxSprite;
	var fog = new FlxSprite();

	switch(FlxG.random.int(1, 3))
        {
            case 2:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST2"));
            case 3:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST3"));
            default:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST1"));
        }
    fog.x = hazardBGkb.x + (i*600) - 800; 
	fog.y = hazardBGkb.y + 400 ;
	fog.scale.set(1.2,2);

	fog.shader = wiggleEffect2.shader;
    fog.alpha = 0.01;
	add(fog);  


}

function addFog(i){
    var scale:Int;
	var fog:FlxSprite;
	var fog = new FlxSprite();

	switch(FlxG.random.int(1, 3))
        {
            case 2:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST2"));
            case 3:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST3"));
            default:
                fog.loadGraphic(Paths.image("stages/hazard/fogEffectTEST1"));
        }
    fog.x = hazardBGkb.x + (i*200) - 800; 
	fog.y = hazardBGkb.y + 730 ;
	fog.scale.set(1.2,1.2);

	fog.shader = wiggleEffect2.shader;
	add(fog);  


}
function stepHit(curStep){

	// if(curStep > 511 && curStep % 2 == 0){
	// 	strumLines.members[0].members[0].angle += 25;
	// 	strumLines.members[0].members[1].angle += 25;
	// 	strumLines.members[0].members[2].angle += 25;
	// 	strumLines.members[0].members[3].angle += 25;

    // }
	switch(curStep){
		case 496:
			hazardBlack.alpha = 0.6;
			hazardInterlopeLaugh.alpha = 1;
		case 512:

		
		hazardBlack.alpha = 0;
			hazardInterlopeLaugh.alpha = 0;
			// FlxG.camera.fade(0xFF000000,Conductor.crochet/2000,true);

		case 1776:
         hazardBlack.alpha = 0.7;
		//  hazardInterlopeLaugh.x += 100;
		hazardInterlopeLaugh.alpha = 1;
			hazardInterlopeLaugh.animation.play("laugh1");
		case 1792:
			hazardInterlopeLaugh.alpha = 0;
			hazardBlack.alpha = 0;
			// FlxG.camera.fade(0xFF000000,Conductor.crochet/3000,true);
		case 2040:
			hazardInterlopeLaugh.alpha = 1;
			hazardBlack.alpha = 0;
			 hazardInterlopeLaugh.x += 100;
			hazardInterlopeLaugh.alpha = 1;
				hazardInterlopeLaugh.animation.play("laugh2");
	    case 2048:
			// FlxG.camera.fade(0xFF000000,Conductor.crochet/3000,true);

		hazardInterlopeLaugh.alpha = 0;
		hazardBlack.alpha = 0;

	}

}

function postCreate() {
			// for (sl in strumLines.members){
			//     for (s in sl.members){
			//         s.noteAngle = 0;
			// 	    s.forceIsOnScreen = true;
				
			// 	}
			// }
 for(eu in [healthBar, healthBarBG, iconP1, iconP2]){
	eu.alpha = 0;
 }
}
function beatHit(curBeat){
	// strumLines.members[0].members[0].x += 10;
	if(curBeat > 575 ){
		if(curBeat % 2 == 0){
		scrollSpeed = 2.2;
		} 
		else
		{
			scrollSpeed = 3;
		}
	// strumLines.members[0].members[0].x += 10;
	}
}
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;
import hxvlc.flixel.FlxVideoSprite;
var wiggleEffect:WiggleEffect;
var void:FlxSprite;

var cuts:FlxVideoSprite;
function postCreate(){
	fireBG.alpha = 0;
	poder_politicoBG.alpha = 0;
	
	strumLines.members[0].characters[1].scale.set(0.5,0.5);
	var ff = 0;
	for(i in strumLines.members[0].characters){
		i.x = 300 - (i.width / 2);
	    ff++;
		if(ff == 2){
			i.x += 100;
		}
	}
	
	for(e in [0,2]) {
		strumLines.members[0].characters[e].scale.set(0.9,0.9);
		strumLines.members[0].characters[e].y = 100;
	}

	for(p in [1,2]){
		strumLines.members[0].characters[p].alpha = 0;
	}
	gf.debugMode = true;

	strumLines.members[1].characters[1].alpha = 0;

	
	wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.DREAMY;
	wiggleEffect.waveAmplitude = 0.01;
	wiggleEffect.waveFrequency = 10;
	wiggleEffect.waveSpeed = 30;

	fireBG.shader = wiggleEffect.shader;

	void = new FlxSprite().makeGraphic(4000,4000, 0xFF000000);
	void.cameras = [camHUD];
	insert(0, void);
	void.alpha = 0;

		cuts = new FlxVideoSprite(0, 0);
		cuts.antialiasing = true;
		cuts.bitmap.onFormatSetup.add(function():Void
		{
			if (cuts.bitmap != null && cuts.bitmap.bitmapData != null)
			{
				final scale:Float = Math.min(FlxG.width / cuts.bitmap.bitmapData.width, FlxG.height / cuts.bitmap.bitmapData.height) * 0.8;

				// cuts.setGraphicSize(cuts.bitmap.bitmapData.width * scale, cuts.bitmap.bitmapData.height * scale);
				// cuts.updateHitbox();
				cuts.screenCenter();
			}
		});

		cuts.load("mods/alloyshit/videos/dora/cutscene_para_poner.mp4");
		cuts.cameras = [camHUD];
		// add(cuts);
		insert(0, cuts);
		cuts.screenCenter();
		
			cuts.play();
			cuts.pause();
			cuts.alpha = 0;

		cuts2 = new FlxVideoSprite(0, 0);
		cuts2.antialiasing = true;
		cuts2.bitmap.onFormatSetup.add(function():Void
		{
			if (cuts2.bitmap != null && cuts2.bitmap.bitmapData != null)
			{
				final scale:Float = Math.min(FlxG.width / cuts2.bitmap.bitmapData.width, FlxG.height / cuts2.bitmap.bitmapData.height) * 0.8;

				// cuts2.setGraphicSize(cuts2.bitmap.bitmapData.width * scale, cuts2.bitmap.bitmapData.height * scale);
				// cuts2.updateHitbox();
				cuts2.screenCenter();
			}
		});
			cuts2.load("mods/alloyshit/videos/dora/finalcutscene.mp4");

		cuts2.cameras = [camHUD];
		// add(cuts2);
		insert(1, cuts2);
		cuts2.screenCenter();
		
			cuts2.play();
			cuts2.pause();
			cuts2.alpha = 0;

		// player.cpu = true;
}

function beatHit(curBeat){
	if(curBeat % 2 == 0){
		if(PlayState.instance.curStep >= 256){
			gf.playAnim("idle-alt", true);
		} else {
			gf.playAnim("idle",true);
		}
	}
}

var focusbff = false;

function postUpdate(elapsed){
	if(paused == true && (cuts.alpha == 1 || cuts2.alpha == 1)){
		cuts.pause();
		cuts2.pause();
	} else if (cuts.alpha == 1 || cuts2.alpha == 1){
		cuts.resume();
		cuts2.resume();
	}
	if(!	startingSong)
	wiggleEffect.update(elapsed);	

	if(focusbff == true){
		camGame.followLerp = 10;
		camFollow.setPosition(600,300);
	}
}
function stepHit(curStep){
	switch(curStep){
		case 240:
			dad.debugMode = true;
			dad.playAnim("Dora Staring", true);
		case 256:
			dad.debugMode = false;
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[0].characters[1].alpha = 1;
			fireBG.alpha = 1;
			// camGame.flash(0xFFFFFFFF, 0.5);
			void.alpha = 1;

		case 272, 320, 336:
			void.alpha = 1;
		case 264, 280, 328, 344, 384:
			void.alpha = 0;
			camGame.flash(0xFFFFFFFF, 0.5);

		case 768:
			cuts.bitmap.rate = inst.pitch + 0.01;
			cuts.alpha = 1;
			cuts.resume();
		case 1088:
			// cuts.bitmap.time += 400;
			// cuts.time += 400;
		case 1152:
			cuts.alpha = 0;
			strumLines.members[0].characters[1].alpha = 0;
			strumLines.members[0].characters[2].alpha = 1;
		case 1400:
			void.alpha = 1;
		case 1408:
			void.alpha = 0;
			camGame.flash(0xFFFFFFFF, 0.5);
			poder_politicoBG.alpha = 1;
			strumLines.members[1].characters[1].x = -350;
			strumLines.members[1].characters[1].y = -200;
			
			strumLines.members[1].characters[0].alpha = 0;
			strumLines.members[0].characters[2].alpha = 0;
			gf.alpha = 0;
			
			strumLines.members[1].characters[1].alpha = 1;			
			focusbff = true;

		case 1664:
			// cuts.load("mods/alloyshit/videos/dora/finalcutscene.mp4");
			camHUD.flash(0xFFFFFFFF, 0.5);

		cuts2.resume();
			cuts2.alpha = 1;
			cuts2.bitmap.rate = inst.pitch;

	
	}
}
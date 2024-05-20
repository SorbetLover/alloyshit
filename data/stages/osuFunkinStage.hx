import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxState;
import haxe.Exception;

import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import hxvlc.util.Handle;
import openfl.system.System;
import openfl.utils.Assets;
import openfl.Lib;
import sys.io.File;
import sys.FileSystem;
import flixel.text.FlxTextAlign;

var video:FlxVideoSprite;
var fadeSPR:FlxSprite;
var capeIMG:FlxSprite;
var title:FlxText;
function postCreate(){
	    video = new FlxVideoSprite(0, 0);
		video.antialiasing = true;
		video.bitmap.onFormatSetup.add(function():Void
		{
			video.setGraphicSize(FlxG.width, FlxG.height);
			video.updateHitbox();
			video.screenCenter();
			
		});
		video.autoVolumeHandle = false;
		video.bitmap.onEndReached.add(video.destroy);
	
	switch(PlayState.instance.curSong){
		case "xamuel":
        	video.load(Paths.video('xamuel'), [':input-repeat=2']);	
	        replaceIcon('xamuel');
		case "stayed-gone":
        	video.load(Paths.video('stayed-gone'), [':input-repeat=2']);	
	        replaceIcon('vox');
	}	
		video.cameras = [camHUD];
        // add(video);
	    insert(members.indexOf(strumLines.members[0].characters[0]) - 1, video);
		// remove(strumLines.members[0].characters[0], true);

        video.bitmap.play();
		new FlxTimer().start(0.0001, function(tmr:FlxTimer){video.bitmap.pause();});
    
	// fadeSPR = new FlxSprite().makeGraphic(FlxG.width, FlxG.height,0xFF000000);
	// fadeSPR.cameras = [camHUD];
	// // fadeSPR.alpha = 1;
    // insert(members.indexOf(video) + 1, fadeSPR);
	// fadeSPR.screenCenter();

    // capeIMG = new FlxSprite().loadGraphic(Paths.image("osuFunkinCapes/" + PlayState.instance.curSong));
	// capeIMG.cameras = [camHUD];
	// capeIMG.alpha = 0;
	
	// capeIMG.scale.set(0.6,0.6);
	// capeIMG.scale.set(1,1);
	// capeIMG.setGraphicSize(600,600);
	
    // insert(members.indexOf(fadeSPR) + 1, capeIMG);
	// capeIMG.screenCenter();
	// capeIMG.y += 50;

	// // title = new FlxText(100,100,0, "xamuel", 32);
    // title = new FlxText(100, 20, 1000, null, 63);
	// title.cameras = [camHUD];
    // // title.setFormat(CoolUtil.getFont('notosans'), 27, 0xFFFFFF);
    // insert(members.indexOf(capeIMG) + 1, title);

	// title.y = 130;
	// title.alignment = FlxTextAlign.CENTER;
	// // title.x = FlxG.width / 2;
	// switch(PlayState.instance.curSong){
	// 	case "xamuel":
	// 	    title.text = "Luna Beauty and XamuelMC";
	//         // title.x = title.width / 2 + 60; 
	// 	case "stayed-gone":
	// 	    title.text = "Stayed Gone";
	//         // title.x = title.width + 60; 
	
	// 	default:
	// 	   title.text = "Undefined";
	// }
	
	}
var started:Bool = false;
function replaceIcon(arg){
	if(curSong != "stayed-gone") remove(iconP2); else iconP2.alpha = 0;
		remove(iconP1);
	iconP1 = new HealthIcon(arg, false);
	iconP1.cameras = [camHUD];
	insert(members.indexOf(healthBar) + 1, iconP1);
	iconP1.y = healthBar.y - iconP1.height / 2;
    switch(arg){
	    default:
	        healthBar.createFilledBar(0xFF333333, 0xFF777777);
		case "xamuel":    
            healthBar.createFilledBar(0xFF333333, 0xFF503302);    
	}
	healthBar.percent = health;

}
function onStartSong(){
    // FlxTween.tween(fadeSPR, {alpha:0}, Conductor.crochet / 3000);
    // FlxTween.tween(title, {alpha:0}, Conductor.crochet / 3000);

    // FlxTween.tween(capeIMG, {alpha:0}, Conductor.crochet / 3000);

	started = true;
	video.play();
	video.bitmap.time = FlxG.sound.music.time;

}
var forcePause:Bool = false;

function postUpdate(){
	dad.alpha = 0;
	boyfriend.alpha = 0;
	if( started == false && curSong != "stayed-gone"){
			// capeIMG.alpha = FlxMath.lerp(capeIMG.alpha, 1, 0.01);
			// capeIMG.scale.x = FlxMath.lerp(capeIMG.scale.x, 0.6, 0.01);
			// capeIMG.scale.y = capeIMG.scale.x;
		
		for(i in strumLines.members[0].members){
	    	i.alpha = 0;
	    }
		for(i in [ healthBar, healthBarBG, iconP1]){
			i.alpha = 0;
		}
	}
	else if(curSong != "stayed-gone"){
		for(i in strumLines.members[0].members){
    		i.alpha = FlxMath.lerp(i.alpha, 1, 0.05);
	    }
		for(i in [ healthBar, healthBarBG, iconP1]){
			i.alpha = FlxMath.lerp(i.alpha, 1, 0.05);
		}
	}
		video.bitmap.volume = 0;
        video.bitmap.rate = inst.pitch;
	// if(curStep == 2 && antiLoop == false){
    //     antiLoop = true;
	// }
	// if(antiLoop == true){
// :	}
    if(forcePause == false && started == true && paused == true){
		video.pause();
	}
	if(forcePause == false && started == true && paused == false){
		video.resume();
	}
    switch(PlayState.instance.curSong){
		case "xamuel":
	        if(curStep == 240) killVid();
	}
}

function killVid(){
	    forcePause = true;
		video.pause();

	    // FlxG.camera.fade(0xFF000000, Conductor.crochet / 1000, false);
		// camHUD.fade(0xFF000000,Conductor.crochet / 1000,false);
        // FlxTween.tween(fadeSPR, {alpha:1}, Conductor.crochet / 1000);
		new FlxTimer().start(1, function(tmr:FlxTimer){ endSong(); });
		// trace("soxe");
		 

}

function stepHit(){
	if(curSong == "stayed-gone"){
		if(curStep == 2040){
			video.stop();
			FlxTween.tween(video, {alpha:0}, 1);
		}
	}
}
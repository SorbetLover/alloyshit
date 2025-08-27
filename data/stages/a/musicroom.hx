import funkin.game.HealthIcon;
import flxanimate.FlxAnimate;

var sideWindow:FlxSprite;
var lastPOSX:Array = [0,0,0,0,0,0];
var lastPOSY:Array = [0,0,0,0,0,0];
var chars:Array = [];
var iconshit:Array = [];
function postCreate(){



    poemVideo = new Character(0,0,'notepadalt', false);
    poemVideo.danceOnBeat = false;
	poemVideo.setGraphicSize(Std.int(poemVideo.width / defaultCamZoom));
    // poemVideo.y = FlxG.height / 2.7;
	poemVideo.y = 270;
    poemVideo.alpha = 0;

	sideWindow = new FlxSprite().loadGraphic(Paths.image("stages/musicroom/notepad/SideWindow"));
	sideWindow.updateHitbox();
	// sideWindow.y = FlxG.height - sideWindow.height * 1.69;

    sideWindow.y = 0;
	sideWindow.alpha = 0;
	sideWindow.scale.set(1.3,1);
	sideWindow.x += 50;
for(i in [sideWindow, poemVideo]){
		i.cameras = [camHUD];	 	
		insert(members.indexOf(strumLines.members[0].members[0]) + 1, i);

	}

	camGame.followLerp = 0.04;
	for(i in 0...5){
				chars.push(strumLines.members[i].characters[0]);
	}

	chars[0].scale.set(0.8,0.8);
	chars[0].y -= 300;
	chars[0].x -= 100;
	
	
	chars[2].x -= 100;
	chars[2].scale.set(0.6,0.6);
	chars[2].y -= 400;
	chars[2].x -= 50;
	
	chars[3].x -= 700;
	chars[3].y -= 400;
	chars[3].scale.set(0.7,0.7);
	
	chars[4].x -= 1100;
	chars[4].y -= 450;
	chars[4].scale.set(0.6,0.6);
	for(i in 0...5){
		lastPOSX[i] = strumLines.members[i].characters[0].x;
		lastPOSY[i] = strumLines.members[i].characters[0].y;
	}
	for(i in ["janja", "wrench", "felcca"]){
		var morradusannemec = new HealthIcon(i, false);
		add(morradusannemec);
		iconshit.push(morradusannemec);
		morradusannemec.cameras = [camHUD];
		morradusannemec.y = healthBar.y - (morradusannemec.height / 2);
		morradusannemec.scale.set(0.5,0.5);
		morradusannemec.x = iconP2.x - 100;		
	}
	iconshit[0].x -= 60;
	iconshit[1].y += 30;
	iconshit[2].y -= 30;
}
var hd = 0.5;
function postUpdate(){
	// iconshit[0].x = healthBar.x + ((healthBar.width / 2) + (iconshit[0].width/2));
	iconshit[0].x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) - 290;
	iconshit[1].x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) - 220;
	iconshit[2].x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) - 220;

	hd = FlxMath.lerp(hd, 0.5, 0.04);
	for(i in 0...3){
		iconshit[i].scale.set(hd,hd);
		iconshit[i].animation.curAnim.curFrame = iconP2.animation.curAnim.curFrame;
	}
	iconP2.alpha = FlxMath.lerp(iconP2.alpha, iAlphas[0], 0.04);
	iconshit[0].alpha = FlxMath.lerp(iconshit[0].alpha, iAlphas[1], 0.04);
	iconshit[1].alpha = FlxMath.lerp(iconshit[1].alpha, iAlphas[2], 0.04);
	iconshit[2].alpha = FlxMath.lerp(iconshit[2].alpha, iAlphas[3], 0.04);
}
function beatHit(){
		hd = 0.6;
}
var iAlphas = [1,1,1,1];
/// raquel, janja, reginaldo, felca
function stepHit(curStep){
	if(chars[2].getAnimName() == 'idle'){
		for(i in 0...4){
			strumLines.members[2].members[i].alpha = 0.001;
		}
			iAlphas[3] = 0.4;

	} else {
		iAlphas[3] = 1;
		for(i in 0...4){
			strumLines.members[2].members[i].alpha = 1;
		}
	}
	if(chars[3].getAnimName() == 'idle'){
		for(i in 0...4){
			strumLines.members[3].members[i].alpha = 0.001;
		}
		iAlphas[1] = 0.4;
	} else {
		iAlphas[1] = 1;
		for(i in 0...4){
			strumLines.members[3].members[i].alpha = 1;
		}
	}

	if(chars[4].getAnimName() == 'idle'){
		for(i in 0...4){
			strumLines.members[4].members[i].alpha = 0.001;
		}
		iAlphas[2] = 0.4;
	} else {
		for(i in 0...4){
			strumLines.members[4].members[i].alpha = 1;
		}
		iAlphas[2] = 1;

	}
	if(chars[0].getAnimName() == "idle"){
		iAlphas[0] = 0.9;
	} else {
		iAlphas[0] = 1;
	}

	switch(curStep){
		case 384:
			poemVideo.alpha = 1;
			camHUD.fade(0xFFFFFFFF, Conductor.crochet  / 1000,true);
			poemVideo.playAnim('idle', true);
            sideWindow.alpha = 1;
			for(i in [2,3]){
				strumLines.members[i].characters[0].cameras = [camHUD];
				strumLines.members[i].characters[0].x = -100;
				strumLines.members[i].characters[0].y = 50	;
			}
			strumLines.members[2].characters[0].x = -800;
			strumLines.members[2].characters[0].y = -400;
			strumLines.members[3].characters[0].x = -800;
			strumLines.members[3].characters[0].y = -400;
			FlxTween.tween(strumLines.members[3].characters[0], {x: -400, y: -300}, Conductor.crochet / 500, {ease:FlxEase.cubeOut}); 	
			
        case 503:
			FlxTween.tween(strumLines.members[3].characters[0], {x: -600, y: -1000}, Conductor.crochet / 500, {ease:FlxEase.cubeIn}); 	

	    	FlxTween.tween(strumLines.members[2].characters[0], {x: -100, y: -100}, Conductor.crochet / 500, {ease:FlxEase.cubeOut, startDelay: Conductor.crochet / 900}); 	
		case 640:

			poemVideo.alpha = 0;
			camHUD.fade(0xFFFFFFFF, Conductor.crochet  / 1000,true);
            sideWindow.alpha = 0;
			for(i in [2,3]){
				strumLines.members[i].characters[0].cameras = [camGame];
		
				strumLines.members[i].characters[0].x = lastPOSX[i];
				strumLines.members[i].characters[0].y = lastPOSY[i]; 
			}       

			camGame.followLerp = 8;
		case 642:
			camGame.followLerp = 0.04;

		}
}
import funkin.game.HealthIcon;
import flxanimate.FlxAnimate;

var monka:HealthIcon;
var abbe:HealthIcon;
var giffur:HealthIcon;
var poemVideo:Character;
var sideWindow:FlxSprite;
var lastPOSX:Array = [0,0,0,0,0];
var lastPOSY:Array = [0,0,0,0,0];
function postCreate(){

	if( PlayState.instance.difficulty == "hard") monka = new HealthIcon('monikapixel', true); else monka = new HealthIcon('senpai', false); 
	monka.cameras = [camHUD];


	monka.alpha = 1;
	insert(members.indexOf(healthBar) + 3, monka);
	abbe = new HealthIcon('abby', false);
	abbe.cameras = [camHUD];


	abbe.alpha = 1;
	insert(members.indexOf(healthBar) + 3, abbe);
	giffur = new HealthIcon('gifnormal', true);
	giffur.cameras = [camHUD];


	giffur.alpha = 1;
	insert(members.indexOf(healthBar) + 3, giffur);

	
	strumLines.members[0].characters[0].x += 100; // annie
	strumLines.members[0].characters[0].y += 60;  // annie
	strumLines.members[2].characters[0].x -= 300; // monika
	strumLines.members[2].characters[0].y += 100; // monika

	if(PlayState.instance.difficulty == "new"){
		
	strumLines.members[2].characters[0].x -= 200; // sepie
	strumLines.members[2].characters[0].y -= 400; // sepie
	}
	
	strumLines.members[3].characters[0].x -= 20;  // gif
	strumLines.members[3].characters[0].y = 260;  // gif
	strumLines.members[4].characters[0].x -= 100;  // abigale evins / car 

    poemVideo = new Character(0,0,'notepad', false);
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
for(i in [sideWindow, poemVideo]){
		i.cameras = [camHUD];	 	
		insert(members.indexOf(strumLines.members[0].members[0]) + 1, i);

}

camGame.followLerp = 0.04;

for(i in 0...4){
	lastPOSX[i] = strumLines.members[i].characters[0].x;
	lastPOSY[i] = strumLines.members[i].characters[0].y;
}
trace(lastPOSX);
trace(lastPOSY);
}
function postUpdate(){
	monka.scale.set(iconP2.scale.x /1.9, iconP2.scale.y / 1.9);
	abbe.scale.set(iconP2.scale.x /1.9, iconP2.scale.y / 1.9);
	giffur.scale.set(iconP2.scale.x /1.9, iconP2.scale.y / 1.9);
   
	monka.y = iconP2.y - 30;
	monka.x = iconP2.x - 90;
	abbe.y = iconP2.y + 10;
    abbe.x = iconP2.x - 60;
    giffur.y = iconP2.y - 40;
	giffur.x = iconP2.x - 40;

	// camZooming = false;
	FlxG.camera.zoom = 1;
	if(iconP2.animation.curAnim.curFrame == 2) for(i in [monka,abbe,giffur]) i.animation.curAnim.curFrame = 2;
	if(iconP2.animation.curAnim.curFrame == 1) for(i in [monka,abbe,giffur]) i.animation.curAnim.curFrame = 1;

	// camFollow.setPosition(100,700);

}

function stepHit(curStep){
	switch(curStep){
		case 384:
			poemVideo.alpha = 1;
			camHUD.fade(0xFFFFFFFF, Conductor.crochet  / 1000,true);
			poemVideo.playAnim('idle', true);
            sideWindow.alpha = 1;
			for(i in [2,3]){
				strumLines.members[i].characters[0].cameras = [camHUD];
				strumLines.members[i].characters[0].x = 100;
				strumLines.members[i].characters[0].y = 50	;
				strumLines.members[i].characters[0].scale.set(5,5);

			}
			strumLines.members[2].characters[0].x = -400;
			strumLines.members[2].characters[0].y = -400;
			strumLines.members[3].characters[0].x = -400;
			strumLines.members[3].characters[0].y = -400;
			// FlxTween.tween(strumLines.members[2].characters[0], {x: 100, y: 50}, 1, {ease:FlxEase.cubeOut}); 	
			FlxTween.tween(strumLines.members[3].characters[0], {x: 100, y: 50}, Conductor.crochet / 500, {ease:FlxEase.cubeOut}); 	
			
				// strumLines.members[1].characters[0].x = 3000;
			// strumLines.members[0].characters[0].scale.set(0.5,0.5);
        case 503:
			FlxTween.tween(strumLines.members[3].characters[0], {x: -500, y: -500}, Conductor.crochet / 500, {ease:FlxEase.cubeIn}); 	

			if(PlayState.instance.difficulty == "hard") {
	    		FlxTween.tween(strumLines.members[2].characters[0], {x: 100, y: 50}, Conductor.crochet / 500, {ease:FlxEase.cubeOut, startDelay: Conductor.crochet / 900}); 	
			}
		    if(PlayState.instance.difficulty == "new"){
    			FlxTween.tween(strumLines.members[2].characters[0], {x: 0, y: 400}, Conductor.crochet / 500, {ease:FlxEase.cubeOut, startDelay: Conductor.crochet / 900}); 	
			}
		case 640:

		poemVideo.alpha = 0;
			camHUD.fade(0xFFFFFFFF, Conductor.crochet  / 1000,true);
            sideWindow.alpha = 0;
			for(i in [2,3]){
				strumLines.members[i].characters[0].cameras = [camGame];
				strumLines.members[i].characters[0].scale.set(6,6);
		
				strumLines.members[i].characters[0].x = lastPOSX[i];
				strumLines.members[i].characters[0].y = lastPOSY[i]; 
			}       

			camGame.followLerp = 8;
		case 642:
			camGame.followLerp = 0.04;

		}
}
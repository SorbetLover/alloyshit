import funkin.game.PlayState;
import flixel.FlxCamera;
function postUpdate(){
	curCameraTarget = -1;
}
var the2:Bool = false;
function postUpdate(){
    if(PlayState.instance.curStep < 0){
		camFollow.setPosition(bg.x + 115, bg.y);

	}
	if(strumLines.members[0].characters[0].getAnimName() != "idle" && strumLines.members[1].characters[0].getAnimName() != "idle"){
		the2 = true;
		camFollow.setPosition(bg.x + 115, bg.y);
	
	}else{
		the2 = false;
	}
    if(PlayState.instance.curStep > 3183 && PlayState.instance.curStep  < 3205){ 		camFollow.setPosition(bg.x + 115, bg.y);	}
    curCameraTarget = -1; 
}
function onDadHit(){
	if(the2 == false){		
		if(PlayState.instance.opponentMode == true) camFollow.setPosition(bg.x + 115, bg.y + 200); else camFollow.setPosition(bg.x + 115,bg.y - 60);

	}
    }
function onPlayerHit(){
	if(the2 == false){
	if(PlayState.instance.opponentMode == false) camFollow.setPosition(bg.x + 115, bg.y + 200); else camFollow.setPosition(bg.x + 115, bg.y - 60);

	} 
    }

var shitdd:FlxSprite;
function postCreate(){

	strumLines.members[0].characters[1].alpha = 0;
	strumLines.members[0].characters[1].y -= 600;
	strumLines.members[0].characters[1].x -= 400;
	strumLines.members[0].characters[0].y -= 500;
	strumLines.members[0].characters[0].x -= 300;
   shitdd = new FlxSprite.makeGraphic(1,1, 0xFF000000);
   add(shitdd);
   shitdd.alpha = 0;
   shitdd.x = 0;
}

function stepHit(curStep){
	switch(curStep){
		case 3184:
			strumLines.members[0].characters[1].alpha = 1;
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[0].characters[1].debugMode = true;
            // strumLines.members[0].characters[1].animation.play("wire", true, false, false);

    	case 3200:
			// strumLines.members[0].characters[1].animation.play("klitch", true, false, false);
        case 3230:
			strumLines.members[0].characters[1].debugMode = false;
		case 3540:
			// strumLines.members[0].characters[1].debugMode = true;

			// strumLines.members[0].characters[1].animation.play("scream", true, false, false);
			FlxG.camera.shake(0.01, 0.9);

		case 3560:
			strumLines.members[0].characters[1].debugMode = false;
		case 3918:
			FlxTween.tween(camGame, {alpha: 0,zoom: 0.01}, 1, {ease: FlxEase.cubeIn});	
           
	} 
}
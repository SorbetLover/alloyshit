import funkin.game.PlayState;
import flixel.FlxCamera;
function postUpdate(){
	camFollow.setPosition(570,camFollow.y);
}
var shitdd:FlxSprite;
function postCreate(){
	strumLines.members[0].characters[1].alpha = 0;
	strumLines.members[0].characters[1].y -= 100;
	strumLines.members[0].characters[1].x -= 30;
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
            strumLines.members[0].characters[1].animation.play("wire", true, false, false);

    	case 3200:
			strumLines.members[0].characters[1].animation.play("klitch", true, false, false);
        case 3230:
			strumLines.members[0].characters[1].debugMode = false;
		case 3540:
			strumLines.members[0].characters[1].debugMode = true;

			strumLines.members[0].characters[1].animation.play("scream", true, false, false);
			FlxG.camera.shake(0.01, 0.9);

		case 3560:
			strumLines.members[0].characters[1].debugMode = false;
		case 3918:
			FlxTween.tween(camGame, {alpha: 0,zoom: 0.01}, 1, {ease: FlxEase.cubeIn});	
           
	} 
}
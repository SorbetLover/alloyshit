
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTweenType;
import Math;
var oPx:Float = 96;
var pLx:Float = 736;
var circ1:FlxTween;
var circ2:FlxTween;

// var shit00:Float = strumLines.members[0].members[0].x;	
var notexs:Array = [[],[],[]];
function postCreate(){
    iconP2.y += 20;
	for(i in [0,1]){
		for(r in 0...strumLines.members[i].length){ 
			notexs[i].push(strumLines.members[i].members[r].x);
		}
	}
	notexs[2][0] = strumLines.members[0].members[0].y;
	trace(notexs);
}

function onStrumCreation(e){
	e.cancelAnimation();
}
var __timer:Float = 0;
function postUpdate(elapsed:Float) {
    if(PlayState.instance.difficulty == "JAX"){
		strumLines.members[0].characters[0].x = -500;
		strumLines.members[0].characters[0].y = -200;
	}
    
	if(startingSong == false)	
		__timer += elapsed ;	
			for(r in 0...strumLines.members[0].length){
				strumLines.members[0].members[r].x = (notexs[0][r] + 30 * Math.sin(__timer));
				strumLines.members[0].members[r].y = (notexs[2][0] + 30 * Math.cos(__timer));
				
				strumLines.members[1].members[r].x = (notexs[1][r] + 30 * Math.sin(__timer));
				strumLines.members[1].members[r].y = (notexs[2][0] + 30 * Math.cos(__timer));
			}
		// strumLines.members[0].members[0].x = (90 +30*Math.sin(__timer));
		// strumLines.members[0].members[0].y = (50 +30*Math.cos(__timer));

		// strumLines.members[0].members[1].x = (200+30*Math.sin(__timer));
		// strumLines.members[0].members[1].y = (50 +30*Math.cos(__timer));

		// strumLines.members[0].members[2].x = ( 310+30*Math.sin(__timer));
		// strumLines.members[0].members[2].y = (50 +30*Math.cos(__timer));

		// strumLines.members[0].members[3].x = (420 +30*Math.sin(__timer));
		// strumLines.members[0].members[3].y = (50 +30*Math.cos(__timer));

		// strumLines.members[1].members[0].x = (730 +30*Math.sin(__timer));
		// strumLines.members[1].members[0].y = (50 +30*Math.cos(__timer));

		// strumLines.members[1].members[1].x = (840 +30*Math.sin(__timer));
		// strumLines.members[1].members[1].y = (50 +30*Math.cos(__timer));

		// strumLines.members[1].members[2].x = (950 +30*Math.sin(__timer));
		// strumLines.members[1].members[2].y = (50 +30*Math.cos(__timer));

		// strumLines.members[1].members[3].x = (1060+30*Math.sin(__timer));
		// strumLines.members[1].members[3].y = (50+30*Math.cos(__timer));

}

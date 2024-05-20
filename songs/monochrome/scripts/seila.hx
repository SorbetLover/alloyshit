import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
var hidearows:Bool = false;
function onStartCountdown(event){
      dad.alpha = 0;
      event.cancel();
	  new FlxTimer().start(1.3, function(tmr:FlxTimer){
        FlxTween.tween(strumLines.members[0].characters[0], {alpha : 1}, 2, {ease: FlxEase.cubeOut, startDelay: 0.1});
        new FlxTimer().start(1.1, function(tmr:FlxTimer){
            hidearows = false;
            FlxTween.tween(strumLines.members[0].members[0], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[0].members[1], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[0].members[2], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[0].members[3], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
	
			FlxTween.tween(strumLines.members[1].members[0], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[1].members[1], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[1].members[2], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
			FlxTween.tween(strumLines.members[1].members[3], {alpha: 1}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
            new FlxTimer().start(1, function(tmr:FlxTimer){ startCountdown(); }); 
            });
    });
  
}

function postUpdate(){
    if(hidearows == true){
    for(shit in strumLines.members[0].members){
        shit.alpha = 0;
    }
    for(shit in strumLines.members[1].members){
        shit.alpha = 0;
    }
}
}
function beatHit(curBeat){
if (curBeat == 384){
    dad.alpha = 0;
}
}
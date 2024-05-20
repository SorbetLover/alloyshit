

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
function create() {
	gf.alpha = 0;
}
function stepHit(curStep){
	trace(curStep);
	switch(curStep){
		case 126:
			gf.alpha = 1;
			FlxTween.tween(gf, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			camera.angle = 135;
			FlxTween.tween(camera, {angle: 0}, 1, {ease: FlxEase.cubeOut});
		
		case 302:
			gf.alpha = 1;
			FlxTween.tween(gf, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			camera.angle = 135;
			FlxTween.tween(camera, {angle: 0}, 1, {ease: FlxEase.cubeOut});
		case 414:
				gf.alpha = 1;
				FlxTween.tween(gf, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
				camera.angle = 135;
				FlxTween.tween(camera, {angle: 0}, 1, {ease: FlxEase.cubeOut});
		
	}
}

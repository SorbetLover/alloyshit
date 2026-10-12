var camfollower:FlxSprite;
var fade:FlxSprite;
function postCreate(){
	fade = new FlxSprite().makeGraphic(4000,4000);
	fade.color = 0xFF000000;
	fade.scale.set(3,3);
	add(fade);
	fade.alpha = 0.9;
	strumLines.members[0].characters[0].alpha = 0;
	FlxG.camera.zoom = 1.8;
	iconP2.alpha = 0;            
	healthBar.createFilledBar(0xFF000000, 0xFF111111);    
	healthBar.percent = health;            
    camfollower = new FlxSprite();
	camfollower.x = 700;
	camfollower.y = 500;
    defaultCamZoom = 1.8;
    strumLines.members[1].characters[1].x = strumLines.members[1].characters[0].x - 6;
    strumLines.members[1].characters[1].y = strumLines.members[1].characters[0].y; 
	
    strumLines.members[1].characters[1].alpha = 0;
	trace("song loaded");

	trace("crochet:" + " " + Conductor.crochet / 1000 );
	trace("script sets cam beats");
	trace("script sets cam zoom");

	
}
function onSongStart(){
	FlxTween.tween(fade, {alpha: 0.5}, 5, {ease: FlxEase.cubeOut});
	trace("fade to 0.5 in 5 secs");


}
var allowbeats:Bool = true;
function postUpdate(){
	
	camFollow.setPosition(camfollower.x,camfollower.y);
	curCameraTarget = -1;
}
function beatHit(curBeat){
	// if(allowbeats == true){
	// 	camHUD.zoom = 1.05;
	
	// 	FlxTween.tween(camHUD, {zoom: 1}, Conductor.crochet/1000, {ease:FlxEase.cubeOut});
    //     camGame.zoom = defaultCamZoom + 0.03;	
	// 	FlxTween.tween(camGame, {zoom: defaultCamZoom}, Conductor.crochet/1000, {ease:FlxEase.cubeOut});
	// }
}
function stepHit(curStep){
	switch(curStep){
		case 96:
			allowbeats = false;
			FlxTween.tween(FlxG.camera, {zoom: 1.5}, 2, {ease:FlxEase.cubeInOut});
			trace("Zoom to 1.5 in 2 secs and camFollowX to 600");

			
			camfollower.x = 600;
		    defaultCamZoom = 1.5;
			
			  

		case 288:
     		FlxTween.tween(FlxG.camera, {zoom: 1.25}, 1, {ease:FlxEase.cubeInOut});
			 defaultCamZoom = 1.25;
			FlxTween.tween(fade, {alpha: 0.4}, 1, {ease: FlxEase.cubeOut});
			trace("cam zoom to 1.25 and fade alpha to 0.4");

	    case 414, 426, 438, 450, 462, 474, 486:
			fade.alpha = 0;
	    	FlxG.camera.fade(0xFF000000,Conductor.crochet / 1000,true);
			trace("fade alpha 0 and blink");

		case 498:
			fade.alpha = 0;
	    	FlxG.camera.fade(0xFF000000,Conductor.crochet / 1000,true);

     		gird.alpha = 0;
		case 504:
			FlxG.camera.fade(0xFF333333,0.3,true);
            FlxG.camera.zoom = 1;
			trace("lights on, cam beats on, chars switched, dad visible and cam zoom to 0.9");

			bedroom2.alpha = 0;
			bed2.alpha = 0;
			bedside2.alpha = 0;
			allowbeats = true;
			camZooming = false;
			strumLines.members[1].characters[1].alpha = 1;
			strumLines.members[1].characters[0].alpha = 0;	
			fade.alpha = 0;
			scrollSpeed = 2.5;
			camfollower.x = 400;
			strumLines.members[0].characters[0].alpha = 1;
			defaultCamZoom = 0.9;
			iconP2.alpha = 1;
	}
}


var desktopIn:FlxSprite;
var desktopOut:FlxSprite;
var desktop:FlxSprite;
var cursor:FlxSprite;
var jeanprof:FlxSprite;
function postCreate(){
    //cutscene shit
	desktopIn = new FlxSprite().loadGraphic(Paths.image('stages/libitina/introdesk'));
	add(desktopIn);
	desktopIn.screenCenter();
	desktopIn.scale.set(1.4,1.4);
	desktopIn.alpha = 0;
    
	desktop = new FlxSprite().loadGraphic(Paths.image("stages/libitina/desktop2"));
	add(desktop);
	
	desktop.screenCenter();
	desktop.cameras = [camHUD];
	desktop.scale.set(0.69,0.69);
	// desktop.x += 100;
    desktop.alpha = 0;

    cursor = new FlxSprite().loadGraphic(Paths.image("stages/libitina/cursor"));
	cursor.cameras = [camHUD];
	add(cursor);
	cursor.scale.set(0.4,0.4);
	cursor.x = 1000;
	cursor.y = -90;
    
	// jeanprof =
    //end of cutscene shit
	strumLines.members[0].characters[0].x = 200;
	strumLines.members[0].characters[0].y = 30;

	strumLines.members[0].characters[0].scale.set(2,2);
	strumLines.members[0].characters[1].scale.set(2,2);
	strumLines.members[0].characters[1].x = strumLines.members[0].characters[0].x;
	strumLines.members[0].characters[1].y = strumLines.members[0].characters[0].y;
	GOONS1.alpha = 0;
	GOONS2.alpha = 0;
	
	
	strumLines.members[0].characters[0].alpha = 0;
	strumLines.members[0].characters[1].alpha = 0;
	bigwindow.alpha = 0;
	bigwindow.scale.set(0.01,0.01);
	InfoMidwayBGInvert.alpha = 0;
	InfoMidwayBG.alpha = 0;
	InfoMidwayBG.scale.set (1.3,1.3);
	InfoMidwayBGInvert.scale.set (1.3,1.3);
	FinaleBG.alpha = 0;

	crackBG.alpha = 0;

   bigwindow.x = strumLines.members[0].characters[0].x;
}

function postUpdate(){
	curCameraTarget = -1;
	if(PlayState.instance.curStep < 2915) camFollow.setPosition(600,400);

}
function stepHit(curStep){
	switch(curStep){
		case 0:
			// FlxTween.tween(desktopIn, {alpha:1}, Conductor.crochet / 40, {ease:FlxEase.cubeOut});
		case 53:
			FlxTween.tween(desktop, {alpha:1}, Conductor.crochet / 300, {ease:FlxEase.cubeOut});
			FlxTween.tween(cursor, {alpha:1}, Conductor.crochet / 300, {ease:FlxEase.cubeOut});
			FlxTween.tween(cursor, {y: 430, x: 80}, Conductor.crochet / 100, {ease:FlxEase.cubeOut});
		case 98:
			desktop.alpha = 0;
			desktopIn.alpha = 0;

	}
	// if(curStep < 260){
	// 	vocals.pitch = 30;
	// 	inst.pitch = 30;
	// } else {
		
	// 	vocals.pitch = 1;
	// 	inst.pitch = 1;
	// }
    switch(curStep){
		case 277:
          bigwindow.alpha = 1;
          FlxTween.tween(bigwindow, {"scale.x": 1.3, "scale.y": 1.3}, 0.3, {ease: FlxEase.cubeOut});
		case 295:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);
			strumLines.members[0].characters[0].alpha = 1;
            bigwindow.alpha = 1;  
		case 320:
			FlxTween.tween(bigwindow, {"scale.x": 0.01, "scale.y": 0.01}, 0.3, {ease: FlxEase.cubeIn});

		case 552:
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[0].characters[1].alpha = 1;
            InfoMidwayBG.alpha = 1;
		case 807:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);
        case 1103:
			FlxG.camera.fade(0xFFFFFFFF,3,false);
        case 1127:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);

		case 1081:
			FlxG.camera.fade(0xFF000000,2,false);
		case 1128:
			FlxG.camera.fade(0xFF000000,0.1,true);
			InfoMidwayBGInvert.alpha = 1;
			InfoMidwayBG.alpha = 0;
			strumLines.members[0].characters[0].alpha = 1;
			strumLines.members[0].characters[1].alpha = 0;
        case 1895:
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[0].characters[1].alpha = 1;
            InfoMidwayBG.alpha = 1;
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);
 
		case 2151:
			FlxG.camera.fade(0xFFFFFFFF,0.7,true);
        case 2391, 2395:
			InfoMidwayBGInvert.alpha = 0;
			FlxG.camera.fade(0xFFFFFFFF,0.2,true);
		case 2399, 2401, 2403, 2405:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);
        case 2407:
			strumLines.members[0].characters[0].alpha = 1;
			strumLines.members[0].characters[1].alpha = 0;
			crackBG.alpha = 1;

		case 2919:
			FlxG.camera.fade(0xFFFFFFFF,0.2,false);
        case 2930:
			defaultCamZoom = 1.3;
            InfoMidwayBG.alpha = 0;
			camFollow.setPosition(600,-200);
		case 2944:
			crackBG.alpha = 0;
			strumLines.members[0].characters[0].scale.set(0.7,0.7);
			dad.color = 0xFF000000;
			GOONS1.alpha = 1;
			GOONS2.alpha = 1;
			FinaleBG.alpha = 1;
			FlxG.camera.fade(0xFFFFFFFF,5,true);
			strumLines.members[0].characters[0].x += 200;
			camGame.followLerp = 0.01;
			camFollow.setPosition(600,400);
			GOONS1.y -= 100;
			GOONS2.y -= 120;
			GOONS2.x -= 190;
        case 3359:
			FlxG.camera.fade(0xFF000000, 5, false);
	}
}
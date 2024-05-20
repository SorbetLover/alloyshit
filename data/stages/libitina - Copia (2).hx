import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import hxvlc.util.Handle;

var crackBG:FlxVideoSprite;

var desktopIn:FlxSprite;
var desktopOut:FlxSprite;
var desktop:FlxSprite;
var cursor:FlxSprite;
var jeanprof:FlxSprite;
var jeancall:FlxSprite;
var ralucapointing:FlxSprite;
var jeanexplains:FlxSprite;
var ralucaassustada:FlxSprite;
var deusdiggo:FlxSprite;
var ralucabrava:FlxSprite;
var vagina:FlxSprite;
var maluca:FlxSprite;
var putz:FlxSprite;
function postCreate(){
	// for(i in strumLines.members[0].members){
	// 	i.alpha = 0;
	// }
	strumLines.members[0].members[0].alpha = 0;
	strumLines.members[0].members[1].alpha = 0;
	strumLines.members[0].members[2].alpha = 0;
	strumLines.members[0].members[3].alpha = 0;
	for(e in [healthBar, healthBarBG, iconP1,iconP2]){
		e.visible = false;
	}
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

 
    
	jeanprof = new FlxSprite().loadGraphic(Paths.image("stages/libitina/discordjean"));
	jeanprof.cameras = [camHUD];
	add(jeanprof);
	jeanprof.screenCenter();
	jeanprof.scale.set(1.54,1.54);
	jeanprof.y -= 60;
	jeanprof.x += 10;
	jeanprof.alpha = 0;
 
	jeancall = new FlxSprite().loadGraphic(Paths.image("stages/libitina/discordcall"));
	jeancall.cameras = [camHUD];
	jeancall.screenCenter();
	add(jeancall);
	jeancall.scale.set(1,1);
	jeancall.alpha = 0;	
 
    ralucapointing = new FlxSprite().loadGraphic(Paths.image("stages/libitina/ralucabio"));
	ralucapointing.cameras = [camHUD];
	ralucapointing.screenCenter();
	ralucapointing.scale.set(1.4,1.4);
	add(ralucapointing);
	ralucapointing.alpha = 0;

	ralucapointing2 = new FlxSprite().loadGraphic(Paths.image("stages/libitina/raloucaapontando"));
	ralucapointing2.cameras = [camHUD];
	ralucapointing2.screenCenter();
	ralucapointing2.scale.set(0.8,0.8);
	add(ralucapointing2);
	ralucapointing2.alpha = 0;
    
	jeanexplains = new FlxSprite().loadGraphic(Paths.image("stages/libitina/jeanresposta"));
	jeanexplains.cameras = [camHUD];
	add(jeanexplains);
    jeanexplains.screenCenter();
	jeanexplains.alpha = 0;

	jeanacusa = new FlxSprite().loadGraphic(Paths.image("stages/libitina/jeanpointing"));
	jeanacusa.cameras = [camHUD];
	jeanacusa.screenCenter();
	add(jeanacusa);
	jeanacusa.scale.set(0.8,0.8);
    jeanacusa.alpha = 0;

    ralucaassustada = new FlxSprite().loadGraphic(Paths.image("stages/libitina/ralocaerrada"));
	add(ralucaassustada);
	ralucaassustada.cameras = [camHUD];
	ralucaassustada.screenCenter();
	ralucaassustada.alpha = 0;
    ralucaassustada.scale.set(1.4,1.4);

	deusdiggo = new FlxSprite().loadGraphic(Paths.image("stages/libitina/deusdiggo"));
	deusdiggo.cameras = [camHUD];
	add(deusdiggo);
	deusdiggo.screenCenter();
	deusdiggo.scale.set(1.3,1.3);
	deusdiggo.alpha = 0;

	ralucabrava = new FlxSprite().loadGraphic(Paths.image("stages/libitina/ralucabraba"));
	ralucabrava.cameras = [camHUD];
	add(ralucabrava);
	ralucabrava.screenCenter();
	ralucabrava.scale.set(1.3,1.3);
	ralucabrava.alpha = 0;
	
	vagina = new FlxSprite().loadGraphic(Paths.image("stages/libitina/elatemmsmumavagina"));
	vagina.cameras = [camHUD];
	vagina.screenCenter();
	add(vagina);
	vagina.scale.set(1.3,1.3);
	vagina.alpha = 0;

	maluca = new FlxSprite().loadGraphic(Paths.image("stages/libitina/ralucamaluca"));
	maluca.cameras = [camHUD];
	maluca.screenCenter();
	maluca.scale.set(1.3,1.3);
	add(maluca);
	maluca.alpha = 0;

    putz = new FlxSprite().loadGraphic(Paths.image("stages/libitina/raluca2"));
	
	putz.cameras = [camHUD];
	putz.scale.set(2,2);
	putz.screenCenter();

	add(putz);
	putz.alpha = 0;
	// insert(members.indexOf(strumLines.members[0].members[0]), putz);

	cursor = new FlxSprite().loadGraphic(Paths.image("stages/libitina/cursor"));
	cursor.cameras = [camHUD];
	add(cursor);
	cursor.scale.set(0.4,0.4);
	cursor.x = 1000;
	cursor.y = -90;

  
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

	// crackBG.alpha = 0;
	    crackBG = new FlxVideoSprite(0, 0);
		crackBG.antialiasing = true;
		crackBG.bitmap.onFormatSetup.add(function():Void
		{
			crackBG.setGraphicSize(FlxG.width + 150, FlxG.height + 100);
			crackBG.scrollFactor.set(0,0);
			crackBG.updateHitbox();
			crackBG.screenCenter();
		});
		// crackBG.bitmap.onEndReached.add(crackBG.destroy);
		crackBG.load(Paths.video('crackBG'), [':input-repeat=2']);

	    insert(members.indexOf(bigwindow) + 1, crackBG);
        crackBG.play();
		crackBG.alpha = 0;

   bigwindow.x = strumLines.members[0].characters[0].x;
}

function postUpdate(){
	curCameraTarget = -1;
	if(PlayState.instance.curStep < 2915) camFollow.setPosition(600,400);
    bigwindow.alpha = 0;
}
var docutscene:Bool = false;
function stepHit(curStep){
	if(docutscene == true){

	
	switch(curStep){
		case 0:
			FlxTween.tween(desktopIn, {alpha:1}, Conductor.crochet / 100, {ease:FlxEase.cubeOut});
			
	strumLines.members[0].members[0].alpha = 0;
	strumLines.members[0].members[1].alpha = 0;
	strumLines.members[0].members[2].alpha = 0;
	strumLines.members[0].members[3].alpha = 0;
		case 53:
			FlxTween.tween(desktop, {alpha:1}, Conductor.crochet / 300, {ease:FlxEase.cubeOut});
			FlxTween.tween(cursor, {alpha:1}, Conductor.crochet / 300, {ease:FlxEase.cubeOut});
			FlxTween.tween(cursor, {y: 430, x: 80}, Conductor.crochet / 200, {ease:FlxEase.cubeOut});
		case 78:
			desktop.alpha = 0;
			desktopIn.alpha = 0;
            jeanprof.alpha = 1;		
			FlxTween.tween(cursor, {y: 590, x: 440}, Conductor.crochet / 270, {ease:FlxEase.cubeOut, startDelay: 1});
        case 98:
			camHUD.fade(0xFFFFFFFF, Conductor.crochet  / 1000,true);
			jeanprof.alpha = 0;
			jeancall.alpha = 1;
			desktop.alpha = 0;
			desktopIn.alpha = 0;


		case 124:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
			desktop.alpha = 0;
			desktopIn.alpha = 0;

			ralucapointing.alpha = 1;
			jeancall.alpha = 0;
			desktop.alpha = 0;
			cursor.alpha = 0;
		case 148:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
            desktop.alpha = 0;
			cursor.alpha = 0;
			ralucapointing.alpha = 0;
			ralucapointing2.alpha = 1;
		case 172:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
			ralucapointing2.alpha = 0;
			cursor.alpha = 0;
			strumLines.members[0].members[0].alpha = 0;
			strumLines.members[0].members[1].alpha = 0;
			strumLines.members[0].members[2].alpha = 0;
			strumLines.members[0].members[3].alpha = 0;
     		jeanexplains.alpha = 1;
		case 197:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
     		jeanexplains.alpha = 0;
			jeanacusa.alpha = 1;
			cursor.alpha = 0;
		case 234:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
		    jeanacusa.alpha = 0;
			ralucaassustada.alpha = 1;
		case 246:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
			ralucaassustada.alpha = 0;
			deusdiggo.alpha = 1;
		   
		case 256:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
             deusdiggo.alpha = 0;
			 ralucabrava.alpha = 1;
		case 266:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
            ralucabrava.alpha = 0;
			vagina.alpha = 1;
			

        case 272:
			camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
            vagina.alpha = 0;
            putz.alpha = 1;
		case 277: //fade out to cam game
		
		camHUD.fade(0xFF000000, Conductor.crochet  / 500,true);
		// putz.alpha = 1;
			




	}
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
			
	strumLines.members[0].members[0].alpha = 1;
	strumLines.members[0].members[1].alpha = 1;
	strumLines.members[0].members[2].alpha = 1;
	strumLines.members[0].members[3].alpha = 1;
          bigwindow.alpha = 1;
		//   putz.alpha = 0;
		  FlxTween.tween(putz, {alpha: 0}, Conductor.crochet / 200);
          FlxTween.tween(bigwindow, {"scale.x": 1.3, "scale.y": 1.3}, Conductor.crochet / 400, {ease: FlxEase.cubeOut});
		case 295:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);
			strumLines.members[0].characters[0].alpha = 1;
            bigwindow.alpha = 1;  
		case 320:
			FlxTween.tween(bigwindow, {"scale.x": 0.01, "scale.y": 0.01}, Conductor.crochet / 800, {ease: FlxEase.cubeIn});

		case 552:
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[0].characters[1].alpha = 1;
            InfoMidwayBG.alpha = 1;
		case 807:
			FlxG.camera.fade(0xFFFFFFFF,0.4	,true);
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
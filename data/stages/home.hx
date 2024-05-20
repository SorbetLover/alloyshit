function postCreate(){

	strumLines.members[2].characters[0].alpha = 0;
	strumLines.members[3].characters[0].alpha = 0;
	dad.color = 0xFF000000;
	boyfriend.color = 0xFF000000;
    strumLines.members[1].characters[1].x = strumLines.members[1].characters[0].x;
    strumLines.members[1].characters[1].y = strumLines.members[1].characters[0].y;
		
    strumLines.members[1].characters[1].alpha = 0;
    strumLines.members[1].characters[2].alpha = 0;
	
    strumLines.members[1].characters[3].alpha = 0;
	paperBG.alpha = 0;
	// BakaBGDoodles.animation.stop();
	BakaBGDoodles.alpha = 0;
	defaultCamZoom = 1;
	camGame.zoom = 1;
		
	
	homeStaticfront.alpha = 0;
	paperBG.cameras = [camHUD];
	BakaBGDoodles.cameras = [camHUD];
    BakaBGDoodles.screenCenter();
	homeStaticfront.cameras = [camHUD];
	
	vig.alpha = 0;

	vig.cameras = [camHUD];
    vig.screenCenter();
	homeStaticback.alpha = 0;
	healthBar.alpha = 0;
	healthBarBG.alpha = 0;
	iconP1.alpha = 0;
	iconP2.alpha = 0;
	scoreTxt.alpha = 0;
	accuracyTxt.alpha = 0;
	missesTxt.alpha = 0;
	// player.cpu = true;
	strumLines.members[0].characters[0].alpha = 0;
	strumLines.members[1].characters[0].alpha = 0;

	FlxG.camera.fade(0xFF000000, 0.001,false);
    strumLines.members[2].cpu = true;
	strumLines.members[3].cpu = true;
	// strumLines.members[1].cpu = true;
	// strumLines.members[0].cpu = false;
}
    
function onStartSong(){
	FlxG.camera.fade(0xFF000000, 10,true);

}
function stepHit(curStep){
	switch(curStep){
		case 128:
			FlxTween.tween(dad, {alpha: 1},1);
        case 160:
			FlxTween.tween(boyfriend, {alpha: 1},1);

		case 255:
			FlxTween.tween(BakaBGDoodles, {alpha: 1}, 1, {ease:FlxEase.linear});

		case 444:
			FlxTween.tween(paperBG, {alpha: 1}, 0.2, {ease:FlxEase.linear});
			FlxTween.tween(homeStaticfront, {alpha: 1}, 1, {ease:FlxEase.linear, startDelay:2});

			BakaBGDoodles.animation.play("breaking");
		case 496:
			dad.x += 100;
			boyfriend.x -= 100;
			strumLines.members[1].characters[1].x = strumLines.members[1].characters[0].x;
			BakaBGDoodles.alpha = 0;
			paperBG.alpha = 0;
			homeStaticfront.alpha = 0;
            DDLCbg.alpha = 0;
			DDLCfarbg.alpha = 0;
			BGs.alpha = 1;    
			strumLines.members[1].characters[1].alpha = 1;
			strumLines.members[1].characters[0].alpha = 0; 
			boyfriend.color = 0xFFFFFFFF;
			dad.color = 0xFFFFFFFF;      
		case 768, 772, 776, 778:
			camZooming = false;
			camGame.zoom += 0.2;
			defaultCamZoom += 0.2;
		case 784:
			camGame.zoom = 1.5;
			homeStaticfront.alpha = 0.1;
			defaultCamZoom = 1.5;
			dad.x += 200;
			camZooming = true;        
            BGs.color = 0xFF999999;
		case 1296:       
			FlxG.camera.fade(0xFF000000,3,true);
			homeStaticfront.alpha = 0;
			dad.color = 0xFF888888;
            strumLines.members[1].characters[1].color = 0xFF999999;
			vig.alpha = 1;
            BGs.color = 0xFFFFFFFF;
			dad.x -= 200;
		case 1552:
			dad.x += 150;
			vig.alpha = 0;
			homeStaticfront.alpha = 0.1;	
			strumLines.members[1].characters[2].x -= 100;
			strumLines.members[1].characters[1].alpha = 0;
			
			strumLines.members[1].characters[2].alpha = 1;
			crazybt = true;

        case 1808:
            dad.x -= 150;
			crazybt = false;
			strumLines.members[1].characters[2].x += 100;
			vig.alpha = 0;
			homeStaticfront.alpha = 0;
			defaultCamZoom = 1.2;
			camGame.zoom = 1.2;
			dad.y += 30;
		case 2048:
			FlxTween.tween(homeStaticfront, {alpha: 1}, 0.3, {ease:FlxEase.linear});
			camGame.followLerp = 9999999;

		case 2064:
		homeStaticfront.alpha = 0;
			notepad.alpha = 1;
			strumLines.members[1].characters[3].alpha = 1;
			strumLines.members[1].characters[2].alpha = 0;
			strumLines.members[1].characters[3].x -= 120;
			strumLines.members[1].characters[3].y -= 200;

			dad.alpha = 0;
			BGs.alpha = 0;
			homeStaticback.alpha = 1;

		case 2176:
			FlxTween.tween(homeStaticfront, {alpha: 1}, 0.3, {ease:FlxEase.linear});
            camGame.followLerp = 1;
		case 2191:
            homeStaticfront.alpha = 0;

			dad.alpha = 1;
			BGruined.alpha = 1;
			dad.color = 0xFFFFFFFF;
			notepad.alpha = 0;
            strumLines.members[1].characters[3].alpha = 0;
			strumLines.members[1].characters[2].alpha = 1;
		case 2320:
			
		   FlxG.camera.fade(0xFF000000,0.1,false);
        case 2323:
		   BGruined.alpha = 0;
		   homeStaticback.alpha = 0;
		   FlxG.camera.fade(0xFF000000,0.01,true);
		   dad.alpha = 0;
		   strumLines.members[1].characters[2].alpha = 0;  
		   dad.colorTransform.color = 0xFFFFFFFF	;  
		   
		   boyfriend.colorTransform.color = 0xFFFFFFFF;
		   
		   strumLines.members[3].characters[0].colorTransform.color = 0x88FFFFFF;
		   strumLines.members[2].characters[0].colorTransform.color = 0x88FFFFFF;
		   camGame.followLerp = 0.03;
		   

		case 2360:
		    defaultCamZoom = 0.6;
			camGame.zoom = 0.6;
			for(i in [strumLines.members[2].characters[0], strumLines.members[3].characters[0]]){
				i.x = strumLines.members[0].characters[0].x;
			}
		    FlxTween.tween(dad, {alpha: 1},1);
			dad.y += 30;
			calmbt = true;

		case 2376:
			FlxTween.tween(strumLines.members[1].characters[0], {alpha: 1},1);
        case 2416:
			FlxTween.tween(strumLines.members[3].characters[0], {alpha: 0.6},1);
			strumLines.members[3].characters[0].x -= 400;
			strumLines.members[3].characters[0].scale.set(0.8,0.8);
			strumLines.members[3].characters[0].y -= 160;
        case 2608:
			FlxTween.tween(strumLines.members[2].characters[0], {alpha: 0.6},1);
			strumLines.members[2].characters[0].x += 1000;
			strumLines.members[2].characters[0].scale.set(0.8,0.8);
			strumLines.members[2].characters[0].y -= 60;
        case 2928:
			strumLines.members[0].characters[0].alpha = 0;
			strumLines.members[1].characters[0].alpha = 0;
			
			strumLines.members[2].characters[0].alpha = 0;
			strumLines.members[3].characters[0].alpha = 0;
			homeStaticback.alpha = 1;
			everyoneisdead.alpha = 1;
			homeStaticback.screenCenter();
			everyoneisdead.screenCenter();
			everyoneisdead.y += 200;
			
			homeStaticback.y += 100;
			homeStaticback.scale.set(1.4,1.4);
            // for(i in [strumLines.members[0].members,strumLines.members[1].members]){
			// 	i.alpha = 0;
			// }
            strumLines.members[0].members[0].y = 2220;
            strumLines.members[0].members[1].y = 2220;
            strumLines.members[0].members[2].y = 2220;
            strumLines.members[0].members[3].y = 2220;
			
            strumLines.members[1].members[0].y = 2220;
            strumLines.members[1].members[1].y = 2220;
            strumLines.members[1].members[2].y = 2220;
            strumLines.members[1].members[3].y = 2220;
		} 
}
function postUpdate(){
	if(crazybt == true){
		camFollow.setPosition(750,550);
		defaultCamZoom = 1.8;
		camGame.zoom = 1.8;
		camGame.followLerp = 5;

	}
	if(calmbt == true){
		camFollow.setPosition(dad.x + 700,550);
        camGame.zoom = 0.6;
	}
}
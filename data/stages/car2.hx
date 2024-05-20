import funkin.game.PlayState;
function postUpdate(){
	switch(strumLines.members[0].characters[1].getAnimName()) {
        case "singLEFT": butt.color = 0xFFc988ff; 
        case "singDOWN": butt.color = 0xFFc4e8ff;
        case "singUP": butt.color = 0xFF7dffff;
        case "singRIGHT": butt.color = 0xFFffa6ff;
        case "idle": butt.color = 0xFFFFFFFF;
 	}
	switch(strumLines.members[0].characters[2].getAnimName()) {
        case "singLEFT": butt2.color = 0xFFc988ff; 
        case "singDOWN": butt2.color = 0xFFc4e8ff;
        case "singUP": butt2.color = 0xFF7dffff;
        case "singRIGHT": butt2.color = 0xFFffa6ff;
        case "idle": butt2.color = 0xFFFFFFFF;
 	}
    if(FlxG.keys.justPressed.Z){
		strumLines.members[0].cpu = true;
		strumLines.members[1].cpu = true;
		
		strumLines.members[2].cpu = true;
	}
	camZooming = false;
}

var shitr:Float = -780;

function postCreate(){
	butt.x = -1010;
	butt2.x = -1010;
	shit.x = -780;
	shit2.x = -780;
	shit.color = 0xFF000000;
	shit3.color = 0xFF000000;


    if(PlayState.SONG.meta.name == "cosmic-swing"){
		butt.scale.set(11, 11);
		shit.scale.set(11, 11);
		shit2.scale.set(11, 11);
		strumLines.members[0].characters[1].y = -200;
		strumLines.members[0].characters[1].x = -580;
	    
		strumLines.members[0].characters[1].scale.set(0.4,0.4);
	}
	iconP2.alpha = 0;

    if(PlayState.SONG.meta.name == "w00f"){
		strumLines.members[0].characters[1].x = shitr;
		strumLines.members[0].characters[1].y = 100;
		strumLines.members[0].characters[2].y = 100;

		strumLines.members[0].characters[1].scale.set(0.9,0.9);
    // butt.skew.y = 3;
	// shit.skew.y = 3;
	// shit2.skew.y = 3;
    strumLines.members[0].characters[2].x = shitr - 50;
	strumLines.members[0].characters[2].scale.set(0.9,0.9);

	shit2.scale.set(0, 0);
	shit.scale.set(20, 34);
	shit3.scale.set(55, 25);
	shit3.cameras = [camHUD];
	}
	strumLines.members[0].characters[2].alpha = 0;
	defaultCamZoom = 0.9;
	FlxG.camera.zoom = 0.9;
}
function stepHit(curStep){
    if(PlayState.SONG.meta.name == "cosmic-swing"){
		switch(curStep){
		case 256:
		FlxTween.tween(iconP2, {alpha: 1}, 0.5, {ease: FlxEase.cubeOut});		
		FlxTween.tween(butt, {x: 0}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit, {x: 0}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit2, {x: 0}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[1], {x: -120}, 0.5, {ease: FlxEase.cubeOut});

	}
	}
	if(PlayState.SONG.meta.name == "w00f"){
	switch(curStep){

	case 32:
		FlxTween.tween(bg, {x:                                                                   bg.x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(chairs, {x:                                                           chairs.x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[1].characters[0], {x: strumLines.members[1].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].characters[0], {x: strumLines.members[2].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[0], {x: strumLines.members[0].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});

     	FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.5, {ease: FlxEase.cubeOut});

    	FlxTween.tween(iconP2, {alpha: 1}, 0.5, {ease: FlxEase.cubeOut});		
		FlxTween.tween(butt, {x: -400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit, {x: -120}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[1], {x: -70}, 0.5, {ease: FlxEase.cubeOut});
	
	case 1064:
		FlxTween.tween(iconP2, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});		
		FlxTween.tween(butt, {x: shitr- 300}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit, {x: shitr}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit2, {x: shitr}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[1], {x: shitr}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.1, {ease: FlxEase.cubeOut});

		FlxTween.tween(bg, {x:                                                                   bg.x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(chairs, {x:                                                           chairs.x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[1].characters[0], {x: strumLines.members[1].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].characters[0], {x: strumLines.members[2].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[0], {x: strumLines.members[0].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});

		case 1071:
		strumLines.members[0].characters[1].alpha = 0;
		strumLines.members[0].characters[2].alpha = 1;
	case 1104:
		FlxTween.tween(iconP2, {alpha: 1}, 0.5, {ease: FlxEase.cubeOut});		
		FlxTween.tween(butt2, {x: -400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit, {x: -120}, 0.5, {ease: FlxEase.cubeOut});
		strumLines.members[0].characters[2].alpha = 1;
        butt2.alpha  = 1 ;
		butt.alpha = 0;
		FlxTween.tween(strumLines.members[0].characters[2], {x: -100}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(bg, {x:                                                                   bg.x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(chairs, {x:                                                           chairs.x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[1].characters[0], {x: strumLines.members[1].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].characters[0], {x: strumLines.members[2].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[0], {x: strumLines.members[0].characters[0].x + 400}, 0.5, {ease: FlxEase.cubeOut});

    
	case 1880:
		FlxTween.tween(iconP2, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});		
		FlxTween.tween(rollIcon, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});		
		FlxTween.tween(butt2, {x: shitr -300}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit, {x: shitr}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(shit2, {x: shitr}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[2], {x: shitr -100}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(bg, {x:                                                                   bg.x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(chairs, {x:                                                           chairs.x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[1].characters[0], {x: strumLines.members[1].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].characters[0], {x: strumLines.members[2].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[0].characters[0], {x: strumLines.members[0].characters[0].x - 400}, 0.1, {ease: FlxEase.cubeOut});
		for(i in strumLines.members[0].members){
		FlxTween.tween(i, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});
		}
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.1, {ease: FlxEase.cubeOut});
 
    case 1881:
		if(opponentMode == true){
		FlxTween.tween(strumLines.members[2].members[0], {x: strumLines.members[2].members[0].x -= 640}, 5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].members[1], {x: strumLines.members[2].members[1].x -= 640}, 5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].members[2], {x: strumLines.members[2].members[2].x -= 640}, 5, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[2].members[3], {x: strumLines.members[2].members[3].x -= 640}, 5, {ease: FlxEase.cubeOut});
		strumLines.members[2].cpu = false;
	    }

	}

	}
}

function postCreate(){
	sofia.animation.pause();
	tio.animation.pause();
}

var focusing:Bool = false;
var focusingOn:Bool = false;

function postUpdate(){
	// camFollow.setPosition(700,500);
	if(dad.getAnimName() == "idle" && boyfriend.getAnimName() == "idle"){
		camFollow.setPosition(700,500);
	}
	if(dad.getAnimName() != "idle" && boyfriend.getAnimName() != "idle"){
		camFollow.setPosition(700,500);
	}
	if(dad.getAnimName() != "idle" && boyfriend.getAnimName() != "idle"){
		camFollow.setPosition(600,500);
	} 
	if(dad.getAnimName() == "idle" && boyfriend.getAnimName() == "idle"){
		camFollow.setPosition(800,500);
	} 

	if(focusing == true){
		switch(focusingOn){
			case false:
			    camFollow.setPosition(1000, 500);
				
			case true:
			    camFollow.setPosition(500, 500);
		}
	}

}
var camDance:Bool = false;
var camDancedir:Bool = true;

function beatHit(curBeat){
	if(curBeat % 4 == 0){
		sofia.animation.play("idle", true);
		tio.animation.play("idle", true);
	}
		if(camDance == true){
        switch(camDancedir){
			case true:
			    camHUD.angle = -2;
				camDancedir = false;
			case false:
			    camHUD.angle = 2;
				camDancedir = true;
		}
	}
	if(curBeat > 63 && curBeat % 4 == 0){
        camHUD.zoom = 1.1;
	}
}

function stepHit(curStep){
    switch(curStep){
		case 1024: camDance = true;
		case 1535: camDance = false; camHUD.angle = 0;
        case 1151, 1184: camGame.followLerp = 1; focusing = true; focusingOn = false;  defaultCamZoom = 1; camGame.zoom = 1;  
		// case 1152, 1156, 1160, 1164, 1172, 1176, 1180, 1184, 1188, 1192, 1196: defaultCamZoom += 0.1; camGame.zoom += 0.1;
		// case 1168: defaultCamZoom = 1; camGame.zoom = 1; focusingOn = true;
	    // case 1200: defaultCamZoom = 0.8; camGame.zoom = 0.8; focusing = false; camGame.zoomLerp = 1; camGame.followLerp = 0.04;

		case 1152, 1156, 1160, 1164, 1172, 1176, 1180, 1184, 1188, 1192, 1196: defaultCamZoom += 0.1; camGame.zoom += 0.1;
		case 1168: defaultCamZoom = 1; camGame.zoom = 1; focusingOn = true;
	    case 1200: defaultCamZoom = 0.8; camGame.zoom = 0.8; focusing = false; camGame.zoomLerp = 1; camGame.followLerp = 0.04;

	}
}
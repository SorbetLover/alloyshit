import flixel.addons.display.FlxBackdrop;
import funkin.game.HealthIcon;
import flixel.tweens.misc.NumTween;
import flixel.tweens.misc.ColorTween;
import flixel.util.FlxColor;
var angle1:Bool = false;
var angle2:Bool = false;
var angle3:Bool = false;
var yuri:HealthIcon;
var camx:Float = 0;
var camy:Float = 0;
var shit:Float = 70;
function create(){
	introLength = 4;
    
yuri1.alpha = 0;
yuri2.alpha = 0;


libi1.alpha = 0;
libi2.alpha = 0;
libi3.alpha = 0;

}
var shit2:Bool = true;
var bgSky:FlxBackdrop;
function postCreate(){
	// for(i in strumLines.members){
	// 	i.cpu = true;
	// }
	strumLines.members[0].characters[0].scale.set(9,9);
    bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Sky"));
	insert(members.indexOf(gf2) - 1, bgSky);
	bgSky.spacing.y = -20; 

	bgSky.velocity.set(-400, 0);
	FlxG.camera.scroll.set(260, 130);
	boyfriend.alpha = 0;
	// FlxG.camera.zoom = 0.9;
	gf.alpha = 0;
	for (strum in strumLines.members[0].members){
        strum.angle = 0;
	}


	dad.y = shit;
	strumLines.members[2].characters[0].x -= 1460;
	strumLines.members[2].characters[0].scale.set(0.8,0.8);

	strumLines.members[2].characters[0].y += 10;
	strumLines.members[3].characters[0].x += 140;
	strumLines.members[0].characters[0].x += 1500;
	strumLines.members[0].characters[0].y += 420;

	healthBar.alpha = 0;
	healthBarBG.alpha = 0;
	iconP2.alpha = 0;
	iconP1.alpha = 0;
	for(i in [strumLines.members[0].characters[0], gf1, gf2]){
		i.y -= 800;
	 } 
	 scoreTxt.x = 670;
	 accuracyTxt.x = 1050;
	 accuracyTxt.y = accuracyTxt.y - 20;
	 missesTxt.x = 8960;
	 missesTxt.y = accuracyTxt.y - 20;
	 strumLines.members[1].characters[0].alpha = 1;
	 strumLines.members[3].characters[0].alpha = 0;

	}
	var shit22:Bool = true;
function postUpdate(){

	if(shit22 == true){

	strumLines.members[0].characters[0].alpha = 0;
	}
	// if(FlxG.keys.justPressed.Z){
	// 		player.cpu = true;
	// 		strumLines.members[2].cpu = true;
            
	// }
	camFollow.setPosition(920,490);

	// switch(strumLines.members[0].characters[0].getAnimName()) {
    //     case "singLEFT": 
	// 		for (strum in strumLines.members[0].members){
	// 			strum.angle = -7;
	// 	        angle1 = true;
	// 		}
					
    //     case "singRIGHT": 
	// 		for (strum in strumLines.members[0].members){
	// 			strum.angle = 7;
	// 			angle1 = true;
	// 		}
		
    //     case "idle":
	// 		if(angle1 == true){			   
	// 			angle1 = false;
	// 			for (strum in strumLines.members[0].members){
	// 				FlxTween.tween(strum, {angle: 0}, 1, {ease: FlxEase.cubeOut});
	// 			}
	// 		}
		
 	// }
	//  switch(strumLines.members[1].characters[0].getAnimName()) {
    //     case "singLEFT": 
	// 		angle2 = true;

	// 	for (strum in strumLines.members[1].members){
	// 			strum.angle = -7;
	// 		}
	// 		for (strum in strumLines.members[2].members){
	// 			strum.angle = -7;
	// 		}
					
    //     case "singRIGHT": 
	// 		angle2 = true;

	// 	for (strum in strumLines.members[1].members){
	// 			strum.angle = 7;
	// 		}
	// 		for (strum in strumLines.members[2].members){
	// 			strum.angle = 7;
	// 		}
		
    //     case "idle":
    //     if(angle2 == true){			   
	// 	    angle2 = false;
	// 		for (strum in strumLines.members[1].members){
	// 			FlxTween.tween(strum, {angle: 0}, 1, {ease: FlxEase.cubeOut});
	// 		}
	// 		for (strum in strumLines.members[2].members){
	// 			FlxTween.tween(strum, {angle: 0}, 1, {ease: FlxEase.cubeOut});
	// 		}
	// 	}
		
 	// }
	//  switch(strumLines.members[2].characters[0].getAnimName()) {
    //     case "singLEFT": 
	// 		angle2 = true;

	// 	for (strum in strumLines.members[1].members){
	// 			strum.angle = -5;
	// 		}
	// 		for (strum in strumLines.members[2].members){
	// 			strum.angle = -5;
	// 		}
					
    //     case "singRIGHT": 
	// 		angle2 = true;

	// 	   for (strum in strumLines.members[1].members){
	// 			strum.angle = 5;
	// 		}
	// 		for (strum in strumLines.members[2].members){
	// 			strum.angle = 5;
	// 		}
		
        
 	
	
}
function stepHit(curStep){

	switch(curStep){
	    case 10:
			shit22 = false;
		case 160:
	    camy = FlxG.camera.y;
	    camx = FlxG.camera.x;

           defaultCamZoom = 0.4;
		   defaultHudZoom = 0.8;
		for (strum in strumLines.members[0].members){
			FlxTween.tween(strum, {y: strum.y - 70}, 1, {ease: FlxEase.cubeOut});
	
		}	   

		   for (strum in strumLines.members[1].members){
			FlxTween.tween(strum, {y: strum.y - 70}, 1, {ease: FlxEase.cubeOut});
	
		}	   
		for (strum in strumLines.members[2].members){
			FlxTween.tween(strum, {y: strum.y - 70}, 1, {ease: FlxEase.cubeOut});	
		}	   
			
		for (strum in strumLines.members[3].members){
			FlxTween.tween(strum, {y: strum.y - 70}, 1, {ease: FlxEase.cubeOut});

		}	   
	
		    FlxTween.tween(boyfriend, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(gf, {alpha: 1}, 1, {ease: FlxEase.cubeOut});

	        for(e in [strumLines.members[1].characters[0], monika1, monika2]){
				FlxTween.tween(e, {y: e.y + 330}, 1 , {ease:FlxEase.cubeOut});
			}
	        for(i in [strumLines.members[0].characters[0], gf1, gf2]){
				FlxTween.tween(i, {alpha:1, y: i.y + 380}, 1 , {ease:FlxEase.cubeOut});
			}
			FlxTween.tween(strumLines.members[3].characters[0], {alpha: 1}, 1, {ease: FlxEase.cubeOut});

			FlxTween.tween(yuri1, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(yuri2, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			
			FlxTween.tween(libi1, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(libi2, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(libi3, {alpha: 1}, 1, {ease: FlxEase.cubeOut});

        case 288:
	    	defaultCamZoom = 0.5;
	        shit2 = false;
		case 3160:
			FlxTween.tween(gf1, {"skew.x": 40, "skew.y": 40, "scale.x": 0, "scale.y": 0}, 0.2, {ease: FlxEase.cubeOut});
			FlxTween.tween(gf2, {"skew.x": 40, "skew.y": 40, "scale.x": 0, "scale.y": 0}, 0.2, {ease: FlxEase.cubeOut});

	        for(e in [strumLines.members[1].characters[0], monika1, monika2]){
				FlxTween.tween(e, {y: e.y - 330}, 1 , {ease:FlxEase.cubeOut});
			}
       
       case 3208:
		FlxTween.tween(yuri1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(yuri2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi3, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(gf, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(boyfriend, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(strumLines.members[3].characters[0], {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(camHUD, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
       case 3302:
		FlxTween.tween(monika1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(monika2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(bgSky, {alpha: 0}, 2, {ease: FlxEase.cubeOut});

	  	
	}
	
}
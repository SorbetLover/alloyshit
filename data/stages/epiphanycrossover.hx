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

	bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Sky"));
	insert(members.indexOf(monika1), bgSky);
	bgSky.spacing.y = -20; 
	bgSky.velocity.set(-400, 0);
	FlxG.camera.scroll.set(-280, 180);
	boyfriend.alpha = 0;
	// FlxG.camera.zoom = 0.9;
	gf.alpha = 0;
	for (strum in strumLines.members[0].members){
        strum.angle = 0;
	}
	yuri = new HealthIcon('yuricrazy', true);
	yuri.cameras = [camHUD];


	yuri.alpha = 1;
	insert(members.indexOf(healthBar) + 3, yuri);
}
function postUpdate(){
	// if(FlxG.keys.justPressed.Z){
	// 		player.cpu = true;
	// 		strumLines.members[2].cpu = true;
            
	// }
      
	
	dad.y = shit;
    yuri.x = iconP1.x + 80;
yuri.y = iconP1.y - 20;
yuri.scale.set(iconP1.scale.x, iconP1.scale.y);
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
	
		case 160:
	    camy = FlxG.camera.y;
	    camx = FlxG.camera.x;

           defaultCamZoom = 0.3;
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
	
		    FlxTween.tween(boyfriend, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(gf, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			
			FlxTween.tween(yuri1, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(yuri2, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			
			FlxTween.tween(libi1, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(libi2, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(libi3, {alpha: 1}, 1, {ease: FlxEase.cubeOut});

        case 288:
	    	defaultCamZoom = 0.5;
	        shit2 = false;
       
       case 3208:
		FlxTween.tween(yuri1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(yuri2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(libi3, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(gf, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(boyfriend, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(camHUD, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
       case 3302:
		FlxTween.tween(monika1, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(monika2, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(bgSky, {alpha: 0}, 2, {ease: FlxEase.cubeOut});

	  	
	}
	
}
import flixel.addons.display.FlxBackdrop;

var sky:FlxBackdrop;
var platform:FlxBackdrop;
var jeanp:FlxSprite;
var skate:FlxSprite;
var damien;
var wrench;
var aiden;
function create(){

	defaultCamZoom = 0.9;
	remove(dad);	
	doIconBop = false;
	sky = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustBg3"));
	add(sky);
	sky.y = -300;
	sky.velocity.x = -3000 * inst.pitch;
	sky.scale.set(3,3);
	sky.repeatAxes = FlxAxes.X;
	add(dad);

   	platform = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustFloor"));
	add(platform);
	platform.velocity.x = -4000 * inst.pitch;
	platform.scale.set(1,1);
    platform.y = sky.y - 700;
	platform.repeatAxes = FlxAxes.X;
	
	// player.cpu = true;
	skate = new FlxSprite().loadGraphic(Paths.image("stages/prey/skate"));
	skate.scale.set(0.5,0.5);
	insert(members.indexOf(strumLines.members[1].characters[0]) - 1, skate);
	skate.scale.set(0.1,0.1);

	skate.x = -1500;
	skate.y = platform.y + 490;

	skate2 = new FlxSprite().loadGraphic(Paths.image("stages/prey/skate"));
	skate2.scale.set(0.5,0.5);
	insert(members.indexOf(strumLines.members[1].characters[0]) - 1, skate2);
	skate2.scale.set(0.1,0.1);

	// skate2.x = -2500;
	skate2.y = platform.y + 490;
	
	sergei = new FlxSprite().loadGraphic(Paths.image("stages/sergei"));
	sergei.scale.set(0.55,0.45);
		camGame.bgColor = 0xFF000000;

}
function postCreate(){	
	curCameraTarget = 1;
	damien = strumLines.members[0].characters[0];
	wrench = strumLines.members[0].characters[1];
	aiden = strumLines.members[1].characters[0];
	for(e in [damien, wrench]){
		e.x -= 2500;
	}
	remove(wrench);
	add(sergei);
	add(wrench);
	
	camGame.zoom = defaultCamZoom;
	for(dog in [aiden, wrench,damien]){
		dog.scale.set(0.5,0.5);
	}
	aiden.x += 200;
	aiden.y += 150;

	// aiden.cameraOffset = FlxPoint.weak(-160,170);
	aiden.cameraOffset = FlxPoint.weak(-140,40);

	for(uhm in [camHUD, sky, platform]){
		uhm.alpha = 0;
	}
	damien.cameraOffset = FlxPoint.get(-160,170);
	damien.y += 160;
	wrench.y -= 300;

	camGame.followLerp = 0.2;
}
var level = 0;
function postUpdate(elapsed){
	if(curCameraTarget == 0 && level == 0){
		camFollow.setPosition(200,900);
	}
	if(curCameraTarget == 0 && level == 1){
		camFollow.setPosition(200,500);
	}
	if(curCameraTarget == 0 && level == 2){
		camFollow.setPosition(2000,500);
	}
	
	
	skate2.x = damien.x - 1800;

	sergei.x = wrench.x - 150;
	sergei.y = wrench.y + 490;
	
	for(i in [iconP1, iconP2]){
		i.scale.x = FlxMath.lerp(i.scale.x, 0.6, 0.06);
		i.scale.y = i.scale.x;
	}	
	
	// if(FlxG.keys.justPressed.SPACE){
	// 		sky.alpha = 1;
	// 		platform.alpha = 1;
	// 		defaultCamZoom = 0.5;
	// 		camZooming = true;
		
	// 		// FlxTween.tween(damien, {x:damien.x + 1500}, 2, {ease: FlxEase.backOut});
	// 		// curCameraTarget = 0;
			// FlxTween.tween(camHUD, {alpha:1}, 1);
	// 			defaultCamZoom = 0.35;
	// 			level = 2;
	// 			aiden.cameraOffset = FlxPoint.weak(390,-170);
	// 			FlxTween.tween(wrench, {x:wrench.x + 4000, y:wrench.y - 300}, 4, {ease: FlxEase.cubeOut});
		
	// }

}
function beatHit(){
	for(i in [iconP1, iconP2]){
		i.scale.set(0.5,0.5);
	}
}

function stepHit(){
	switch(curStep){
		case 128:
			camGame.fade(0xFF000000, 1, true);
			sky.alpha = 1;
			platform.alpha = 1;
			defaultCamZoom = 0.5;
			camZooming = true;
		
		case 240:
			FlxTween.tween(damien, {x:damien.x + 1500}, 2, {ease: FlxEase.backOut});
			curCameraTarget = 0;
			FlxTween.tween(camHUD, {alpha:1}, 1);

		case 1460:
			iconP2.visible = false;
			FlxTween.tween(damien, {x:damien.x + 200}, 3, {ease: FlxEase.backIn, onComplete: function(){
							FlxTween.tween(damien, {x:damien.x - 2500}, 2, {ease: FlxEase.backIn});
			}});
		case 1540:
			FlxTween.tween(wrench, {x:wrench.x + 1000}, 2, {ease: FlxEase.backOut});
			curCameraTarget = 0;
			defaultCamZoom = 0.3;
			level = 1;
			iconP2.setIcon("wrench", false);
			iconP2.visible = 1;
			health = 1;
		case 1710:
			FlxTween.tween(wrench, {x:wrench.x + 3000, y:wrench.y - 300}, 4, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.35;
			level = 2;
				aiden.cameraOffset = FlxPoint.weak(390,-170);
		case 3365:
			damien.x += 5000;
			FlxTween.tween(damien, {x:aiden.x}, 0.15, {onComplete: function(){
			camGame.fade(0xFF000000, 0.1, false);
				
			}});
		

	}

}
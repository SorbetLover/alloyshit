import flixel.addons.display.FlxBackdrop;
import funkin.game.HealthIcon;

var bgSky:FlxBackdrop;
var camshit:Bool = true;

function postCreate(){
	bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Sky"));
	insert(members.indexOf(closet) - 1, bgSky);
	bgSky.spacing.y = -20;
	bgSky.velocity.set(-300,0);
    BG.alpha = 1;
	bgSky.alpha = 1;
	closet.alpha = 1;
	defaultCamZoom = 0.9;
	FlxG.camera.zoom = 0.9;

    
strumLines.members[0].characters[1].alpha = 0;
strumLines.members[0].characters[1].x -= 100;
strumLines.members[0].characters[1].y -= 200;
strumLines.members[0].characters[1].scale.set(1.7,1.7);
	camshit = true;
	dad.scale.set(1.6,1.6);
	boyfriend.alpha = 0;
	closet.alpha = 1;
	PlayState.instance.scrollSpeed = 2.3;
    dad.color = 0xFF000000;


	remove(iconP2);
	iconP2 = new HealthIcon('raluca0');
	iconP2.cameras = [camHUD];
    iconP2.y = healthBar.y - 60;
	insert(members.indexOf(healthBar) + 2, iconP2);

}
function postUpdate(){
	if(camshit == true){
		camFollow.setPosition(700,300);
		
	}
}
function stepHit(){
	switch(PlayState.instance.curStep){
	case 434: 
		icn();
	case 391:
	 BG.visible = false;
	 bgSky.visible = false;
	 FlxTween.tween(FlxG.camera, {alpha: 0}, 3);
	
	case 960:
	 BG.visible = false;
	 bgSky.visible = false;
	 FlxTween.tween(FlxG.camera, {alpha: 0}, 1);
    
	 case 2815:
		FlxG.camera.alpha = 0;
	case 2832:
		FlxG.camera.alpha = 1;
	    closet.colorTransform.color = 0xFFffffff;
		dad.color = 0xFFFFFFFF;
    case 2864:
		FlxTween.tween(strumLines.members[0].characters[1], {y: strumLines.members[0].characters[1].y + 1300}, 1.4, {ease: FlxEase.backIn});
	}
	switch(PlayState.instance.curStep){
        case 434| 991 | 2267:
		camshit = true;
		dad.color = 0xFFFFFFFF;
		closet.color = 0xFFFFFFFF;
		defaultCamZoom = 0.9;
		FlxG.camera.zoom = 0.9;
		strumLines.members[0].characters[1].alpha = 1;
		strumLines.members[0].characters[0].alpha = 0;

		dad.scale.set(1.6,1.6);
		boyfriend.alpha = 0;
		closet.alpha = 1;
	FlxG.camera.alpha = 1;
	bgSky.visible = true;
	BG.visible = true;		
	
	PlayState.instance.scrollSpeed = 3;
        case 448 | 1504:
			strumLines.members[0].characters[1].alpha = 0;
			strumLines.members[0].characters[0].alpha = 1;

		camshit = false;
		PlayState.instance.scrollSpeed = 3.5;
		FlxG.camera.zoom = 1.08;
		defaultCamZoom = 1.08;
		closet.alpha = 0;
		dad.scale.set(1,1);
		boyfriend.alpha = 1;
	}
}

function icn(){
    health = 0.5;
	remove(iconP2);
	iconP2 = new HealthIcon('raluca2');
	iconP2.cameras = [camHUD];
    iconP2.y = healthBar.y - 60;
	insert(members.indexOf(healthBar) + 2, iconP2);
}
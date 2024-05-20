import flixel.addons.display.FlxBackdrop;
import funkin.game.PlayState;
import flixel.group.FlxSpriteGroup;
var lightGroup:FlxSpriteGroup;
var bgSky:FlxBackdrop;
var clouds:FlxBackdrop;
var iconP22:HealthIcon;
var iconP11:HealthIcon;

function postCreate(){


	
	lightGroup = new FlxSpriteGroup();

	iconP11 = new HealthIcon("cellbit", false);
	iconP11.cameras = [camHUD];
	insert(members.indexOf(iconP1) + 1, iconP11);
	
	remove(iconP1);
	iconP1 = new HealthIcon("felps", false);
	iconP1.cameras = [camHUD];
	insert(members.indexOf(healthBar) + 1, iconP1);
	iconP1.y = healthBar.y - 60;
	
	remove(iconP2, true);
	iconP2 = new HealthIcon("raloca", false);
	iconP2.cameras = [camHUD];
	insert(members.indexOf(healthBar) + 2, iconP2);
    iconP2.y = healthBar.y - 70;

    iconP22 = new HealthIcon("jeanL", false);
	iconP22.cameras = [camHUD];
	insert(members.indexOf(healthBar) + 2, iconP22);
    iconP22.y = healthBar.y - 70;


	bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Sky"));
	insert(members.indexOf(BG) - 2, bgSky);
	bgSky.spacing.y = -20; 

	clouds = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Clouds"));
	insert(members.indexOf(bgSky) + 2, clouds);
	clouds.spacing.y = -20; 

	mask = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Mask"));
	insert(members.indexOf(clouds) + 1, mask);
	mask.spacing.y = -20; 

    
	bgSky.velocity.set((-Conductor.crochet * 1.8), 0);
	mask.velocity.set((-Conductor.crochet * 1.1), 0);
	clouds.velocity.set((-Conductor.crochet * 1.1), 0);
	strumLines.members[0].characters[0].y = -180;
	strumLines.members[0].characters[0].x = 730;
	strumLines.members[0].characters[0].scale.set(1.2,1.2);
	strumLines.members[1].characters[0].scale.set(1.1,1.1);
	strumLines.members[1].characters[0].y = -170;
	for(i in [mask, lights, windowLight]){
		lightGroup.add(i);
	}

	// lights.alpha = 0;
	// windowLight.alpha = 0;
	// strumLines.members[2].cpu = true;
	FG2.scale.set(1.5,1);
	FG2.x -= 115;
	BG.color = 0xFF999999;
	defaultCamZoom = 1.2;
    camGame.zoom = 1.2;
    
}
function postUpdate(){
    // camGame.zoom = 0.8;
	camFollow.setPosition(870,500);
    iconP11.y = iconP1.y;
	iconP11.x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) + 80;
	iconP11.scale.x = iconP1.scale.x- 0.3;
	iconP11.scale.y = iconP1.scale.y- 0.3;

	iconP22.y = iconP11.y ;
	iconP22.x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) - 230;
	iconP22.scale.x = iconP2.scale.x - 0.4;
	iconP22.scale.y = iconP2.scale.y -0.4;

	if(iconP2.animation.curAnim.curFrame == 2) iconP22.animation.curAnim.curFrame = 2;
	if(iconP2.animation.curAnim.curFrame == 1) iconP22.animation.curAnim.curFrame = 1;
}
var lightsOn:Bool = true;
function stepHit(curStep){
	// trace(Conductor.crochet / 100);
	if(curStep % 128 == 0){
    switch(lightsOn){
		case true:
			trace("shit");
			lightsOn = false;
			FlxTween.tween(lightGroup, {alpha: 0}, (Conductor.crochet / 100), {ease: FlxEase.cubeOut});
			FlxTween.color(BG, (Conductor.crochet / 100), 0xFF999999, 0xFFFFFFFF);
		case false:
			
		    trace("shit");
			lightsOn = true;
			FlxTween.tween(lightGroup, {alpha: 1}, (Conductor.crochet / 100), {ease: FlxEase.cubeOut});
			FlxTween.color(BG, (Conductor.crochet / 100), 0xFFFFFFFF, 0xFF999999);

	}
	}
	switch(curStep){
		case 160:
			defaultCamZoom = 0.8;
		case 288:
			trace("a");
			defaultCamZoom = 0.9;
        case 3162:
			FlxTween.tween(strumLines.members[0].characters[0], {alpha: 0, "scale.x": 4, "scale.y": 0.1, angle: 180}, 0.1);
			FlxTween.tween(strumLines.members[1].characters[0], {alpha: 0, "scale.x": 4, "scale.y": 0.1, angle: 180}, 0.1);
            iconP2.alpha = 0;
			iconP22.alpha = 0;
		}
}
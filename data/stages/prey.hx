import flixel.addons.display.FlxBackdrop;

var sky:FlxBackdrop;
var platform:FlxBackdrop;
var jeanp:FlxSprite;
var skate:FlxSprite;
var jean;
var raluca;
function create(){

	// remove(iconP2);
	// iconP2 = new HealthIcon("ralucaprey", false);
	// iconP2.cameras = [camHUD];
	// iconP2.alpha = 0;
	// iconP2.y = healthBar.y - iconP2.height / 2;

	// remove(iconP1);
	// iconP1 = new HealthIcon("diggoprey", false);
	// iconP1.cameras = [camHUD];
	// iconP1.alpha = 0;
	// iconP1.y = healthBar.y - iconP1.height / 2;

    jean = strumLines.members[0].characters[1];
    raluca = strumLines.members[0].characters[0];
	sky = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustBg3"));
	// add(sky);
	sky.y = -470;
	sky.velocity.x = -2000 * inst.pitch;
	sky.scale.set(1,1);
	sky.repeatAxes = FlxAxes.X;

	
    platform = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustFloor"));
	add(platform);
	platform.velocity.x = -2000 * inst.pitch;
	platform.scale.set(0.5,0.5);
    platform.y = sky.y - 700;
	platform.repeatAxes = FlxAxes.X;


	insert(members.indexOf(strumLines.members[0].characters[0]) - 1, sky);
    jean.y = -200;
    jean.scale.set(0.6,0.6);
    
	strumLines.members[1].characters[0].scale.set(0.6,0.6);
    strumLines.members[1].characters[0].y = -105;
    
	jeanp = new FlxSprite().loadGraphic(Paths.image("stages/prey/eggmobile"));
	jeanp.scale.set(0.5,0.5);
	insert(members.indexOf(strumLines.members[0].characters[1]) + 1, jeanp);
	jeanp.scale.set(1.5,1.5);

    jeanp.y = strumLines.members[0].characters[1].y + 550;
    jeanp.x = strumLines.members[0].characters[1].x + 280;

    skate = new FlxSprite().loadGraphic(Paths.image("stages/prey/skate"));
	skate.scale.set(0.5,0.5);
	insert(members.indexOf(strumLines.members[1].characters[0]) - 1, skate);
	skate.scale.set(0.08,0.08);

    skate.y = strumLines.members[1].characters[0].y - 950;
    skate.x = strumLines.members[1].characters[0].x - 2150;


    flames = new FlxSprite();
    flames.frames = Paths.getSparrowAtlas("stages/prey/flame");
	insert(members.indexOf(strumLines.members[0].characters[0]) - 1, flames);
	flames.scale.set(1,1);
    flames.animation.addByPrefix("idle","flame idle",24,true);
	flames.animation.play("idle");
	flames.angle = -90;

	FlxG.camera.zoom = 0.76;
	defaultCamZoom = 0.76;

    jean.x = -1500;
    jean.y = -550;
	raluca.x = - 1500;
	raluca.y = -340;
    raluca.scale.set(0.63,0.63);
    flames.y = strumLines.members[0].characters[0].y + 300;
    flames.x = strumLines.members[0].characters[0].x + 120;
    boyfriend.cameraOffset = FlxPoint.weak(-100,-10);

    camHUD.alpha = 0;

}
function onSongStart(){
	
	// doIconBop = false;
}
function postCreate(){
	// doIconBop = false;
    trace(doIconBop);
	remove(iconP1);
	iconP1 = new HealthIcon("diggo", false);
	iconP1.cameras = [camHUD];
	// iconP1.alpha = 0;
	iconP1.y = healthBar.y - iconP1.height / 2;
	add(iconP1);

	// iconP1.setIcon("diggoprey");
	iconP2.setIcon("raloca");
	camGame.bgColor = 0xFF000000;
}
var focusondiggo:Bool = true;
var rodajean:Bool = false;
function postUpdate(elapsed){
	
	iconP1.scale.x = FlxMath.lerp(iconP1.scale.x, 0.8, 0.04);
	iconP1.scale.y = FlxMath.lerp(iconP1.scale.y, 0.8, 0.04);

    // trace(doIconBop);
    flames.y = strumLines.members[0].characters[0].y + 300;
    flames.x = strumLines.members[0].characters[0].x + 220;
    jeanp.y = strumLines.members[0].characters[1].y + 595;
    jeanp.x = strumLines.members[0].characters[1].x + 360;

    skate.y = strumLines.members[1].characters[0].y - 1000;
    skate.x = strumLines.members[1].characters[0].x - 2150;

	sky.velocity.x = -1000 * inst.pitch;
	platform.velocity.x = -3000 * inst.pitch;
    if(focusondiggo == true){
	camFollow.setPosition(500,300);
    
	}
	// if(rodajean == true) jean.angle += 100 * elapsed;
}
function beatHit(){
	iconP1.scale.set(1.1,1.1);
}

function stepHit(){
	switch(curStep){
		case 240:

			FlxTween.tween(camHUD, {alpha: 1}, 1 / inst.pitch);
		    dad.cameraOffset = FlxPoint.weak(1299,300);

		    focusondiggo = false;
		    FlxTween.tween(raluca, {x: -200}, 1 / inst.pitch, {ease:FlxEase.cubeOut});
		case 1536:
		focusondiggo = true;
		    FlxTween.tween(raluca, {x: -1700}, 0.6 / inst.pitch);
			FlxTween.tween(iconP2, {alpha:0}, 1 / inst.pitch);
		case 1750, 3200:
            dad.cameraOffset = FlxPoint.weak(1200,300);

		    // focusondiggo = t;
            remove(iconP2);
			// iconP2 = new HealthIcon("jeanprey", false);
			iconP2 = new HealthIcon("jeanl", false);
			iconP2.cameras = [camHUD];
			iconP2.alpha = 0;
			iconP2.y = healthBar.y - iconP2.height / 2;
			add(iconP2);
			FlxTween.tween(iconP2, {alpha:1}, 1 / inst.pitch);

		    FlxTween.tween(jean, {x: 600}, 3 / inst.pitch, {ease:FlxEase.cubeOut});
		case 1787: focusondiggo = false;

		case 3367:
		    // rodajean = true;
			
			FlxTween.tween(iconP2, {alpha:0}, 1 / inst.pitch);
		    FlxTween.tween(jean, {x: -1700, y: -700}, 0.3 / inst.pitch);
            
	}
}
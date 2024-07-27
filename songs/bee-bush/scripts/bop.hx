var box0:FlxSprite;
var box1:FlxSprite;
var guh = false;
function postCreate(){
    // player.cpu = true;
    // cpu.cpu = true;

    box0 = new FlxSprite(0,0).makeGraphic(7000,200, 0xFF000000);
    add(box0);
    box0.screenCenter();
    box0.y = -250;

    box1 = new FlxSprite(0,0).makeGraphic(7000,150, 0xFF000000);
    add(box1);
    box1.screenCenter();
    box1.y = 700;

}

function postUpdate(){
    iconP2.angle = FlxMath.lerp(iconP2.angle, 1, 0.044);
    iconP1.angle = FlxMath.lerp(iconP1.angle, 1, 0.044);
    
    iconP2.y = FlxMath.lerp(iconP2.y, healthBarBG.y - 75, 0.044);
    
    camHUD.angle = FlxMath.lerp(camHUD.angle, 0, 0.044);
    camGame.angle = FlxMath.lerp(camGame.angle, 0, 0.044);

    for(i in [camHUD, camGame]){
        i.x = FlxMath.lerp(i.x, 0, 0.044);
        i.y = FlxMath.lerp(i.y, 0, 0.044);
    }
    if(FlxG.keys.justPressed.T && !startingSong){
        customGameOver();
    }
}
function customGameOver(){
        persistentUpdate = false;
		persistentDraw = false;
		paused = true;

		vocals.stop();
		if (FlxG.sound.music != null){
			FlxG.sound.music.stop();
        }
		for (strumLine in strumLines.members){ strumLine.vocals.stop();
        }
        trace("CU");
        openSubState(new ModSubState("RalucaDeathSubState", true));
}
function onGameOver(e){
    e.cancel();
    customGameOver();
}
function beatHit(curBeat: Int) {
if(startingSong == false && curBeat >= 4){
    guh = !guh;
    
    var angle = guh ? -17 : 17;
    var angle2 = guh ? -1 : 1;
    var x0 = guh ? -10 : 10;

    iconP1.angle = angle;
    
    iconP2.flipX = guh;
    
    iconP2.angle = -angle;

    camHUD.angle = angle2;
    camGame.angle = angle2;
    iconP2.y = healthBar.y - 75 + 10;
    
    for(i in [ camHUD,camGame]){
        i.x = x0;
        i.y = 10;
    }
}
}

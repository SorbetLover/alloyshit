import flixel.addons.display.FlxBackdrop;
import funkin.game.HealthIcon;
import flixel.tweens.misc.NumTween;
import flixel.tweens.misc.ColorTween;
import flixel.util.FlxColor;
var bgSky:FlxBackdrop;
import flixel.FlxCamera;
var shitcam:FlxCamera;
function create(){
	bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/hotcall/Sky"));
	insert(members.indexOf(bg1) - 0, bgSky);
	bgSky.spacing.y = -20; 
    
	introLength = 4;
    
		strumLines.members[2].cpu = true;
	defaultCamZoom = 0.3;
}
function postCreate(){
	shit1.scale.set(10, 40);
	shit2.scale.set(90, 10);
	shit3.scale.set(90, 10);
	shit4.scale.set(10, 40);

	bg1.color = 0xFF999999;
	frame1.color = 0xFF999999;
	bg2.color = 0xFF999999;
	frame2.color = 0xFF999999;
	bg3.color = 0xFF000000;
	frame3.color = 0xFF999999;
	bg4.color = 0xFF999999;
	frame4.color = 0xFF999999;
strumLines.members[1].characters[0].flipX = false;
strumLines.members[1].characters[0].y = 139;
strumLines.members[3].characters[0].y = -490;
strumLines.members[3].characters[0].x = 1445;
strumLines.members[3].characters[0].scale.set(2.40,2.40);
strumLines.members[2].characters[0].x = -100;
strumLines.members[2].characters[0].y = -650;
strumLines.members[2].characters[0].scale.set(1.3,1.3);
strumLines.members[0].characters[0].x = 1450;
strumLines.members[0].characters[0].y = 140;
healthBar.alpha = 0;
healthBarBG.alpha = 0;
iconP1.alpha = 0;
iconP2.alpha = 0;
}

function postUpdate(elapsed){
	camFollow.setPosition(970, 200);	
	

}

import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.game.HealthIcon;
import funkin.backend.Conductor;
import flixel.math.FlxPoint;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import funkin.game.Character;
import funkin.menus.FreeplayState;
import flixel.util.FlxColor;
import openfl.geom.ColorTransform;
import funkin.game.PlayState;
var weekBD:FlxBackdrop;
var weekBG:FlxSprite;
var weekSPR:FlxSprite;
var imgs = Paths.image; 
var weekSPRGroup:FlxSpriteGroup;
var weekChar:Character;
var weekCharGroup:FlxSpriteGroup;
var scrollTween:FlxTween;
var shitIconGroup:FlxSpriteGroup;
var shitCrochet = Conductor.crochet / 2500;
var shitIcon:HealthIcon;
function create(){
	weekCharGroup = new FlxSpriteGroup();
	shitIconGroup = new FlxSpriteGroup();

	weekSPRGroup = new FlxSpriteGroup();
	
	weekBD = new FlxBackdrop().loadGraphic(imgs("editors/bgs/charter"));
add(weekBD);
weekBD.color = 0xFF990000;


for(i in ["gf", "dad", "spooky", "pico", "mom","parents-christmas", "senpai", "tankman" ]){
	weekChar = new Character(0,0, i, false, false);
	add(weekChar);
	weekCharGroup.add(weekChar);
     
	}

weekBG = new FlxSprite().makeGraphic(800,1400, 0xFFFFFFFF);
add(weekBG);
weekBG.screenCenter(FlxAxes.Y);
weekBG.color = 0xFF990000;
weekBG.x = -500;
weekBG.alpha = 1;
weekBG.angle = 25;



// weekCharGroup.x = 0;
// weekCharGroup.y = 0;

// gfIcon = new HealthIcon("gf", false);
// add(gfIcon);
// gfIcon.scale.set(2,2);
// gfIcon.x = 100;
// gfIcon.y = 500;
for(i in ["gf", "dad", "spooky", "pico", "mom","parents-christmas", "senpai", "tankman" ]){
	shitIcon = new HealthIcon(i, false);
	add(shitIcon);
	shitIcon.scale.set(2,2);
	// shitIcon.colorTransform.color = 0xFF770000;
	// shitIcon.color = 0xFF990000;
 shitIcon.x = 100;
 shitIcon.scale.set(2,2);
	shitIconGroup.add(shitIcon);
shitIcon.y = 500;
}
for(i in ["tutorial","week1","week2","week3","week4","week5","week6","week7", "NOWEEK"]){
	weekSPR = new FlxSprite().loadGraphic(imgs("menus/storymenu/weeks/" + i));
	// weekSPR.group = weekSPRGroup;
	weekSPRGroup.add(weekSPR);
	weekSPR.screenCenter();
	weekSPR.x = 30;
	add(weekSPR);
	

}
var shame:Float = 0;
var shirt:Float = 0;
var shit:Float = 0;
weekSPRGroup.forEach(function(spr:FlxSprite):Void{
	spr.y = spr.y + shit;
	shit += 500;
});
weekCharGroup.forEach(function(spr:FlxSprite):Void{
	spr.x = spr.x + shirt;
	// spr.y = spr.y - (spr.height / 2);
	shirt += 1000;
	// spr.scale.set(0.8,0.8);
});
shitIconGroup.forEach(function(spr:FlxSprite):Void{
	spr.x = 0 + shame;
	// spr.y = spr.y - (spr.height / 2);
	shame += 1500;
	// spr.scale.set(0.8,0.8);
});

weekCharGroup.x = 600;
weekCharGroup.members[0].y = 230;
weekCharGroup.members[6].scale.set(7,7);
weekCharGroup.members[0].scale.set(1.3,1.3);
weekCharGroup.members[1].scale.set(1.3,1.3);
weekCharGroup.members[1].y = 100;
// for(i in 1...8){
// 	shitIconGroup.members[i].alpha = 0;
// }



shitIconGroup.x = 100;
shitIconGroup.members[0].colorTransform.color = 0xFF880000;
shitIconGroup.members[1].colorTransform.color = 0xFF660066;
shitIconGroup.members[2].colorTransform.color = 0xFF111111;
shitIconGroup.members[3].colorTransform.color = 0xFF006611;
shitIconGroup.members[4].colorTransform.color = 0xFFa20072;
shitIconGroup.members[5].colorTransform.color = 0xFFa700d5;
shitIconGroup.members[6].colorTransform.color = 0xFFcc843d;
shitIconGroup.members[7].colorTransform.color = 0xFF111111;
}

var weekSPROffset:Float = 0;

var curSelected:Int = 0;
var curWeek:String = "tutorial";
function update(elapsed:Float){

	// weekSPRGroup.y = 0;
    // weekCharGroup.x += -FlxG.mouse.wheel;
    
	if(FlxG.keys.justPressed.ESCAPE){
		FlxG.switchState(new MainMenuState());
	}   
    if(weekCharGroup.x > -7800){
	if(FlxG.keys.justPressed.W){
		if(canTween)setY();

	}   
    }
	if(curSelected == 0){
		curWeek = "tutorial";
	}
	else
	{
		curWeek = "week" + curSelected;
	}
	
	if(FlxG.keys.justPressed.S && curSelected != 0){
		
		if(canTween)remY();
	}
	if(FlxG.keys.justPressed.ENTER){
		PlayState.loadWeek(curWeek,
			 "hard");
		FlxG.switchState(new PlayState());


	}
weekBD.x += Conductor.crochet / 1000;

weekBD.y += Conductor.crochet / 1000;
}
var canTween:Bool = true;
function setY(){
	curSelected += 1;
    trace(curSelected);
	canTween = false;
	scrollTween = FlxTween.tween(weekSPRGroup, {y: weekSPRGroup.y - 500}, shitCrochet, {ease:FlxEase.cubeInOut, onComplete: function(twn:FlxTween){
		canTween = true;
	
	}});
	setColor();

}
function remY(){
	curSelected -= 1;
    trace(curSelected);

	canTween = false;
	scrollTween = FlxTween.tween(weekSPRGroup, {y: weekSPRGroup.y + 500}, shitCrochet,{ease:FlxEase.cubeInOut, onComplete: function(twn:FlxTween){
		canTween = true;
	
	}});
	setColor();

}

function tweenChar(arg1){
	FlxTween.tween(weekCharGroup, {x: arg1}, shitCrochet, {ease:FlxEase.cubeInOut});
}
function tweenIC(arg1){
	FlxTween.tween(shitIconGroup, {x: arg1}, shitCrochet, {ease:FlxEase.cubeInOut});
}
function setColor(){
	switch(curSelected){
		case 0:
			// weekBG.color = 0xFF990000;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF990000);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF992222);
            tweenChar(600);
		    tweenCA(0);
			tweenIC(100);
		case 1:
			// weekBG.color = 0xFF770077;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF770077);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF770077);
			tweenChar(-300);
			tweenCA(1);
			tweenIC(-1400);
			
		case 2:
			// weekBG.color = 0xFF222222;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF222222);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF777777);
			tweenChar(-1300);
			tweenCA(2);
			
			tweenIC(-2900);
		case 3:
			// weekBG.color = 0xFF007722;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF007722);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF007722);
			tweenChar(-2400);
			tweenCA(3);
			
			tweenIC(-4400);
		case 4:
			// weekBG.color = 0xFFb30086;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFFb30086);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFFb30086);
			tweenChar(-3200);
			tweenCA(4);
			
			tweenIC(-5900);
		case 5:
			// weekBG.color = 0xFFb800e6;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFFb800e6);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFFb800e6);
			tweenChar(-4100);
			tweenCA(5);
			
			tweenIC(-7400);
	    case 6:
			// weekBG.color = 0xFFffa64d;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFFffa64d);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFFffa64d);
			tweenChar(-5200);
			tweenCA(6);
			
			tweenIC(-8900);
		case 7:
			// weekBG.color = 0xFF000000;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF000000);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF444444);
			tweenChar(-6400);
			tweenCA(7);
			
			tweenIC(-10400);
		default:
			// weekBG.color = 0xFF222222;
			FlxTween.color(weekBG, shitCrochet, weekBG.color, 0xFF222222);
			FlxTween.color(weekBD, shitCrochet, weekBG.color, 0xFF444444);
			tweenChar(-7800);
			
			tweenIC(-11900);
	}
	
}
function tweenCA(arg1){
	switch(arg1){
		case 0:
			FlxTween.tween(weekCharGroup.members[0],{alpha:1}, shitCrochet);

        		FlxTween.tween(weekCharGroup.members[1],{alpha:0}, shitCrochet);
		case 1:
    		FlxTween.tween(weekCharGroup.members[0],{alpha:0}, shitCrochet);

	    		FlxTween.tween(weekCharGroup.members[1],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[2],{alpha:0}, shitCrochet);
		case 2:
    		FlxTween.tween(weekCharGroup.members[1],{alpha:0}, shitCrochet);

    			FlxTween.tween(weekCharGroup.members[2],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[3],{alpha:0}, shitCrochet);
		case 3:
    		FlxTween.tween(weekCharGroup.members[2],{alpha:0}, shitCrochet);

		    	FlxTween.tween(weekCharGroup.members[3],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[4],{alpha:0}, shitCrochet);
		case 4:
    		FlxTween.tween(weekCharGroup.members[3],{alpha:0}, shitCrochet);

			    FlxTween.tween(weekCharGroup.members[4],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[5],{alpha:0}, shitCrochet);
		case 5:
    		FlxTween.tween(weekCharGroup.members[4],{alpha:0}, shitCrochet);

		    	FlxTween.tween(weekCharGroup.members[5],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[6],{alpha:0}, shitCrochet);
		case 6:
    		FlxTween.tween(weekCharGroup.members[5],{alpha:0}, shitCrochet);

    			FlxTween.tween(weekCharGroup.members[6],{alpha:1}, shitCrochet);

			FlxTween.tween(weekCharGroup.members[7],{alpha:0}, shitCrochet);
		case 7:
    		FlxTween.tween(weekCharGroup.members[6],{alpha:0}, shitCrochet);

	    		FlxTween.tween(weekCharGroup.members[7],{alpha:1}, shitCrochet);

			// FlxTween.tween(weekCharGroup.members[8],{alpha:0}, shitCrochet);

	}
}
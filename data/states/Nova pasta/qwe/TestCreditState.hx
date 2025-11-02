import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.text.FlxTextAlign;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.game.HealthIcon;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import funkin.menus.MainMenuState;
import flixel.util.FlxColor;
import funkin.backend.utils.FlxInterpolateColor;
var pth = Paths.image;

var walls:FlxSprite;
var floor:FlxSprite;
var desk:FlxSprite;
var tvBG:FlxSprite;
var tv:FlxSprite;


var eggGroup:FlxSpriteGroup;
var iconGroup:FlxSpriteGroup;

var curCredit:Int = 0;
var crewName:FlxText;
var crewFunc:FlxText;
var crewWork:FlxText;
var workedtext:FlxText;

// var interpColor:FlxInterpolateColor;

function create(){
	
	eggGroup = new FlxSpriteGroup();
    iconGroup = new FlxSpriteGroup();

	walls = new FlxSprite().loadGraphic(pth("creditshit/bg/Credits_walls"));
	add(walls);

	floor = new FlxSprite().loadGraphic(pth("creditshit/bg/credits_floor"));
	add(floor);

	desk = new FlxSprite().loadGraphic(pth("creditshit/bg/credits_desk"));
	add(desk); 

    tvBG = new FlxSprite().loadGraphic(pth("creditShit/bg/credits_BG"));
	add(tvBG);

    tv = new FlxSprite().loadGraphic(pth("creditShit/bg/credits_Tv"));
	add(tv);

	for(i in ["eggarms", "eggbody", "egghead"]){
		spr = new FlxSprite().loadGraphic(pth("creditshit/egg/" + i));
		add(spr);
	    spr.screenCenter();
		spr.scale.set(0.6,0.6);
		spr.antialiasing = true;
		spr.y = -250;
		eggGroup.add(spr);
	}
    for(i in [walls, floor,desk, tvBG, tv ]){
		i.scale.set(0.5, 0.5);
    	i.screenCenter();
		i.antialiasing = true;
     
	}

	icon = new HealthIcon('dad', false);
	add(icon);
	// icon.x = 360;
	// icon.y = 40;
    // icon.angle = -10;
	// icon.scale.set(1.1,1.1);

	tvBG.color = 0xFF990099;
    changeCredit();

	workedtext = new FlxText(100,100, 300, "Worked on:", 32);
	add(workedtext);
    workedtext.x = 670;
	workedtext.angle = 3;
	workedtext.y = 50;
	workedtext.setFormat(Paths.font("sncf2.ttf"), 30, 0xFFFFFFFF, FlxTextAlign.LEFT);

	crewWork = new FlxText(100,100, 300, "directed the mod", 32);
	add(crewWork);
    crewWork.x = 670;
	crewWork.angle = 3;
	crewWork.y = 90;
	crewWork.setFormat(Paths.font("sncf2.ttf"), 30, 0xFFFFFFFF, FlxTextAlign.LEFT);
	
	crewName = new FlxText(100,100, 1000, "Yaster", 32);
	add(crewName);
    crewName.x = 380;
	crewName.angle = -3;
	crewName.y = 160;
	crewName.setFormat(Paths.font("sncf2.ttf"), 60, 0xFFFFFFFF, FlxTextAlign.LEFT);

	crewFunc = new FlxText(100,100, 200, "Director", 32);
	add(crewFunc);
    crewFunc.x = 400;
	crewFunc.angle = -3;
	crewFunc.y = 250;
	crewFunc.setFormat(Paths.font("sncf2.ttf"), 30, 0xFFFFFFFF, FlxTextAlign.LEFT);

    workedtext.antialiasing = true;
    crewWork.antialiasing = true;
    crewName.antialiasing = true;
	crewFunc.antialiasing = true;

	// interpColor = new FlxInterpolateColor(tvBG.color);
    colorTween = new FlxTween();
}

var charColor = 0xFF990099;
function update(){
		// interpColor.fpsLerpTo(charColor, 0.06);
		// tvBG.color = interpColor.color;\
	
	if (FlxG.keys.justPressed.F6){
		FlxG.resetState();
	}
	if (FlxG.keys.justPressed.ESCAPE){
		FlxG.switchState(new MainMenuState());
	}
    
	// if(curCredit > -1 && curCredit != -1){
	if(curCredit != 0 && FlxG.keys.justPressed.S){ curCredit -= 1; changeCredit(); }
	if(curCredit != 7 && FlxG.keys.justPressed.W){ curCredit += 1; changeCredit(); }
	// }

	if(FlxG.keys.justPressed.ENTER){
		openCrewURL();
	}
	
	
}
function openCrewURL(){
	switch(curCredit){
		case 0: CoolUtil.openURL("twitter.com/YasterWolly");
		case 1: CoolUtil.openURL("twitter.com/Apollo_X3");
		case 2: CoolUtil.openURL("twitter.com/UmMeliante69lol");
		case 3: CoolUtil.openURL("twitter.com/alloysenz");
		case 4: CoolUtil.openURL("twitter.com/TheBigBoss050");
		case 5: CoolUtil.openURL("twitter.com/furry_preguicos");
		case 6: CoolUtil.openURL("twitter.com/Tomis_Turbando");
		case 7: CoolUtil.openURL("twitter.com/JBendett");
	}
}
var functext:String = "Director";
var pname:String = "Yaster";
var cname:String = "dad";
var worktx:String = "directed";
var colorTween:FlxTween;
function changeCredit(){
    switch(curCredit){
		case 0:
		    functext = "Director";
            pname = "Yaster";
		    cname = "dad";
			charColor = 0xFF990099;
            worktx = "directed and drew this state";
		case 1:
		    functext = "Director";
            pname = "Apollox";
		    cname = "gf";			
			charColor = 0xFF992222;
            worktx = "directed x2";
			
		case 2:
		    functext = "Director";
            pname = "ARandomMeliante";
		    cname = "bf";			
			charColor = 0xFF555599;
            worktx = "directed x3";

		case 3:
		    functext = "Back End Programmer";
            pname = "Alloy";
		    cname = "spooky";			
			charColor = 0xFF222222;
            worktx = "coded that credit state";
		case 4:
		    functext = "Front End Programmer";
            pname = "TheBigBoss";
		    cname = "pico";
			charColor = 0xFF227722;
            worktx = "Song coding";
		case 5:
		    functext = "Artist";
            pname = "Sun";
		    cname = "mom";			
			charColor = 0xFF552222;
            worktx = "Drew";
		case 6:
		    functext = "Composer";
            pname = "Tomis";
		    cname = "senpai";
			charColor = 0xFF99555;
            worktx = "drew";
		case 7:
		    functext = "Voice Actor";
            pname = "JBendett";
		    cname = "tankman";			
			charColor = 0xFF111111;
            worktx = "drew";			
        default:
            functext = "streamer muito foda";
			pname = "Felps";
		    cname = "felps";
			charColor = 0xFF333333;
            worktx = "fez muitas lives foda";
 
	}
	FlxG.sound.play(Paths.sound("menu/scroll"));

	// trace("Uh");
	remove(icon);
	icon = new HealthIcon(cname, false);
	add(icon);
	icon.x = 360;
	icon.y = 40;

	// tvBG.color = charColor;
	trace(curCredit);
	crewName.text = pname;
	crewFunc.text = functext;
	crewWork.text = worktx;
	colorTween.cancel();
    colorTween = FlxTween.color(tvBG, Conductor.crochet / 2000, tvBG.color, charColor);
	
    // icon.angle = -10;
	icon.scale.set(1.1,1.1);
}
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxGridOverlay;
import funkin.game.HealthIcon;
import funkin.backend.Conductor;
import flixel.math.FlxPoint;
import funkin.menus.PauseSubState;
import flixel.FlxCamera;
import funkin.game.PlayState;
var shitSprite:FlxSprite;
var nameSprite:FlxSprite;
var nameText:FlxText;
var thename:String;
function create(){

	                  thename = "Andrei";

	winTitle = "Your ass";
    shitSprite = new FlxSprite().makeGraphic(900, 70, 0xFF333333);
	add(shitSprite);
	shitSprite.x = 0;
    shitSprite.y = 500;

    nameSprite = new FlxSprite().makeGraphic(600,50, 0xFF555555);
	add(nameSprite);
    nameSprite.x = shitSprite.x ;
	nameSprite.y = shitSprite.y - 40;

    nameText = new FlxText(0,0,1000, thename, 20, false);
	nameText.setFormat(Paths.font("notosans.ttf"), 30);

	add(nameText);
	shitSprite.x = -900;
	switch(thename){
		case "Pierre" | "Andrei":
			nameText.x = shitSprite.x + 400;
        	FlxTween.tween(shitSprite, {x: -100}, 1, {ease: FlxEase.cubeOut, startDelay: 1});	
		case "Gustave Lime":
			nameText.x = shitSprite.x + 400;
        	FlxTween.tween(shitSprite, {x: -100}, 1, {ease: FlxEase.cubeOut, startDelay: 1});	

	}
	FlxTween.tween(shitSprite, {y: 900}, 1, {ease: FlxEase.cubeIn, startDelay: 3});	

	nameText.alignment = FlxTextAlign.CENTER;

}

function update(){
    nameSprite.x = shitSprite.x ;
	nameSprite.y = shitSprite.y - 40;
	switch(nameText.text){
		case "Pierre" | "Andrei":
			nameText.x = shitSprite.x + 470;

		case "Gustave Lime":
			nameText.x = shitSprite.x + 360;

		}
	nameText.y = shitSprite.y - 40;
    if(FlxG.keys.justPressed.ESCAPE){
		FlxG.switchState(new MainMenuState());
	}   
}

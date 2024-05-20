import funkin.ui.FunkinText;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxAxes;

var pixelScript:Script;
var pauseCam = new FlxCamera();

var bg:FlxSprite;
var bg2:FlxSprite;
var bg3:FlxSprite;
var hand:FlxSprite;
var texts:Array<FlxText> = [];
var resetScore:Bool = false;
var isThorns = PlayState.SONG.meta.name.toLowerCase() == "thorns";

function create(event) {
	// cancel default pause menu!!
	event.cancel();

	event.music = isThorns ? "pixel/LunchboxScary" : "pixel/mvalunchbox";

	cameras = [];

	pixelScript = game.scripts.getByName("pixel.hx");
	pixelScript.call("pixelCam", [pauseCam]);

	FlxG.cameras.add(pauseCam, false);

	pauseCam.bgColor = isThorns ? 0x88000000 : 0xB33A3437;
	pauseCam.alpha = 0;
	


	bg = new FlxSprite(44 * 6, 14 * 6);
	bg.loadGraphic(Paths.image('stages/school/pause/whitesquare'));
	bg.scale.set(100, 100);
	bg.updateHitbox();
    bg.x = 920; 
	bg.y = 300;
	bg.cameras = [pauseCam];

	bg3 = new FlxSprite(44 * 6, 14 * 6);
	bg3.loadGraphic(Paths.image('stages/bar/Piano_bg'));
	bg3.scale.set(1.5, 1.5);
	bg3.updateHitbox();
	bg3.x = 400;
	bg3.y = 250;
	bg3.scale.x = 0.001;
	bg3.cameras = [pauseCam];
    bg3.color = 0xFFB3B3B3;

	bg2 = new FlxSprite(44 * 6, 14 * 6);
	bg2.loadGraphic(Paths.image('stages/school/pause/whitesquare'));
	bg2.scale.set(400, 10);
	bg2.updateHitbox();
	bg2.cameras = [pauseCam];
    bg2.y = 710;
	bg2.x = -100;
	bg2.color = 0x43000000;
	add(bg2);
	add(bg);
    add(bg3);
    bg.color = 0xFF000000;
	songText = new FlxText(0, 22 * 6, 0, "Pause", 8, false);

	confText(songText);
	add(songText);
	
	var i = 2;
	for(e in menuItems) {
		text = new FlxText(0, (22 * 6) + (i * 9 * 6), 0, e, 8, false);
		confText(text);
		
		add(text);
		texts.push(text);
		i++;
	}

	hand = new FlxSprite().loadGraphic(Paths.image('stages/school/ui/hand_textbox'));
	hand.scale.set(6, 6);
	hand.updateHitbox();
	add(hand);
	hand.color = 0xFFead4aa;

	// FlxTween.tween(bg, {"scale.y": 500, "scale.x": 550}, 0.75, {ease: FlxEase.elasticOut});
	// FlxTween.tween(bg2, {"scale.x": 1000}, 1, {ease: FlxEase.elasticOut});
	// FlxTween.tween(bg2, {"scale.y": 2000}, 0.3, {ease: FlxEase.elasticOut});
	FlxTween.tween(bg3, {"scale.x": 5, "scale.y": 5}, 0.7, {ease: FlxEase.elasticOut});

	cameras = [pauseCam];

	FlxG.sound.play(Paths.sound(isThorns ? 'pixel/ANGRY' : 'pixel/clickText'));
}

function confText(text) {
	text.scale.set(6, 6);
	text.updateHitbox();
	text.screenCenter(FlxAxes.X);
	text.borderStyle = FlxTextBorderStyle.OUTLINE;
	if (!isThorns) text.borderColor = 0xFF241914;
}

function destroy() {
	FlxG.cameras.remove(pauseCam);
}

var canDoShit = true;
var time:Float = 0;
function update(elapsed) {
	if(FlxG.keys.justPressed.F){
		            
		FlxG.switchState(new FreeplayState());
	}
    if(FlxG.keys.justPressed.Q){
     resetScore = true;
	}
	pixelScript.call("postUpdate", [elapsed]);

	pauseCam.alpha = lerp(pauseCam.alpha, 1, 0.25);
	time += elapsed;

	var curText = texts[curSelected];
	hand.setPosition(curText.x - hand.width - 18 + (Math.sin(time * Math.PI * 2) * 12), curText.y + (text.height - hand.height) - 6);
	hand.x -= hand.x % 6;
	hand.y -= hand.y % 6;

	if (!canDoShit) return;
	var oldSec = curSelected;
	if (controls.DOWN_P)
		changeSelection(1, false);
	if (controls.UP_P)
		changeSelection(-1);
	 

	if (oldSec != curSelected) {
		FlxG.sound.play(Paths.sound(isThorns ? 'pixel/type' : 'pixel/pixelText'));
	}


	if (controls.ACCEPT) {
		FlxG.sound.play(Paths.sound(isThorns ? 'pixel/ANGRY' : 'pixel/clickText'));
		var option = menuItems[curSelected];
		if (option == "Resume" || option == "Exit to menu") {
			if(option == "Exit to menu"){
				FlxTween.tween(bg2, {"scale.x": 2300}, 0.75, {ease: FlxEase.elasticOut});
			}
			
			canDoShit = false;
			for(t in texts) t.visible = false;
			hand.visible = songText.visible = false;
			FlxTween.tween(bg, {"scale.y": 0}, 0.125, {ease: FlxEase.cubeOut, onComplete: function() {
				selectOption();
			}});
		} else {
			selectOption();
		}
	}
}

function changeSelection(change) {
	curSelected += change;

	if (curSelected < 0)
		curSelected = menuItems.length - 1;
	if (curSelected >= menuItems.length)
		curSelected = 0;
}
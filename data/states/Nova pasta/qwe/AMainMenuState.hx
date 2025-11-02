import flixel.group.FlxSpriteGroup;
import flixel.text.FlxTextAlign;
import funkin.menus.ModSwitchMenu;
import flixel.addons.display.FlxBackdrop;
var buttons:Array = ["Story", "Freeplay", "Options", "Credits"];
var gro:FlxSpriteGroup;
var curSelected:Int = 0;
var bg:FlxSprite;
var bg2:FlxSprite;
var bd:FlxBackdrop;

function create(){
    bg = new FlxSprite().loadGraphic(Paths.image('menus/menuDesat'));
    bg.color = 0xFF663366;
    add(bg);

    bg2 = new FlxSprite().makeGraphic(350,1000, 0xFF000000);
    bg2.alpha = 0.6;
    bg2.x = 200;
    add(bg2);

    gro = new FlxSpriteGroup();
    var bruh:Int = 1;
    for(i in buttons){
        i = new FlxText(0,0,1000, buttons[bruh - 1], 80);
        add(i);
        i.x = (bruh * 200) - 400;
        i.y = (bruh * 100) + 400;
        i.alignment = FlxTextAlign.CENTER;
        bruh += 1;
        gro.add(i);
    }
    FlxG.mouse.visible = true;
}

function update(elapsed){
    // buttons[curSelected].x = FlxMath.lerp(buttons[curSelected].x)
    // gro.forEach(function(spr:FlxSprite){
    //     if(spr)
    // });
    for(i in gro.members){
        i.x = FlxMath.lerp(i.x, -900, 5 * elapsed);
        i.scale.x = FlxMath.lerp(i.scale.x, 0.4, 5 * elapsed);
        i.scale.y = i.scale.x;
    }
        gro.members[curSelected].scale.x = FlxMath.lerp(gro.members[curSelected].scale.x, 1.2, 5 * elapsed);
        gro.members[curSelected].scale.y = gro.members[curSelected].scale.x;

    gro.y = FlxMath.lerp(gro.y, (curSelected) * -100 - 200, 5 * elapsed);

    gro.members[curSelected].x = FlxMath.lerp(gro.members[curSelected].x, 630, 5 * elapsed);
    if(FlxG.keys.justPressed.W && curSelected > 0) curSelected -= 1;
    if(FlxG.keys.justPressed.S && curSelected < 3) curSelected += 1;
    
    
    if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}
}
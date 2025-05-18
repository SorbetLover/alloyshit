import flixel.text.FlxTextAlign;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxTextAlign;
import flixel.animation.FlxAnimationController;
import Date;

import Std;
import sys.io.File;
import sys.FileSystem;
import funkin.backend.assets.ModsFolder;

var bruh:FlxSpriteGroup;

var tempcounting:Int = 1;

var bg:FlxSprite;
var bg2:FlxSprite;
var boxside1:FlxSprite;
var boxside2:FlxSprite;
var boxside12:FlxSprite;
var boxside22:FlxSprite;

var title:FlxText;
var text:FlxText;

var showing:Bool = true;

var res:Array = [400,900];
var borderSize:Array = [10,10];

var errorsCount:Int = 0;

var warningTXT:FlxText;
var logo:FlxSprite;

var saveSTR:String;
function create(){
trace(res);

saveLog();
bg = new FlxSprite().makeGraphic(res[0],res[1], 0xFF991111);
bg.screenCenter();
add(bg);
bg.alpha = 1;
bg.x -= 250;

boxside1 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF440000);
boxside1.screenCenter();
boxside1.x = bg.x;
add(boxside1);
boxside1.alpha = 1;


boxside2 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF440000);
boxside2.screenCenter();
boxside2.x = bg.x + bg.width;
add(boxside2);
boxside2.alpha = 1;



bg2 = new FlxSprite().makeGraphic(res[0],res[1], 0xFF991111);
bg2.screenCenter();
add(bg2);
bg2.alpha = 1;
bg2.x += 250;

boxside12 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF440000);
boxside12.screenCenter();
boxside12.x = bg2.x;
add(boxside12);
boxside12.alpha = 1;


boxside22 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF440000);
boxside22.screenCenter();
boxside22.x = bg2.x + bg.width;
add(boxside22);
boxside22.alpha = 1;


for(i in [ boxside1, boxside2, bg]){
    i.scrollFactor.set(0,0);

}
    bruh = new FlxSpriteGroup();

    var tempTxt = new FlxText(400,30,1000, "", 40);
    tempTxt.setFormat(Paths.font("Roboto-Regular.ttf"), 50);
    tempTxt.color = 0xFFFFFFFF;
    tempTxt.screenCenter();
    tempTxt.y = 30;
    tempTxt.x -= 250;
    // tempTxt.x = bg.x - bg.width / 3 - 40; 
    tempTxt.antialiasing = true;
    tempTxt.alignment = FlxTextAlign.CENTER;

    bruh.add(tempTxt);    
    tempTxt.text = "Missing Files:";
    add(tempTxt);
    
    for(i in FlxG.save.data.missingAssetsIMG){
        addText("images/" + i);
        tempcounting += 1;        
    }

    for(i in FlxG.save.data.missingAssetsCHARS){
        addText("characters/" + i);
        tempcounting += 1;        
    }
    warningTXT = new FlxText(400,40,350,
"Looks like there is some files missing. Please reinstall the mod. 
 If you ignore this warning, songs or menus can have bugs/missing images.
 Press ENTER to proceed.  

",
 
40);
    warningTXT.setFormat(Paths.font("Roboto-Regular.ttf"), 30);
    warningTXT.color = 0xFFFFFFFF;
    warningTXT.screenCenter();
    warningTXT.x += 255 ;
    warningTXT.y = 320;
    warningTXT.alignment = FlxTextAlign.CENTER;

    add(warningTXT);

    logo = new FlxSprite();
    logo.frames = Paths.getSparrowAtlas("menus/titlescreen/logo");
    
    logo.animation.addByPrefix("logo bumpin", "logo bumpin", 24, false);

    logo.scale.set(0.7,0.7);
    logo.x = warningTXT.x - logo.width / 3.2;
    logo.y = -170;
    logo.antialiasing = true;
    add(logo);
}
function beatHit(curBeat){
    
    if(curBeat % 2 == 0) logo.animation.play("logo bumpin");
}
function addText(val1){
    
        var tempTT = new FlxText(0,0,1000, val1, 20);
        tempTT.setFormat(Paths.font("Roboto-Regular.ttf"), 20);
        tempTT.x = bruh.members[0].x + 10;
        tempTT.antialiasing = true;
        tempTT.y = bruh.members[0].y + 50 + (15 * tempcounting);
        tempcounting += 1;
        tempTT.scrollFactor.set(0,0);
        errorsCount += 1;
        tempTT.alignment = FlxTextAlign.CENTER;
        bruh.add(tempTT);
        add(tempTT);
        saveSTR += val1 + "
        ";
}

function update(){
    if(FlxG.keys.justPressed.ENTER)   openState();
    if(FlxG.keys.pressed.S) bruh.y -= 4;
    if(FlxG.keys.pressed.W) bruh.y += 4;

}
function openState(){
    switch(FlxG.save.data.WarningLastState){
        case "MainMenuState":
        FlxG.switchState(new MainMenuState());
    }
}
var curD:Float;
function saveLog(){
    	var prefix = (ModsFolder.currentModFolder == null) ? "./assets" : (ModsFolder.modsPath + ModsFolder.currentModFolder);
        var curD = Date.now();
		if (!FileSystem.exists(prefix + "/data/shit") || !FileSystem.isDirectory(prefix + "/data"))
			FileSystem.createDirectory(prefix + "/data/shit");
        var uhhvr:Float = Date.now().getDate();
		File.saveContent(prefix + "/data/shit/" + "File Log " + uhhvr + "-" + Date.now().getMonth()  + " " +  Date.now().getHours() + "-" + Date.now().getMinutes() + "-" + Date.now().getSeconds()+ ".txt",
        "IMGS:" + FlxG.save.data.missingAssetsIMG+ "  CHARS:" + FlxG.save.data.missingAssetsCHARS );
        
}
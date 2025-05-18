import flixel.text.FlxTextAlign;
var bg:FlxSprite;
var boxside1:FlxSprite;
var boxside2:FlxSprite;
var boxabove:FlxSprite;
var boxbelow:FlxSprite;

var title:FlxText;
var text:FlxText;

var showing:Bool = true;

var res:Array = [400,300];
var borderSize:Array = [10,10];

var pfpThing:FlxSprite;
var pfp:FlxSprite;
var plName:FlxText;
var user:Array = [];
var eSPR:FlxSprite;
var eTXT:FlxSprite;

function create(){
res[0] = FlxG.save.data.WDWarningRes[0];
res[1] = FlxG.save.data.WDWarningRes[1];
trace(res);
    
bg = new FlxSprite().makeGraphic(res[0],res[1], 0xFF222222);
bg.screenCenter();
add(bg);
bg.alpha = 0;

boxside1 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF555555);
boxside1.screenCenter();
boxside1.x = bg.x;
add(boxside1);
boxside1.alpha = 1;


boxside2 = new FlxSprite().makeGraphic(borderSize[0],res[1], 0xFF555555);
boxside2.screenCenter();
boxside2.x = bg.x + bg.width;
add(boxside2);
boxside2.alpha = 0;

boxabove = new FlxSprite().makeGraphic(res[0],borderSize[1], 0xFF555555);
boxabove.screenCenter();
boxabove.y = bg.y;
boxabove.x = bg.x;
add(boxabove);
boxabove.alpha = 0;

boxbelow = new FlxSprite().makeGraphic(res[0] + 10,borderSize[1], 0xFF555555);
boxbelow.screenCenter();
boxbelow.y = bg.y + bg.height;
boxbelow.x = bg.x;
add(boxbelow);
boxbelow.alpha = 0;
title = new FlxText(0,0, 900, FlxG.save.data.WDWarningTitle, 30);
title.screenCenter();
title.alignment = FlxTextAlign.CENTER;
title.y = bg.y + 20; 
title.setFormat(Paths.font("Roboto-Condensed.ttf"), 30);

title.antialiasing = true;
add(title);
title.alpha = 0;

text = new FlxText(0,0, 900, FlxG.save.data.WDWarningText);

text.screenCenter();
text.alignment = FlxTextAlign.CENTER;
text.y = bg.y + 80; 
text.antialiasing = true;

text.setFormat(Paths.font("Roboto-Regular.ttf"), 15);
text.alpha = 0;
add(text);



        var tempmerda = CoolUtil.coolTextFile(Paths.txt('WDUser'));
        	if (tempmerda.length > 0) {
			for(s in tempmerda){

                // songs.push(s);
                user.push(s);

            }
        }

        pfpThing = new FlxSprite().makeGraphic(2000,60, 0xFF000000);
        pfpThing.y = 680;
        pfpThing.x = 0;
        add(pfpThing);
         
        pfp = new FlxSprite().loadGraphic(Paths.image("wdpfps/" + user[1]));
        add(pfp);
        pfp.setGraphicSize(30,30);
        pfp.y = 470;
        pfp.x = -190;

        name = new FlxText(20,680,200, user[0], 10);
        name.setFormat(Paths.font("Roboto-Regular.ttf"), 30);
        name.scale.set(0.6,0.6);
        name.color = 0xFFbfbfbf;
        add(name);
                eSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/E"));
        add(eSPR);
        for(i in [eSPR]){
            i.setGraphicSize(25,25);
            i.y = 445;
            i.antialiasing = true;
        }
        
        eTXT = new FlxText(1220,687,100,"Back");
        eTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        eTXT.color = 0xFFbfbfbf;
        // eTXT.x = 1400; 
        add(eTXT);
        eSPR.x = eTXT.x - 280;


}

function update(){
    if(FlxG.keys.justPressed.E) closeShit();
    for(i in [bg, boxabove, boxbelow, boxside1, boxside2, title, text]){
       if(showing == true) i.alpha = FlxMath.lerp(bg.alpha, 1, Conductor.crochet / 5000);
       if(showing == false) i.alpha = FlxMath.lerp(bg.alpha, 0, Conductor.crochet / 5000);
    }
}
function closeShit(){

    showing = false;
        // FlxTween.tween(pfp, {alpha:0}, Conductor.crochet / 1000);
        new FlxTimer().start(Conductor.crochet / 5000, function(tmr:FlxTimer){close(); 
            // parent.call("buttonsIn");
            // FlxG.closeSubState();
            FlxG.save.data.WDReturnButtons = true;
            });

}

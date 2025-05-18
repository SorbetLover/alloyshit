import flixel.group.FlxSpriteGroup;
import funkin.backend.chart.Chart;

// import funkin.backend.chart.ChartData.ChartMetaData;
import funkin.menu.FreeplayState;
import funkin.menus.FreeplayState.FreeplaySonglist;

import haxe.io.Path;
import lime.utils.Assets;
public var freeplayList:FreeplaySonglist;
public var curSong:ChartMetaData;
	
var freeplayShitGroup:FlxSpriteGroup;
var freeplayColorBGGroup:FlxSpriteGroup;
var freeplayTextGroup:FlxSpriteGroup;
public var songName:Array = [];
public var songs:Array = [];
public var songColors:Array = [];

function create(){

    freeplayTextGroup = new FlxSpriteGroup();
    freeplayShitGroup = new FlxSpriteGroup();
    freeplayColorBGGroup = new FlxSpriteGroup();
		freeplayList = FreeplaySonglist.get(false);
        trace(freeplayList);
        tempmerda = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
		if (tempmerda.length > 0) {
			for(s in tempmerda){

                songName.push(s);
                tempshit2 = Chart.loadChartMeta(s, "normal", true);
				songs.push(tempshit2.displayName);
				songColors.push(tempshit2.color);

                // trace(s);
            }
        }
        txtCCount = songs.length;

        for(i in songs){

            cnm2 += 1;
            if(cnm2 == -1) cnm2 = 0;

            var tempSpr = new FlxSprite().makeGraphic(1200,60, 0xFF0E0D12);
            // tempSpr.setGraphicSize(songs[cnm2].length * 50, 60);

            tempSpr.y = cnm2 * 200 + offst[1] - (tempSpr.height / 10) + 200;
            tempSpr.x = -offst[0];
            freeplayShitGroup.add(tempSpr);
            add(tempSpr);

            // var tempSpr2 = new FlxSprite().makeGraphic(1200,60, 0xFF0E0D12);
            // // tempSpr.setGraphicSize(songs[cnm2].length * 50, 60);

            // tempSpr2.y = cnm2 * 200 + offst[1] - (tempSpr.height / 10) + 200;
            // tempSpr2.x = -offst[0];
            // freeplayColorBGGroup.add(tempSpr2);
            // add(tempSpr2);

        }
        // trace(freeplayShitGroup.members[1].y - freeplayShitGroup.members[0].y);
        for(i in songs){
            
            
            var temptxt = new FlxText(0,0, 900, songs[cnm]);
            cnm += 1;
            temptxt.setFormat(Paths.font("pixel2.ttf"), 50);
            temptxt.y = cnm * 200 + offst[1];
            // temptxt.y = freeplayShitGroup[cnm].y;
            temptxt.x = offst[0];
            temptxt.antialiasing = false;
            add(temptxt);
            freeplayTextGroup.add(temptxt);


        }
        freeplayTextGroup.alpha = 0;
        lastOffset[0] = freeplayTextGroup.x;
        lastOffset[1] = freeplayTextGroup.members[0].y - freeplayTextGroup.members[1].y;




showing = true;        
}
var closing:Bool = false;
var plays:Bool = false;
function update(){    
    if(showing == true) freeplayTextGroup.alpha = FlxMath.lerp(freeplayTextGroup.alpha, 1, Conductor.crochet / 10000);
    
    if(FlxG.keys.justPressed.W) curSelected += 1;
    if(FlxG.keys.justPressed.S) curSelected -= 1;
    

    if(FlxG.keys.justPressed.E) closeShit();
    freeplayTextGroup.y = FlxMath.lerp(freeplayTextGroup.y, 200 * curSelected + 40, Conductor.crochet / 5000);
    freeplayShitGroup.y = FlxMath.lerp(freeplayTextGroup.y, 200 * curSelected + 40, Conductor.crochet / 5000);
    freeplayShitGroup.forEach(function(spr:FlxSprite):Void {
        // FlxTween.tween(spr, {alpha: 0}, 1);
        spr.colorTransform.color = 0xFF0E0D12;
    });

    freeplayShitGroup.members[-curSelected].colorTransform.color = FlxColor.fromString(songColors[-curSelected]);

    if(closing == true){
        freeplayTextGroup.y = FlxMath.lerp(freeplayTextGroup.y, 1000, Conductor.crochet / 10000);
        freeplayShitGroup.y = FlxMath.lerp(freeplayShitGroup.y, 1000, Conductor.crochet / 10000);

    }
    
    if(plays == true){
        freeplayTextGroup.x = FlxMath.lerp(freeplayTextGroup.x, -2000, Conductor.crochet / 10000);
        freeplayShitGroup.x = FlxMath.lerp(freeplayShitGroup.x, -2000, Conductor.crochet / 10000);

    }
    if(FlxG.keys.justReleased.ENTER){
        plays = true;
		PlayState.loadSong(songName[-curSelected], "hard", false, false);
		FlxG.switchState(new PlayState());

    }

}



function closeShit(){
    closing = true;
        // FlxTween.tween(pfp, {alpha:0}, Conductor.crochet / 1000);
        new FlxTimer().start(Conductor.crochet / 10000, function(tmr:FlxTimer){close(); 
            // parent.call("buttonsIn");
            // FlxG.closeSubState();
            FlxG.switchState(new MainMenuState());
            FlxG.save.data.WDReturnButtons = true;
            });

}

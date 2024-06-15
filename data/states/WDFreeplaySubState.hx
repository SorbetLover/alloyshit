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

var pfp:FlxSprite;
var cnm:Int = 0;
var cnm2:Int = -1;

var offst:Array = [100,120];
var curSelected = 0;
var lastOffset:Array = [];
var showing:Bool = false;
var txtCCount:Int = 0;

var pfpThing:FlxSprite;
var pfp:FlxSprite;
var plName:FlxText;
var user:Array = [];
var tempshit2;
var eSPR:FlxSprite;
var eTXT:FlxText;
var downSPR:FlxSprite;
var downTXT:FlxText;
var upSPR:FlxSprite;
var upTXT:FlxText;
var enterSPR:FlxSprite;
var enterTXT:FlxText;

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



       enterSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/enter"));
        add(enterSPR);
        eSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/E"));
        add(eSPR);
        downSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/DOWN"));
        add(downSPR);
        upSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/DOWN"));
        add(upSPR);
        
        for(i in [eSPR,downSPR, upSPR, enterSPR]){
            i.setGraphicSize(25,25);
            i.y = 445;
            i.antialiasing = true;
        }

                enterTXT = new FlxText(1120,687,100,"Select");
        enterTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        enterTXT.color = 0xFFbfbfbf;
         
        add(enterTXT);
        enterSPR.x = enterTXT.x - 280;
        
        eTXT = new FlxText(1220,687,100,"Back");
        eTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        eTXT.color = 0xFFbfbfbf;
        // eTXT.x = 1400; 
        add(eTXT);
        eSPR.x = eTXT.x - 280;


        downTXT = new FlxText(1020,687,100,"Down");
        downTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        downTXT.color = 0xFFbfbfbf;
        // eTXT.x = 1400; 
        add(downTXT);
        downSPR.x = downTXT.x - 280;
        
        upTXT = new FlxText(920,687,100,"Up");
        upTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        upTXT.color = 0xFFbfbfbf;
        // eTXT.x = 1400; 
        add(upTXT);
        upSPR.x = upTXT.x - 280;
        upSPR.flipY = true;

        
}
var closing:Bool = false;
var plays:Bool = false;
function update(){    
    if(showing == true) freeplayTextGroup.alpha = FlxMath.lerp(freeplayTextGroup.alpha, 1, Conductor.crochet / 10000);
    
    if(FlxG.keys.justPressed.W) curSelected += 1;
    if(FlxG.keys.justPressed.S) curSelected -= 1;
    

    // freeplayShitGroup.members[curSelected].colorTransform.color = 0xFF000000;
    if(FlxG.keys.justPressed.E) closeShit();
    // trace(curSelected);
    freeplayTextGroup.y = FlxMath.lerp(freeplayTextGroup.y, 200 * curSelected + 40, Conductor.crochet / 5000);
    freeplayShitGroup.y = FlxMath.lerp(freeplayTextGroup.y, 200 * curSelected + 40, Conductor.crochet / 5000);
    // freeplayColorBGGroup.y = FlxMath.lerp(freeplayTextGroup.y, 200 * curSelected + 40, Conductor.crochet / 5000);
    // trace(lastOffset[1]);
    // trace(freeplayShitGroup.length);
        // if(freeplayShitGroup.members != curSelected){
            // freeplayShitGroup.members[freeplayShitGroup.length].colorTransform.color = 0xFF0E0D12;
        // }
    // for(i in freeplayShitGroup.members.length){
    //     freeplayShitGroup.members[i].color.colorTransform.color = 0xFF0E0D12;
    // }
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
        new FlxTimer().start(Conductor.crochet / 10000, function(tmr:FlxTimer){
			close(); 
            // parent.call("buttonsIn");
            // FlxG.closeSubState();
            FlxG.save.data.WDReturnButtons = true;
            });

}

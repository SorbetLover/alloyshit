import funkin.menus.MainMenuState;
import flixel.group.FlxSpriteGroup;
import funkin.backend.chart.Chart;
import funkin.backend.utils.FlxInterpolateColor;
import sys.FileSystem;
import sys.io.File;
import flixel.text.FlxTextAlign;
import funkin.savedata.FunkinSave;
import openfl.display.BitmapData;
import flixel.addons.display.FlxBackdrop;
import funkin.editors.charter.Charter;
import funkin.backend.MusicBeatTransition;

var backdropshit:FlxBackdrop;
var sections:Array = [];
var curSection:Int = 0;

var curSongs:Array = [];
var songNames:Array = [];
var bpms:Array = [];
var bms:Array = [];
var spm:Array = [];

var shits:FlxSpriteGroup;
var icons:FlxSpriteGroup;
var colors:Array = [];
var curSelected = 0;

var modtext:FlxText;
                                                // HOW TO GET A METADATA VAR
                                                // var merda:StringMap<Dynamic> = Chart.loadChartMeta("remorse", "hard", true);
                                                // trace(merda.opponentModeAllowed);
var bg:FlxSprite;
var sdf:FlxSprite;
var sdf2:FlxSprite;
var diftxt:FlxText;
public var interpColor:FlxInterpolateColor;
var diffs:Array = [];
var curDiff = 0;

var opponentshit = ["Solo", "Opponent", "Coop", "Coop Inverted"];
var ops = 0;
var opptext:FlxText;

var selAnimOF:Float = 0;
var selAnimOBJ:FlxSprite;
function create(){
        // MusicBeatTransition.script = "data/scripts/blankScript.hx";
    selAnimOBJ = new FlxSprite();
        for(i in ["kou", "static", "doki", "fever"]){
            fag22 =  new FlxSprite().loadGraphic(Paths.image("freeplay/" + i));
        } 
        var files = FileSystem.readDirectory("mods/alloyshit/data/freeplaysecs");
        for (i in files) {
            if (StringTools.endsWith(i, ".txt")) {
                var nameWithoutExtension = i.substr(0, i.length - 4); // remove ".txt"
                sections.push(nameWithoutExtension);
            }
        }
        removedd = false;
        for (i in 0...sections.length) {
            if (!removedd && sections[i] == "default") {
                sections.splice(i, 1); // Correctly removes the element at index i
                removedd = true;
                sections.insert(0, "default");
                break;
            }
        }

        bg = new FlxSprite().loadGraphic(Paths.image("menus/menuDesat"));
        add(bg);
        shits = new FlxSpriteGroup();
        icons = new FlxSpriteGroup();
        CoolUtil.playMenuSong();
        interpColor = new FlxInterpolateColor(bg.color);

        backdropshit = new FlxBackdrop(Paths.image('editors/bgs/charter'));
        // add(backdropshit);
        insert(members.indexOf(bg) + 1, backdropshit);
        backdropshit.alpha = 0.4;
        backdropshit.velocity.set(200,0);

        sdf = new FlxSprite().makeGraphic(240,80, 0xFFFFFFFF);

        sdf2 = new FlxSprite().makeGraphic(400,200, 0x99000000);

        modtext = new FlxText(FlxG.width / 2, 10, 1000, "list name", 20);
        // add(modtext);
        modtext.antialiasing = true;
        modtext.setFormat(Paths.font("riffic.ttf"), 30);
        modtext.alignment = FlxTextAlign.CENTER;
        makeSongs();
        sdf.y = -20;
        sdf.x = FlxG.width / 2 - (sdf.width / 2); 

        sdf2.x = FlxG.width - sdf2.width    ;
        sdf2.y = FlxG.height - sdf2.height;
        diftxt = new FlxText(FlxG.width / 2, 20, 1000, "diff name", 20);
        diftxt.antialiasing = true;
        diftxt.setFormat(Paths.font("riffic.ttf"), 40);
        diftxt.alignment = FlxTextAlign.CENTER;
        
        scoretxt = new FlxText(FlxG.width / 2, 20, 1000, "score num", 20);
        scoretxt.antialiasing = true;
        scoretxt.setFormat(Paths.font("riffic.ttf"), 25);
        scoretxt.alignment = FlxTextAlign.LEFT;
        
        opptext = new FlxText(FlxG.width / 2, 20, 1000, "dde num", 20);
        opptext.antialiasing = true;
        opptext.setFormat(Paths.font("riffic.ttf"), 25);
        opptext.alignment = FlxTextAlign.LEFT;
        
        
        insert(150, sdf);
        insert(151, modtext);       
        insert(152, sdf2);
        insert(153, diftxt);
        insert(154, scoretxt);
        insert(155, opptext);
        loadDiffs();
        selAnimOBJ.x = -600;
        FlxTween.tween(selAnimOBJ, {x:0}, 0.3, {ease:FlxEase.cubeOut});

}
var edh = 130;
var shouldTrack = false;
function makeSongs(){
    

    modtext.text = "[1] " + sections[curSection] + " [2]";
    modtext.x = FlxG.width / 10 + 10;
    
    curSelected = 0;
    shouldTrack = false;
        for (m in shits.members) {
            if (m != null) m.destroy();
        }
        for (i in icons.members) {
            if (i != null) i.destroy();
        }
        shits.clear();
        icons.clear();
        colors = [];
        songNames = [];
        bpms = [];
        bms = [];
        spm = [];
        curSongs = getList(curSection);
    for(i in 0...curSongs.length){
        var merda = Chart.loadChartMeta(curSongs[i], "hard", true);
        // diffs[i] = [];
        // diffs[i].push(merda.difficulties);
        songNames.push(merda.name);
        colors.push(merda.parsedColor);
        bpms.push(merda.bpm);
        bms.push(merda.beatsPerMeasure);
        spm.push(merda.stepsPerMeasure);
    
        songText = new Alphabet(100 , 100 + (i * edh), merda.displayName, true,false);
        add(songText);
        shits.add(songText);
        icon = new HealthIcon(merda.icon, false);
        icon.x = -200;
        icon.scale.set(0.8,0.8);
        add(icon);
        icons.add(icon);
    }   
    shouldTrack = true;
    changeSelection();
}
var dgg:Int;
function updateScore() {
		if (diffs.length <= 0) {
			intendedScore = 0;
			return;
		}
		var changes:Array<HighscoreChange> = [];

		var saveData = FunkinSave.getSongHighscore(songNames[curSelected], diffs[curDiff], changes);
		intendedScore = saveData.score;
        dgg = FlxMath.lerp(dgg, intendedScore, 0.2);
        scoretxt.text = "SCORE:" + Std.int(dgg); 
	}
function loadDiffs(){
    curDiff = 0;
    var merda = Chart.loadChartMeta(curSongs[curSelected], "hard", true);
    diffs = merda.difficulties;
}
var iconBeatScl = 0.8;
var iconBeatRot = 0;
function update(){
    selAnimOF = selAnimOBJ.x;
    // backdropshit.angle = backdropshit.velocity.degrees;
    opptext.text = "[TAB] " + opponentshit[ops];
    updateScore();
    opptext.x = sdf2.x - (sdf2.width / 2) +230;
    opptext.y = sdf2.y + 60;
    diftxt.text = diffs[curDiff];
    diftxt.x = sdf2.x - (sdf2.width / 2) - 100;
    diftxt.y = sdf2.y;
    
    scoretxt.x = sdf2.x - (sdf2.width / 2) + 230;
    scoretxt.y = sdf2.y + 100;

    sdf.color = bg.color;
    if(curSelected == -1){curSelected = shits.members.length - 1;}
    if(curSelected == shits.members.length){ curSelected = 0;}
    
    if(shouldTrack == true) track();

    if(FlxG.keys.justPressed.A){
        if(diffs[curDiff - 1] == null){
            curDiff = diffs.length - 1;
        } else{
            curDiff -= 1;

        }  
    
    }
    if(FlxG.keys.justPressed.D){
        if(diffs[curDiff + 1] == null){
            curDiff = 0;
        } else{
            curDiff += 1;

        }   
    }
    if (controls.BACK)
    {
        FlxG.camera.fade(0xFF000000, 0.2, false);
        new FlxTimer().start(0.2, function(f:FlxTimer){
            FlxG.switchState(new MainMenuState());
            MusicBeatTransition.script = "";
        });
    }
    if(FlxG.keys.justPressed.S || FlxG.keys.justPressed.DOWN){
        curSelected += 1;
        loadDiffs();
        changeSelection();
    }
    if(FlxG.keys.justPressed.W || FlxG.keys.justPressed.UP){
        curSelected -= 1;
        loadDiffs();
        changeSelection();
    } 
    interpColor.fpsLerpTo(colors[curSelected], 0.0625);
	bg.color = interpColor.color;
	backdropshit.color = interpColor.color;

    if(FlxG.keys.justPressed.ONE){
        curSection -= 1;
        if(curSection == -1){
            curSection = sections.length - 1;
        }
        makeSongs(0);

        trace("SUBTRACTED " + curSection);
    }
    if(FlxG.keys.justPressed.TWO){
        curSection += 1;
        if(curSection >= sections.length){
            curSection = 0;
        }
        makeSongs(1);
        
        trace("ADDED " + curSection);
    }
    if(FlxG.keys.justPressed.SEVEN){
                FlxG.switchState(new Charter(songNames[curSelected],diffs[curDiff], true));
    }
    if(FlxG.keys.justPressed.SPACE){
					FlxG.sound.playMusic(Paths.inst(songNames[curSelected], diffs[curDiff]), 1);
					Conductor.changeBPM(bpms[curSelected], bms[curSelected], spm[curSelected]);
    }
    iconBeatScl = FlxMath.lerp(iconBeatScl, 1, 0.06);
    iconBeatRot = FlxMath.lerp(iconBeatRot, 0, 0.035);
    for(i in 0...icons.members.length){
        icons.members[i].scale.x = iconBeatScl;
        icons.members[i].scale.y = iconBeatScl;
    }
    bg.scale.x = FlxMath.lerp(bg.scale.x, 1, 0.06);
    bg.scale.y = bg.scale.x; 

    if(FlxG.keys.justPressed.TAB){
        if(ops == 3){
            ops = 0;
        } else {
            ops += 1;
        }
    }

    if(FlxG.keys.justPressed.ENTER){
        enterSong();
    }

    for(i in icons.members){
        i.angle = iconBeatRot;
    }
    curSelected -= FlxG.mouse.wheel; 
}
function changeSelection(){
    switch(songNames[curSelected]){
        case "gears", "tranquility", "mechanical", "loaded", "w00f", "last-meow":
            bg.loadGraphic(Paths.image("freeplay/fever"));
        
        case "b-epiphany", "b-epiphany-alt", "b-epiphany-raluca", "catfight", "hot-air-baloon", "its-complicated", "poems-n-thorns", "love n funkin", "takeover medley", "markov", "libitina", "home", "drinks on me", "bara no yume":
            bg.loadGraphic(Paths.image("freeplay/doki"));

        case "soul", "damage-erect", "damage":
            bg.loadGraphic(Paths.image("freeplay/static"));

        case "lockdown":
            bg.loadGraphic(Paths.image("freeplay/kou"));

        default:
            bg.loadGraphic(Paths.image("menus/menuDesat"));
    }
}
var isOpp = false;
var isCop = false;
function enterSong(){
    	switch(ops){
            case 0:
                isOpp = false;
                isCop = false;
            case 1:
                isOpp = true;
                isCop = false;
            case 2:
                isOpp = false;
                isCop = true;
            case 3:
                isOpp = true;
                isCop = true;
        }
        trace("CU");
        FlxTween.tween(selAnimOBJ, {x: -1700}, 0.5, {ease:FlxEase.backIn});
        MusicBeatTransition.script = "data/scripts/blankScript.hx";
        new FlxTimer().start(0.5, function(f:FlxTimer){
            FlxG.camera.fade(0xFF000000, 0.3, false);
            FlxTween.tween(FlxG.sound.music, {volume:0}, 0.3);

                new FlxTimer().start(2, function(f:FlxTimer){
                    PlayState.loadSong(songNames[curSelected], diffs[curDiff],isOpp, isCop);
                    FlxG.switchState(new PlayState());
                    MusicBeatTransition.script = "";

                });
        });
}
var iconOffY = 0;
var boog = false;
var twins = ["boogieman", "power-hour", "sleeptalk","bee-bush"];
function beatHit(curBeat){
    // if(curBeat % 2 == 0)
    iconBeatScl = 0.9;
    bg.scale.set(1.03,1.03);
    
        boog = !boog;
    
    if(twins.contains(songNames[curSelected])){
        switch(boog){
            case false:
                iconBeatRot = 15;
            case true:
                iconBeatRot = -15;
        }
    }
    if(songNames[curSelected] == "bee-bush"){
        for(i in icons.members){
            i.flipX = boog;
        }
        iconOffY = 10;
    } else if(icons.members[0].flipX == true) {
        for(i in icons.members){
            i.flipX = false;
        }
    }
}

function track(){
    iconOffY = FlxMath.lerp(iconOffY, 0, 0.07);
    // shits.y = ((FlxG.height / 2) - 100) - (edh  * curSelected);
    shits.y = FlxMath.lerp(shits.y, ((FlxG.height / 2) - 100) - (edh  * curSelected), 0.3);
    for(i in 0...shits.members.length){  
        if(i == curSelected && i != null){
            shits.members[i].alpha = 1;
            icons.members[i].alpha = 1;
            shits.members[i].x = FlxMath.lerp(shits.members[i].x, (FlxG.width / 2 - (shits.members[i].width / 2 )), 0.2);
            
        } 
        if(i != curSelected && i != null){
            shits.members[i].alpha = 0.4;
            icons.members[i].alpha = 0.4;
            
            shits.members[i].x = FlxMath.lerp(shits.members[i].x, 30 + selAnimOF, 0.2);
        } 
    }
    for(i in 0...icons.members.length){
        icons.members[i].y = shits.members[i].y - (125 - (icons.members[i].height / 2)) + iconOffY;
        icons.members[i].x = shits.members[i].x + (1 * shits.members[i].width) + 5;
    }
    
}


function getList(){
    var songss = sections[curSection];
    // switch(curSection){
    //     case 0:
    //         songss = "freeplaySonglist";
    //     case 1:
    //         songss = "sec1";
    //     default:
    //         songss = "freeplaySonglist";
    // }

    uhm = CoolUtil.coolTextFile(Paths.txt("freeplaysecs/" + songss));
    return uhm;
}

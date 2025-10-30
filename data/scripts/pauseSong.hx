import funkin.backend.Conductor;
import funkin.menus.PauseSubState;
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;
import sys.FileSystem;

import funkin.backend.assets.ModsFolder;

import openfl.display.BitmapData;

var merda:FlxText;
var merda:FlxText;
var pitchnum:Float;
var backdropshit:FlxBackdrop;

var cu2:CustomShader;
var icondrop:FlxBackdrop;
var icondrop2:FlxBackdrop;
var iconlist:Array = [];
function create(event) {
        listIcons();

	backdropshit = new FlxBackdrop(Paths.image('editors/drawers'));
    add(backdropshit);
    backdropshit.color = 0xFFadadad;
    FlxTween.tween(backdropshit, {"velocity.y": 100, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});
    backdropshit.scale.set(1,1);
    var merda = 0;
                                    // for(i in [icondrop, icondrop2]){
                                    //     merda += 1;
                                    //     i = new FlxBackdrop().loadGraphic(Paths.image("icons/" + iconlist[randomIcon()[0]]), true,150,150);
                                    //     i.animation.add("idle", [0], [0], false);
                                    //     add(i);

                                    //     i.spacing.x = 600;
                                    //     i.spacing.y = 600;
                                    //     i.scale.set(0.5,0.5);
                                    //     i.antialiasing = true;
                                    //     FlxTween.tween(i, {"velocity.y": 70, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});
                                    // }
    icondrop = new FlxBackdrop().loadGraphic(Paths.image("icons/" + iconlist[randomIcon()[0]]), true,150,150);
    icondrop.animation.add("idle", [0], [0], false);
    add(icondrop);

    icondrop.spacing.x = 400;
    icondrop.spacing.y = icondrop.spacing.x;
    icondrop.scale.set(0.7,0.7);
    icondrop.antialiasing = true;
    FlxTween.tween(icondrop, {"velocity.y": 70, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});

    icondrop2 = new FlxBackdrop().loadGraphic(Paths.image("icons/" + iconlist[randomIcon()[0]]), true,150,150);
    icondrop2.animation.add("idle", [0], [0], false);
    add(icondrop2);

    icondrop2.spacing.x = icondrop.spacing.y;
    icondrop2.spacing.y = icondrop.spacing.y;
    icondrop2.scale.set(0.7,0.7);
    icondrop2.x += icondrop.spacing.y /2;
    icondrop2.y += icondrop.spacing.y/2;
    icondrop2.antialiasing = true;
    FlxTween.tween(icondrop2, {"velocity.y": 70, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});
    icondrop2.alpha = 0.001;

    icondrop.color = 0xFF999999;
    icondrop2.color = 0xFF999999;
    // backdropshit.spacing.x = -14;
    // backdropshit.spacing.y = -14;
    backdropshit.alpha = 0.8;
    switch(PlayState.SONG.meta.name){
        default:
            event.music = "property-surgery";
        case "memories":
            event.music = "piggy-menu";
        case "b-epiphany", "b-epiphany-alt", "love n funkin", "hot-air-baloon", "catfight", "its-complicated", "takeover medley":
            event.music = "ddto-menu";
    }
    startIconLoop();
}
var wichicondrop = false;

function startIconLoop() {
    swapIcons(); // inicia o loop
}
var icontween1:FlxTween;
var icontween2:FlxTween;
var ttime = 2;
var sdelay = 1;
var easy = FlxEase.cubeOut;
var currentAngle = 0;
var ft = false;
function swapIcons() {
    randomIcon();
    wichicondrop = !wichicondrop;
    switch(wichicondrop){
        case true:
            icondrop.loadGraphic(Paths.image("icons/" + iconlist[randomIcon()[0]]), true,150,150);
            icondrop.angle = 90;
        case false:
            icondrop2.loadGraphic(Paths.image("icons/" + iconlist[randomIcon()[0]]), true,150,150);
            icondrop2.angle = 90;
    }
    if(ft == false){
        icondrop.angle = 0;
        ft = true;
    }
    // tween do icondrop
    icontween1 = FlxTween.tween(icondrop, { 
        angle: wichicondrop ? 0 : 90, 
        alpha: wichicondrop ? 1 : 0.001 
    }, ttime, { onComplete: swapIcons, startDelay:sdelay, ease:easy}); // chama novamente quando terminar

    // tween do icondrop2
    icontween2 = FlxTween.tween(icondrop2, { 
        angle: wichicondrop ? 90 : 0, 
        alpha: wichicondrop ? 0.001 : 1 
    }, ttime, {startDelay:sdelay, ease:easy});
}

function listIcons(){
        var ignore = ["1TEMPLATE"];
        var folder = "mods/" + ModsFolder.currentModFolder + "/images/icons/";
        
        if (FileSystem.exists(folder) && FileSystem.isDirectory(folder)) {
            var files = FileSystem.readDirectory(folder);
            
            for (file in files) {
                if (StringTools.endsWith(file, ".png")) {
                    if(ignore.contains(file) == false){
                        var bmp = BitmapData.fromFile(folder + file);
                        if (bmp.width >= 300 && bmp.height >= 150) {
                            var without = StringTools.replace(file, ".png", "");
                            iconlist.push(without);
                        }
                    }   
                }
            }
        }
        // trace(iconlist);
        randomIcon();
        // trace(currentIcons);
}
var currentIcons = [];
function randomIcon(){
    currentIcons = [FlxG.random.int(0,iconlist.length),FlxG.random.int(0,iconlist.length)];
    checkequal(0);
    return currentIcons;
}
var tries = 0;
function checkequal(tries){
    if(currentIcons[0] == currentIcons[1]){
        currentIcons[1] = FlxG.random.int(0, iconlist.length);
        tries +=1;
        checkequal(tries);
        print("Duplicated:" + currentIcons);
    } else {
        if(tries == 0){
            print("Not Duplicated, 0 tries " + currentIcons);
        } else {
            print("Fixed the duplication with " + tries + " tries. "  + currentIcons);
        }
        tries = 0;
    }
}
function print(d){
    return;
    trace("[EQUAL DEBUG] " + d);
}







function postCreate(){
    
    merda = new FlxText(20, 15, 0, FlxG.save.data.codenameCurPitch, 32);
    add(merda);
    merda.screenCenter();
    merda.x = FlxG.width - 350;
    
    merda2 = new FlxText(20, 15, 0, FlxG.save.data.codenameCurPitch, 32);
    add(merda2);
    merda2.screenCenter();
    merda2.x = FlxG.width - 350;
    merda2.y += 50;

    for(i in [merda, merda2]){
        i.setFormat(Paths.font("notosans.ttf"), 25);
    }
}
function update(elapsed){
    pitchnum = "[Y][U/I] Pitch: " + FlxG.save.data.codenameCurPitch;
    kcnum = "[H][J/K] Mania: " + FlxG.save.data.keyCount;
    merda.text = pitchnum;
    merda2.text = kcnum;

    if(controls.ACCEPT){
        icontween1.cancel();
        icontween2.cancel();
    }
}


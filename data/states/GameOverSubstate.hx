import flixel.FlxSprite;
import flixel.util.FlxTimer;
var giff:Character;
var pianobite:Character;
var ralucaLine:Int;
var ralucatalking = false;
function create(){


    if(PlayState.instance.difficulty == "raluca" || PlayState.instance.curSong == "cyberhate" || PlayState.instance.curSong == "bgospel" || PlayState.instance.curSong == "markov" || PlayState.instance.curSong == "libitina" ){
        ralucaLine = FlxG.random.int(1, 14);

        trace(ralucaLine);
        ralucatalking = true;
    
        FlxG.sound.play(Paths.sound("raluca/" + ralucaLine));
    
    if(ralucaLine == 1){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 2){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 3){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 4){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 5){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 6){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 7){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 8){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 9){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 10){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 11){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 12){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 13){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
    if(ralucaLine == 14){
        new FlxTimer().start(1.5, function(tmr:FlxTimer){ralucatalking = false;});
    }
}
    


    if(PlayState.instance.curSong == "quickdraw"){
    giff = new Character(0,0, 'gifmadquickdraw', false);
    giff.danceOnBeat = true;
    giff.playAnim('idle', true);
    giff.scale.set(5,5);
    giff.y = 500;
    giff.x = -200;
    add(giff);

    pianobite = new Character(0,0, '8bitsaloon', true);
    pianobite.danceOnBeat = true;
    pianobite.y = -370;
    pianobite.x = 900;
    pianobite.scale.set(5,5);
    pianobite.playAnim('idle', true);
    add(pianobite);

    new FlxTimer().start(.1, function(tmr:FlxTimer){
        pianobite.playAnim('gunshoot');
    });
    new FlxTimer().start(1.4, function(tmr:FlxTimer){
    character.alpha = 1;
    });

    
    // // switch(ralucaLine){
    // //     case 1:
    // //         FlxG.sound.play(Paths.sound("raluca/1.ogg"));
    // //     case 2:
    // //         FlxG.sound.play(Paths.sound("raluca/2.ogg"));
    // //     case 3:
    // //         FlxG.sound.play(Paths.sound("raluca/3.ogg"));
    // //     case 4:
    // //         FlxG.sound.play(Paths.sound("raluca/4.ogg"));
    // //     case 5:
    // //         FlxG.sound.play(Paths.sound("raluca/5.ogg"));
    // //     case 6:
    // //         FlxG.sound.play(Paths.sound("raluca/6.ogg"));
    // //     case 7:
    // //         FlxG.sound.play(Paths.sound("raluca/7.ogg"));
    // //     case 8:
    // //         FlxG.sound.play(Paths.sound("raluca/8.ogg"));
    // //     case 9:
    // //         FlxG.sound.play(Paths.sound("raluca/9.ogg"));
    // //     case 10:
    // //         FlxG.sound.play(Paths.sound("raluca/10.ogg"));
    // //     case 11:
    // //         FlxG.sound.play(Paths.sound("raluca/11.ogg"));
    // //     case 12:
    // //         FlxG.sound.play(Paths.sound("raluca/12.ogg"));
    // //     case 13:
    // //         FlxG.sound.play(Paths.sound("raluca/13.ogg"));
    // //     case 14:
    // //         FlxG.sound.play(Paths.sound("raluca/14.ogg"));

    // }
}

}
function update(){ 
    if(ralucatalking == true) { FlxG.sound.music.volume = 0; }
    if(ralucatalking == false) { FlxG.sound.music.volume = 1; }
    if(PlayState.instance.curSong == "quickdraw") character.y = 200;
    if(FlxG.keys.justPressed.ENTER){
        pianobite.danceOnBeat = false;
        pianobite.playAnim('anger', false);
        giff.playAnim('laugh', false);
    }
 }
function beatHit(curBeat){
    if(curBeat < 0 && PlayState.instance.curSong == "quickdraw"){
    character.alpha = 0;
    }
    if(curBeat % 4 == 0 && PlayState.instance.curSong != "quickdraw"){
        FlxG.camera.zoom = 1.1;
     FlxTween.tween(FlxG.camera, {zoom: 1}, Conductor.crochet / 1000, {ease:FlxEase.cubeOut});
    }
    if(curBeat % 4 == 0 && PlayState.instance.curSong == "quickdraw"){
        FlxG.camera.zoom = 0.85;
     FlxTween.tween(FlxG.camera, {zoom: 0.8}, Conductor.crochet / 1000, {ease:FlxEase.cubeOut});
    }    
}
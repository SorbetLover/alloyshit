import flixel.FlxSprite;
var char1:Character;
var char2:Character;
var char1name:String;
var char2name:String;
function create(){
    switch(PlayState.instance.curSong){
    case "quickdraw":
        char1name = "gifmad";
        char2name = "8bitsaloon";
    case "worship":
        char1name = "sarvente";
        char2name = "gf";
    case "soul":
        char1name = "pump";
        char2name = "gf";
    case "last-meow":
        char1name = "wee";
        char2name = "gf";
    
    default:
        char1name = "dad";
        char2name = "gf";
    }
    char1 = new Character(0,0, char1name, false);
    char1.danceOnBeat = true;
    char1.playAnim('idle', true);
    
   
    char2 = new Character(0,0, char2name, true);
    char2.danceOnBeat = true;
    char2.playAnim('idle', true);
    
    switch(PlayState.instance.curSong){
    case "quickdraw":

   
    add(char1);
    add(char2);     char2.scale.set(5,5);
        char1.scale.set(5,5);    
        char2.y = -370;
        char2.x = 900;
        char1.y = 0;
        char1.x = -200;        
        new FlxTimer().start(.1, function(tmr:FlxTimer){
        char2.playAnim('gunshoot');
        });
        new FlxTimer().start(1.4, function(tmr:FlxTimer){
             character.alpha = 1;
        });
        FlxG.camera.zoom = 1.1;

    case "bopeebo", "dadbattle","fresh":
        add(char2);
        add(char1);
        char2.flipX = false;
        char1.x = 400;
        char1.y = 250;
        char2.y = 330;
        char2.scale.set(0.7,0.7);
        char2.x = 900;
        char1.scale.set(0.8,0.8);
    case "worship":
        add(char2);
        add(char1);
        char2.flipX = false;
        char1.x = 400;
        char1.y = 280;
        char2.y = 300;
        char2.scale.set(0.7,0.7);
        char2.x = 900;
        char1.scale.set(0.75,0.75);
    case "soul":
        add(char2);
        add(char1);
        char2.flipX = false;
        char1.x = 200;
        char1.y = 80;
        char2.y = 300;
        char2.scale.set(0.7,0.7);
        char2.x = 600;
        char1.scale.set(0.75,0.75);
        char2.alpha = 0.2;
        // char2.color = 0xFFFFFFFF;
    case "last-meow":
        add(char2);
        add(char1);
        char2.flipX = false;
        char1.x = 0;
        char1.y = -100;
        char2.y = 300;
        char2.scale.set(0.7,0.7);
        char2.x = 950;
        char1.scale.set(0.75,0.75);
        char2.alpha = 0;
    default:
        add(char2);
        add(char1);
        char2.flipX = false;
        char1.x = 400;
        char1.y = 250;
        char2.y = 330;
        char2.scale.set(0.7,0.7);
        char2.x = 900;
        char1.scale.set(0.8,0.8);
        char1.danceOnBeat = false;
        char2.alpha = 0;
    // case "b-epiphany":

    }

}
function update(){ 
       
    if(PlayState.instance.curSong == "soul") char1.playAnim('idle', false);
    character.scale.set(0.8,0.8);
    camFollow.setPosition(character.x - 100, character.y + 430);
    
    character.y = 200;
    if(FlxG.keys.justPressed.ENTER){
    switch(PlayState.instance.curSong){
    case "quickdraw":
        char2.danceOnBeat = false;
        char2.playAnim('anger', false);
        
        if(PlayState.instance.difficulty == "GIF") char1.playAnim('laugh', false);
    case "worship":
        char1.danceOnBeat = false;
        char1.playAnim('singUP-alt', false);
        char2.playAnim('cheer', false);   
        char1.x -= 30;
    }
    
}
}
function beatHit(curBeat){
    
    // if(curBeat < 100) character.scale.set(0.8,0.8);


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
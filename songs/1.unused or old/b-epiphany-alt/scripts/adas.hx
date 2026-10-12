// function gameOver(e){
//     return;
// }
var idleTimer:FlxTimer;

function postCreate(){
    health = 2;
}
function postUpdate(){
        customGO();
}
function customGO(){
    if(health < 0.2){
        inst.pitch = 0;
        vocals.pitch = 0;
    
        strumLines.clear();
        health = 0.1;
    if(FlxG.keys.justPressed.SPACE){
        FlxG.resetState();

    }        
    }
}
import flixel.tweens.FlxTween;
import funkin.backend.HealthIcon;
function postCreate(){
camGame.addShader(shader2 = new CustomShader("chroma"));

strumLines.members[0].characters[0].x -= 60;
strumLines.members[2].characters[0].x += 20;
// strumLines.members[0].characters[0].y -= 10;
// shit2.cameras = [camHUD];

// strumLines.members[0].characters[0].cameras = [camHUD];


bg.alpha = 0;
shit2.alpha = 0;
strumLines.members[2].characters[0].alpha = 0;
}
var shit222:Bool = false;
function postUpdate(){
    camFollow.setPosition(481,270);
}
function stepHit(curStep){
    switch(curStep){
        case 260:
            // FlxTween.tween(strumLines.members[0].characters[0], {alpha: 0}, 0.6, {ease: FlxEase.cubeOut});
            
            FlxTween.tween(shit2, {alpha: 1}, 0.6, {ease: FlxEase.cubeOut}); 
            shit222 = true;
            
        case 270:
            shit.alpha = 0;

            FlxTween.tween(shit2, {alpha: 0}, 1, {ease: FlxEase.cubeOut}); 
            FlxTween.tween(bg, {alpha: 1}, 1, {ease: FlxEase.cubeOut}); 
            
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[2].characters[0].alpha = 1;

        }
        if(curStep % 16 == 0 && shit222 == true){
            camHUD.zoom = 1.1;
            FlxTween.tween(camHUD, {zoom: 1}, 1, {ease: FlxEase.cubeOut}); 
            
        }
    
}
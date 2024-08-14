
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTweenType;
import Math;
var windowoffsetfuck:FlxSprite;
function postCreate(){
    windowoffsetfuck = new FlxSprite();
    // windowoffsetfuck.x = window.height / 2.1;
    // FlxTween.tween(windowoffsetfuck, {x: 330}, 1, {ease:FlxEase.cubeOut});
    if(dad.curCharacter == "felcanpc"){
        dad.x -= 100;
        dad.y -= 190;
    }
}
function onStartSong(){
    FlxTween.circularMotion(windowoffsetfuck, 300, 150, 30, 0, true, 10 ,true, { ease: FlxEase.linear, type: FlxTweenType.LOOPING });

}
var left:Bool = true;
function postUpdate(){
    window.x = windowoffsetfuck.x;
    window.y = windowoffsetfuck.y;

}
// function stepHit(curStep){
// // if(curStep % 32 == 0){
// //     switch(left){
// //         case true:
// //             left = false;
// //             FlxTween.tween(windowoffsetfuck, {x: -20}, 1, {ease:FlxEase.cubeInOut});
// //         case false:
// //             left = true;
// //             FlxTween.tween(windowoffsetfuck, {x: 20}, 1, {ease:FlxEase.cubeInOut});
    
// //     }
// // }
// }
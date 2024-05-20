import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
var shita:Bool = false;
var dadq:Float = -100;
var dade:Float = 300;
var dady:Float;

var floatup:Bool = false;
function ralucafloat(){
	
    if (floatup == true){
        FlxTween.tween(strumLines.members[0].characters[0], {y:dady - 80}, 3,{ease:FlxEase.cubeInOut});
        FlxTween.tween(camHUD, {y: -20}, 3,{ease:FlxEase.cubeInOut});
    
     new FlxTimer().start(3.2, function(tmr:FlxTimer)
	{
        floatup = false;
        ralucafloat();
    });
    }
    if(floatup == false){
    FlxTween.tween(strumLines.members[0].characters[0], {y:dady + 100}, 3, {ease:FlxEase.cubeInOut});
    FlxTween.tween(camHUD, {y: 20}, 3,{ease:FlxEase.cubeInOut});

    new FlxTimer().start(3.2, function(tmr:FlxTimer)
					{
        floatup = true;
        ralucafloat();

                    });
    }

                                                                                                                
}


function postCreate(){
	ralucafloat();

    dady = strumLines.members[0].characters[0].y;
    if(PlayState.SONG.meta.name == "bgospel"){
        strumLines.members[1].characters[0].y = 0;
        strumLines.members[1].characters[0].scale.set(0.7,0.7);
        strumLines.members[1].characters[0].x = 800;
    }
}


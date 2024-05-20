import hxvlc.flixel.FlxVideo;
import flixel.util.FlxTimer;

import hxvlc.flixel.FlxVideoSprite;


var video:FlxVideoSprite = new FlxVideoSprite();

function onSongStart(){
    video.play(Paths.video("xamuel"));
    video.volume = 0;
    video.x = 0;
    // video.alpha = 1;
    video.y = 0;
    video.setGraphicSize(Std.int(video.width / defaultCamZoom));


}

// function postUpdate(){
//     if(paused == true) video.pause();
//     if(paused == false && video.isPlaying == false) video.resume();
// }
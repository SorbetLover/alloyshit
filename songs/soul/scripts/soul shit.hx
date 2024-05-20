import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
function postCreate(){
    // camGame.addShader(shader2 = new CustomShader("old tv effect/old tv2"));
    camRatio = new FlxCamera();
    camRatio.bgColor.alpha = 0;
    
    FlxG.cameras.add(camRatio);
    
}
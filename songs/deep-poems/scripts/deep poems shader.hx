import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
function postCreate(){
    FlxG.camera.addShader(shader2 = new CustomShader("glitch effect/glitch"));
}

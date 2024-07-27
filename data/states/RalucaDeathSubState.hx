import flixel.FlxObject;
import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import flixel.util.FlxTimer;
var raluD:FlxVideoSprite;
var raluca:Character;
public var camHUD:FlxCamera;
var glow:FlxSprite;
var hm:FlxSprite;
function create(){
  hm = new FlxSprite().makeGraphic(10000,10000, 0xFF191719);
  add(hm);
		FlxG.cameras.add(camHUD = new FlxCamera(), true);
		
    FlxG.camera.followLerp = 0;
    
    raluD = new FlxVideoSprite( 0, 0);
    raluD.antialiasing = true;
    raluD.bitmap.onFormatSetup.add(function():Void
    {
        raluD.setGraphicSize(FlxG.width, FlxG.height);
        raluD.scrollFactor.set(0,0);
        raluD.updateHitbox();
        raluD.screenCenter();
    });
    // raluD.bitmap.onEndReached.add(raluD.play());
    // raluD.load(Paths.video("ralocalimbo", "mods/alloyshit/videos"));
    
    raluD.load("mods/alloyshit/videos/ralocalimbo.mp4 ");
    add(raluD);
    raluD.play();
    // raluD.bitmap.pitch = 3;
    // raluD.bitmap.time = 10000;
    raluD.alpha = 1;
    trace("hn");
    raluca = new Character(0, 0, "ralucaanimadead", false);
    add(raluca);
    raluca.x = 206;
    raluca.y = -103;
    raluca.scale.set(0.72,0.72);
    raluca.cameras = [camHUD];
    raluD.cameras = [camHUD];
    raluca.alpha = 0;
    
    raluD.autoVolumeHandle = false;
    raluD.bitmap.volume = 0;

    FlxG.sound.play(Paths.sound("limbo/ralucaDeath"));

    glow = new FlxSprite().loadGraphic(Paths.image("stages/limbo/glow"));
    add(glow);
    glow.x = raluca.x;
    glow.y = raluca.y;
    glow.scale.set(0.72,0.72);
    glow.cameras = [camHUD];
    glow.alpha = 0;

}
var exiting:Bool = false;
var finishedCutscene:Bool = false;
function startshit(){
		Conductor.changeBPM(102);
		CoolUtil.playMusic(Paths.music("gameOver"), false, 1, true, 100);

    raluD.alpha = 0;
    raluca.alpha = 1;
    raluca.danceOnBeat = false;
    
}
function endShit(){
    if (FlxG.sound.music != null){
			  FlxG.sound.music.stop();
        FlxG.sound.music = null;
    }

    var sound = FlxG.sound.play(Paths.sound("gameOverEnd"));
    raluca.debugMode = true;
    raluca.playAnim("deathConfirm", true);
    glow.alpha = 1;
    glow.color = 0xFF777799;
    FlxTween.color(glow, 2, 0xFF990000, 0xFFFFFFFF);
    hm.color = 0xFFFFFFFF;
    FlxG.camera.bgColor = 0xFF000000;
    FlxTween.color(hm, 2, hm.color, 0xFF000000);
    FlxTween.tween(raluca, {alpha: 0}, 1, {startDelay: 1});
    FlxTween.tween(glow, {alpha: 0}, 0.2, {startDelay: 2, onComplete: function(twn:FlxTween){
    }});

    new FlxTimer().start(4, function(tmr:FlxTimer){
    	FlxG.switchState(new PlayState());

    });

}

function update(){
  if(finishedCutscene == false && FlxG.keys.justPressed.SPACE){
      finishedCutscene = true;
      startshit();
			beatHit(0);

  }
  // trace(raluD.bitmap.time);
  if(raluD.bitmap.time >= 10000 && finishedCutscene == false){
      finishedCutscene = true;
      startshit();
			beatHit(0);
  }
  if(FlxG.keys.justPressed.ENTER && finishedCutscene == true){
    exiting = true;
    endShit();
  }
    
    if(FlxG.keys.justPressed.Q){
		  close();
      
    }
    camHUD.zoom = FlxMath.lerp(camHUD.zoom, 1, 0.04);
}

function beatHit(curBeat){
  if(curBeat % 4 == 0 && exiting == false){
    raluca.playAnim("idle");
    camHUD.zoom = 1.1;
  }

}
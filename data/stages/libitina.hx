import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import hxvlc.util.Handle;
import openfl.display.BlendMode;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;

var crackBG:FlxVideoSprite;
var infoBG:FunkinSprite;
var infoBGI:FunkinSprite;
var ghostBG:FunkinSprite;
var raluca:Array = [];
var coolWindow:FunkinSprite;
var staticthing:FunkinSprite;
var shadowmilkcookieisthatyou:FunkinSprite;
var vignette:FunkinSprite;

var glitchShader:CustomShader;
var ghostShader:WiggleEffect;
var usingShader = false;
var lightOverlay:FunkinSprite;

var FinaleBG:FunkinSprite;
var she:FunkinSprite;
var goons1:FunkinSprite;
var goons2:FunkinSprite;
var sheWatches:FunkinSprite;

var camSHIT:FlxSprite;
function create(){
            ghostBG = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/ghostbg"));
                insert(0,ghostBG);
                ghostBG.scrollFactor.set(0,0);
                ghostBG.screenCenter();
                ghostBG.scale.set(1.5,1.5);
                ghostBG.alpha = 0;
                coolWindow = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/bigwindow"));
                insert(0, coolWindow);

                shadowmilkcookieisthatyou = new FunkinSprite();
                shadowmilkcookieisthatyou.frames = Paths.getSparrowAtlas("stages/libitina/EyeMidwayBG");
                add(shadowmilkcookieisthatyou);
                shadowmilkcookieisthatyou.scrollFactor.set(0,0);
                shadowmilkcookieisthatyou.screenCenter();
                shadowmilkcookieisthatyou.animation.addByPrefix("MidwayBG","MidwayBG", 24, true);
                shadowmilkcookieisthatyou.animation.play("MidwayBG");
                shadowmilkcookieisthatyou.alpha = 0.001;
                
                staticshit = new FunkinSprite();
                staticshit.frames = Paths.getSparrowAtlas("stages/libitina/HomeStatic");
                add(staticshit);
                staticshit.color = 0xFF888888;
                staticshit.antialiasing = false;
                staticshit.scrollFactor.set(0,0);
                staticshit.screenCenter();
                staticshit.animation.addByPrefix("HomeStatic", "HomeStatic", 24, true);
                staticshit.animation.play("HomeStatic");
                staticshit.alpha = 0.0001;

                vignette = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/vignette"));
                vignette.cameras = [camHUD];
                vignette.scrollFactor.set(0,0);
                vignette.setGraphicSize(FlxG.width, FlxG.height);
                vignette.screenCenter();
                insert(1, vignette);
                


                infoBG = new FunkinSprite();
                infoBG.frames = Paths.getSparrowAtlas("stages/libitina/InfoMidwayBGInvert");
                infoBG.animation.addByPrefix("InfoBG", "InfoBG", 24, true);
                infoBG.animation.play("InfoBG");
                infoBG.scrollFactor.set(0,0);
                infoBG.screenCenter();
                insert(0, infoBG);

                infoBGI = new FunkinSprite();
                infoBGI.frames = Paths.getSparrowAtlas("stages/libitina/InfoMidwayBG");
                infoBGI.animation.addByPrefix("InfoBG", "InfoBG", 24, true);
                infoBGI.animation.play("InfoBG");
                infoBGI.scrollFactor.set(0,0);
                infoBGI.screenCenter();
                insert(0, infoBGI);
                infoBG.alpha = 0.00001;
                infoBGI.alpha = 0.000001;

                    crackBG = new FlxVideoSprite(0, 0);
                    crackBG.antialiasing = true;
                    crackBG.bitmap.onFormatSetup.add(function():Void
                    {
                        crackBG.setGraphicSize(FlxG.width + 150, FlxG.height + 100);
                        crackBG.scrollFactor.set(0,0);
                        crackBG.updateHitbox();
                        crackBG.screenCenter();
                    });
                    crackBG.bitmap.onEndReached.add(replayCrack());
                    crackBG.load(Paths.video('libitina/crackBG'), [':input-repeat=2']);
                    insert(4, crackBG);
                    // crackBG.play();
                    crackBG.alpha = 0.000000000001;

/// finale WOW
    camSHIT = new FlxSprite(0,0);
    FinaleBG = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/finale/FinaleBG"));
    insert(10, FinaleBG);
    FinaleBG.scrollFactor.set(0,1);
    FinaleBG.screenCenter();
    FinaleBG.scale.set(1.1,1.1);
    she = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/ralucalookin"));
    she.scale.set(0.8,0.8);
    she.x = -600;
    she.y = 100;
    she.color = 0xFF555599;
    insert(11,she);

    goons1 = new FunkinSprite(0,-200).loadGraphic(Paths.image("stages/libitina/finale/GOONS1"));
    insert(12, goons1);
    goons2 = new FunkinSprite(100,-200).loadGraphic(Paths.image("stages/libitina/finale/GOONS2"));
    insert(13, goons2);
    goons1.scrollFactor.set(0, 0.9);
    goons2.scrollFactor.set(0,0.9);
    goons1.alpha = 0.00000000001;
    goons2.alpha = 0.000000000001;

    she.alpha = 0.00001;
    FinaleBG.alpha = 0.0000001;


}
function replayCrack(){
    crackBG.bitmap.time = 0;
}
function postCreate(){
    for(ee in [iconP1, iconP2, healthBar, healthBarBG]){
        ee.y += 800;
    }
    raluca = [strumLines.members[0].characters[0],strumLines.members[0].characters[1]];
    insert(100, raluca[0]);
    insert(101, raluca[1]);
    for(ee in [raluca[1], raluca[0]]){
        ee.scrollFactor.set(0,0);
        ee.screenCenter();
        ee.scale.set(1.5,1.5);
        ee.x += 80;
        ee.y += 180;
        
    }
    for(ff in [coolWindow]){
        ff.scrollFactor.set(0,0);
        ff.screenCenter();
        ff.scale.set(0.0001,0.0001);
    }
    raluca[1].visible = false;
    raluca[0].visible = false;

    glitchShader = new CustomShader("coolseparation/libitinaGlitch");
    FlxG.camera.addShader(glitchShader);
    glitchShader.glitchThing = 0.0;
    
    lightOverlay = new FunkinSprite().loadGraphic(Paths.image("stages/libitina/lightOverlay"));
    lightOverlay.cameras = [camHUD];
    lightOverlay.blend = BlendMode.ADD;
    lightOverlay.alpha = 0.2;
    insert(0,lightOverlay);

    ghostShader = new WiggleEffect();
    ghostShader.effectType = WiggleEffectType.DREAMY;
    ghostShader.waveAmplitude = 0.02;
	ghostShader.waveFrequency = 3;
	ghostShader.waveSpeed = 1;
    ghostBG.shader = ghostShader.shader;
}

function swapRaluca(){
    raluca[0].visible = !raluca[0].visible;
    raluca[1].visible = !raluca[1].visible;
}
function stepHit(curStep){
    switch(curStep){
        case 348:
            inst.pitch = FlxG.save.data.codenameCurPitch;
            vocals.pitch = FlxG.save.data.codenameCurPitch;
        case 364:
            FlxTween.tween(coolWindow, {"scale.x": 1.2, "scale.y": 1.2}, 1 / inst.pitch, {ease:FlxEase.cubeOut});
        case 384:
            raluca[1].visible = true;
            doFlash(0xFF333333);
        case 640:
            // swapRaluca();
            // ghostBG.alpha =1;
            coolWindow.alpha = 0.000000001;
        case 1195:
            FlxG.camera.fade(0xFF000000, 1 / inst.pitch, false);
        case 1216:
            swapRaluca();
            FlxG.camera.fade(0xFF000000, 0.01, true);
            ghostBG.alpha = 1;
        case 1712:
            staticshit.alpha = 1;
        case 1728:
            staticshit.alpha = 0.0001;
            shadowmilkcookieisthatyou.alpha = 1;
            ghostBG.alpha = 0;
            doFlash(0xFF222222);
        case 1984:
            shadowmilkcookieisthatyou.alpha = 0.0001;
            swapRaluca();
            doFlash(0xFF222222);
            infoBGI.alpha = 1;
        case 2240:
            infoBGI.alpha = 0.0001;
            infoBG.alpha = 1;
            swapRaluca();
            doFlash(0xFFFFB275);
        case 2496:
            infoBG.alpha = 0.00001;
            crackBG.alpha = 1;
            crackBG.play();
            doFlash(0xFF666666 );
        case 3008:
            FlxG.camera.fade(0xFF000000, 0, false);
        case 3025:
            FlxG.camera.fade(0xFF000000, 6 / inst.pitch, true);
            for(eeee in [raluca[0], raluca[1], crackBG, vignette, lightOverlay]){
                eeee.visible = false;
            }
            she.alpha = 1;
            FinaleBG.alpha = 1;
            FlxTween.tween(camSHIT, {y: 500}, 10 / inst.pitch, {ease:FlxEase.cubeOut});
        case 3648:
            FlxG.camera.fade(0xFF000000, 0, false);
        case 3584:
            goons1.alpha = 1;
            goons2.alpha = 1;
            doFlash(0xFF000000);
    }
}
function update(elapsed){
    if(usingShader == true){
        glitchShader.glitchThing = FlxG.random.float(0.05,1);
    }
    ghostShader.update(elapsed);
    camFollow.y = camSHIT.y;

}
function postUpdate(){
    if(startingSong == false && inst.time < 40000){
        inst.pitch = 10;
        vocals.pitch = 10;
    }
}
var disableFlash = false;
function doFlash(colour){
    if (disableFlash == true) return;
    camGame.fade(colour, 0.35 / inst.pitch, true);
}
function shaderThing(dddd){
    usingShader = !usingShader;

    if(usingShader == false){
        glitchShader.glitchThing = 0;
    }
}

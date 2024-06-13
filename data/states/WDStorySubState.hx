import flixel.group.FlxSpriteGroup;
import funkin.backend.chart.Chart;
import flixel.camera.FlxCamera;
// import funkin.backend.chart.ChartData.ChartMetaData;
import funkin.menu.FreeplayState;
import funkin.menus.FreeplayState.FreeplaySonglist;

import haxe.io.Path;
import lime.utils.Assets;
var bruhShader:CustomShader;
var bruhCamera:FlxCamera;

var tempthing:FlxSprite;
var dedseclogo:FlxSprite;
function create(){
FlxG.cameras.add(bruhCamera = new FlxCamera(), false);
bruhCamera.bgColor = 0x00000000;
bruhCamera.addShader(bruhShader = new CustomShader("3D"));
bruhShader.yrot = 0.04;
bruhShader.xrot = 00;
bruhShader.ypos = 0;
// bruhShader.zrot = 0.02;

var tempthing:FlxSprite = new FlxSprite().makeGraphic(400,600, 0xFF000000);
add(tempthing);
tempthing.cameras = [bruhCamera];
tempthing.screenCenter();

bruhCamera.alpha = 0;
bruhCamera.x = 350;

dedseclogo = new FlxSprite().loadGraphic(Paths.image("dedsecshit/logo"));
add(dedseclogo);
dedseclogo.cameras = [bruhCamera];
dedseclogo.x = tempthing.x + 40;
dedseclogo.y = tempthing.y + dedseclogo.height / 10;
dedseclogo.scale.set(1.25,1.25);

// dedseclogo.origin.set(600,0);
// dedseclogo.angle = 10;
FlxTween.tween(bruhCamera, {alpha: 1}, Conductor.crochet / 7000);

}

function update(){
    
        if(FlxG.keys.justPressed.E) closeShit();
        if(FlxG.keys.justPressed.Q) remove(bruhShader);
        // if(FlxG.keys.justPressed.J) {bruhShader.xrot += 0.01; trace("plus X  " + bruhShader.xrot);}
        // if(FlxG.keys.justPressed.L) {bruhShader.xrot -= 0.01; trace("minus X  " + bruhShader.xrot);}

        // if(FlxG.keys.justPressed.U) {bruhShader.zrot += 0.01; trace("plus Z  " + bruhShader.zrot);}
        // if(FlxG.keys.justPressed.O) {bruhShader.zrot -= 0.01; trace("minus Z  " + bruhShader.zrot);}

        if(FlxG.keys.justPressed.U) {dedseclogo.angle += 1; trace("plus Angle  " + dedseclogo.angle);}
        if(FlxG.keys.justPressed.O) {dedseclogo.angle -= 1; trace("minus Angle  " + dedseclogo.angle);}
        
        // if(FlxG.keys.justPressed.I) {bruhShader.yrot += 0.01; trace("plus Y  " + bruhShader.yrot);}
        // if(FlxG.keys.justPressed.K) {bruhShader.yrot -= 0.01; trace("minus Y  " + bruhShader.yrot);}
}


function closeShit(){
    closing = true;
    
    // FlxTween.tween(bruhCamera, {alpha: 1}, Conductor.crochet / 10000);;
    // bruhShader.destroy();
    FlxG.cameras.remove(bruhCamera, true);
        // FlxTween.tween(pfp, {alpha:0}, Conductor.crochet / 1000);
        new FlxTimer().start(Conductor.crochet / 10000, function(tmr:FlxTimer){close(); 
            // parent.call("buttonsIn");
            // FlxG.closeSubState();
            FlxG.save.data.WDReturnButtons = true;
            FlxG.cameras.remove(bruhCamera, true);
    
            });

}

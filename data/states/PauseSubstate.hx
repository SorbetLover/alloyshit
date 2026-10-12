import flixel.addons.display.FlxBackdrop;


var backdrop:FlxBackdrop;
var nyansesii:FunkinSprite;

var botbtn:FunkinSprite;
var merdacam:FlxCamera;

var backdrop1:FlxBackdrop;

var pauseBeat = 0;
var pauseStep = 0;
//// 140 bpm
function create(e){

	menuItems.insert(2, 'Change Diff');

    eventCreate(e);
    /// backdrop
        backdrop = new FlxBackdrop().loadGraphic(Paths.image("drawers"));
        add(backdrop);
        backdrop.alpha = 0.5;
        backdrop.velocity.x = 100;
        backdrop.velocity.y = 30;
}
function eventCreate(e){
        e.music = "property-surgery";
        switch(PlayState.SONG.meta.name){
        default:
            e.music = "property-surgery";
        case "memories":
            e.music = "piggy-menu";
        case "b-epiphany", "b-epiphany-alt", "love n funkin", "hot-air-baloon", "catfight", "its-complicated", "takeover medley":
            e.music = "ddto-menu";
    }
}
var pitchthing:FlxText;
    
function postCreate(){
    if(Conductor.isSorbetBuild){
        bg.visible = false;
    } else {
        camera.bgColor = 0x00000000;
    }
    // trace(FlxG.save.data.codenameCurPitch);
        if(FlxG.save.data.codenameCurPitch == null || FlxG.save.data.codenameCurPitch < 0) FlxG.save.data.codenameCurPitch = 1;
        
        pitchthing = new FlxText(900,400, 0, "[Yr][I+][O-]\n  Pitch = " + FlxG.save.data.codenameCurPitch, 30);
        pitchthing.font = Paths.font("notosans.ttf");
        add(pitchthing);
    // merdacam
        merdacam = new FlxCamera();
        FlxG.cameras.add(merdacam, false);
        merdacam.bgColor = 0x00FFFFFF;    
    //botplay
    #if mobile
        botbtn = new FunkinSprite().makeSolid(300,120,0x33FFFFFF);
        botbtn.x = FlxG.width - 500;
        botbtn.updateHitbox();
        add(botbtn);
        botbtn.cameras = [merdacam];
    #end
}
var fg = FlxG.keys.justPressed;
var fag = FlxG.keys.pressed;


function update(elapsed){
    
#if android
    for (touch in FlxG.touches.list)
    {
        if (touch.justPressed || FlxG.mouse.justPressed)
        {
            var pos = touch.getWorldPosition(merdacam);

            if (botbtn.overlapsPoint(pos, true, merdacam))
            {
                PlayState.instance.player.cpu = !PlayState.instance.player.cpu;
                trace("merda");
            }
        }
    }
#end


    if(fg.Y) FlxG.save.data.codenameCurPitch = 1;

    if(fag.SHIFT){
        if(fg.I) FlxG.save.data.codenameCurPitch += 0.05;
        if(fg.O) FlxG.save.data.codenameCurPitch -= 0.05; 
    } else if (fag.CONTROL) {
        if(fg.I) FlxG.save.data.codenameCurPitch += 1;
        if(fg.O) FlxG.save.data.codenameCurPitch -= 1; 
    } else {

        if(fg.I) FlxG.save.data.codenameCurPitch += 0.1;
        if(fg.O) FlxG.save.data.codenameCurPitch -= 0.1;
    }

    FlxG.save.data.codenameCurPitch = FlxMath.bound(FlxG.save.data.codenameCurPitch, 0.1, 50);
    pitchthing.text = "[Yr][I+][O-]\nPitch = " + FlxG.save.data.codenameCurPitch;
    if (controls.ACCEPT) if (menuItems[curSelected] == "Change Diff") openSubState(new ModSubState("mod/PauseDiffs"), true);
}

function destroy() {
    if (merdacam != null) {
        FlxG.cameras.remove(merdacam);
        merdacam.destroy();
        merdacam = null;
    }
}

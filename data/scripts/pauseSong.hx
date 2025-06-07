import funkin.backend.Conductor;
import funkin.menus.PauseSubState;
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;
var merda:FlxText;
var merda:FlxText;
var pitchnum:Float;
var backdropshit:FlxBackdrop;
function create(event) {
	backdropshit = new FlxBackdrop(Paths.image('editors/drawers'));
    add(backdropshit);
    FlxTween.tween(backdropshit, {"velocity.y": 100, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});
    backdropshit.scale.set(1,1);


    // backdropshit.spacing.x = -14;
    // backdropshit.spacing.y = -14;
    backdropshit.alpha = 0.8;
    switch(PlayState.SONG.meta.name){
        default:
            event.music = "property-surgery";
        case "memories":
            event.music = "piggy-menu";
        case "b-epiphany", "b-epiphany-alt", "love n funkin", "hot-air-baloon", "catfight", "its-complicated", "takeover medley":
            event.music = "ddto-menu";
    }
}

function postCreate(){
    
    merda = new FlxText(20, 15, 0, FlxG.save.data.codenameCurPitch, 32);
    add(merda);
    merda.screenCenter();
    merda.x = FlxG.width - 350;
    
    merda2 = new FlxText(20, 15, 0, FlxG.save.data.codenameCurPitch, 32);
    add(merda2);
    merda2.screenCenter();
    merda2.x = FlxG.width - 350;
    merda2.y += 50;

    for(i in [merda, merda2]){
        i.setFormat(Paths.font("notosans.ttf"), 25);
    }
}
function update(){
    pitchnum = "[Y][U/I] Pitch: " + FlxG.save.data.codenameCurPitch;
    kcnum = "[H][J/K] Mania: " + FlxG.save.data.keyCount;
    merda.text = pitchnum;
    merda2.text = kcnum;

}
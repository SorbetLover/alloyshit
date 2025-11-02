import funkin.backend.Conductor;
import funkin.menus.PauseSubState;
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;
var merda:FlxText;
var pitchnum:Float;
var backdropshit:FlxBackdrop;
var ddtoImage:FlxSprite;
function create(event) {
	// backdropshit = new FlxBackdrop(Paths.image('editors/drawers'));
    // add(backdropshit);
    // FlxTween.tween(backdropshit, {"velocity.y": 100, "velocity.x": PlayState.SONG.meta.bpm}, 0.8, {ease: FlxEase.cubeIn});
    // backdropshit.scale.set(1,1);


    // backdropshit.spacing.x = -14;
    // backdropshit.spacing.y = -14;
    // backdropshit.alpha = 0.8;
            event.music = "ddto-menu";
    merda = new FlxText(20, 15, 0, FlxG.save.data.codenameCurPitch, 32);
    add(merda);
    merda.screenCenter();
    
   if(PlayState.instance.curStep < 255){
        ddtoImage = new FlxSprite().loadGraphic(Paths.image("dokiPort/annie"));
   
     
    }
//    if(PlayState.instance.curStep > 256 && PlayState.instance.curStep < 383){
//         ddtoImage = new FlxSprite().loadGraphic(Paths.image("dokiPort/abby"));
//    }
//    add(ddtoImage);
}
function postCreate(){
    if(PlayState.instance.curStep < 255){
        ddtoImage.screenCenter();
        ddtoImage.x = 700;
        ddtoImage.scale.set(0.3,0.3);            
        FlxTween.tween(ddtoImage, {x: 0}, Conductor.crochet / 500, {ease: FlxEase.cubeOut});     
    }
    // if(PlayState.instance.curStep > 256 && PlayState.instance.curStep < 383){
    //     ddtoImage.screenCenter();
    //     ddtoImage.x = 700;  
    //     ddtoImage.scale.set(0.8,0.8);
    //     ddtoImage.x = 700;
    //     FlxTween.tween(ddtoImage, {x: 500}, Conductor.crochet / 500, {ease: FlxEase.cubeOut});     
    // }
    add(ddtoImage);
   trace("uh");
}

function update(){
    pitchnum = FlxG.save.data.codenameCurPitch;

    // merda.text = pitchnum;

    

}
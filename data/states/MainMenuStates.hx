import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxGridOverlay;
import funkin.game.HealthIcon;
import funkin.backend.Conductor;
import flixel.math.FlxPoint;
import funkin.menus.FreeplayState;
// import flixel.addons.ui.interfaces.IResizable;
// import flixel.addons.ui.FlxUIInputText;
// var sqar:FlxUIInputText;
function postCreate(){
    // sqar = new FlxUIInputText(50, 65, 900, "0", 20, 0xFF000000, 0x00000000);
    // sqar.screenCenter();
    // sqar.y += 350;
    // // sqar.scale.set(2,2);
    // sqar.resize(900,30);
    // sqar.alpha = 1;
    // add(sqar);
    // FlxG.mouse.visible = true;
    // // sqar.focusGained = () -> FlxG.stage.window.textInputEnabled = true;
    // sqar.scrollFactor.set(0,0); 


} 
function update(){
    
    // if(FlxG.mouse.overlaps(sqar)){
    //      txtBoxFocus = true;
    // } else {
    //     txtBoxFocus = false;
    // }
    // if(FlxG.keys.justPressed.ENTER && txtBoxFocus == true){
	// 	PlayState.loadSong(sqar.text,"hard", "false","false");
    //     FlxG.switchState(new PlayState());


	//  }
 
    if(FlxG.keys.justPressed.Z){
        FlxG.switchState(new ModState("TestStoryState"));
         
    }
    // if(FlxG.keys.justPressed.X){
    //     FlxG.switchState(new ModState("ShitStateCredits"));
         
    // }
}


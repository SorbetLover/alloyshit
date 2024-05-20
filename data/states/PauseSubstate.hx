
import funkin.backend.utils.NativeAPI;
import funkin.editors.charter.Charter;

// function create() {
// 	menuItems.insert(3, 'Open Console');

// }

function update() {
    // if (controls.ACCEPT) {

    //     if (menuItems[curSelected] == "Open Console") {
    // 	    	NativeAPI.allocConsole();

	// 	}
    // }
    if(FlxG.keys.justPressed.I && !FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch += 0.1;
	}
	if(FlxG.keys.justPressed.U && !FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch -= 0.1;
	}

	if(FlxG.keys.justPressed.I && FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch += 0.05;
	}
	if(FlxG.keys.justPressed.U  && FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch -= 0.05;
	}

	if(FlxG.keys.justPressed.Y){
		FlxG.save.data.codenameCurPitch = 1;
	}
}
// function postUpdate(){
//     if(FlxG.keys.justPressed.SIX){
// 		NativeAPI.allocConsole();
// 	}
	// if(FlxG.keys.justPressed.SEVEN){
// 		FlxG.switchState(new Charter(PlayState.instance.SONG.meta.name, PlayState.instance.difficulty, false));
// 	}

// }
// /
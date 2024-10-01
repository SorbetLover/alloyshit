
import funkin.backend.utils.NativeAPI;
import funkin.editors.charter.Charter;

function create() {
	menuItems.insert(2, 'Change Diff');
}

function update() {
    if (controls.ACCEPT) {

        if (menuItems[curSelected] == "Change Diff") {
    	    	openSubState(new ModSubState("PauseDiffs"), true);

		}
    }

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
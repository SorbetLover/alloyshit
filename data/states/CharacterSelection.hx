// import funkin.editors.ui.UIModState;
import funkin.editors.ui.UIState;

function update(){
	if(FlxG.keys.justPressed.P){
		FlxG.switchState(new UIState(true,"CharacterBruteForceAlt"));
	}

		
}
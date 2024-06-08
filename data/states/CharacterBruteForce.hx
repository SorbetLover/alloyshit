import funkin.editors.ui.UIWindow;
import funkin.editors.ui.UITextBox;
import funkin.editors.character.CharacterEditor;
import funkin.editors.ui.UIState;

// var window:UIWindow;
var txtinput:UITextBox;
function create(){
	FlxG.sound.music.destroy();

}

function postCreate(){
    window = new UIWindow(400,200,500,200, "Char Brute Load");
	add(window);

    txtinput = new UITextBox(405,260, "", 490,50, false);
    // txtinput.screenCenter();
	
	add(txtinput);
}

function update(){
	if(FlxG.keys.justPressed.ENTER){
			FlxG.switchState(new CharacterEditor(txtinput.label.text));
	}
	// trace("CU");
		if (FlxG.keys.justPressed.TAB)
		FlxG.switchState(new UIState(true, "CharacterBruteForce"));
}
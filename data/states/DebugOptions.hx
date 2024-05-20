var brightenShader = FlxG.state.stateScript.get("brightenShader"); // kinda weird way of getting it but cameras break on static vars.

var xml = FlxG.state.stateScript.get("xml");
var stageGroup = FlxG.state.stateScript.get("stageGroup");

var sprList = FlxG.state.stateScript.get("sprList");
var spriteMap = FlxG.state.stateScript.get("spriteMap");
var charMap = FlxG.state.stateScript.get("charMap");

import funkin.editors.ui.UIText;
import funkin.editors.ui.UIButton;
import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UICheckbox;

var disableBackdrop:UICheckbox;
var enableBeatAnim:UICheckbox;
function create() {
	winTitle = 'Debug Properties';
	
	winWidth = 350;
	winHeight = 200;
}

function createPost() {
	function addLabelOn(ui, text:String) {
		var txt = new UIText(ui.x, ui.y - 5, 0, text);
		txt.y -= txt.height;
		add(txt);
		return txt;
	}











	disableBackdrop = new UICheckbox(0, 0, "disable Backdrop", FlxG.save.data.charEditordisableBackdrop);
	add(disableBackdrop);
	disableBackdrop.x += 8;
	disableBackdrop.y += 40;

	enableBeatAnim = new UICheckbox(0, 0, "beat anim", FlxG.save.data.charEditorenableBeatAnim);
	add(enableBeatAnim);
	enableBeatAnim.x += 8;
	enableBeatAnim.y += 65;













	var saveButton = new UIButton(windowSpr.x + windowSpr.bWidth - 20, windowSpr.y + windowSpr.bHeight - 16 - 32, "Save", function() {
		saveProperties();		
		close();
	}, 75);


	add(saveButton);
	saveButton.frames = Paths.getFrames("editors/ui/grayscale-button");
	saveButton.color = 0xFF00FF00;
	saveButton.x -= saveButton.bWidth;

	var closeButton = new UIButton(saveButton.x - 20, saveButton.y, "Cancel", function() {
		close();
	}, 75);
	add(closeButton);
	closeButton.frames = Paths.getFrames("editors/ui/grayscale-button");
	closeButton.color = 0xFFFF0000;
	closeButton.x -= closeButton.bWidth;
}

function saveProperties() {

	switch(disableBackdrop.checked){
		case false:
		FlxG.save.data.charEditordisableBackdrop = false;
        case true:
		FlxG.save.data.charEditordisableBackdrop = true;

	}
	switch(enableBeatAnim.checked){
		case false:
		FlxG.save.data.charEditorenableBeatAnim = false;
        case true:
		FlxG.save.data.charEditorenableBeatAnim = true;

	}


}

var callPost:Bool = true;
function update() {
	if (callPost) {
		callPost = false;
		createPost();
	}

	if (FlxG.keys.justPressed.ESCAPE)
		close();

}


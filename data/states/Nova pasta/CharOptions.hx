// var brightenShader = FlxG.state.stateScript.get("brightenShader"); // kinda weird way of getting it but cameras break on static vars.

// var xml = FlxG.state.stateScript.get("xml");
// var stageGroup = FlxG.state.stateScript.get("stageGroup");

// var sprList = FlxG.state.stateScript.get("sprList");
// var spriteMap = FlxG.state.stateScript.get("spriteMap");
// var charMap = FlxG.state.stateScript.get("charMap");

import funkin.editors.ui.UIText;
import funkin.editors.ui.UIButton;
import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UINumericStepper;
import funkin.editors.ui.UICheckbox;
import funkin.editors.ui.UIFileExplorer;
import lime.system.System;
var disableBackdrop:UICheckbox;
var enableBeatAnim:UICheckbox;

var customSongPath:UITextBox;
var customBPM:UITextBox;
function create() {
	winTitle = 'Editor Properties';
	
	winWidth = 350;
	winHeight = 300;
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













	var saveButton = new UIButton(windowSpr.x + 200, windowSpr.y + windowSpr.bHeight - 16 - 32, "Save", function() {
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
    
	add(new UIText(90,90,1020, "custom song path", 15));
	customSongPath = new UITextBox(20,110, "", 300, 30);
	add(customSongPath);

	add(new UIText(90,140,1120, "bpm", 15));
	customBPM = new UITextBox(20,160, "", 300, 30);
	add(customBPM);


	var loadButton = new UIButton(saveButton.x + 100, windowSpr.y + windowSpr.bHeight - 16 - 32, "Load", function() {
		// saveProperties();		
		loadCS(customSongPath);
		// trace(Paths.song(customSongPath));
		close();
	}, 75);
	add(loadButton);

    var browse = new UIButton(closeButton.x, loadButton.y - 50, "See BPM", function(){
		System.openFile('mods/alloyshit/songs/' + customSongPath.label.text + '/meta.json');
	});	
	add(browse);

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
function loadCS(path){
    FlxG.save.data.changingCharSong = true;
	FlxG.save.data.charSongPath = path.label.text;
	FlxG.save.data.customBPM = customBPM.label.text;
	trace("loadCS");
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


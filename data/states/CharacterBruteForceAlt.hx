import funkin.editors.ui.UIWindow;
import funkin.editors.ui.UITextBox;
import funkin.editors.character.CharacterEditor;
import funkin.editors.ui.UIState;
import funkin.editors.ui.UIButton;
import haxe.io.Path;

import sys.FileSystem;

import flixel.group.FlxSpriteGroup;
// var window:UIWindow;
var txtinput:UITextBox;
var btG:FlxSpriteGroup;
var foldersToCheck:Array = ["babs", "gif", "gif2"];
function create(){
	FlxG.sound.music.destroy();

}
var cnt:Int = -1;
var lstcnt:Inst = -1;
var col:Int = 0;
// var files:Array = [];
var guh:Array = [];
function postCreate(){
	for(e in FileSystem.readDirectory("mods/alloyshit/data/characters")){
	    if(FileSystem.isDirectory("mods/alloyshit/data/characters/" + e)){
	        trace(Path.withoutExtension(e));
        	guh.push(e);

	    }
    }
	trace(guh);

	btG = new FlxSpriteGroup();
    window = new UIWindow(0,0,1280,720, "Char Brute Load");
	add(window);

    txtinput = new UITextBox(405,260, "", 490,50, false);
    // txtinput.screenCenter();
	
	// add(txtinput);
    for(i in guh){
        lstcnt += 1;
        cnt = -1;
        var files = Paths.getFolderContent("data/characters/" + guh[cnt + 1] + "/");

        for(e in files){
            cnt += 1;
		    if(cnt == 16){ col += 1;
		        cnt = 0;
		    }
            var uhhbt = new UIButton(20 + (230 * lstcnt), 40 + (40 * cnt), files[cnt], function(){FlxG.switchState(new CharacterEditor(i + "/" + Path.withoutExtension(e)));}, 200, 30);
		    add(uhhbt);
	    	// trace(cnt);
	    	// trace(Path.withoutExtension(e));
            btG.add(uhhbt);
        }
    }   	
}

function update(){
	if(FlxG.keys.justPressed.ENTER){
			FlxG.switchState(new CharacterEditor(txtinput.label.text));
	}
	// trace("CU");
		if (FlxG.keys.justPressed.TAB)
		FlxG.switchState(new UIState(true, "CharacterBruteForceAlt"));

        
}
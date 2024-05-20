import flixel.addons.display.FlxBackdrop;
import funkin.editors.ui.UISubstateWindow;
import funkin.backend.utils.NativeAPI;

var charHasDances:Bool = false;
var backdropshit:FlxBackdrop;
var saves = FlxG.save.data;

var avaiableECC:Array = ['jeanL'];
var bgProp:Bool = false;
var stopCharCreation = false;
var otherExtraChar = false;
var shite:FlxSprite;
var extraChar:Character;
var extraChar2:Character;
var invertCanims:Bool = false;
// var extraCharDirPlaying:Bool = false;
function postCreate() {
	if(character.animation.exists("danceLeft") || character.animation.exists("danceRight") || character.isGF == true){ charHasDances = true;}
	backdropshit = new FlxBackdrop(Paths.image('editors/drawers2'));
	trace(charHasDances);

	insert(members.indexOf(character) - 1, backdropshit);
	// add(backdropshit);
    backdropshit.alpha = 1;
	backdropshit.cameras = [charCamera];
	// backdropshit.color = 0x113D3D3D ;
    FlxG.mouse.visible = true;
	// if(saves.charEditorenableBeatAnim == true){
	// FlxG.sound.playMusic(Paths.music('offsetSong'), 1, true);
	// Conductor.changeBPM(128.0);
	// }

	backdropshit.y = 700;
	// trace(backdropshit.x);
	if(saves.charEditorenableBeatAnim == true){
		characterBG.alpha = 0;
	}

    backdropshit.x = character.x;
	backdropshit.y = character.y;
    // if(character.sprite == "jeanL"){
	// extraChar = new Character(-400,0,'ralucacloserv2', false);
	// add(extraChar);
	// extraChar.cameras = [charCamera];
	// extraChar.alpha = 0.5;
	// extraChar.debugMode = true;
	// extraChar.animation.pauseAnim();
	// }
switch(character.sprite){
	case 'jeanL':
	    extraChar = new Character(-500,0,'ralucacloserv2', false);
	case '8bitsaloon':
		extraChar = new Character(-500,340,'gifmad', false);
	case 'armRoboF', 'armScarlet', 'arm', 'armYui':
		bgProp = true;
        otherExtraChar = true;
    	
		extraChar = new Character(80,-200,'fever_rolldog', true);
		extraChar2 = new Character(-530,220,'rolldog', false);
		
		shite = new FlxSprite(-600,-100).loadGraphic(Paths.image("stages/rolldog/bg chairs"));
		insert(members.indexOf(character)-1, shite);
		invertCanims = true;
		// shite.flipX = true;
	case 'cellbit':
	    extraChar = new Character(400,-50,'felps', false);
		
    default:
		stopCharCreation = true;
   
}
if(stopCharCreation == false){

	extraChar.alpha = 0.5;
	extraChar.cameras = [charCamera];
	extraChar.debugMode = true;
	insert(members.indexOf(character)-1 , extraChar);

	if(bgProp == true) shite.cameras = [charCamera];
	if(otherExtraChar == true) extraChar2.cameras = [charCamera]; 	insert(members.indexOf(extraChar), extraChar2); extraChar2.alpha = 0.5; extraChar2.debugMode = true;
	
}
}

function update(){

	if(saves.charEditordisableBackdrop == true){ backdropshit.alpha = 0; }
	if(saves.charEditordisableBackdrop == false){ backdropshit.alpha = 1; }

	if(FlxG.keys.justPressed.SEVEN){
		openSubState(new UISubstateWindow(true, "CharOptions"));


	}
	// uiCamera.zoom = FlxG.save.data.charEditorUIZoom;
    if(saves.charEditorenableBeatAnim == true && FlxG.sound.music.playing == false){
		FlxG.sound.playMusic(Paths.music('offsetSong'), 1, true);
		Conductor.changeBPM(128.0);
			backdropshit.velocity.x = 0;
			// backdropshit.x = 0;
			characterBG.alpha = 0;
			// trace(backdropshit.x);
			switch(character.getAnimName()){
				case "idle":
					playAnimation("idle");
			}
	

	}
	if(saves.charEditorenableBeatAnim == false && FlxG.sound.music.playing == true){
			FlxG.sound.music.destroy();
				backdropshit.velocity.x = 10;
                characterBG.alpha = 1;
		
    }
	if(stopCharCreation == false && FlxG.mouse.justPressed){
		
		switch(character.getAnimName()){
            case 'singLEFT': extraChar.playAnim("singRIGHT");
            case 'singRIGHT': extraChar.playAnim("singLEFT");
			case 'singUP': extraChar.playAnim("singUP");
            case 'singDOWN': extraChar.playAnim("singDOWN");

		}
	}
	
	if(stopCharCreation == false && invertCanims == false){
		
		switch(character.getAnimName()){
            case 'singLEFT': extraChar.playAnim("singLEFT");
            case 'singRIGHT': extraChar.playAnim("singRIGHT");
			case 'singUP': extraChar.playAnim("singUP");
            case 'singDOWN': extraChar.playAnim("singDOWN");

		}
	}

}
var danceBool:Bool = false;
function beatHit(curBeat){


	if(curBeat % 4 == 0 || curBeat == 0){
		backdropshit.scale.set(1.1,1.1);
		FlxTween.tween(backdropshit, {"scale.x": 1, "scale.y": 1}, Conductor.crochet / 1000, {ease: FlxEase.cubeOut});
		if(otherExtraChar == true) extraChar2.playAnim("idle");

		if(charHasDances == false){
	    	switch(character.getAnimName()){
                case "idle":
    		        playAnimation("idle");
					if(stopCharCreation == false) extraChar.playAnim("idle"); 					
				
			}
	    }

	}
    if(charHasDances == true && curBeat % 2 == 0){
	    	switch(character.getAnimName()){
                case "danceLeft":
					playAnimation("danceRight");
				case "danceRight":
					playAnimation("danceLeft");

	    }

	}

}


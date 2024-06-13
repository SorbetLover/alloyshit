import funkin.editors.charter.Charter;
import funkin.editors.charter.Charter;
import funkin.editors.charter.CharterBackdropGroup;
import funkin.editors.charter.Charter;
import funkin.editors.charter.CharterBackdropGroup.CharterBackdrop;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxGridOverlay;
import funkin.game.HealthIcon;
import funkin.backend.system.Conductor;
import flixel.math.FlxPoint;
import funkin.editors.charter.Charter;
import funkin.editors.charter.CharterEvent;
import funkin.editors.ui.UIWindow;
import funkin.editors.ui.UICheckbox;

import funkin.editors.ui.UIText;
var backdropshit:FlxBackdrop;
// var FlxG.save.data = FlxG.save.data;

var curPitch:Float;
function create() {
	
    // quant = 16;
	// quants = [6,12, 18, 1212];
	gridColor1 = 0xFFFF5555;

}
// var	meh = new UIWindow(0,520,160,200, "bruu");
var pitTXT = new UIText(600,0,200,"pitch", 18);
function postCreate() { 
	// add(meh);
	add(pitTXT);
	for(i in [ pitTXT]) i.cameras = [uiCamera];
	// meh.x = 400;
	backdropshit = new FlxBackdrop(Paths.image('editors/drawers2'));

	insert(members.indexOf(charterBG) + 1, backdropshit);
    backdropshit.cameras = [charterCamera];
    charterBG.alpha = 0;
    backdropshit.alpha = 1;
	backdropshit.color = 0x113D3D3D ;
    FlxG.mouse.visible = true;


	// curPitch = vocals.pitch;


}
function update() {
	
	pitTXT.text = "pitch:" + FlxG.save.data.codenameCurPitch;
	if(FlxG.sound.music.playing){
		backdropshit.velocity.x = 0;

	} else {
		backdropshit.velocity.x = 	Conductor.bpm * 0.8 * vocals.pitch;

	}
	// if(FlxG.keys.justPressed.I && !FlxG.keys.pressed.SHIFT){
	// 	vocals.pitch += 0.1;
		
	// 	FlxG.sound.music.pitch += 0.1;
	
	// 	FlxG.save.data.codenameCurPitch += 0.1;
	// }
	// if(FlxG.keys.justPressed.U && !FlxG.keys.pressed.SHIFT){
	// 	vocals.pitch -= 0.1;
	// 	FlxG.save.data.codenameCurPitch -= 0.1;

	// 	FlxG.sound.music.pitch -= 0.1;
		
	// }

	// if(FlxG.keys.justPressed.I && FlxG.keys.pressed.SHIFT){
	// 	vocals.pitch += 0.05;
		
	// 	FlxG.sound.music.pitch += 0.05;
	// 	FlxG.save.data.codenameCurPitch += 0.05;
	// }
	// if(FlxG.keys.justPressed.U  && FlxG.keys.pressed.SHIFT){
	// 	vocals.pitch -= 0.05;
		
	// 	FlxG.sound.music.pitch -= 0.05;
	// 	FlxG.save.data.codenameCurPitch -= 0.05;
	// }

	// if(FlxG.keys.justPressed.Y){
	// 	vocals.pitch = 1;
		
	// 	FlxG.sound.music.pitch = 1;
	// 	FlxG.save.data.codenameCurPitch = 1;
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
	vocals.pitch = FlxG.save.data.codenameCurPitch;
	FlxG.sound.music.pitch = FlxG.save.data.codenameCurPitch;

	if(FlxG.save.data.codenameCurPitch < 0.01){FlxG.save.data.codenameCurPitch = 0.1;}
	

}
// function postUpdate(){
// 	// if(curBeat % 8 == 0){
// 	// FlxG.camera.zoom = 1.05;
// 	// FlxTween.tween(FlxG.camera, {zoom: 1}, 0.4, {ease: FlxEase.cubeOut});
// 	// }
//     // strumLines.members[2].healthIcons.scale.y = 4;    
//     charterBG.x += 1;  
// 	charterBG.color = 0xFF3F2E44; // white
// }
function postUpdate(){
	
    gridBackdrops.members.alpha = 0;
}



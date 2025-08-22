import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;
import flixel.FlxObject;
var subs:FlxText;
function postCreate(){
	camGame.followLerp = 10;
	if(PlayState.SONG.meta.displayName == "Black Chrome" ){
		// for(e in strumLines.members[0]){
		// 	e.y -= 1000;
		//  }
		//  for(e in strumLines.members[1]){
		// 	e.y -= 1000;
		//  }
	}
    // subs = new FlxText(1, 19, 400, "", 32);
    // subs.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    // subs.text = "AAA";
	// subs.cameras = [camHUD];
	// subs.x = camGame.width / 2.5; 
	// add(subs);
    // subs.alignment = FlxTextAlign.CENTER; 
	

}
function postUpdate(){
	// switch(strumLines.members[0].characters[0].getAnimName()) {
    //     case "singLEFT": camFollow.setPosition(490, 400);
    //     // case "singDOWN": camFollow.setPosition(550, 370);
    //     // case "singUP": camFollow.setPosition(520, 430);
    //     case "singDOWN": camFollow.setPosition(520,400);
    //     case "singUP": camFollow.setPosition(520,400);
    //     case "singRIGHT": camFollow.setPosition(550, 400);
    //     case "idle": 	camFollow.setPosition(520,400);

 	// }
	 camFollow.setPosition(520,400);
	curCameraTarget = -1;
	// camFollow.setPosition(520,400);
	boyfriend.alpha = 0;
	gf.alpha = 0;
if(FlxG.keys.justPressed.X){
	strumLines.members[1].cpu = true;
}
}


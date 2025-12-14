import flixel.tweens.FlxEase;
var upd;
var upd1;
var bf;
var bf1;

var mania:Int = 4;
#if !android
var skew:CustomShader;
#end
var strumpos:Array = [[], []];
var strumpos1:Array = [[], []];

var strd;

var ogscale = 1;
function create(){
	importScript("data/scripts/remorse-cu");

}
function postCreate(){
	player.cpu = true;

	healthBar.alpha = 0;
	iconP2.visible = false;
	iconP1.visible = false;
	healthBarBG.visible = false;
	#if !android
	camHUD.addShader(skew = new CustomShader("3D"));

	skew.yrot = 0;
	skew.xrot = 0;
	#end
	upd = strumLines.members[0].characters[0]; 
	upd1 = strumLines.members[0].characters[1];
	bf = strumLines.members[1].characters[0];
	bf1 = strumLines.members[1].characters[1];
	
	upd1.x = upd.x;
	bf1.x = bf.x;
	upd1.alpha = 0;
	bf1.alpha = 0;
	doors.animation.pause();
	intercom2.animation.pause();
	intercom.animation.pause();
	
	mania = strumLines.members[0].length;

	strumLines.members[2].characters[0].visible = false;
	for(i in strumLines.members[2].members){
		i.visible = false;
		i.x += 2000;
	}
	new FlxTimer().start(0.03, function(){
		for(i in 0...mania){

			strumLines.members[0].members[i].x -= 10;
			strumLines.members[1].members[i].x += 30;
			
			strumpos[0].push(strumLines.members[0].members[i].x);
			strumpos[1].push(strumLines.members[0].members[i].y);

			strumpos1[0].push(strumLines.members[1].members[i].x);
			strumpos1[1].push(strumLines.members[1].members[i].y);
		}
	});
	
	strd = [strumLines.members[0], strumLines.members[1]];

	ogscale = strd[0].members[0].scale.x;

}


function onStartCountdown(){

}
function onSongStart(){
}

var tweeningscroll = false;

var unbindthestrums = false;
var lerp = 0.05;
var scrollLerp = 0.01;

var dizzy = false;
var delta = 0;
var goup = false;
var intendedScrollSpeed = 2;
function postUpdate(elapsed){
	#if !android
	skew.yrot = FlxMath.lerp(skew.yrot, 0, 0.05);
	skew.xrot = FlxMath.lerp(skew.xrot, 0, 0.05);
	#end
	// scrollSpeed = intendedScrollSpeed;
	delta += elapsed;

	if(FlxG.keys.justPressed.I){
		goup = !goup;
	}
	if(dizzy == true){
		unbindthestrums = true;
		var thestrum = PlayState.instance.opponentMode ? 0 : 1; 
		for(i in [thestrum]){
			for(e in 0...mania){
				
				if(e % 2 == 0){
					strd[i].members[e].x = ((((FlxG.width / mania) -50) * e) + 180) + 20 * Math.cos(delta);
					strd[i].members[e].y = strumpos[1][0] + 20 * Math.sin(delta);
				} else {
					strd[i].members[e].y = strumpos[1][0] + 20 * Math.cos(delta);
					strd[i].members[e].x = ((((FlxG.width / mania) -50) * e) + 180) + 20 * Math.sin(delta);
	
				}
			}
		}
			for(e in 0...mania){
				strd[PlayState.instance.opponentMode ? 1 : 0].members[e].y = 1000;
			}

	} else {
		unbindthestrums = false;
	}
	if(mania != null && unbindthestrums == false && strumpos != null && !startingSong){
		for(i in 0...mania){
			strumLines.members[0].members[i].x = FlxMath.lerp(strumLines.members[0].members[i].x, strumpos[0][i], lerp);
			strumLines.members[1].members[i].x = FlxMath.lerp(strumLines.members[1].members[i].x, strumpos1[0][i], lerp);
			if(goup == false){

				strumLines.members[0].members[i].y = FlxMath.lerp(strumLines.members[0].members[i].y, strumpos[1][0], lerp);
				strumLines.members[1].members[i].y = FlxMath.lerp(strumLines.members[1].members[i].y, strumpos[1][0], lerp);
				if(!tweeningscroll) scrollSpeed = FlxMath.lerp(scrollSpeed, intendedScrollSpeed, scrollLerp);
			} else {
				strumLines.members[0].members[i].y = FlxMath.lerp(strumLines.members[0].members[i].y, FlxG.height - 160, lerp);
				strumLines.members[1].members[i].y = FlxMath.lerp(strumLines.members[1].members[i].y, FlxG.height - 160, lerp);

				if(!tweeningscroll) scrollSpeed = FlxMath.lerp(scrollSpeed, -intendedScrollSpeed, scrollLerp);
			}


		}
	}

	if(!startingSong){
		for(i in 0...mania){
			strumLines.members[0].members[i].scale.x = FlxMath.lerp(strumLines.members[0].members[i].scale.x ,ogscale, 0.05);
			strumLines.members[1].members[i].scale.x = FlxMath.lerp(strumLines.members[1].members[i].scale.x ,ogscale, 0.05);
		}
	}

	if(PlayState.instance.curStep >= 1493){
		tweeningscroll = true;
		scrollSpeed = FlxMath.lerp(scrollSpeed, 0.5, 0.002);
	}
	if(PlayState.instance.curStep == 1540){
		camHUD.fade(0xFF000000, 1, false);
	}
}
var uh = false;
var u2h = false;
var u3h = false;
function stepHit(curStep){
	switch(curStep){
		case 256:
			scrollSpeed = 3;
		case 768:
			intendedScrollSpeed = 3;
		case 896:
			dizzy = true;
			intendedScrollSpeed = 2.3;
			scrollSpeed = intendedScrollSpeed;
			hall.alpha = 0;
			intercom.alpha = 0;
			upd.alpha = 0;
			upd1.alpha = 1;
			bf.alpha = 0;
			bf1.alpha = 1;
			lightzY.alpha = 0;
		case 1152:
			dizzy = false; 
			
			for(e in 0...mania){
				strd[PlayState.instance.opponentMode ? 1 : 0].members[e].y = strumpos1[1][0];
				strd[PlayState.instance.opponentMode ? 1 : 0].members[e].x = strd[PlayState.instance.opponentMode ? 0 : 1].members[e].x;
			}
			
			lightzY.alpha = 1;
			hall.alpha = 1;
			intercom.alpha = 1;
			upd.alpha = 1;
			upd1.alpha = 0;
			bf.alpha = 1;
			bf1.alpha = 0;
	}
	#if !android
	if(curStep % 4 == 0 && curStep >= 384 && curStep <= 511){
		if(uh == false){
			skew.yrot = -0.1;
			uh = true;
		} else {
			skew.yrot = 0.1;
			uh = false;
		}
		
		skew.xrot = 0.1;
		for(i in 0...4){
			strumLines.members[0].members[i].scale.x = ogscale + 0.2;
			strumLines.members[1].members[i].scale.x = ogscale + 0.2;
		}
	}
	if(curStep % 16 == 0 && curStep >= 384 && curStep <= 511){

		switch(u2h){
			case false:
			stry = strumpos[1][1] + 500;
			case true: 
			stry = strumpos[1][1];
		}
		u2h = !u2h;
		stra = !stra;
	}

	if(curStep % 4 == 0 && curStep >= 1024 && curStep <= 1407){
		switch(u3h){
			case false:
				skew.xrot = 0.1;
			case true:
				skew.xrot = -0.1;
		}

		u3h = !u3h;
	}
	#end
}
function onNoteHit(e){
	if(e.character.curCharacter == "disablethis"){
		trace(e.direction);
		switch(e.direction){
			case 0:
				strumBeat();
			case 1:
				goup = !goup;
			case 2:
				speedBeat();
		}
	}
}

function onStrumCreation(e){
	e.cancelAnimation();
}
function speedBeat(){
	scrollSpeed -= 2;
	scrollLerp = 0.002;
}
function strumBeat(){

	switch(mania){
		case 6:
			for(i in [0,1]){
				strd[i].members[0].x -= 40;
				strd[i].members[1].x -= 30;
				strd[i].members[2].x -= 20;

				strd[i].members[3].x += 20;
				strd[i].members[4].x += 30;
				strd[i].members[5].x += 40;
			}
	}
}
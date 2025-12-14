import flixel.tweens.FlxEase;
var upd;
var upd1;
var bf;
var bf1;

var skew:CustomShader;
function postCreate(){

	camHUD.addShader(skew = new CustomShader("3D"));
	skew.yrot = 0;
	skew.xrot = 0;
	upd = strumLines.members[0].characters[0]; 
	upd1 = strumLines.members[0].characters[1];
	bf = strumLines.members[1].characters[0];
	bf1 = strumLines.members[1].characters[1];
	
	// player.cpu = true;

	upd1.x = upd.x;
	bf1.x = bf.x;
	upd1.alpha = 0;
	bf1.alpha = 0;
	doors.animation.pause();
	intercom2.animation.pause();
	intercom.animation.pause();
	dad.debugMode = true;
	
	for(i in 0...4){
		for(e in [0,1]){
			strumLines.members[e].members[i].alpha = 0;
		}
	}

}
var strumpos:Array = [[], []];
var strumpos1:Array = [[], []];


function onStartCountdown(){
	dad.playAnim("in");

	strumpos[0].push(strumLines.members[0].members[0].x);
	strumpos[0].push(strumLines.members[0].members[1].x);
	strumpos[0].push(strumLines.members[0].members[2].x);
	strumpos[0].push(strumLines.members[0].members[3].x);

	strumpos[1].push(strumLines.members[0].members[0].y);
	strumpos[1].push(strumLines.members[0].members[1].y);
	strumpos[1].push(strumLines.members[0].members[2].y);
	strumpos[1].push(strumLines.members[0].members[3].y);

	strumpos1[0].push(strumLines.members[1].members[0].x);
	strumpos1[0].push(strumLines.members[1].members[1].x);
	strumpos1[0].push(strumLines.members[1].members[2].x);
	strumpos1[0].push(strumLines.members[1].members[3].x);

	strumpos1[1].push(strumLines.members[1].members[0].y);
	strumpos1[1].push(strumLines.members[1].members[1].y);
	strumpos1[1].push(strumLines.members[1].members[2].y);
	strumpos1[1].push(strumLines.members[1].members[3].y);

	trace(strumpos);
	trace(strumpos1);


}
var ustarted:Bool = false;
function onSongStart(){
	ustarted = true;
	dad.playAnim("out");
	new FlxTimer().start(2, function(tmr:FlxTimer){
		dad.debugMode = false;
	});
		for(i in 0...4){
			for(e in [0,1]){
				strumLines.members[e].members[i].alpha = 1;
				strumLines.members[e].members[i].x -= 90;
				strumLines.members[e].members[i].y -= 160;
			}
		}

	
}

var alrstarted:Bool = false;
function postUpdate(elapsed){
	modcU(elapsed);
	skew.yrot = FlxMath.lerp(skew.yrot, 0, 0.05);
	skew.xrot = FlxMath.lerp(skew.xrot, 0, 0.05);

	if(ustarted == false){
		for(i in 0...4){
			strumLines.members[1].members[i].alpha = 0;
			strumLines.members[0].members[i].alpha = 0;
		}
	}
	
	if(startingSong){
		
		strumLines.members[0].members[0].x = 96;
		strumLines.members[0].members[1].x = 208;
		strumLines.members[0].members[2].x = 320;
		strumLines.members[0].members[3].x = 432;
		
		strumLines.members[1].members[0].x = 736;
		strumLines.members[1].members[1].x = 848;
		strumLines.members[1].members[2].x = 960;
		strumLines.members[1].members[3].x = 1072;

		for(i in 0...4){
			strumLines.members[0].members[i].y = 50;
			strumLines.members[1].members[i].y = 50;

		}
	}

}
var strumlerp = false;
var uh = false;
var u2h = false;
var u3h = false;
var stry = strumpos[1][0];
var stra = true;
function stepHit(curStep){
	modc(curStep);
	// if(PlayState.instance.curStep >= 1024 && PlayState.instance.curStep <= 1152){
		
	// }

	switch(curStep){
		case 256:
			scrollSpeed = 3;
		case 896:
			hall.alpha = 0;
			intercom.alpha = 0;
			upd.alpha = 0;
			upd1.alpha = 1;
			bf.alpha = 0;
			bf1.alpha = 1;
			lightzY.alpha = 0;
		case 1152:
			lightzY.alpha = 1;
			hall.alpha = 1;
			intercom.alpha = 1;
			upd.alpha = 1;
			upd1.alpha = 0;
			bf.alpha = 1;
			bf1.alpha = 0;
	}
	
}
function modc(curStep){
	var time = 3;
	switch(curStep){
		case 0:
			FlxTween.tween(strumLines.members[0].members[0], {x: strumpos[0][0], y: strumpos[1][0], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 16:
			FlxTween.tween(strumLines.members[0].members[1], {x: strumpos[0][1], y: strumpos[1][1], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 32:
			FlxTween.tween(strumLines.members[0].members[2], {x: strumpos[0][2], y: strumpos[1][2], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 48:
			FlxTween.tween(strumLines.members[0].members[3], {x: strumpos[0][3], y: strumpos[1][3], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});

		case 64:
			FlxTween.tween(strumLines.members[1].members[0], {x: strumpos1[0][0], y: strumpos1[1][0], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 80:
			FlxTween.tween(strumLines.members[1].members[1], {x: strumpos1[0][1], y: strumpos1[1][1], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 96:
			FlxTween.tween(strumLines.members[1].members[2], {x: strumpos1[0][2], y: strumpos1[1][2], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 112:
			FlxTween.tween(strumLines.members[1].members[3], {x: strumpos1[0][3], y: strumpos1[1][3], alpha:1}, time / inst.pitch, {ease: FlxEase.bounceOut});
		case 255:
			strumlerp = true;
		case 256, 261, 268, 272, 278, 284, 288, 294, 300, 304, 310, 316, 318, 320, 326, 332, 336, 342, 348, 352, 358, 364, 368, 374, 380:
			scrollSpeed = 2.5;
			strumLines.members[0].members[0].x -= 40;
			strumLines.members[0].members[1].x -= 20;
			
			strumLines.members[0].members[2].x += 20;
			strumLines.members[0].members[3].x += 40;
			
			strumLines.members[1].members[0].x -= 40;
			strumLines.members[1].members[1].x -= 20;
			
			strumLines.members[1].members[2].x += 20;
			strumLines.members[1].members[3].x += 40;
	}
	
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
			strumLines.members[0].members[i].scale.x = 1.2;
			strumLines.members[1].members[i].scale.x = 1.2;
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

}
var _elapses:Float = 0;
function modcU(elapsed){
	_elapses += elapsed * 1;

	if(strumlerp == true){
		for(i in 0...4){
			strumLines.members[0].members[i].x = FlxMath.lerp(strumLines.members[0].members[i].x ,strumpos[0][i], 0.05);
			strumLines.members[1].members[i].x = FlxMath.lerp(strumLines.members[1].members[i].x ,strumpos1[0][i], 0.05);
			

			strumLines.members[0].members[i].scale.x = FlxMath.lerp(strumLines.members[0].members[i].scale.x ,0.7, 0.05);
			strumLines.members[1].members[i].scale.x = FlxMath.lerp(strumLines.members[1].members[i].scale.x ,0.7, 0.05);
			// trace("uhg");
			if(PlayState.instance.curStep >= 384 && PlayState.instance.curStep <= 511){

			strumLines.members[0].members[i].y = FlxMath.lerp(strumLines.members[0].members[i].y , stry, 0.05);
			strumLines.members[1].members[i].y = FlxMath.lerp(strumLines.members[1].members[i].y , stry, 0.05);
			}
		}
	}
	if(stra == true){
		for(i in 0...4){
			strumLines.members[0].members[i].angle = 0;
			strumLines.members[1].members[i].angle = 0;
		} 
	} else {
		
		for(i in 0...4){
			strumLines.members[0].members[i].angle = 180;
			strumLines.members[1].members[i].angle = 180;
		} 
	}

	if(PlayState.instance.curStep >= 896 && PlayState.instance.curStep <= 1152){
		for(i in [0,1]){
			var bruh = FlxG.width / 5.5;
			strumLines.members[i].members[0].x = (bruh * 1)+20*Math.sin(_elapses);
			strumLines.members[i].members[1].x = (bruh * 2)+20*Math.sin(-_elapses);
			strumLines.members[i].members[2].x = (bruh * 3)+20*Math.sin(_elapses);
			strumLines.members[i].members[3].x = (bruh * 4)+20*Math.sin(-_elapses);
			
			strumLines.members[i].members[0].y = 50+20*Math.cos(_elapses);
			strumLines.members[i].members[1].y = 50+20*Math.cos(-_elapses);
			strumLines.members[i].members[2].y = 50+20*Math.cos(_elapses);
			strumLines.members[i].members[3].y = 50+20*Math.cos(-_elapses);
		}

		if(PlayState.opponentMode == false){
			for(i in 0...4) {
				for(e in cpu.notes){
					e.alpha = 0;
				}
				
				strumLines.members[0].members[i].alpha = 0;
			}
		} 
		if(PlayState.opponentMode == true) {
			for(i in 0...4) {
				for(e in player.notes){
					e.alpha = 0;
				}
				strumLines.members[1].members[i].alpha = 0;
			}
		} 
	} else {
		for(i in 0...4) {
			for(e in cpu.notes){
				e.alpha = 1;
			}
			for(e in player.notes){
				e.alpha = 1;
			}
			strumLines.members[1].members[i].alpha = 1;
			strumLines.members[0].members[i].alpha = 1;

		}

	}

	if(PlayState.instance.curStep >= 1493){
		scrollSpeed = FlxMath.lerp(scrollSpeed, 0.5, 0.002);
	}

	if(PlayState.instance.curStep == 1540){
		camHUD.fade(0xFF000000, 1, false);
	}
}
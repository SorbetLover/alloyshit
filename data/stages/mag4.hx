var thrw:Bool = false;
function update(elapsed){
if(thrw == false){
	switch(strumLines.members[2].characters[0].getAnimName()){
		case "singLEFT":
			mcfunny.x = 100 - FlxG.random.int(0, 20);
			mcfunny.y = 74;

			mcfunny.angle = -15;
		case "singRIGHT":
			mcfunny.x = 290  + FlxG.random.int(0,20);
			
			mcfunny.angle = 15;
			mcfunny.y = 74;
		case "singUP":
			mcfunny.y = 190  + FlxG.random.int(0,20);
			mcfunny.x = 191;

			mcfunny.angle = 0;
		case "singDOWN":
			mcfunny.y = -10  - FlxG.random.int(0,20);
			mcfunny.x = 191;
			
			mcfunny.angle = 0;
	}
	mcfunny.x = FlxMath.lerp(mcfunny.x, 191, 0.1);
	mcfunny.y = FlxMath.lerp(mcfunny.y, 74, 0.1);
	mcfunny.angle = FlxMath.lerp(mcfunny.angle, 0, 0.2);
	}

	if(thrw == true){
	mcfunny.angle = FlxMath.lerp(mcfunny.angle, mcfunny.angle += 10, 0.2);
	}
}


function stepHit(curStep){
	if(curStep == 633){
		thrw = true;
		FlxTween.tween(mcfunny, {x: 2000}, Conductor.crochet / 800, {ease:FlxEase.backIn});	
	
	}
}
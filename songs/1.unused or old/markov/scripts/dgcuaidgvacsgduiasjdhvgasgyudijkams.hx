// 

function stepHit(curStep){

	switch(curStep){
        case 704, 768, 832, 864, 880, 896, 1328, 2016, 2048, 2080, 2112: // song ones
            markeye();
        case 992, 1008, 1024, 1040, 1056, 1072, 1088, 1104, 1376, 1408, 1632, 1648, 1664, 1696, 1728, 1972, 1997, 2600, 2703: // additional
            markeye();
        case 1248:
            markeye();
            markeye();
    }
}
function markeye(){
	if(FlxG.save.data.disableMarkovEyes == false){
                var val1:Float = FlxG.random.int(1000,0);
				var val2:Float = FlxG.random.int(500,0);
				
				var eye:FlxSprite = new FlxSprite(val1, val2);
				eye.frames = Paths.getSparrowAtlas('MarkovEyes');
				eye.animation.addByPrefix('idle', 'MarkovWindow', 24, false);
				eye.animation.play('idle');
				eye.antialiasing = true;
				eye.scrollFactor.set();
				eye.cameras = [camHUD];
                insert(members.indexOf(iconP2) + 1, eye);
                // TODO: make this delete itself so it don't take up memory lol
				// goku goes super saiyan
				new FlxTimer().start(4.61, function(tmr:FlxTimer)
				{
					remove(eye);
				});
	}
}
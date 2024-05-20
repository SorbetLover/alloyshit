
import flixel.text.FlxText;
import flixel.addons.text.FlxTypeText;
// import Random;
import flixel.group.FlxGroup.FlxTypedGroup;

var funnTextGroup:FlxTypedGroup<FlxText>;
function create(){
	
	trace("sadsadasjdjaskdj");
}
function postCreate(){
	player.cpu = true;
	funnTextGroup = new FlxTypedGroup();
	funnTextGroup.cameras = [camHUD];
	add(funnTextGroup);

	defaultCamZoom = 0.9;
    FlxG.camera.zoom = 0.9;
	// strumLines.members[1].characters[1].x = 1400;
	// strumLines.members[1].characters[1].y = 370;
	// strumLines.members[1].characters[1].scale.set(7,7);
    // strumLines.members[0].characters[1].x -= 20;
	// strumLines.members[0].characters[1].scale.set(1.2,1.2);
	
	// strumLines.members[0].characters[1].alpha = 0;
	
	for(i in [ dana, barbg2, dorth, jill, alma]){
		i.alpha  = 0;
	}
}
var turnniconico:Bool = false;
var jillShit:Bool = false;
function stepHit(curStep){
	switch(curStep){

		case 512:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);

		for(i in [dana, barbg2,jill]){
				i.alpha  = 1;
			}
			// for(o in [sky, trees, path, bench, roses, strumLines.members[1].characters[0],strumLines.members[0].characters[0]]){
                // o.alpha = 0;
			// }
			getblue();
			// strumLines.members[0].characters[1].x += 200;
			defaultCamZoom = 0.8;

		jillShit = true;
		case 768:
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);

			for(i in [alma, dorth]){
				i.alpha = 1;
			}
		case 1024:
           turnniconico = true;
		case 1220:
			turnniconico = false;
		case 1280:
			for(i in [alma, dorth,dana, barbg2,jill, ]){
				i.alpha  = 0;
			}
			for(o in [sky, trees, path, bench, roses]){
                o.alpha = 1;
			}
			getnormal();
			FlxG.camera.fade(0xFFFFFFFF,0.4,true);



	}
}

function beatHit(){
	if(turnniconico == true){
	    niconicoLights();
	}

}

function postUpdate(){
      if(jillShit == true){
		switch(curCameraTarget){
			case 0:
				camFollow.setPosition(1300,750);
			case 1:
				camFollow.setPosition(1400,840);

		}
	  }
}

function niconicoLights()
	{
		trace("It's happenin!");
			var nicoText:Array<String> = CoolUtil.coolTextFile(Paths.txt("nicoText"));
	
			// if (Date.now().getDay() != 5)
			// 	nicoText.push("it's not even friday...");
			// // else https://youtu.be/SaNmV7Sx5_M
			
			var randomText:String = nicoText[FlxG.random.int(0, nicoText.length)];
			trace(randomText);
			var funnyText:FlxText = new FlxText(0, 0, 0, randomText, 50);
			funnyText.scrollFactor.set();
			funnyText.setFormat('CyberpunkWaifus', 50, FlxColor.WHITE);
			funnyText.setPosition(FlxG.width + funnyText.width, FlxG.random.float(0, 650));
			funnyText.antialiasing = false;
			funnTextGroup.add(funnyText);
			FlxTween.tween(funnyText, {x: -funnyText.width / defaultCamZoom}, FlxG.random.float(4, 12), {
				ease: FlxEase.linear, 
				onComplete: function(tween:FlxTween)
				{
					funnTextGroup.remove(funnyText);
				}
			});
		
}

function getblue(){
	sky.loadGraphic(Paths.image("stages/hazbin/blue/sky"));
	trees.loadGraphic(Paths.image("stages/hazbin/blue/trees"));
	path.loadGraphic(Paths.image("stages/hazbin/blue/path"));
	bench.loadGraphic(Paths.image("stages/hazbin/blue/bench"));
	roses.loadGraphic(Paths.image("stages/hazbin/blue/roses"));
}


function getnormal(){
	sky.loadGraphic(Paths.image("stages/hazbin/sky"));
	trees.loadGraphic(Paths.image("stages/hazbin/trees"));
	path.loadGraphic(Paths.image("stages/hazbin/path"));
	bench.loadGraphic(Paths.image("stages/hazbin/bench"));
	roses.loadGraphic(Paths.image("stages/hazbin/roses"));
}
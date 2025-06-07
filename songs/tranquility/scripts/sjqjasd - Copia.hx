var t1;
var t2;
var t3;
var t4;

var movingCam:Bool = false;
var hmalpha:Float = 1;
var campos:FlxSprite;
function postUpdate(elapsed){


    if(movingCam == true){
        camFollow.setPosition(campos.x, campos.y);
    } else {
        campos.setPosition(camFollow.x, camFollow.y);
    }


    if(!camZooming && PlayState.instance.curStep <= 100){ camFollow.setPosition(boyfriend.x + dad.x + 100 , boyfriend.y + 400);}
    
    // camZooming = !movingCam;
    // trace(camZooming, movingCam);
    // trace(curCameraTarget);

	strumLines.members[0].notes.forEachAlive(function(note:Note){
		note.alpha = hmalpha;
    });
	strumLines.members[1].notes.forEachAlive(function(note:Note){
		note.alpha = hmalpha + 0.3;
    });
}

function postCreate(){
    campos = new FlxSprite();


	purpleOverlay = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.PURPLE);
	purpleOverlay.alpha = 0.33;
	add(purpleOverlay);
	purpleOverlay.cameras = [camHUD];
	purpleOverlay.scale.set(1.5, 1.5);
	purpleOverlay.scrollFactor.set();

	blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	blackScreen.alpha = 0;
	blackScreen.scrollFactor.set();
	blackScreen.scale.set(5, 5);
	add(blackScreen);

    t1 = new FlxSprite().loadGraphic(Paths.image("tranquility/1"));
	t1.scrollFactor.set(0, 0);
	t1.scale.set(1 * (1 / defaultCamZoom), 1 * (1 / defaultCamZoom));
	t1.antialiasing = true;
	add(t1);
	t1.alpha = 0;

	t2 = new FlxSprite().loadGraphic(Paths.image("tranquility/2"));
	t2.scrollFactor.set(0, 0);
	t2.scale.set(1 * (1 / defaultCamZoom), 1 * (1 / defaultCamZoom));
	t2.antialiasing = true;
	add(t2);
	t2.alpha = 0;

	t3 = new FlxSprite().loadGraphic(Paths.image("tranquility/3"));
	t3.scrollFactor.set(0, 0);
	t3.scale.set(1 * (1 / defaultCamZoom), 1 * (1 / defaultCamZoom));
	t3.antialiasing = true;
	add(t3);
	t3.alpha = 0;

	t4 = new FlxSprite().loadGraphic(Paths.image("tranquility/4"));
	t4.scrollFactor.set(0, 0);
	t4.scale.set(1 * (1 / defaultCamZoom), 1 * (1 / defaultCamZoom));
	t4.antialiasing = true;
	add(t4);
	t4.alpha = 0;
}

var duh = 3;
var game = PlayState.instance;
function beatHit(curBeat)
{
	switch (curBeat)
	{
		case 48:
        camFollow.setPosition(11,11);
            movingCam = true;
			FlxTween.tween(campos, {y: camFollow.y - 550}, 0.64);
			FlxTween.num(1, 0.2, duh, {ease:FlxEase.linear}, function(num:Float){
				hmalpha = num;
			});
			FlxTween.tween(blackScreen, {alpha: 1}, 0.58, {
				onComplete: function(t)
				{
					FlxTween.tween(purpleOverlay, {alpha: 0}, 0.1);
					for (i in [iconP1, iconP2, healthBar, healthBarBG])
						FlxTween.tween(i, {alpha: 0}, 0.46);

					var yAdd:Int = downscroll ? -200 : 200;
					

				}
			});
		case 50:
			// forceComboPos = new FlxPoint(strumLineNotes[4].x - 200, strumLineNotes[4].y);
			FlxTween.tween(t1, {alpha: 1}, 0.7);
		case 59:
			FlxTween.tween(t1, {alpha: 0}, 0.7);
		case 62:
			FlxTween.tween(t2, {alpha: 1}, 0.7);
		case 71:
			FlxTween.tween(t2, {alpha: 0}, 0.7);
		case 75:
			FlxTween.tween(t3, {alpha: 1}, 0.7);
		case 83:
			FlxTween.tween(t3, {alpha: 0}, 0.7);
		case 87:
			FlxTween.tween(t4, {alpha: 1}, 0.7);
		case 94:
			FlxTween.tween(t4, {alpha: 0}, 0.7);
		case 96:
			FlxTween.tween(t4, {alpha: 0}, 0.7);
			FlxTween.tween(blackScreen, {alpha: 0}, 1.5);
            FlxTween.tween(campos, {y: campos.y + 550}, 0.01, {onComplete: function(uh:FlxTween){
                movingCam = false;
            }});
			FlxTween.num(hmalpha, 1, duh, {ease:FlxEase.linear}, function(num:Float){
				hmalpha = num;
			});
		case 97:
			var yAdd:Int = downscroll ? -200 : 200;
			FlxTween.tween(scoreTxt, {y: scoreTxt.y - (downscroll ? yAdd / 3.3 : 0), alpha: 1}, 0.4, {
				startDelay: 0.46,
				onComplete: function(t)
				{
					game.disableScoreBop = false;
					for (i in [iconP1, iconP2, healthBar, healthBarBG]){
						FlxTween.tween(i, {alpha: 1}, 0.46);
                    }
            	}});
    
	}
}

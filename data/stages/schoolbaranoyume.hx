import flixel.addons.display.FlxBackdrop;
var bgSky:FlxBackdrop;

function create(){
	// importScript("data/scripts/pixel");
        
}
function postCreate(){
	mbgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/epiphanycross/Sky"));
	insert(members.indexOf(BG), mbgSky);
	mbgSky.spacing.y = -20; 
	mbgSky.velocity.set(-Conductor.crochet, 0);

    schoolA(false);
	flabbergastGirls();
    schoolE(false, false);
	monBG(false, false);
	for(e in [bgSky, bgSchool, bgStreet]){
		e.visible = true;
		e.color = FlxG.save.data.AMOLEDSCREEN ? 0xFF333333 : 0xFF111111;
	}
	
}

function monBG(v1,v2){
	for(i in [BG, FG, mbgSky]){
		i.visible = v1;

	}
	evilsch.visible = false;
	if(v2 == true){
		FlxG.camera.flash(0xFF803300, Conductor.crochet / 400, true);
	}
}

function schoolE(v1, v2){
	evilsch.visible = v1;
	if(v2 == true){
		FlxG.camera.flash(0xFF141452, Conductor.crochet / 400, true);
	}
}
function schoolA(v1){
    if(v1 == true || v1 == false){
	for(i in [bgSky, bgSchool, bgStreet, fgTrees, bgTrees, treeLeaves, bgGirls]){	
		i.visible = v1;
	}
	}
}

function girlsbrotando(){
		bgGirls.visible = true;
		bgGirls.alpha = 0;

		FlxTween.tween(bgGirls, {alpha:1}, Conductor.crochet / 1000);

}
public function flabbergastGirls() {
	bgGirls.animation.remove("danceLeft");
	bgGirls.animation.remove("danceRight");
	bgGirls.animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
	bgGirls.animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(30, 15), "", 24, false);
	bgGirls.animation.play("danceLeft", true);
}

function stepHit(curStep){
	switch(curStep){
	case 272:
        	for(e in [bgSky, bgSchool, bgStreet]){
            FlxTween.color(e, Conductor.crochet / 1000, 0xFF111111, 0xFFFFFFFF);
			}
			schoolA("eee");
			girlsbrotando(); 
	case 464:
		schoolE(true, true);
	case 1360:
		monBG(true, true);

    // for(i in strumLines.members[0].members){
    //     i.cameras = [camGame];	
    //     i.scrollFactor.set(1,1);
    //     i.x += 100;
    //     i.y += 100;
	// 	insert(members.indexOf(BG) - 3, i);
	// 	trace("cu");
    // }



	case 1548:
		monBG(false,false);
		schoolE(false,false);
		schoolA(false);
		FlxG.camera.flash(0xFFFFFFFF, Conductor.crochet / 1000, true);
        for(i in [strumLines.members[0].characters[0],strumLines.members[1].characters[0]]){
			i.colorTransform.color = 0xFFFFFFFF;
		}
	case 1800:
		for(i in [strumLines.members[0].characters[0],strumLines.members[1].characters[0], camHUD]){
			i.visible = false;
		}
		
	}
}
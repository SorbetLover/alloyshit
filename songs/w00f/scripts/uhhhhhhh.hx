import funkin.game.HealthIcon;
var shit:Float = boyfriend.x;
var shit2:Float = boyfriend.y;
var switchshit:Bool = true;
function create(){
	strumLines.members[0].characters[1].y = -150;
	strumLines.members[0].characters[2].y = -130;
	if(PlayState.difficulty == "6k"){
		importScript("data/scripts/6kstrum");
	
	}

}
public var rollIcon:HealthIcon;

function postCreate(){
		FlxG.camera.scroll.set(95, -32);
		
		
	    rollIcon = new HealthIcon('rolldog', true);
		rollIcon.cameras = [camHUD];
		rollIcon.y = healthBar.y - (rollIcon.height / 1.5) ;
        rollIcon.alpha = 1;
		insert(members.indexOf(healthBar) + 2, rollIcon);
       if(PlayState.difficulty == "6k"){
		for(i in strumLines.members[2].members){
			i.x -= 35;
		}

		strumLines.members[2].members[0].x -= 3;
		strumLines.members[2].members[1].x -= 23;
		strumLines.members[2].members[2].x -= 43;
		strumLines.members[2].members[3].x -= 63;
		
		strumLines.members[2].members[4].x -= 87;
		
		strumLines.members[2].members[5].x -= 108;

	}
		
}
function postUpdate(){
	FlxG.camera.y = 0;
	FlxG.camera.x = 0;	
	camFollow.setPosition(734, 330);
	rollIcon.x = iconP1.x + 100;
	rollIcon.y = iconP1.y -10;
	rollIcon.scale.set(iconP1.scale.x, iconP1.scale.y);

}
function stepHit(curStep){

	switch(curStep){

	case 1072:
        remove(iconP2);
	    iconP2 = new HealthIcon('scarlet', false);
		iconP2.cameras = [camHUD];
		iconP2.y = healthBar.y - (iconP2.height / 1.5) + 20;
        iconP2.alpha = 0;
		insert(members.indexOf(healthBar) + 2, iconP2);

    case 1880:
		remove(iconP2);
	    iconP2 = new HealthIcon('rolldog', false);
		iconP2.cameras = [camHUD];
		iconP2.y = healthBar.y - (iconP2.height / 1.5) + 20;
        iconP2.alpha = 0;
		insert(members.indexOf(healthBar) + 2, iconP2);
		FlxTween.tween(iconP2, {alpha: 1}, 0.2, {ease: FlxEase.cubeOut});		


	} 

}
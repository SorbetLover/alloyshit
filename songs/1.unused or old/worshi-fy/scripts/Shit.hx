import flixel.FlxG;
import funkin.game.HealthIcon;
import flixel.tweens.FlxTween;
var takiIcon:HealthIcon;
var cesarIcon:HealthIcon;
function postCreate(){
	takiIcon = new HealthIcon('taki', false);
	takiIcon.cameras = [camHUD];
	takiIcon.alpha = 1;
	insert(members.indexOf(healthBar) + 3, takiIcon);

	cesarIcon = new HealthIcon('cesar', true);
	cesarIcon.cameras = [camHUD];
	cesarIcon.alpha = 1;
	insert(members.indexOf(healthBar) + 4, cesarIcon);
	

}

function update(){
	
	takiIcon.y = healthBar.y - (takiIcon.height / 1.5) ;
	cesarIcon.y = healthBar.y - (cesarIcon.height / 1.5) ;
    takiIcon.x = iconP1.x - 200;
	cesarIcon.x = iconP1.x + 100;
	
	takiIcon.scale.set(iconP1.scale.x -0.15, iconP1.scale.y -0.15);
	cesarIcon.scale.set(iconP1.scale.x -0.15, iconP1.scale.y -0.15);
	strumLines.members[3].characters[0].x = 1300;
	strumLines.members[3].characters[0].y = 300;

	strumLines.members[4].characters[0].x = -700;
	strumLines.members[4].characters[0].y = -500;
	strumLines.members[4].characters[0].scale.set(0.8, 0.8); 
	FlxG.mouse.visible = true;
}

function stepHit() {}

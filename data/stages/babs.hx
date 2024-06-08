var babs;
var assgirl;
var assboy;
var tiara;

var spoon:Character;

function postCreate(){
babs = strumLines.members[1].characters[0];
assgirl = strumLines.members[3].characters[0];
assboy = strumLines.members[2].characters[0];
tiara = strumLines.members[0].characters[0];

// assgirl.scale.set(0.9,0.9);
// babs.scale.set(0.7,0.7);
assgirl.x = 760;
assboy.x = 650;
assboy.y = 110;
babs.x = -250;
babs.y = -470;
tiara.x = -570;
tiara.y = -440;
tiara.scrollFactor.set(2,2);
babs.scrollFactor.set(2,2);
babs.cameraOffset = FlxPoint.weak(300,200);
// spoon = new Character(-300,-450,"babs/spoon",false);
// add(spoon);
spoon = strumLines.members[4].characters[0];
spoon.x = -300;
spoon.y = -450;
remove(spoon);
insert(members.indexOf(babs) - 1, spoon);
spoon.scrollFactor.set(2,2);

assboy.cameraOffset = FlxPoint.weak(-200,100);
tiara.cameraOffset = FlxPoint.weak(650,300);
for(i in [spoon, tiara]){
	i.alpha = 0;
}

remove(iconP2);
remove(iconP1);

iconP2 = new HealthIcon("babs", false);
iconP2.cameras = [camHUD];
add(iconP2);
iconP2.y = healthBar.y - iconP2.height / 2;

iconP1 = new HealthIcon("bloom", true);
iconP1.cameras = [camHUD];
add(iconP1);
iconP1.y = healthBar.y - iconP1.height / 2;


}
var bruh:Bool = false;
function postUpdate(){
	switch(curCameraTarget){
		case 3,2: defaultCamZoom = 1.6;
		case 1,0: defaultCamZoom = 0.9;
	}
	// FlxG.camera.zoom = 0.5;
	// trace(curCameraTarget);
    // player.cpu = true;
	// strumLines.members[3].cpu = true;
	// strumLines.members[2].cpu = true;
//    if(bruh == false) {
// 	switch(spoon.getAnimName()){
// 		case "mine": 
// 			spoon.y = -490; spoon.x = -350;
			

// 		default: spoon.y = -450; spoon.x = -300;
	// }

	// }
}

function beatHit(curBeat){
	if(curBeat % 2 == 0){
	belle.playAnim("idle", true);
	}
}

function stepHit(){
	if(curStep == 1250) bruh = true;
	switch(curStep){
		case 833: babs.danceOnBeat = false;
		babs.playAnim("goback", true);
		case 836: babs.alpha = 0;
		case 1072: spoon.playAnim("blank"); tiara.playAnim("blank");
		for(i in [spoon, tiara]){
        	i.alpha = 1;
        }
		babs.alpha = 0;
		babs.cameraOffset = FlxPoint.weak(200,200);

        case 1204: babs.alpha = 1; babs.playAnim("jump", true);

		case 1220, 1348: spoon.danceOnBeat = false; tiara.danceOnBeat = false; spoon.animation.play("mine");
		case 1228, 1356: tiara.animation.play("mine");

	    
		case 1240, 1368: tiara.playAnim("blank2", true); spoon.playAnim("blank2", true);
		case 1250, 1378: spoon.danceOnBeat = true; tiara.danceOnBeat = true;

		case 1264, 1328, 1392, 1456: spoon.playAnim("blank"); tiara.playAnim("blank");
		case 1304, 1432: tiara.playAnim("blank2", true); spoon.playAnim("blank2", true);
        
	}
}
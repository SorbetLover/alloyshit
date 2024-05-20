import flixel.util.FlxColor;
var crowda:FlxSprite;
var the2:Bool = false;

function onDadHit(){
	if(the2 == false){		
	camFollow.setPosition(1200, 1750);
	}
    }
function onPlayerHit(){
	if(the2 == false){
	camFollow.setPosition(1800, 1750);
	} 
    }
function postCreate(){
//    crowda = new FlxSprite();
//    crowda.loadGraphic(Paths.image('stages/mag/Crowd1'), true, 1912, 695);
//    crowda.animation.add("Crowd0", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14], 2, false, false, false);
//    crowda.x = 500;
//    crowda.y = 1300;
//    insert(members.indexOf(bgshit) + 1, crowda);
for(e in [sayori, yuri, natsuki, monika]){
	e.scale.set(0.76,0.76);
}
camGame.followLerp = 0.2;
natsuki.x += 1200;
natsuki.y += 150;
yuri.y += 10;
yuri.x += 470;
sayori.y += 100;
sayori.x += 1000;

// sayori.color = 0xFF99b3ff;
// yuri.color = 0xFF99b3ff;
// natsuki.color = 0xFF99b3ff;

switch(PlayState.SONG.meta.displayName){
	case "hot-air-baloon":
		monika.alpha = 0;
	case "its-complicated":
	    sayori.alpha = 0;
		boyfriend.flipX = true;
    	

	}
}
function postUpdate(){

	if(strumLines.members[0].characters[0].getAnimName() != "idle" && strumLines.members[1].characters[0].getAnimName() != "idle"){
		the2 = true;
		camFollow.setPosition(1600, 1750);
	
	}else{
		the2 = false;
	}

    curCameraTarget = -1;

}


function beatHit(curBeat){
	if(curBeat % 4 == 0 ){
               Crowd1.playAnim("shit");
				sayori.playAnim("bop");
				natsuki.playAnim("bop");
				yuri.playAnim("bop");
				monika.playAnim("bop");
				
	}
}
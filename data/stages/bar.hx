
function postCreate(){
	strumLines.members[1].characters[0].cameraOffset = FlxPoint.weak(-100,-110);
}
var dir = false;
function beatHit(){
	if(beatHit % 4 == 0){
		dir = !dir;
		switch(dir){
			case true:
				barley.playAnim("danceRight");
			case false:
				barley.playAnim("danceLeft");
		}
	}
}
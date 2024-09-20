function postCreate(){
	strumLines.members[0].characters[0].scale.set(0.6,0.6);
	strumLines.members[0].characters[0].y = -140;
    strumLines.members[0].characters[0].x = 200;

	strumLines.members[0].characters[0].cameraOffset = FlxPoint.weak(-60,0);
	strumLines.members[2].characters[0].cameraOffset = FlxPoint.weak(-60,0);
}

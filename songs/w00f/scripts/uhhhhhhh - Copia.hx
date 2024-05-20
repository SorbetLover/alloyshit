function postUpdate(){
	if(strumLines.members[0].characters[0].getAnimName() != "idle"
	
	&& strumLines.members[1].characters[0].getAnimName() == "idle" 
	&& strumLines.members[2].characters[0].getAnimName() == "idle"
	&& PlayState.instance.curStep > 32){
		camFollow.setPosition(300,330);
		defaultCamZoom = 1;
	}

	if(strumLines.members[0].characters[0].getAnimName() == "idle" 
	&& strumLines.members[1].characters[0].getAnimName() == "idle"
	&& strumLines.members[2].characters[0].getAnimName() == "idle"){
		
	camFollow.setPosition(634, 380);
	defaultCamZoom = 0.9;
	}
	
	if(strumLines.members[0].characters[0].getAnimName() != "idle" 
	&& strumLines.members[1].characters[0].getAnimName() != "idle"
	&& strumLines.members[2].characters[0].getAnimName() != "idle"){
		
	camFollow.setPosition(734, 330);
	defaultCamZoom = 0.6;
	}
	if(strumLines.members[1].characters[0].getAnimName() != "idle"
	|| strumLines.members[2].characters[0].getAnimName() != "idle"){
		
	camFollow.setPosition(934, 330);
	defaultCamZoom = 0.8;
	}
	// defaultCamZoom = 0.4;
    // FlxG.camera.zoom = 0.4;
}
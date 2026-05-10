// script used as camera static thing
function stepHit(curStep){
    switch(curStep){
        case 540:
        	camHUD.angle = 200;
            camera.angle = 100;
			FlxTween.tween(camera, {angle: 0}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.cubeOut});
            spr = new FlxSprite().loadGraphic(Paths.image("stages/hazbin/effect2"));
            add(spr);
            FlxTween.tween(spr, {alpha: 0}, 1);
			for(i in [strumLines.members[0].characters[1]]){
			 i.alpha = 0.3;
			}

    }
    // player.cpu = true;
}
function postUpdate(){
    switch(curCameraTarget){
        case 0: defaultCamZoom = 0.7;
        case 1:
            defaultCamZoom = 0.7;
            camFollow.setPosition(1500,870);
    }
    // scrollSpeed = 2;
}
function onStrumCreation(event){
    if(event.player == 0){
          event.sprite = "game/notes/NOTE_alastor";
            
    }
}

function onNoteCreation(event){
    if(event.strumLineID == 0){
    event.noteSprite = 'game/notes/NOTE_alastor'; // replaces default noteskin
    event.noteScale = 0.7;
    }
}
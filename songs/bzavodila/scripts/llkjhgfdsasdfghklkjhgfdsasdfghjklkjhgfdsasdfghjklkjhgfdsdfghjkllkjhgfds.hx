function postCreate(){
    boyfriend.x -= 300;
    boyfriend.y -= 160;
    for(i in strumLines.members[1].members){
        i.cameras = [camGame];
        i.scrollFactor.set(1,1);
        i.x += 150;
        i.y += 400;
        i.noteAngle = 180;
    }
    // for(i in strumLines.members[0].members){
    //     i.cameras = [camGame];
    //     i.scrollFactor.set(1,1);
    //     i.x -= 50;
    // }
    // camHUD.alpha = 0;
    boyfriend.cameraOffset = FlxPoint.weak(-200,150);
}
function update(){
    strumLines.members[1].notes.forEachAlive(function(note:Note){
        if(note.strumRelativePos <= 950) note.forceIsOnScreen = true;
    });
}
function postCreate(){
    boyfriend.x -= 300;
    boyfriend.y -= 160;
    for(i in strumLines.members[1].members){
        i.cameras = [camGame];
        i.scrollFactor.set(1,1);
        i.x += 150;
    }
    // for(i in strumLines.members[0].members){
    //     i.cameras = [camGame];
    //     i.scrollFactor.set(1,1);
    //     i.x -= 50;
    // }
    // camHUD.alpha = 0;
    boyfriend.cameraOffset = FlxPoint.weak(-200,150);
    // camHUD.flipY = true ;
    trace("AAAAAAAAAAAAAAAAA");
}

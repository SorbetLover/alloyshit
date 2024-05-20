function postCreate(){
    strumLines.members[0].characters[0].y += 400;
    strumLines.members[0].characters[0].x += 400;
    strumLines.members[2].characters[0].y += 290;
    strumLines.members[2].characters[0].x -= 300;
}

function postUpdate(){
    switch(curCameraTarget){
        case 0:
            camGame.followLerp = 0.06;
        case 1:
                camGame.followLerp = 0.06;
        case 2:
            camGame.followLerp = 2;
            camFollow.setPosition(440,440);
        
    }
}
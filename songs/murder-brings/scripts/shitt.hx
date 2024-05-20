function postCreate(){
    strumLines.members[1].characters[0].x -= 10;
    strumLines.members[1].characters[1].x -= 370;
    strumLines.members[1].cpu = true;
    healthBar.alpha = 0;
    healthBarBG.alpha = 0;
    for(e in [iconP1, iconP2]){
        e.alpha = 0;
    }
    for(e in strumLines.members[1].characters){
        e.alpha = 0;
    }

    strumLines.members[1].characters[1].y -= 200;
    strumLines.members[1].characters[1].scale.set(0.9,0.9);
    
}

function postUpdate(){
    camFollow.setPosition(600, 300);
}
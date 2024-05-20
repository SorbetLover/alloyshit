function postCreate(){
    
    strumLines.members[0].characters[0].scale.set(0.7,0.7);
    strumLines.members[0].characters[0].y -= 120;
    strumLines.members[0].characters[0].x -= 100;
    strumLines.members[1].characters[0].x += 200;

    strumLines.members[2].characters[0].y -= 100;
    strumLines.members[3].characters[0].y -= 100;

    for( i in [2,3,4]){
   strumLines.members[i].characters[0].alpha = 0;
    }
}

function stepHit(curStep){
    switch(curStep){
        case 1040, 2324, 4112:
            defaultCamZoom = 0.8;
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[2].characters[0].alpha = 1;
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 0;
            remove(iconP2);
            iconP2 = new HealthIcon("felps", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);
        case 1296:
            defaultCamZoom = 0.8;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 1;
            remove(iconP2);
            iconP2 = new HealthIcon("cellbit", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

        case 2832:
            defaultCamZoom = 0.8;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 1;
            remove(iconP2);
            iconP2 = new HealthIcon("raloca", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

            
    }
}
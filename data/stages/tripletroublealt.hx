    var pomniIcon:HealthIcon;
function postCreate(){
    FlxG.camera.zoom = 1;
    defaultCamZoom = 0.6;
    pomniIcon = new HealthIcon("pomni",false);
    pomniIcon.cameras = [camHUD];
    pomniIcon.y = healthBar.y - 75;
    // pomniIcon.x = iconP2.x - 58;
    insert(members.indexOf(iconP2) + 1, pomniIcon);
    pomniIcon.alpha = 0;

    strumLines.members[0].characters[0].scale.set(1,1);
    strumLines.members[0].characters[0].y += 50;
    strumLines.members[0].characters[0].x += 300;
    strumLines.members[1].characters[0].x += 500;
    strumLines.members[1].characters[0].y += 100;

    strumLines.members[2].characters[0].y -= 30;
    strumLines.members[3].characters[0].y += 170;

    for( i in [2,3,4]){
       strumLines.members[i].characters[0].alpha = 0;
    }
    strumLines.members[4].characters[1].alpha = 0;

}

function stepHit(curStep){
    switch(curStep){
        case 1040, 2324, 4112:
            
            defaultCamZoom = 0.8;
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[2].characters[0].alpha = 1;
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 0;
            strumLines.members[4].characters[1].alpha = 0;  

            remove(iconP2);
            iconP2 = new HealthIcon("uzi", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);
            pomniIcon.alpha = 0;
        case 1296:
            defaultCamZoom = 0.8;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 1;
            remove(iconP2);
            iconP2 = new HealthIcon("knux", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 65;
            // iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

        case 2832:
            defaultCamZoom = 0.78;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 1;
            strumLines.members[4].characters[0].y -= 115;
            strumLines.members[4].characters[0].scale.set(0.9,0.9);
            strumLines.members[4].characters[1].alpha = 1;
            strumLines.members[4].characters[1].y += 240;
            remove(iconP2);
            iconP2 = new HealthIcon("jax", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);
            
            pomniIcon.x = iconP1.x - 140;

            pomniIcon.alpha = 1;
    }
}
// var centers:Float = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0);

// function postUpdate(){

// }

function postUpdate(){
    if(PlayState.instance.curStep > 1039 && PlayState.instance.curStep < 1295 || PlayState.instance.curStep > 2320 && PlayState.instance.curStep < 2831 || PlayState.instance.curStep > 4111){
       if(curCameraTarget == 0) camFollow.setPosition(700,500);
    }
    pomniIcon.scale.x = iconP2.scale.x - 0.2;
    pomniIcon.scale.y = iconP2.scale.y - 0.2;

    pomniIcon.x = PlayState.instance.iconP2.x - 80;
    if(iconP2.animation.curAnim.curFrame == 2) pomniIcon.animation.curAnim.curFrame = 2;
	if(iconP2.animation.curAnim.curFrame == 1) pomniIcon.animation.curAnim.curFrame = 1;

    
}
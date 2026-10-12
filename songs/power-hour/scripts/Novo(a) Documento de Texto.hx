import funkin.game.HealthIcon;
var felps:HealthIcon;

function postUpdate(){
    // camFollow.setPosition(500,300);
//     felps.x = iconP2.x - 80;
//     felps.y = iconP2.y - 20;
//     felps.scale.set(iconP2.scale.x, iconP2.scale.y);
    
}
function postCreate(){
    // remove(iconP2);
// iconP2 = new HealthIcon('cellbiticon');
// iconP2.cameras = [camHUD];
// insert(members.indexOf(healthBar) + 2, iconP2);
// iconP2.y = healthBar.y - 50;

// felps = new HealthIcon('felpsicon', false);
// felps.cameras = [camHUD];


// felps.alpha = 1;
// insert(members.indexOf(healthBar) + 3, felps);

    camGame.zoom = 0.8;
    strumLines.members[2].characters[0].scale.set(1.2,1.2);

    defaultCamZoom = 0.8;
strumLines.members[0].characters[0].x += 600;
strumLines.members[2].characters[0].x += 300;
    strumLines.members[0].characters[0].y += 40;
    strumLines.members[2].characters[0].y += 100;
    
    felps.animation.curAnim.curFrame = 0;

}
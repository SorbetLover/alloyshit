// function postCreate(){
//     remove(iconP1);
//     iconP1 = new HealthIcon(dad.icon, true);
//     add(iconP1);
//     iconP1.cameras = [camHUD];
    
//     remove(iconP2);
//     iconP2 = new HealthIcon(player.icon, false);
//     add(iconP2);
//     iconP2.cameras = [camHUD];

//     for(i in [iconP1, iconP2]){
//         i.y = healthBar.y - (i.height / 2) ;
//     }
// }

function postCreate(){
    strumLines.members[0].characters[0].x += 200;
    strumLines.members[0].characters[0].y -= 100;
    // strumLines.members[0].characters[1].scale.set(0.85,0.85);
}
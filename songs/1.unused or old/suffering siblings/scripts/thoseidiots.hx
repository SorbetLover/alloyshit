var rid:HealthIcon;
var bitch:HealthIcon;
function postCreate(){
    rid = new HealthIcon("gt/ridley");
    bitch = new HealthIcon("gt/mitch");
    for(i in [rid, bitch]){
        add(i);
        i.cameras = [camHUD];
        i.y = healthBar.y - i.height / 2;
        iconArray.push(i);
    }
    doIconBop = false;
    // rid.x = healthBar.x + healthBar.width - 30;
    // bitch.x = healthBar.x - 120;
    strumLines.members[0].characters[1].x -= 300;
    strumLines.members[1].characters[1].x += 300;
    defaultCamZoom = 0.7;
    FlxG.camera.zoom = 0.7;
}
function postUpdate(){
    updatIcons();
    
}
function updatIcons(){
    iconP2.scale.x = FlxMath.lerp(iconP2.scale.x, 0.55, 0.06);
    iconP2.scale.y = iconP2.scale.x;

    iconP1.scale.x = FlxMath.lerp(iconP1.scale.x, 0.65, 0.06);
    iconP1.scale.y = iconP1.scale.x;
    
    rid.scale.x = FlxMath.lerp(rid.scale.x, 0.45, 0.06);
    rid.scale.y = rid.scale.x;

    bitch.scale.x = FlxMath.lerp(bitch.scale.x, 0.45, 0.06);
    bitch.scale.y = bitch.scale.x;

    bitch.x = iconP2.x - 70;
    rid.x = iconP1.x + 60;
}


function beatHit(){
    iconP2.scale.set(0.5,0.5);
    iconP1.scale.set(0.6,0.6);

    for(i in [bitch, rid]){
        i.scale.set(0.4,0.4);
    }
}
// function postCreate(){
    
//     strumLines.members[0].characters[0].scale.set(0.7,0.7);
//     strumLines.members[0].characters[0].y -= 120;
//     strumLines.members[0].characters[0].x -= 100;
//     strumLines.members[1].characters[0].x += 200;

//     strumLines.members[2].characters[0].y -= 100;
//     strumLines.members[3].characters[0].y -= 100;

// //     for( i in [2,3,4]){
// //    strumLines.members[i].characters[0].alpha = 0;
// //     }
// }



import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;
var buildings1:FlxBackdrop;
var buildings2:FlxBackdrop;
var buildings3:FlxBackdrop;

function postCreate(){
    // for(i in 0...6){
    //     strumLines.members[i].characters[0].alpha = 0;
    // }
     strumLines.members[1].characters[1].alpha = 0;

    strumLines.members[2].characters[0].alpha = 0;
    strumLines.members[3].characters[0].alpha = 0;
    strumLines.members[4].characters[0].alpha = 0;

    fondo.alpha = 0;
    train.alpha = 0;
    sky.alpha = 0;
    background.alpha = 0;

	boyfriend.cameraOffset = FlxPoint.weak(-400,-300);
    strumLines.members[2].characters[0].x -= 400;
    strumLines.members[2].characters[0].y -= 140;

    strumLines.members[1].characters[1].x -= 170;
    strumLines.members[1].characters[1].scale.set(1,1);
    
    strumLines.members[1].characters[1].y -= 200;
    

    
    strumLines.members[3].characters[0].x -= 700;
    strumLines.members[3].characters[0].y -= 300;
    strumLines.members[3].characters[0].scale.set(0.8,0.8);


	buildings1 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/furthestBuildings'), 0, 0);
	buildings1.antialiasing = true;
	buildings1.scrollFactor.set(0.9, 0.9);
	buildings1.origin.set(0, 0);
	buildings1.setGraphicSize(Std.int(buildings1.width * 1.75));
	buildings1.updateHitbox();
	buildings1.y -= 180;
	buildings1.x -= 600;

	buildings2 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/middleBuildings'), 0, 0);
	buildings2.antialiasing = true;
	buildings2.scrollFactor.set(0.9, 0.9);
	buildings2.origin.set(0, 0);
	buildings2.setGraphicSize(Std.int(buildings2.width * 1.75));
	buildings2.updateHitbox();
	buildings2.y -= 350;
	buildings2.x -= 600;

	buildings3 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/frontBuildings'), 0, 0);
	buildings3.antialiasing = true;
	buildings3.scrollFactor.set(0.9, 0.9);
	buildings3.origin.set(0, 0);
	buildings3.setGraphicSize(Std.int(buildings3.width * 1.75));
	buildings3.updateHitbox();
	buildings3.y -= 750;
	buildings3.x -= 600;
	buildings1.repeatAxes = FlxAxes.X;
	buildings2.repeatAxes = FlxAxes.X;
	buildings3.repeatAxes = FlxAxes.X;
    var hmd = 0;
    for(i in [ buildings1, buildings2, buildings3]){
        insert(members.indexOf(sky) + hmd, i);
        hmd++;

        i.y += 400;
        i.velocity.x = -1000 * hmd;

        i.alpha = 0;
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
            iconP2 = new HealthIcon("uzi", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

            background.alpha = 1;
            strumLines.members[1].characters[1].alpha = 1;
    strumLines.members[1].characters[0].alpha = 0;
    
    strumLines.members[1].characters[1].alpha = 1;


    
        for(i in [ buildings1, buildings2, buildings3]){
            i.alpha = 0;
        }

        train.alpha = 0;
        sky.alpha = 0;
            defaultCamZoom = 0.8;


        case 1296:
            defaultCamZoom = 0.8;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 1;
            remove(iconP2);
            iconP2 = new HealthIcon("aiden", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

    strumLines.members[1].characters[0].alpha = 1;
    
    strumLines.members[1].characters[1].alpha = 0;

    background.alpha = 0;
    sky.alpha = 1;
    train.alpha = 1;

    defaultCamZoom = 0.4;
        for(i in [ buildings1, buildings2, buildings3]){
            i.alpha = 1;
        }

        case 2832:
            defaultCamZoom = 0.8;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 1;
            strumLines.members[4].characters[0].y += 260;
            remove(iconP2);
            iconP2 = new HealthIcon("colette", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            health = 1;
            insert(members.indexOf(iconP1) + 1, iconP2);

            background.alpha = 0;
            fondo.alpha = 1;

                strumLines.members[1].characters[1].alpha = 0;

                strumLines.members[1].characters[0].alpha = 1;
    defaultCamZoom = 0.6;


            
    }
}
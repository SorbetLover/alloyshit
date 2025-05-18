import flixel.group.FlxSpriteGroup;
// var strum = strumLines.members[1];
// var songName:Array = [
//     "boogieman"
// ];
// var strums:Array = [
//     [1,2],
// ];
// trace(songName[0]);
var strums:Array = [1];

public var initialletociaAlpha = 0.8;
public var uhhGrouper:FlxTypedGroup<FlxSprite>;
function create(){

    switch(curSong){
        case "boogieman", "w00f":
            strums = [1,2];
        case "babssneed":
            strums = [2,3];
        case "takeover medley": strums = [0];
    }
    if(PlayState.opponentMode == true){
        strums = [0];
    }
}
function postCreate(){
    
    uhhGrouper = new FlxTypedGroup();
    if(FlxG.save.data.letocinhaMode){
        scrollSpeed = 2;

    
    for(i in strums){
        if(strumLines.members[0].length == 4){
            strumLines.members[i].members[0].x -= 40;
            strumLines.members[i].members[1].x -= 40;
        
            strumLines.members[i].members[2].x += 40;
            strumLines.members[i].members[3].x += 40;
        }
        // if(strumLines.members[0].length == 6){
        
        //     for(i in 1...6){
        //         if(i <= 3){
        //             // i.x -= 40;
        //             for(e in 0...3){
                        
        //                 strumLines.members[0].members[e].x -= 40;
        //                 strumLines.members[1].members[e].x -= 40;
        //             }
        //         } else {
        //             // i.x += 40;
                    
        //             for(e in 0...3){    
                        
        //                 strumLines.members[0].members[e].x += 40;
        //                 strumLines.members[1].members[e].x += 40;
        //             }
        //         }
        //     }
        // }  
    }

    for(i in 0...strumLines.members[0].members.length){
        var bruh = new FlxSprite().makeGraphic(120,2000, 0xFF000000);
            bruh.cameras = [camHUD];
            // bruh.x = strumLines.members[strums[0]].members[i].x - 5;
            if(strumLines.members[0].length == 6){
                bruh.makeGraphic(100,2000,0xFF000000);
                bruh.x = strumLines.members[strums[0]].members[i].x + 0;

            }
            bruh.alpha = 0.8;
            insert(members.indexOf(strumLines.members[1].members[0]) + 1, bruh);
            
            uhhGrouper.add(bruh);
            
            // trace(uh);
    }
    }
    for(i in 0...uhhGrouper.length){
    uhhGrouper.members[i].alpha = initialletociaAlpha;
    }
    
}



function postUpdate(){
    if(FlxG.save.data.letocinhaMode){
        scrollSpeed = 2;
        // playerStrums.
        // strumLines.members[1].scrollSpeed = 2;
    }
}
function onSongStart(){
trace("Angle: " + strumLines.members[0].members[0].y);
    for(i in strumLines.members[0].members){
        i.x -= 100;
        i.y += 100;
        i.alpha = 0.0001;
        i.angle = 90;
    }

    for(i in strumLines.members[0].members){
        trace(i.x);
    }

    // strumLines.members[0].cpu = true;
}

// [  11:59:57  |    TRACE    ] bleh.hx:21: 96
// [  11:59:57  |    TRACE    ] bleh.hx:21: 208
// [  11:59:57  |    TRACE    ] bleh.hx:21: 320
// [  11:59:57  |    TRACE    ] bleh.hx:21: 432

// [  12:19:06  |    TRACE    ] bleh.hx:10: 736
// [  12:19:06  |    TRACE    ] bleh.hx:10: 848
// [  12:19:06  |    TRACE    ] bleh.hx:10: 960
// [  12:19:06  |    TRACE    ] bleh.hx:10: 1072
var strumTween:FlxTween;
var strumTween1:FlxTween;
var strumTween2:FlxTween;
var strumTween3:FlxTween;
var cancellingtweens:Bool = false;

var allowThatStrumShit:Bool = false;
function stepHit(curStep){
    switch(curStep){
        case 256:
            strumTween = FlxTween.tween(strumLines.members[0].members[0], {x: strumLines.members[0].members[0].x + 100, y: strumLines.members[0].members[0].y - 100, alpha:1, angle: 0}, Conductor.crochet / 70 / vocals.pitch, {ease: FlxEase.cubeOut});
        case 320:
            strumTween1 = FlxTween.tween(strumLines.members[0].members[1], {x: strumLines.members[0].members[1].x + 100, y: strumLines.members[0].members[1].y - 100, alpha:1, angle: 0}, Conductor.crochet / 70 / vocals.pitch, {ease: FlxEase.cubeOut});
        case 384:
            strumTween2 = FlxTween.tween(strumLines.members[0].members[2], {x: strumLines.members[0].members[2].x + 100, y: strumLines.members[0].members[2].y - 100, alpha:1, angle: 0}, Conductor.crochet / 70 / vocals.pitch, {ease: FlxEase.cubeOut});
        case 448:
            strumTween3 = FlxTween.tween(strumLines.members[0].members[3], {x: strumLines.members[0].members[3].x + 100, y: strumLines.members[0].members[3].y - 100, alpha:1, angle: 0}, Conductor.crochet / 70 / vocals.pitch, {ease: FlxEase.cubeOut});
        case 1024:

            for(i in [strumLines.members[0].members[0]]){
                strumTween = FlxTween.tween(i, {x: i.x - 640}, Conductor.crochet / 70, {ease: FlxEase.cubeInOut, type: FlxTween.PINGPONG});
            }
            for(i in [strumLines.members[0].members[1]]){
                strumTween1 = FlxTween.tween(i, {x: i.x - 640}, Conductor.crochet / 70, {ease: FlxEase.cubeInOut, type: FlxTween.PINGPONG});
            }
            for(i in [strumLines.members[0].members[2]]){
                strumTween2 = FlxTween.tween(i, {x: i.x - 640}, Conductor.crochet / 70, {ease: FlxEase.cubeInOut, type: FlxTween.PINGPONG});
            }
            for(i in [strumLines.members[0].members[3]]){
                strumTween3 = FlxTween.tween(i, {x: i.x - 640}, Conductor.crochet / 70, {ease: FlxEase.cubeInOut, type: FlxTween.PINGPONG});
            }
        case 1776:
            // cancellingtweens = true;
            strumTween.cancel();
            strumTween1.cancel();
            strumTween2.cancel();
            strumTween3.cancel();

            strumLines.members[0].members[0].x = 736;
            strumLines.members[0].members[1].x = 848;
            strumLines.members[0].members[2].x = 960;
            strumLines.members[0].members[3].x = 1072;
        case 1791:
            allowThatStrumShit = true;

        case 2040:
            
            for(i in strumLines.members[0].members){
                FlxTween.tween(i, {y:  400 - i.height, angle:0}, Conductor.crochet / 500 / vocals.pitch, {ease: FlxEase.cubeOut});
            }

    }
}

// function postUpdate(){
//     if(cancellingtweens == true && strumLines.members[0].members[3].x == 1072){
//             strumTween.cancel();
//             strumTween1.cancel();
//             strumTween2.cancel();
//             strumTween3.cancel();
            
//     for(i in strumLines.members[0].members){
//         trace(i.x);
//     }
//     cancellingtweens = false;
//     }
// }

// [  11:59:57  |    TRACE    ] bleh.hx:21: 96
// [  11:59:57  |    TRACE    ] bleh.hx:21: 208
// [  11:59:57  |    TRACE    ] bleh.hx:21: 320
// [  11:59:57  |    TRACE    ] bleh.hx:21: 432

// [  12:19:06  |    TRACE    ] bleh.hx:10: 736
// [  12:19:06  |    TRACE    ] bleh.hx:10: 848
// [  12:19:06  |    TRACE    ] bleh.hx:10: 960
// [  12:19:06  |    TRACE    ] bleh.hx:10: 1072
var beatchangedir:Bool = true;

function beatHit(curBeat){
    if(PlayState.instance.difficulty == "hard"){
    
       if((curBeat > 445) && (curBeat < 508) && (curBeat % 2 == 0)){
            switch(beatchangedir){
                case false:
                    strumLines.members[0].members[0].x = 96;
                    strumLines.members[0].members[1].x = 208;
                    strumLines.members[0].members[2].x = 320;
                    strumLines.members[0].members[3].x = 432;
                    beatchangedir = true;
                case true:
                    strumLines.members[0].members[0].x = 736;
                    strumLines.members[0].members[1].x = 848;
                    strumLines.members[0].members[2].x = 960;
                    strumLines.members[0].members[3].x = 1072;
                    beatchangedir = false;
            }
        }
    
        if((curBeat > 510) && (curBeat < 576)){
            switch(beatchangedir){
                case false:
                    strumLines.members[0].members[0].x = 96;
                    strumLines.members[0].members[1].x = 208;
                    strumLines.members[0].members[2].x = 320;
                    strumLines.members[0].members[3].x = 432;
                    beatchangedir = true;
                case true:
                    strumLines.members[0].members[0].x = 736;
                    strumLines.members[0].members[1].x = 848;
                    strumLines.members[0].members[2].x = 960;
                    strumLines.members[0].members[3].x = 1072;
                    beatchangedir = false;
            }
        }
    
    } else {
        if((curBeat > 446) && (curBeat < 508) && (curBeat % 2 == 0)){
                    strumLines.members[0].members[0].x = 416;
                    strumLines.members[0].members[1].x = 528;
                    strumLines.members[0].members[2].x = 640;
                    strumLines.members[0].members[3].x = 752;

                    for(i in strumLines.members[0].members){
                        // i.y = 430 - i.height;
                        i.angle = FlxG.random.int(40,-40);
                    }
        }
        if((curBeat > 510) && (curBeat < 576)){
                    for(i in strumLines.members[0].members){
                        // i.y = 430 - i.height;
                        i.angle = FlxG.random.int(0,-360);
                    }
        
        }

        if(curBeat == 576){
            for(i in strumLines.members[0].members){
                i.angle = 0;
                i.y = 50;
            }
        }
    }
    
    
     // if(allowThatStrumShit){
    //     switch(beatchangedir){
    //          case false:
    //              strumLines.members[0].members[0].x = 96;
    //              strumLines.members[0].members[1].x = 208;
    //              strumLines.members[0].members[2].x = 320;
    //              strumLines.members[0].members[3].x = 432;
    //              beatchangedir = true;
    //          case true:
    //              strumLines.members[0].members[0].x = 736;
    //              strumLines.members[0].members[1].x = 848;
    //              strumLines.members[0].members[2].x = 960;
    //              strumLines.members[0].members[3].x = 1072;
    //              beatchangedir = false;
    //     }
    // }

}
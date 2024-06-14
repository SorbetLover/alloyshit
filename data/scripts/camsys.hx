///// ALLOY's CAM SYS!!!!!!!!!!!!!!!!!!!!!
//////////////////////////====dad============plr=========none===
public var camOFF:Array = [[0,0], [0, 0], [0,0]];
public var camChars:Array = [0, 1];
var the2:Bool = false;
function postCreate(){
    trace(camChars);
}
function onDadHit(){
	    if(the2 == false){		
		    // if(PlayState.instance.opponentMode == true){ camFollow.setPosition(camOFF[1][0], camOFF[1][1]);} else camFollow.setPosition(camOFF[0][0], camOFF[0][1]);
            
            // if(PlayState.instance.opponentMode == false){camFollow.setPosition(0, 0);} 
            

	    }
	
	
}
// function onPlayerHit(){
// 	if(the2 == false){
//         if(PlayState.instance.opponentMode == true) camFollow.setPosition(camOFF[1][0], camOFF[1][0]); 
//         if(PlayState.instance.opponentMode == false) camFollow.setPosition(camOFF[0][0], camOFF[0][1]);
//     }

// }

function postUpdate(){
    if(strumLines.members[camChars[0]].characters[0].getAnimName() == "idle" && 
    (strumLines.members[camChars[1]].characters[0].getAnimName() == "idle" || 
    strumLines.members[camChars[1]].characters[0].getAnimName() == "danceLeft" || 
    strumLines.members[camChars[1]].characters[0].getAnimName() == "danceRight")){
        // camFollow.setPosition(camOFF[2][0],camOFF[2][1]);
    
        the2 = true;
    } else {
        the2 = false;
    }
    trace(the2);
    if(strumLines.members[camChars[0]].characters[0].getAnimName() != "idle" || 
    (strumLines.members[camChars[1]].characters[0].getAnimName() != "idle" || 
    strumLines.members[camChars[1]].characters[0].getAnimName() != "danceLeft" || 
    strumLines.members[camChars[1]].characters[0].getAnimName() != "danceRight")){
        camFollow.setPosition(camOFF[2][0],camOFF[2][1]);
        the2 = false;
    } else {
        the2 = true;
        
    }

    if(the2 == false){
        if(strumLines.members[camChars[0]].characters[0].getAnimName() != "idle" && (strumLines.members[camChars[1]].characters[0].getAnimName() == "idle" || strumLines.members[camChars[1]].characters[0].getAnimName() == "danceLeft" || strumLines.members[camChars[1]].characters[0].getAnimName() == "danceRight")){
            camFollow.setPosition(camOFF[0][0], camOFF[0][1]);
        }

        if(strumLines.members[camChars[0]].characters[0].getAnimName() == "idle" && (strumLines.members[camChars[1]].characters[0].getAnimName() != "idle" || strumLines.members[camChars[1]].characters[0].getAnimName() != "danceLeft" || strumLines.members[camChars[1]].characters[0].getAnimName() != "danceRight")){
            camFollow.setPosition(camOFF[1][0], camOFF[1][1]);
        }

    }
}
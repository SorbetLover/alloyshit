function postCreate(){
    for(i in [monark, gabriel, mamaefalei, mcpipokinha, bigX, podcast]){
        i.animation.stop();
        // i.color = 0xFF999999;
        i.scrollFactor.set(0.6,0.6);
    }
    dad.scale.set(1.9,1.9);

    camGame.bgColor = 0xFF191719;
    

}
var xof = 0;
function postUpdate(){
    camFollow.setPosition(strumLines.members[0].characters[0].x + (strumLines.members[0].characters[0].width / 6) + xof,strumLines.members[0].characters[0].y + 100);
}
function beatHit(curBeat){
    if(curBeat % 2 == 0){
        // for(i in [monark, gabriel, mamaefalei, mcpipokinha, felca]){
        //     i.animation.play("idle");
        // }
        for(i in [gabriel, mcpipokinha]){
            i.animation.play("idle", true);
        }
    } else {
        for(i in [monark,mamaefalei,  bigX]){
            i.animation.play("idle", true);
        }
        
    }
    if(dad.getAnimName() == "idle"){
        xof = 0;
    }
}

function onDadHit(){
    if(PlayState.instance.opponentMode == false){
        if(health > 0.1){
            health -= 0.02;
        }
    }
}

function onNoteHit(e){
    if(e.character.curCharacter == "ralucaanima"){
        if(e.direction == 0){
            xof = -100;
        } else 
        if(e.direction == 3){
            xof = 100;
        } else {
            xof = 0;
        }
    }
}
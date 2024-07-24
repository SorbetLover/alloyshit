function postCreate(){
    for(i in [monark, gabriel, mamaefalei, mcpipokinha, felca]){
        i.animation.stop();
        // i.color = 0xFF999999;
    }
    dad.scale.set(1.9,1.9);

    camGame.bgColor = 0xFF191719;
    

}
function postUpdate(){
    camFollow.setPosition(strumLines.members[0].characters[0].x + (strumLines.members[0].characters[0].width / 6) ,strumLines.members[0].characters[0].y + 100);
}
function beatHit(curBeat){
    if(curBeat % 2 == 0){
        // for(i in [monark, gabriel, mamaefalei, mcpipokinha, felca]){
        //     i.animation.play("idle");
        // }
        for(i in [gabriel, mcpipokinha]){
            i.animation.play("idle");
        }
    } else {
        for(i in [monark,mamaefalei,  felca]){
            i.animation.play("idle");
        }
        
    }
}

function onDadHit(){
    if(PlayState.instance.opponentMode == false){
        if(health > 0.1){
            health -= 0.02;
        }
    }
}
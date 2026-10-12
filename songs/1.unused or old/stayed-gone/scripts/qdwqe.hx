
function postCreate(){
    for(i in strumLines.members[0].members){
    i.alpha = 0;
    }
    iconP2.alpha = 0;
    strumLines.members[0].members[1].alpha = 0;
}    
function postUpdate(){
    vocals.volume = 1;

}

function stepHit(){
    switch(curStep){
        case 1164:
            FlxTween.tween(iconP2, {alpha:1}, Conductor.crochet / 500);
            for(i in strumLines.members[0].members){

                FlxTween.tween(i, {alpha:1}, Conductor.crochet / 500);
            }

    }
}
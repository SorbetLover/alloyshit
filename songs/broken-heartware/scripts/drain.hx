function onDadHit(){
    if(health > 0.2 && PlayState.opponentMode == false){
        health -= 0.03;
    }
    if(health < 1.8 && PlayState.opponentMode == true){
            health += 0.03;
    }
        
    }
function onPlayerHit(){
    if(PlayState.opponentMode == false)
        health += 0.05;
    if(PlayState.opponentMode == true)
        health -= 0.05;
    }
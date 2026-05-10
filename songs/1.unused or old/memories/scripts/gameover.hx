function postCreate(){
    gameOverSong = "pig/gameOver";
    lossSFX = "gameOverSFX";
    retrySFX = "pig/end";

}

function postUpdate(){
    if(FlxG.keys.justPressed.Z){
        camGame.filtersEnabled = false;
    } 
    if(FlxG.keys.justPressed.X){
        camGame.filtersEnabled = true;
    
    } 

}
function update(){
    if(Options.ghostTapping == false){
        if(misses > 1){
            gameOver(boyfriend);

        }
    }
    if(FlxG.keys.justPressed.Z){
        inst.pause();
        vocals.pause();
    }
    if(FlxG.keys.justPressed.X){
        inst.resume();
        vocals.resume();
    }
}


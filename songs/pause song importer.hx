
function postCreate(){
    if(PlayState.SONG.meta.name != "love n funkin"){PauseSubState.script = 'data/scripts/pauseSong';}
    if(PlayState.SONG.meta.name == "love n funkin"){PauseSubState.script = 'data/scripts/lovenFunkin';}
    
    // importScript("data/scripts/dbug");
}


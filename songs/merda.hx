
function postCreate(){
    theStrs = PlayState.opponentMode ? cpu : player;
}
function update(){
    if(FlxG.keys.justPressed.C){
        // player.cpu = !player.cpu;
        theStrs.cpu = !theStrs.cpu;
    }
    if(FlxG.keys.justPressed.V){
        for(i in strumLines.members){
            i.cpu = true;
        }
    }
}
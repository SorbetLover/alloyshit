function postCreate(){
	if(PlayState.instance.curSong != "release"){
		bgfreaks.alpha = 0;
	}
}
function beatHit(){
	if(curBeat % 2 == 0){
		bgfreaks.playAnim("idle", true);

	}
	bgfreaks.color = 0xFF666666;
}
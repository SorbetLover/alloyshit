function postCreate(){
	sofia.animation.pause();
	tio.animation.pause();

	boyfriend.alpha = 0;
}
function postUpdate(){
	camFollow.setPosition(700,500);
}

function beatHit(curBeat){
	if(curBeat % 4 == 0){
		sofia.animation.play("idle", true);
		tio.animation.play("idle", true);
	}
}
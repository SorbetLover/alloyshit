function create(){
	uh = new FlxSprite().makeGraphic(10000,10000, 0xFFFFFFFF);
	insert(0,uh);
	boyfriend.x -= 60;
	boyfriend.y -= 70;

}

function postUpdate(){
	camFollow.setPosition(800,500);
}
function stepHit(){

}

function postCreate(){
	color = 0xFF44444488;
	strumLines.members[0].characters[0].color = color;
	strumLines.members[1].characters[0].color = color;
	walls.color = color;
	walls_alt.color = color;
	ring_l_n_trash_can.color = color;
	chair.color = color;
	// luz.color = color;
	table.color = color;

	camGame.followLerp = 100;
}
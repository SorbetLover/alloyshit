function update(){
    for(e in strumLines){
        e.vocals.pitch = FlxG.save.data.codenameCurPitch;
		for(i in e.healthIcons){
			i.scale.x = FlxMath.lerp(i.scale.x, 0.5,0.05);
			i.scale.y = FlxMath.lerp(i.scale.x, 0.5,0.05);

		}
	}
}
function beatHit(){
	for(e in strumLines){
		for(i in e.healthIcons){
			i.scale.set(0.6,0.6);

			if(curBeat % 4 == 0){
				i.scale.set(0.7, 0.7);
			}
		}
	}
}

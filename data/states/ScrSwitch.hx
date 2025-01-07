var warning:FlxText;

function create() {
warning = new FlxText(0,0,1000, "Are you sure", 20);
add(warning);
warning.screenCenter();
}




var callPost:Bool = true;
function update() {
	if (callPost) {
		callPost = false;
		createPost();
	}

	if (FlxG.keys.justPressed.ESCAPE)
		FlxG.switchState(new MainMenuState());

	if (FlxG.keys.justPressed.ENTER){
		switch(FlxG.save.data.portraitmode){
			case null, true:
				FlxG.save.data.portraitmode = false;
			case false:
			FlxG.save.data.portraitmode = true;
		}
		// FlxG.switchState(new MainMenuState());
		FlxG.resetGame();
        }
}


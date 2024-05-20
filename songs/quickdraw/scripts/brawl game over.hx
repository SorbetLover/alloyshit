
function create() {
	importScript("data/scripts/pixel");

	enablePauseMenu = false;
	pixelNotesForDad = false;
	enablePixelUI = false;
	pixelNotesForBF = true;
	enablePixelGameOver = false;
	gameOverSong = "brawlgameOver";
	lossSFX = "gameOverSFXBrawl";
	retrySFX = "gameOverEndBrawl";
	introLength = 5;
	dad.playAnim("anger");
	FlxG.sound.play(Paths.sound('saloonAngry'));
	boyfriend.color = 0xFFF0EBEB;
    new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			boyfriend.playAnim('singLEFTmiss');
		});
}

// function update(){
	
//     camFollow.setPosition(0,0);
// }
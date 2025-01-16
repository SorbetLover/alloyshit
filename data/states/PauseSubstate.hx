
import funkin.backend.utils.NativeAPI;
import funkin.editors.charter.Charter;

var manualtxt:Array = ["Trate essa sua calvice de merda com a Manual!", "Manual, a solução dos seus problemas de entradas.", "Até os clones do lule aprovam.", "O pavor de Alexandre de Morales."];
function create() {
	menuItems.insert(2, 'Change Diff');
	// PlayState.instance.strumLines.members[1].cpu = true;
}
function postCreate(){
	if(PlayState.instance.curSong == "bee-bush"){
		// trace(manualtxt);
		mbg = new FlxSprite().makeGraphic(1400,200, 0xFF134445);
		
		add(mbg);
		manual = new FlxSprite().loadGraphic(Paths.image("manual"));
		
		add(manual);
		manual.scale.set(2,2);
		manual.y += 60;
		manual.x += 200;

		mbg.y = manual.y - mbg.height / 2;

		dd = new FlxText(580,60,700,manualtxt[FlxG.random.int(0,3)], 30);
		dd.font = Paths.font("vcr.ttf");
		dd.antialiasing = true;
		add(dd);

		// dd.scale.set(3,3);

	}}
function update() {
    if (controls.ACCEPT) {

        if (menuItems[curSelected] == "Change Diff") {
    	    	openSubState(new ModSubState("PauseDiffs"), true);

		}

    }

    if(FlxG.keys.justPressed.I && !FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch += 0.1;
	}
	if(FlxG.keys.justPressed.U && !FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch -= 0.1;
	}

	if(FlxG.keys.justPressed.I && FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch += 0.05;
	}
	if(FlxG.keys.justPressed.U  && FlxG.keys.pressed.SHIFT){
		FlxG.save.data.codenameCurPitch -= 0.05;
	}

	if(FlxG.keys.justPressed.Y){
		FlxG.save.data.codenameCurPitch = 1;
	}

	// trace("cuzin");
}

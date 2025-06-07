import funkin.game.StrumLine;

var plrX = 90;
var oppX = 0;
var mania = 1;
var rdom = 0;
var holds = true;
function create(){
	if(PlayState.instance.curSong == "suffering siblings"){
		disableScript();
	}
}
var keyBinds = [
	["D", "F", "J", "K"],
	["A", "S", "D", "J", "K", "L"],
	["A", "S", "D", "SPACE", "J", "K", "L"],
	["A", "S", "D", "F", "SPACE", "H", "J", "K", "L"],
	["A", "S", "D", "F", "H", "J", "K", "L"],
];

var maniaScales = [0.7, 0.6, 0.55, 0.5, 0.55];
var maniaTypes = [
["purple", "blue", "green", "red"],
["purple", "green", "red", "purple", "blue", "red"],
["purple", "green", "red", "green", "purple", "blue", "red"],
["purple", "blue", "green", "red", "green", "purple", "blue", "green", "red"],
["purple", "blue", "green", "red", "purple", "blue", "green", "red"]

];
var issus = false;
//this is where the note generation happens!
function onNoteCreation(e) {
	issus = e.note.isSustainNote;
	if(issus == false){
        rdom += 1;
    }
    if (mania == 1) {
		//down note
		if (e.note.noteData == 1) { 
    			e.note.noteData = 4;
			return;
		}
		//up note
		if (e.note.noteData == 2) { 
    			e.note.noteData = 1;
			return;
		}
		//every other left note
		if (e.note.noteData == 0 && rdom % 2 == 0) { 
    			e.note.noteData = 3;
			return;
		}
		//every other right note
		if (e.note.noteData == 3 && rdom % 2 == 0) { 
    			e.note.noteData = 5;
			return;
		}
		//the every other other right note
		if (e.note.noteData == 3) {
		    	e.note.noteData = 2;
			return;
		}
	}
	if (mania == 2) {
		//down note
		if (e.note.noteData == 1) { 
    			e.note.noteData = 5;
			return;
		}
		//up note
		if (e.note.noteData == 2 && rdom % 2 == 0 ) { 
    			e.note.noteData = 3;
			return;
		}
		if (e.note.noteData == 2) { 
    			e.note.noteData = 1;
			return;
		}
		//every other left note
		if (e.note.noteData == 0 && rdom % 2 == 0 ) { 
    			e.note.noteData = 4;
			return;
		}
		//every other right note
		if (e.note.noteData == 3 && rdom % 2 == 0 ) { 
    			e.note.noteData = 6;
			return;
		}
		//the every other other right note
		if (e.note.noteData == 3) {
		    	e.note.noteData = 2;
			return;
		}
	}

	if (mania == 3) {
		if (e.note.noteData == 0 && rdom % 2 == 0 ) { 
    			e.note.noteData = 5;
			return;
		}
		if (e.note.noteData == 1 && rdom % 2 == 0 ) { 
    			e.note.noteData = 6;
			return;
		}
		if (e.note.noteData == 2 && rdom % 2 == 0 && rdom % 4 != 0 ) { 
    			e.note.noteData = 7;
			return;
		}
		if (e.note.noteData == 2 && rdom % 4 == 0 ) { 
    			e.note.noteData = 4;
			return;
		}
		if (e.note.noteData == 3 && rdom % 2 == 0 ) { 
    			e.note.noteData = 8;
			return;
		}
	}
	if (mania == 4) {
		if (e.note.noteData == 0 && rdom % 2 == 0 ) { 
    			e.note.noteData = 4;
			return;
		}
		if (e.note.noteData == 1 && rdom % 2 == 0 ) { 
    			e.note.noteData = 5;
			return;
		}
		if (e.note.noteData == 2 && rdom % 2 == 0 ) { 
    			e.note.noteData = 6;
			return;
		}
		if (e.note.noteData == 3 && rdom % 2 == 0 ) { 
    			e.note.noteData = 7;
			return;
		}
	}

	if (holds == false) {
		if (e.note.isSustainNote) {
			e.note.noteData = 1000;
		}
	}
}

function onPreGenerateStrums(e) {
    for (i in strumLines.members) i.strumAnimPrefix = switch(mania) {
        case 0: ["left", "down", "up", "right"];
        case 1: ["left", "up", "right", "left", "down", "right"];
        case 2: ["left", "up", "right", "up", "left", "down", "right"];
        case 3: ["left", "down", "up", "right", "up", "left", "down", "up", "right"];
        case 4: ["left", "down", "up", "right", "left", "down", "up", "right"];
    };
    e.amount = strumLines.members[0].strumAnimPrefix.length;
}

function onStrumCreation(e) {
	e.cancel();

	var strum = e.strum;

	// trace(e.player);

	strum.frames = Paths.getFrames("game/shaggyNotes");
	strum.scale.set(maniaScales[mania], maniaScales[mania]);


	strum.animation.addByPrefix('static', 'arrow' + e.animPrefix.toUpperCase());

	strum.animation.addByPrefix('pressed', maniaTypes[mania][e.strumID] + ' press', 24, false);
	strum.animation.addByPrefix('confirm', maniaTypes[mania][e.strumID] + ' confirm', 24, false);

	strum.getPressed = () -> Reflect.getProperty(FlxG.keys.pressed, keyBinds[mania][strum.ID]);
	strum.getJustPressed = () -> Reflect.getProperty(FlxG.keys.justPressed, keyBinds[mania][strum.ID]);
	strum.getJustReleased = () -> Reflect.getProperty(FlxG.keys.justReleased, keyBinds[mania][strum.ID]);
	if (e.player == 1) {
	strum.x = 700 + (e.strumID * 150 * maniaScales[mania]);
	}
	if (e.player == 0) {
	strum.x = 100 + (e.strumID * 150 * maniaScales[mania]);
	}
}
// function update(){
	
// 	if(PlayState.instance.curSong == "love n funkin"){
// 		for(i in 0...strumLines.length){
// 			for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x -= 1000;
// 		}
	
// 		for(i in 0...strumLines.length){
// 			if(strumLines.members[i].opponentSide == true){	
// 				for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x = 100 + (e * 150 * maniaScales[mania]);
// 			} else {
// 				for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x = 700 + (e * 150 * maniaScales[mania]);
// 			}
// 		}
// 	}

// }
var singDir = [
    ["LEFT", "DOWN", "UP", "RIGHT"],
    ["LEFT", "UP", "RIGHT", "LEFT", "DOWN", "RIGHT"],
    ["LEFT", "UP", "RIGHT", "UP", "LEFT", "DOWN", "RIGHT"],
    ["LEFT", "DOWN", "UP", "RIGHT", "UP", "LEFT", "DOWN", "UP", "RIGHT"],
    ["LEFT", "DOWN", "UP", "RIGHT", "LEFT", "DOWN", "UP", "RIGHT"]
];

function onNoteHit(e) {
    e.showSplash = false;
    e.cancelAnim();
    for (char in e.characters)
        if (char != null)
            char.playAnim("sing" + singDir[mania][e.direction], e.forceAnim, "SING");
}

function postCreate() {
	for (strum in strumLines) {
		for (note in strum.notes) {
			note.scale.x = note.scale.y = maniaScales[mania];
    		}
	}


		for(i in 0...strumLines.length){
			for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x -= 1000;
		}
	
		for(i in 0...strumLines.length){
			if(strumLines.members[i].opponentSide == true){	
				for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x = 100 + (e * 150 * maniaScales[mania]);
			} else {
				for(e in 0...strumLines.members[0].length) strumLines.members[i].members[e].x = 700 + (e * 150 * maniaScales[mania]);
			}
		}

}
var mania = 1;
function onPreGenerateStrums(e){
    for (i in strumLines.members) i.strumAnimPrefix = switch(mania) {
        case 1: ["left", "down", "up", "up", "right"];
    };
    e.amount = strumLines.members[0].strumAnimPrefix.length;


}
var keyBinds = [
	["D", "F", "J", "K"],
	["D", "F", "SPACE", "J", "K"],
	["A", "S", "D", "J", "K", "L"],
	["A", "S", "D", "SPACE", "J", "K", "L"],
	["A", "S", "D", "F", "SPACE", "H", "J", "K", "L"],
	["A", "S", "D", "F", "H", "J", "K", "L"],
];
var maniaScales = [0.7, 0.6, 0.55, 0.5, 0.55];
var maniaTypes = [
["purple", "blue", "green", "red"],
["purple", "blue", "white", "green", "red"],
["purple", "green", "red", "green", "purple", "blue", "red"],
["purple", "blue", "green", "red", "green", "purple", "blue", "green", "red"],
["purple", "blue", "green", "red", "purple", "blue", "green", "red"]

];


var singDir = [
    ["LEFT", "DOWN", "UP", "UP", "RIGHT"],
    ["LEFT", "DOWN", "UP", "UP", "RIGHT"],
];

function onNoteHit(e) {
    e.showSplash = false;
    e.cancelAnim();
    for (char in e.characters)
        if (char != null)
            char.playAnim("sing" + singDir[mania][e.direction], e.forceAnim, "SING");
}
function onStrumCreation(e) {
	e.cancel();

	var strum = e.strum;

	trace(e.player);

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

function postCreate(){
    for(i in strumLines.members){
    i.members[2].animation.addByPrefix("static", "arrowSPACE", 24, false);
    i.members[2].animation.addByPrefix("static", "arrowSPACE", 24, false);
    i.members[2].playAnim("static");
    }
    trace(strumLines.members[0].members[2]);
}
function postUpdate(){
    // strumLines.members[1].members[2].animation.play("pressed");
}   
var rdom:Int = 2;
var switchn:Bool = false;
function onNoteCreation(e){

    // if()

    // if(e.note.noteData == 1){
    //     if(switchn == false){
    //         e.note.noteData = 1;
    //         switchn = true;
    //     }
    //     else{
    //         e.note.noteData = 4;
    //         switchn = false;        
    //     }
    // }	
    if(e.note.noteData == 3){
        e.note.noteData = 4;
    }
    
    
    if(e.note.noteData == 2){
        // e.note.animation.addByPrefix('scroll', 'arrowSPACE');
		e.note.animation.addByPrefix('hold', 'white hold piece');
		e.note.animation.addByPrefix('holdend', 'white hold end');
        // e.note.animation.play("scroll");
    }
        rdom += 1;

    if(e.note.noteData == 2 && rdom % 2 == 0 && !e.note.isSustainNote){
        e.note.noteData = 3;

    }
    
    if(e.note.noteData == 2){
        e.noteSprite = "game/improvisedmiddlenote";
        trace(rdom);
    }
}
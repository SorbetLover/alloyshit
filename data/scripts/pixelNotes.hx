import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;

function onNoteCreation(event) {
	if (event.note.strumLine == playerStrums && !pixelNotesForBF) return;
	if (event.note.strumLine == cpuStrums && !pixelNotesForDad) return;

	event.cancel();

	var note = event.note;
	if (event.note.isSustainNote) {
		note.loadGraphic(Paths.image('stages/school/ui/ALPHA_NOTE_assetsENDS'), true, 7, 6);
		note.animation.add("hold", [event.strumID]);
		note.animation.add("holdend", [4 + event.strumID]);
	} else {
		note.loadGraphic(Paths.image('stages/school/ui/ALPHA_NOTE_assets'), true, 17, 17);
		note.animation.add("scroll", [4 + event.strumID]);
	}
	note.scale.set(daPixelZoom, daPixelZoom);
	note.updateHitbox();
}

function onStrumCreation(event) {
	if (event.player == 1 && !pixelNotesForBF) return;
	if (event.player == 0 && !pixelNotesForDad) return;

	event.cancel();

	var strum = event.strum;
	strum.loadGraphic(Paths.image('stages/school/ui/ALPHA_NOTE_assets'), true, 17, 17);
	strum.animation.add("static", [event.strumID]);
	strum.animation.add("pressed", [4 + event.strumID, 8 + event.strumID], 12, false);
	strum.animation.add("confirm", [12 + event.strumID, 16 + event.strumID], 24, false);

	strum.scale.set(daPixelZoom, daPixelZoom);
	strum.updateHitbox();
}


function onPlayerHit(event:NoteHitEvent) {
	if (!enablePixelUI) return;
	event.ratingPrefix = "stages/school/ui/";
	event.ratingScale = daPixelZoom * 0.7;
	event.ratingAntialiasing = false;

	event.numScale = daPixelZoom;
	event.numAntialiasing = false;
}


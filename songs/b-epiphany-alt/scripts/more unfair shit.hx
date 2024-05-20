
function onNoteCreation(event){
    if(event.strumLineID == 4){
    event.noteSprite = 'game/notes/NOTE_alastor'; // replaces default noteskin
    event.noteScale = 0.7;
    event.mustHit = false;
    }
}
function onPlayerHit(event){
    trace("dead");

    if(event.note.strumID == 4){
    event.misses = false;
    event.countScore = false;
    event.countAsCombo = false;
    // health = 0;
   }
}
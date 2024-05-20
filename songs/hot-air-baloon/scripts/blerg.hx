
function onNoteCreation(event){
    if(event.noteType == "Hurt Note"){
        event.noteSprite = 'game/notes/dark'; // replaces default noteskin
        // event.misses = false;
        event.mustHit = false;
    }
}
// function onPlayerHit(event) {
//     if (event.noteType == "Hurt Note"){
//         event.countScore = false;
        
//         event.countAsCombo = false;
//         // event.
//         PlayState.instance.health -= 0.3;
//     }
// }
// function onPlayerMiss(event){
//     if (event.noteType == "Hurt Note") event.cancel();  
 
// }

function onPlayerMiss(event)
    if (event.noteType == "Hurt Note") {event.cancel(true); event.note.strumLine.deleteNote(event.note);}

function onPlayerHit(event) 
    if (event.noteType == "Hurt Note") {
        event.countAsCombo = event.showRating = event.showSplash = false; 
        event.strumGlowCancelled = true; health -= 0.1;
    }


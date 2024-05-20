function onNoteCreation(event){
    if(event.noteType == "markov"){
        event.noteSprite = 'game/notes/markovNotes'; // replaces default noteskin
        // event.misses = false;
        event.mustHit = false;
    }
}
// function onPlayerHit(event) {
//     if (event.noteType == "markov"){
//         event.countScore = false;
        
//         event.countAsCombo = false;
//         // event.
//         PlayState.instance.health -= 0.3;
//     }
// }
// function onPlayerMiss(event){
//     if (event.noteType == "markov") event.cancel();  
 
// }

function onPlayerMiss(event)
    if (event.noteType == "markov") {event.cancel(true); event.note.strumLine.deleteNote(event.note);}

function onPlayerHit(event) 
    if (event.noteType == "markov") {
        event.countAsCombo = event.showRating = event.showSplash = false; 
        event.strumGlowCancelled = true; health -= 0.1;
    }
function onNoteCreation(event){
    if(event.strumLineID == 0){
    event.noteSprite = 'game/notes/dark'; // replaces default noteskin
    event.noteScale = 0.7;
    }
    if(event.strumLineID == 4){
        event.noteSprite = 'game/notes/orang'; // replaces default noteskin
        event.noteScale = 0.7;
    }
    if(event.strumLineID == 2){
        event.noteSprite = 'game/notes/pink2'; // replaces default noteskin
        event.noteScale = 0.7;
    }
    if(event.strumLineID == 3){
        event.noteSprite = 'game/notes/pink1'; // replaces default noteskin
        event.noteScale = 0.7;
    }
    
    
}

var testaa:Array = ["monka", "abby", "annie", "sepie"];
function postCreate(){
    // player.cpu = true;
    trace(returnArrayBool(testaa, "abby"));
    returnChars();
}
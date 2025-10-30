function onNoteCreation(e){
    if(e.note.isSustainNote){
        if(e.note.prevNote.isSustainNote == false) e.note.prevNote.colorTransform.color = 0xFFFFFF;
        // e.note.noteAngle = 10;
    }
}
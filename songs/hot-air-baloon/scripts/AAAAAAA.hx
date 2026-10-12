function onNoteCreation(event) {
    event.noteScale = 0.7;
}
if(PlayState.difficulty == "6k"){
    importScript("data/scripts/6kstrum");
    
}

// function postCreate(){
//     if(PlayState.difficulty == "6k"){
//     strumLines.members[1].cpu = true;
//     }
// }
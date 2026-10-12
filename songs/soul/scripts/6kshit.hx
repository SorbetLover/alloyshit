function create()
    importScript("data/scripts/6kstrum");

function postCreate()
if(PlayState.difficulty == "6k"){
    strumLines.members[1].cpu = false;    
}


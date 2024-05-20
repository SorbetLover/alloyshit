// song script
function postCreate() {
    for(strumline in strumLines.members) for(character in strumline.characters) character.extra.set("strumline", strumline);
}


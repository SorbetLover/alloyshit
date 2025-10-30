var thealp = 0.7;
function postCreate() {
    scrollSpeed = 2.2;
    if(strumLines.members[0].members.length != 4) return;
    if (curSong != "interlope") {
        for (i in 0...strumLines.length) {
            var line = strumLines.members[i];
            var members = line.members;

            if (!line.cpu ) {
                var total = members.length;
                var spacing = 110;
                var startX = (FlxG.width / 2) - spacing * (total - 1) / 2 - 60; // centraliza o grupo

                for (e in 0...total) {
                    members[e].x = startX + spacing * e;
                }
            }

            if(line.cpu && members.length == 4){            
                var spacing = 115;
                var half = Std.int(members.length / 2); 

                for (e in 0...half) {
                    members[e].x = 100 + spacing * e;
                members[e].alpha = thealp;
                
                }

                for (e in half...members.length) {
                    var index = e - half;
                    members[e].x = (FlxG.width - 100) - (spacing * (half - index - 1)) - 100;
                    members[e].alpha = thealp;
                
                }
            
            } else if(line.cpu){
                for(i in 0...members.length){
                    members[i].x = 4000;
                }
            }
        }
    }
}

function onNoteCreation(e){
    if(strumLines.members[0].members.length != 4 || strumLines.members[e.strumLineID].cpu == false) return;

    e.note.alpha = thealp;
}
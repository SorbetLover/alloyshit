
public function arrayContains(arr, obj){
    var isItThere:Bool = false;
    for(i in 0...arr.length){
        if(arr[i] == obj){
            isItThere = true;
        }
    }
    return isItThere;   
}

public function returnChars(){
    for(i in strumLines.members){
        for(e in i.characters){
            trace(e.curCharacter);   
        }
    }
}

public function getCharFolders(){
        for (file in Paths.getFolderContent('data/characters')){
                if (StringTools.endsWith(file, '.xml')){
                    trace(file);
                }
        }
}

public function getDiffs(){
    var song = (curSong != null) ? curSong : PlayState.curSong;
    var jjs:Array<String> = []; 

    for (file in Paths.getFolderContent('songs/' + song + "/charts")){
        if (StringTools.endsWith(file, '.json')){
            var cleanFile = StringTools.replace(file, '.json', ''); 
            jjs.push(cleanFile);
        }
    }
    return jjs; 
}

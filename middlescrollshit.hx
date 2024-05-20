//var psych:Bool = false;
var exArray:Array<String>= ["interlope", "b-zavodila", "bgospel", "agitated_remix", "cyberhate"];
function postCreate() {
    // trace(exArray);
    if(curSong == "love n funkin"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[2].members[i].x -= 5000;
            strumLines.members[3].members[i].x -= 5000;
            strumLines.members[4].members[i].x -= 5000;
        }	
    }
    if(curSong == "power-hour"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[2].members[i].x -= 5000;
        }	
    }
    if(curSong == "b-epiphany"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
        }	
        for (i in strumLines.members[2].members) {
            i.x -= 310;
        }

    }

    if(curSong == "b-epiphany-alt"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[1].members[i].x -= 5000;
        }	
        
        for (i in strumLines.members[3].members) {
            i.x -= 310;
        }
        for (i in strumLines.members[2].members) {
            i.x -= 310;
        }
    }
    if(curSong == "b-epiphany-raluca"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[1].members[i].x -= 5000;
        }	
        
        for (i in strumLines.members[2].members) {
            i.x -= 310;
        }
    }
    if(curSong == "b-epiphany-raluca"){
        for(i in 0...4){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[1].members[i].x -= 5000;
        }	
        
        for (i in strumLines.members[2].members) {
            i.x -= 310;
        }
    }
    if(curSong == "boogieman" || curSong == "w00f"){
        for (i in strumLines.members[2].members) {
            i.x -= 310;
        }
    }
    if(curSong == "deep-poems"){
        for (i in strumLines.members[2].members) {
            i.x -= 5000;
        }
    }
///////////////////////


    if(curSong != "interlope" || curSong != "b-zavodila" || PlayState.instance.difficulty != "TAKEOVER MEDLEY"){
        // trace(exArray + "CU");
        for (i in playerStrums.members) {
            i.x -= 310;
        }
	    for (i in cpuStrums.members) {
                i.x -= 5000;
        }

    }   

    



    trace(curSong);

    trace(PlayState.instance.difficulty);


    ////////////////////////////////////
    if(curSong == "agitated_remix" && PlayState.instance.difficulty != "6k-alt"){
        for(i in 0...6){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[2].members[i].x -= 5000;
            strumLines.members[3].members[i].x -= 5000;
            strumLines.members[4].members[i].x -= 5000;
            strumLines.members[5].members[i].x -= 5000;
        }	
        
        for (i in strumLines.members[1].members) {
            i.x -= 310;
        }
    }  
    if(curSong == "hot-air-baloon"    && PlayState.instance.difficulty == "6k"){
        for(i in 0...6){
            strumLines.members[0].members[i].x -= 5000;
                    }	
        
        // for (i in strumLines.members[1].members) {
        //     i.x -= 310;
        // }
    }
    
    // if(curSong == "triple-trouble"){
    //         strumLines.members[0].members[0] -= 5000;
    //         strumLines.members[0].members[1] -= 5000;
    //         strumLines.members[0].members[2] -= 5000;
    //         strumLines.members[0].members[3] -= 5000;

    //         strumLines.members[2].members[0] -= 5000;
    //         strumLines.members[2].members[1] -= 5000;
    //         strumLines.members[2].members[2] -= 5000;
    //         strumLines.members[2].members[3] -= 5000;
            
    //         strumLines.members[3].members[0] -= 5000;
    //         strumLines.members[3].members[1] -= 5000;
    //         strumLines.members[3].members[2] -= 5000;
    //         strumLines.members[3].members[3] -= 5000;
            
    //         strumLines.members[4].members[0] -= 5000;
    //         strumLines.members[4].members[1] -= 5000;
    //         strumLines.members[4].members[2] -= 5000;
    //         strumLines.members[4].members[3] -= 5000;
        
    // }

    if(curSong == "takeover medley"){
        
        for(i in [0,1,2,3]){
            strumLines.members[0].members[i].x -= 320;
        }
        for(i in [0,1,2,3,4,5,6,7]){
            for(e in [0,1,2,3]){
            strumLines.members[i].members[e].x += 5000;
            }
        }
    }
    
}

function postUpdate(){
    
    if(curSong == "agitated_remix" && (PlayState.instance.difficulty == "6k-alt" || PlayState.instance.difficulty == "6k") ){
        for(i in 0...6){
            strumLines.members[0].members[i].x -= 5000;
            strumLines.members[2].members[i].x -= 5000;
            strumLines.members[3].members[i].x -= 5000;
            strumLines.members[4].members[i].x -= 5000;
            strumLines.members[5].members[i].x -= 5000;
        }	
        
    }

}
var iconP12:HealthIcon;
var iconRAL:HealthIcon;
var iconFEL:HealthIcon;
var iconCEL:HealthIcon;
var iconALAN:HealthIcon;
function postCreate(){

    strumLines.members[2].characters[0].alpha = 0;
    strumLines.members[3].characters[0].alpha = 0;
    strumLines.members[4].characters[0].alpha = 0;
    strumLines.members[5].characters[0].alpha = 0;

    iconP12 = new HealthIcon('spinel', true);
    insert(members.indexOf(iconP1) + 2, iconP12);
    iconP12.scale.set(1.4,1.4);
    iconP12.cameras = [camHUD];
    iconP1.visible = false;
    if(PlayState.difficulty == "alt" ||PlayState.difficulty == "6k-alt" ){
        strumLines.members[5].characters[0].y -= 100;
        strumLines.members[5].characters[0].x -= 100;
        
        iconRAL = new HealthIcon('raloca', false);
        insert(members.indexOf(iconP2) + 2, iconRAL);
        iconRAL.scale.set(1.4,1.4);
        iconRAL.cameras = [camHUD];
    
        iconFEL = new HealthIcon('felps', false);
        insert(members.indexOf(iconP2) + 2, iconFEL);
        iconFEL.scale.set(1.4,1.4);
        iconFEL.cameras = [camHUD];

        iconCEL = new HealthIcon('cellbit', false);
        insert(members.indexOf(iconP2) + 2, iconCEL);
        iconCEL.scale.set(1.4,1.4);
        iconCEL.cameras = [camHUD];

        iconALAN = new HealthIcon('alanzoka', false);
        insert(members.indexOf(iconP2) + 2, iconALAN);
        iconALAN.scale.set(1.4,1.4);
        iconALAN.cameras = [camHUD];
        for(i in [iconRAL, iconFEL, iconCEL, iconALAN]) i.alpha = 0;
        if(PlayState.difficulty == "6k-alt" || PlayState.difficulty == "6k" ){
        for(i in strumLines.members[2].members){
            i.x -= 35;
            // i.y += 100;
        }
    }
    
    }

}
function onNoteHit(event){

    if(PlayState.instance.curStep < 1279 &&  (PlayState.difficulty == "alt" || PlayState.difficulty == "6k-alt" )){

    trace(event.character.sprite);
    switch(event.character.sprite){
        case "core":
            for(i in [iconRAL, iconFEL, iconCEL, iconALAN]) i.alpha = 0;
        iconP2.alpha = 1;
            strumLines.members[0].characters[0].alpha = 1;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 0;
            strumLines.members[5].characters[0].alpha = 0;
        case "ralucasegundo":
            strumLines.members[2].characters[0].alpha = 1;

        for(i in [iconP2, iconFEL, iconCEL, iconALAN]) i.alpha = 0;
        iconRAL.alpha = 1;
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 0;
            strumLines.members[5].characters[0].alpha = 0;

        case "felps":
        iconFEL.alpha = 1;
            for(i in [iconRAL, iconP2, iconCEL, iconALAN]) i.alpha = 0;
            strumLines.members[3].characters[0].alpha = 1;
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 0;
            strumLines.members[5].characters[0].alpha = 0;

        case "cellbit":
            iconCEL.alpha = 1;
        for(i in [iconRAL, iconFEL, iconP2, iconALAN]) i.alpha = 0;
            strumLines.members[4].characters[0].alpha = 1;
            strumLines.members[2].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[0].characters[0].alpha = 0;
            strumLines.members[5].characters[0].alpha = 0;

        case "alanzoka":
            iconALAN.alpha = 1;
        for(i in [iconRAL, iconFEL, iconCEL, iconP2]) i.alpha = 0;
        strumLines.members[5].characters[0].alpha = 1;
        strumLines.members[2].characters[0].alpha = 0;
        strumLines.members[3].characters[0].alpha = 0;
        strumLines.members[4].characters[0].alpha = 0;
        strumLines.members[0].characters[0].alpha = 0;
    }
    }
}
var dsOffset:Float = 0;
function postUpdate(){
    // player.cpu = true;
    for(i in [strumLines.members[2].members,strumLines.members[3].members,strumLines.members[4].members,strumLines.members[5].members]){
        i.y = 50;
    }
    if(PlayState.difficulty == "6k-alt"){

    for(i in [2,3,4,5]){
        strumLines.members[i].members[0].x = 100;
        strumLines.members[i].members[1].x = 190;
        strumLines.members[i].members[2].x = 280;
    
        strumLines.members[i].members[3].x = 370;
        strumLines.members[i].members[4].x = 460;
        strumLines.members[i].members[5].x = 550;
    
    }
    }
    // vocals.pitch = 1.25;
    // inst.pitch = 1.25;
    scrollSpeed = 3.1 / inst.pitch;

    FlxG.camera.zoom = 0.7;
    iconP12.x = iconP1.x;
    iconP12.y = iconP1.y + 30;
    iconP12.scale.x = iconP1.scale.x * 1.2;
    iconP12.scale.y = iconP1.scale.y * 1.2;
    if(PlayState.difficulty == "alt" ||PlayState.difficulty == "6k-alt" ){
        for( i in [iconRAL, iconFEL, iconCEL, iconALAN]){
            i.x = iconP2.x;
            i.scale.x = iconP1.scale.x * 1;
            i.scale.y = iconP1.scale.y * 1;
            i.y = iconP2.y;
            
        }
    }    
}
// function create(){
if(PlayState.difficulty == "6k" ||PlayState.difficulty == "6k-alt" ){
    importScript("data/scripts/6kstrum");
    
}
// }
function stepHit(curStep){
    switch(curStep){
        case 1280:
            strumLines.members[0].characters[0].alpha = 1;
            iconP2.alpha = 1;
            iconRAL.alpha = 0;
            iconFEL.alpha = 0;
            iconCEL.alpha = 0;
            iconALAN.alpha = 0;
            strumLines.members[2].characters[0].alpha = 1;
            strumLines.members[2].characters[0].x -= 300;
            strumLines.members[2].characters[0].y += 100;
            if(PlayState.difficulty == "6k-alt" || PlayState.difficulty == "alt" ){
                for( i in [3,4,5]){
                strumLines.members[i].characters.alpha = 0;
                }
            } 
           strumLines.members[5].characters[0].alpha = 0;

       case 1344:
           iconP2.alpha = 0;
           strumLines.members[4].characters[0].x -= 300;
           if(PlayState.difficulty == "6k-alt" || PlayState.difficulty == "alt" ){

              for( i in [0,2,5]){
                strumLines.members[i].characters[0].alpha = 0;
               } 
            }
               strumLines.members[3].characters[0].alpha = 1;
               iconFEL.alpha = 1;
               
               strumLines.members[4].characters[0].alpha = 1;
       
    }
}
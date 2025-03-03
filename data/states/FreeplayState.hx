import flixel.addons.display.FlxBackdrop;
var dokiBD:FlxBackdrop;
var oogieboogievar:Bool = true;
var mechanicalvar:Bool = true;


function postCreate(){
    dokiBD = new FlxBackdrop(Paths.image('fpscrolling_BG'));
    insert(members.indexOf(bg)+1,dokiBD);
}
function beatHit(){
        switch(songs[curSelected].name){
            default:
                if(curBeat % 2 == 0){
                    for(i in iconArray){
                        i.scale.set(1.2,1.2);
                    }
                }
            case "boogieman", "power-hour", "sleeptalk":
                
                for(i in iconArray){
                    if(curBeat % 2 == 0 && oogieboogievar == true){
                        i.angle = -25;
                    }
                    if(curBeat % 2 == 0 && oogieboogievar == false)
                    {
                        i.angle = 25;
                    }
                }
            case "mechanical":
            
                for(i in iconArray){
                    if(mechanicalvar == true){
                        i.angle = -15;
                    }
                    if(mechanicalvar == false)
                    {
                        i.angle = 15;
                    }
                    if(curBeat % 2 == 0){
                    for(i in iconArray){
                        i.scale.set(1.2,1.2);
                    }
                }
                }
        }
        switch(mechanicalvar){
            case true:
               mechanicalvar = false;
            case false:
               mechanicalvar = true;
        }
        if(curBeat % 2 == 0 ){
                if(oogieboogievar == true){
                    oogieboogievar = false;
                }
                else
                {
                    oogieboogievar = true;
                }

        for(i in grpSongs.members){
                i.scale.set(1.1,1.1);
        }
        bg.scale.set(1.1,1.1);
        }
    
    // trace(Conductor.crochet / 10000);
}

function postUpdate(){
    dokiBD.velocity.x = FlxMath.lerp(dokiBD.velocity.x, Conductor.crochet / 2, 0.03);
    dokiBD.velocity.y = dokiBD.velocity.x / 3; 
    switch(songs[curSelected].name){
        case "b-epiphany", "b-epiphany-alt", "b-epiphany-raluca", "markov", "catfight", "hot-air-baloon", "its-complicated", "poems-n-thorns", "love n funkin", 'takeover medley', 'libitina', "home", 'drinks on me', 'bara no yume':
            dokiBD.alpha = FlxMath.lerp(dokiBD.alpha, 1, 0.03);
        default:
            dokiBD.alpha = FlxMath.lerp(dokiBD.alpha, 0, 0.03);
   
    }
    dokiBD.color = bg.color;
    
        changeSelection(-FlxG.mouse.wheel);
    if(songs[curSelected].name != "mechanical"){
    for(i in iconArray){
        i.angle = FlxMath.lerp(i.angle, 1, Conductor.crochet / 10000);
        i.scale.x = FlxMath.lerp(i.scale.x, 1, Conductor.crochet / 10000);
        i.scale.y = i.scale.x;
    }
    }
    for(i in grpSongs.members){
        i.scale.x = FlxMath.lerp(i.scale.x, 1, Conductor.crochet / 10000);
        i.scale.y = i.scale.x;
    }
        bg.scale.x = FlxMath.lerp(bg.scale.x, 1, Conductor.crochet / 10000);
        bg.scale.y = bg.scale.x;
    
}

function onChangeSelection(){
    for(i in iconArray){
                        i.scale.set(1.2,1.2);
    }
}
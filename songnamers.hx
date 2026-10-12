var box:FlxSprite;
var txt:FlxText;
var iconname:String;
var ico:HealthIcon;
var hideandshowHB:Bool = true;
var shitpos:Array = []; 
var opName:FlxText;
function postCreate(){
if(PlayState.instance.curSong != "stayed-gone"){
    box = new FlxSprite().makeGraphic(400,100, 0xFF222222);
    box.cameras = [camHUD];
    add(box);
    box.y = 500;
    box.x = 0;

    txt = new FlxText(150,540,1000, "Test", 40);
    txt.cameras = [camHUD];
    add(txt);
    opName = new FlxText(150,510,1000, "Vs:", 15);
    opName.cameras = [camHUD];
    add(opName);
    

    switch(PlayState.instance.curSong){
        case "demonila":
            txt.text = "Demonila";
            // iconname = "abby";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Abby";
        case "stargazer":
            txt.text = "Stargazer";
            // iconname = "abby";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Abby";
        case "bzavodila":
            txt.text = "B-Zavodila";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Raluca";
            
            box.setGraphicSize(520,100);
        case "bgospel":
            txt.text = "B-Gospel";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Raluca";
        case "loaded":
            txt.text = "Loaded";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Felipe Neto";
            if(PlayState.instance.difficulty == "abby")
            {
                opName.text = "Vs: " + "Abby";
            }
        case "interlope":
            txt.text = "Interlope";
            iconname = "amelia";
            opName.text = "In: " + "Your own subconscious";
            box.setGraphicSize(470,100);

        case "bara no yume":
            
                txt.text = "Bara no Yume";
                iconname = iconP2.curCharacter;
                box.setGraphicSize(630,100);
                opName.text = "Vs: " + "Senpai and Monika";
        case "home":
            hideandshowHB = false;
            txt.x += 50;
            txt.text = "Home";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(400,100);
            opName.text = "Vs: " + "Core";
        case "agitated_remix":
            // txt.x += 50;
            txt.text = "Agitated Remix";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(490,100);
            opName.text = "Vs: " + "Core";
            
        case "libitina":
            txt.text = "Libitina (Raluca Mix)";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Raluca";
        case "markov":
            txt.text = "Markov (Raluca Mix)";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(1000,100);
            opName.text = "Vs: " + "Raluca";
        case "broken-heartware":
            txt.text = "Broken Heartware";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Giffany";
            if(PlayState.instance.difficulty == "raluca"){
                opName.text = "Vs: " + "Raluca";
                iconname = iconP2.curCharacter;
            
            }        
        case "vespers":
            txt.text = "Vespers";
            iconname = iconP2.curCharacter;
            // box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Sarvin";
        case "b-epiphany":
            hideandshowHB = false;
            txt.text = "B-Side Epiphany";
            iconname = "bigmonika";
            box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Monika";
        case "b-epiphany-alt":
            hideandshowHB = false;
            txt.text = "B-Side Epiphany";
            iconname = "bigmonika";
            box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Monika and Giffany";
        case "b-epiphany-raluca":
            hideandshowHB = false;
            txt.text = "B-Side Epiphany";
            iconname = "ralucoejean";
            box.setGraphicSize(690,100);
            opName.text = "Vs: " + "Raluca and Jean L";
        case "boogieman":
            txt.text = "Boogieman";
            iconname = "boogielemon";
            box.setGraphicSize(520,100);
            opName.text = "Vs: " + "Lemon Demon";
        case "memories":
            txt.text = "Memories";
            iconname = "memory";
            opName.text = "Vs: " + "Memory";

        case "love n funkin":
            txt.text = "Love N Funkin'";
            iconname = "lovenfunkin";
            opName.text = "Vs: " + "Annie, Abby, Giffany and Monika";
            box.setGraphicSize(640,100);
        case "power-hour":
            txt.text = "Power Hour";
            iconname = "felpsandcellbit";
            opName.text = "Vs: " + "Cellbit and Felps";
            box.setGraphicSize(580,100);
        case "cyberhate":
            txt.text = "CyberHate";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Raluca";
            box.setGraphicSize(510,100);
        case "xamuel":
            txt.text = "Luna Beauty e Xamuel";
            iconname = iconP1.curCharacter;
            opName.text = "osu!Mania";
            box.setGraphicSize(1060,100);
        case "damage":
            txt.text = "Damage";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " +"Alastor";
        case "lockdown":
            txt.text = "Lockdown";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Diamante Preto";        

        case "hot-air-baloon":
            txt.text = "Hot Air Balloon";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Abby";

            box.setGraphicSize(700,100);
    
        case "catfight":
            txt.text = "Catfight";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Yuri";

            box.setGraphicSize(400,100);
        case "its-complicated":
            txt.text = "It's Complicated";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Abby";
            box.setGraphicSize(800,100);
        case "takeover":
            txt.text = "Takeover";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(500,100);
            opName.text = "Vs: " + "Cassandra";
            if(PlayState.instance.difficulty == "JAX"){
                opName.text = "Vs: " + "Jax";
                iconname = iconP2.curCharacter;
            
            }        

        case "w00f":
            txt.text = "W00f";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Robo-Fever and Scarlet";
            box.setGraphicSize(600,100);
        case "deep-poems":
            txt.text = "Deep Poems  ";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Memory and True Penny";
            box.setGraphicSize(600,100);
        case "last-meow":
            txt.text = "Last Meow";
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + "Wee";
            box.setGraphicSize(500,100);

        case "quickdraw":
            txt.text = "QU1CKDR4W";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(500,100);
            opName.text = "Vs: " + "8-BIT";

        case "soul":
            txt.text = "Soul";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(300,100);
            box.x -= 60;
            opName.text = "Vs: " + "Pump";
        case "worshi-fy":
            txt.text = "Woship x Crucify";
            iconname = iconP2.curCharacter;
            box.setGraphicSize(800,100);
            opName.text = "Vs: " + "Sarv and Taki";
    



        default:
            txt.text = curSong;
            iconname = iconP2.curCharacter;
            opName.text = "Vs: " + dad.curCharacter;
    }
    ico = new HealthIcon(iconname, false);
    ico.cameras = [camHUD];
    add(ico);
    ico.y = 480;

    shitpos[0] = box.x;
    shitpos[1] = txt.x;
    shitpos[2] = ico.x;
    if(hideandshowHB == true){

        
        for(i in [iconP1, iconP2, healthBar, healthBarBG]){
            i.alpha = 0;
        }
    }

    trace(shitpos);
}
} 
function beatHit(){
    if(PlayState.instance.curSong != "stayed-gone"){

    ico.scale.set(1.2, 1.2);
    // trace(Conductor.crochet / 50);
    }
}
var endingshit:Bool = false;
function update(){
    if(PlayState.instance.curSong != "stayed-gone"){

    ico.scale.x = FlxMath.lerp(ico.scale.x, 1, Conductor.crochet / 10000);
    ico.scale.y = FlxMath.lerp(ico.scale.y, 1, Conductor.crochet / 10000);
    
    if(inst.time > inst.length - (Conductor.crochet / 5 * 100) && endingshit == false){
        endingshit = true;
        trace("JAJDJKASJD");
        
    trace(shitpos);
        var merda:Int = 0;
        for(i in [opName, ico, box, txt]){    
            FlxTween.tween(i, {x: i.x + 1000}, Conductor.crochet / 400, {ease: FlxEase.cubeOut});
        }
    }
    }
}
function onSongStart(){
if(PlayState.instance.curSong != "stayed-gone"){

    for(i in [ico, box, txt, opName]){
        FlxTween.tween(i, {x: i.x - 1000}, Conductor.crochet / 2000, {ease: FlxEase.cubeIn});
    }
    if(hideandshowHB == true){
        for(i in [iconP1, iconP2, healthBar, healthBarBG]){
        FlxTween.tween(i, {alpha: 1}, Conductor.crochet / 2000, {ease: FlxEase.cubeIn});

        }
    }
}
}
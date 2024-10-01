var uhhhCam:FlxCamera;
var things:Array = [];
var curSelected = 0;
var grou:FlxSpriteGroup = [];
function create(){
        uhhhCam = new FlxCamera();
        FlxG.cameras.add(uhhhCam, false);
		uhhhCam.bgColor = 0xDD000000;
        trace(PlayState.instance.curSong);
        for (file in Paths.getFolderContent('songs/' + PlayState.instance.curSong + "/charts")){
            if (StringTools.endsWith(file, '.json')){
                var cleanFile = StringTools.replace(file, '.json', ''); 
                things.push(cleanFile);
                
            }
        }
        trace(things);
        grou = new FlxSpriteGroup();
        add(grou);

        for(i in 0...things.length){
            var sss = new Alphabet(200, i * 100, things[i], true, false);
            // insert(sss, 20);

            grou.add(sss);
            add(sss);
            sss.cameras = [uhhhCam];
        }
}

var sametime:Bool = false;
function update(){
    grou.y = FlxG.height / 4 - (curSelected * 100) + 140;
    if(things[curSelected] != null){
        
        for(ee in 0...grou.length){ grou.members[ee].color = 0xFF555555; }
        grou.members[curSelected].color = 0xFFFFFFFF;
    }
    if(FlxG.keys.justPressed.ALT){
        sametime = true;
        FlxG.save.data.difftime = PlayState.instance.inst.time;
        FlxG.save.data.samedifftime = true;
    }
    if(FlxG.keys.justPressed.W && curSelected != 0) curSelected -= 1;
    if(FlxG.keys.justPressed.S && curSelected != things.length - 1) curSelected += 1;
    if(FlxG.keys.justPressed.ESCAPE) {uhhhCam.bgColor = 0x00000000; close(); } 

    if(FlxG.keys.justPressed.ENTER){
	PlayState.loadSong(PlayState.instance.curSong, things[curSelected], PlayState.instance.opponentMode, PlayState.instance.coopMode);
		FlxG.switchState(new PlayState());    }
}


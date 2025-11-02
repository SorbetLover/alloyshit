import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import hxvlc.util.Handle;
import flixel.group.FlxSpriteGroup;
var nameVar:String = "umc4r4aa3";
var bgvid:FlxVideoSprite;
var pfpThing:FlxSprite;
var pfp:FlxSprite;
var plName:FlxText;
var user:Array = [];
var txtshit:Array = ["// Play", "Freeplay", "Donate", "Uhh", "Settings", "Credits"];
var txtGroup:FlxSpriteGroup;
var txtBGGroup:FlxSpriteGroup;
var txtCCount:Int = 0;
var txtCCount2:Int = 0;
var txtOFS:Array = [100,350];
var enterSPR:FlxSprite;
var mouseSPR:FlxSprite;
var enterTXT:FlxText;
var mouseTXT:FlxText;

// var lasttxtpos:Array = [100,100,100,100,200];
// var lastbgpos:Array = [90,90,125,110,98, 86];
function create(){
        var tempmerda = CoolUtil.coolTextFile(Paths.txt('WDUser'));
        	if (tempmerda.length > 0) {
			for(s in tempmerda){

                // songs.push(s);
                user.push(s);

            }
        }


	    bgvid = new FlxVideoSprite(0, 0);
		bgvid.antialiasing = true;
		bgvid.bitmap.onFormatSetup.add(function():Void
		{
			bgvid.setGraphicSize(FlxG.width + 150, FlxG.height + 100);
			bgvid.scrollFactor.set(0,0);
			bgvid.updateHitbox();
			bgvid.screenCenter();
		});
		bgvid.bitmap.onEndReached.add(bgvid.bitmap.time = 0);
		bgvid.load(Paths.video('wdmenu'), [':input-repeat=2']);
        add(bgvid);
        bgvid.play();
    FlxG.sound.music.stop();
    CoolUtil.playMusic(Paths.music("wdmenu"), true, 1, true, 102);

        pfpThing = new FlxSprite().makeGraphic(2000,60, 0xFF000000);
        pfpThing.y = 680;
        pfpThing.x = 0;
        add(pfpThing);
         
        pfp = new FlxSprite().loadGraphic(Paths.image("wdpfps/" + user[1]));
        add(pfp);
        pfp.setGraphicSize(30,30);
        pfp.y = 470;
        pfp.x = -190;

        name = new FlxText(20,680,200, user[0], 10);
        name.setFormat(Paths.font("Roboto-Regular.ttf"), 30);
        name.scale.set(0.6,0.6);
        name.color = 0xFFbfbfbf;
        add(name);

        txtGroup = new FlxSpriteGroup();
        txtBGGroup = new FlxSpriteGroup();

        for(i in txtshit){
            txtCCount += 1;

            var tempSpr = new FlxSprite().makeGraphic(120,30, 0xFF0E0D12);
            tempSpr.y = txtCCount * txtshit.length * 7 + txtOFS[1] - 5;
            tempSpr.x = txtOFS[0] - 10;
            // add(tempSpr);
            if(i == "// Play"){
                tempSpr.y -= 10;
                tempSpr.setGraphicSize(120,60);
            }
                    
            if(i == "Donate"){
                tempSpr.setGraphicSize(190,30);
                tempSpr.x += 35;
            }

            if(i == "Uhh"){
                tempSpr.setGraphicSize(160,30);
                tempSpr.x += 20;
            }
            if(i == "Settings"){
                tempSpr.setGraphicSize(135,30);
                tempSpr.x += 8;
            }
            if(i == "Credits"){
                tempSpr.setGraphicSize(110,30);
                tempSpr.x -= 4;
            }
            txtBGGroup.add(tempSpr);
            add(tempSpr);

        }
        for(i in txtshit){
            txtCCount2 += 1;
            var temptxt = new FlxText(0,0, 200, i);
            temptxt.setFormat(Paths.font("pixel2.ttf"), 19);
            temptxt.color = 0xFFbfbfbf;

            temptxt.antialiasing = false;
            temptxt.y = txtCCount2 * txtshit.length * 7 + txtOFS[1]; 
            temptxt.x = txtOFS[0];
            if(i == "// Play"){
                temptxt.y -= 10;
            }
            txtGroup.add(temptxt);
            add(temptxt);
        }
        FlxG.mouse.visible = true;

        // enterSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/enter"));
        enterSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/E"));
        add(enterSPR);
        mouseSPR = new FlxSprite().loadGraphic(Paths.image("wdpfps/mouse"));
        add(mouseSPR);

        for(i in [enterSPR, mouseSPR]){
            i.setGraphicSize(25,25);
            i.y = 445;
        }
        enterTXT = new FlxText(1220,687,100,"Exit");
        enterTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        enterTXT.color = 0xFFbfbfbf;
         
        add(enterTXT);
        enterSPR.x = enterTXT.x - 280;
   
        mouseTXT = new FlxText(1020,687,100,"NAVIGATE");
        mouseTXT.setFormat(Paths.font("Roboto-Condensed.ttf"), 19);
        mouseTXT.color = 0xFFbfbfbf;
         
        add(mouseTXT);
        mouseSPR.x = mouseTXT.x - 280;

        // trace(lasttxtpos + lastbgpos);

        
            FlxG.save.data.WDReturnButtons = false;

        for(e in [mouseTXT, enterTXT, name]){
            e.antialiasing = true;
        }
 
}
var curov:Int = 0;
public var substOpen:Bool = false;
function update(){    
    // trace(FlxG.random.int(1,3));
    for(i in txtBGGroup.members){
        if(FlxG.mouse.overlaps(i)){
            i.colorTransform.color = 0xFF0022ff;

        }
        if(!FlxG.mouse.overlaps(i)){
            i.colorTransform.color = 0xFF0E0D12;
        }
    }
    if(FlxG.mouse.overlaps(txtBGGroup.members[0])){
        curov = 0;
    }
    
    if(FlxG.mouse.overlaps(txtBGGroup.members[1])){
        curov = 1;
    }
    
    if(FlxG.mouse.overlaps(txtBGGroup.members[2])){
        curov = 2;
    }
    
    if(FlxG.mouse.overlaps(txtBGGroup.members[3])){
        curov = 3;
    }
    
    if(FlxG.mouse.overlaps(txtBGGroup.members[4])){
        curov = 4;
    }
    if(FlxG.mouse.overlaps(txtBGGroup.members[5])){
        curov = 5;
    }
    // trace(curov);
    for(i in txtBGGroup.members){
        if(FlxG.mouse.overlaps(i) && FlxG.mouse.justReleased){
            switch(curov){
            case 0: trace("Play");
                
                substOpen = true;
                buttonsOut();
                FlxG.save.data.WDWarningRes = [400,100];

                FlxG.save.data.WDWarningTitle = "Story";
                FlxG.save.data.WDWarningText = "Sorry! This hasn't beeing done yet.";
                // FlxG.save.data.WDWarningType = "Warning";
                new FlxTimer().start(Conductor.crochet / 1000, function(tmr:FlxTimer){  openSubState(new ModSubState("WDStorySubState")); returnButtons = true;   });

            case 1:
                trace("Freeplay");
                substOpen = true;
                buttonsOut();
                FlxG.save.data.WDWarningRes = [400,100];

                FlxG.save.data.WDWarningTitle = "Freeplay";
                FlxG.save.data.WDWarningText = "Sorry! This menu hasn't beeing done yet.";

                new FlxTimer().start(Conductor.crochet / 1000, function(tmr:FlxTimer){  openSubState(new ModSubState("WDFreeplaySubState")); returnButtons = true;   });

            case 2: trace("Donate");
            case 3: trace("Uhh");
            case 4: trace("Settings");
            case 5: trace("Credits");
            }
        }
    if(FlxG.keys.justPressed.E && substOpen == false) FlxG.switchState(new MainMenuState());
if(FlxG.save.data.WDReturnButtons == true){

            FlxG.save.data.WDReturnButtons = false;
        buttonsIn();    
        substOpen = false;
}
}
    
}
function buttonsOut(){

        FlxTween.tween(txtBGGroup, {x:-500}, Conductor.crochet / 1000, {ease: FlxEase.cubeIn});
        FlxTween.tween(txtGroup, {x: -500}, Conductor.crochet / 1000, {ease: FlxEase.cubeIn});

    
}
public function buttonsIn(){
        
        FlxTween.tween(txtBGGroup, {x:0}, Conductor.crochet / 1000 , {ease: FlxEase.cubeOut});
        FlxTween.tween(txtGroup, {x: 0}, Conductor.crochet / 1000, {ease: FlxEase.cubeOut});
       
    trace("USdh");
}
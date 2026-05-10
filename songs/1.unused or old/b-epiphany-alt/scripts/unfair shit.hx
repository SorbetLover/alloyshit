function onDadHit(){
    if(strumLines.members[3].characters[0].getAnimName() != "idle"){
        
        if (FlxG.random.bool(4))
            {
             markeye();
            }
       }
       if(strumLines.members[2].characters[0].getAnimName() != "idle"){
        
        if (FlxG.random.bool(5))
            {
             libiWin();
            }
       }

}
var eyegroup:FlxSpriteGroup;
function postCreate(){
    // strumLines.members[2].cpu = true;
    // strumLines.members[3].cpu = true;
    eyegroup = new FlxSpriteGroup();
				
    add(eyegroup);
    // trace("RESTARTED-----------------------------");
    // trace("RESTARTED-----------------------------");
    // trace("RESTARTED-----------------------------");
    // trace("------libitina-----");
    // trace("x");
    // trace(strumLines.members[2].members[0].x);
    // trace(strumLines.members[2].members[1].x);
    // trace(strumLines.members[2].members[2].x);
    // trace(strumLines.members[2].members[3].x);
    // trace("y");
    // trace(strumLines.members[2].members[0].y);
    // trace(strumLines.members[2].members[1].y);
    // trace(strumLines.members[2].members[2].y);
    // trace(strumLines.members[2].members[3].y);
    
    // trace("------ yuri -----");
    // trace("x");
    // trace(strumLines.members[3].members[0].x);
    // trace(strumLines.members[3].members[1].x);
    // trace(strumLines.members[3].members[2].x);
    // trace(strumLines.members[3].members[3].x);
    // trace("y");
    // trace(strumLines.members[3].members[0].y);
    // trace(strumLines.members[3].members[1].y);
    // trace(strumLines.members[3].members[2].y);
    // trace(strumLines.members[3].members[3].y);
    
}
function markeye(){
    var val1:Float = FlxG.random.int(1200,-400);
    var val2:Float = FlxG.random.int(500,0);
    var valscale:Float = FlxG.random.float(1.1,0.5);
    
    var eye:FlxSprite = new FlxSprite(val1, val2);
    eye.frames = Paths.getSparrowAtlas('MarkovEyes');
    eye.animation.addByPrefix('idle', 'MarkovWindow', 24, false);
    eye.animation.play('idle');
    eye.antialiasing = true;
    eye.scrollFactor.set();
    eye.cameras = [camHUD];
    eye.scale.set(valscale,valscale);
    insert(members.indexOf(iconP2) + 1, eye);
    // TODO: make this delete itself so it don't take up memory lol
    // goku goes super saiyan
    FlxTween.tween(eye, {x: eye.x + 500}, 5);
    new FlxTimer().start(4.61, function(tmr:FlxTimer)
    {
        remove(eye);
    });
    
}
function libiWin(){
    var val1:Float = FlxG.random.int(1200,-400);
    var val2:Float = FlxG.random.int(500,0);
    var valueRandom:Float = FlxG.random.int(0, 4);    
    var libiwindow:FlxSprite = new FlxSprite(val1, val2);
    var windowPath:String;
    switch(valueRandom){
        case 0: windowPath = "libi windows/Binary";
        case 1: windowPath = "libi windows/Unauthorized";
        case 2: windowPath = "libi windows/Unspecified";
        case 3: windowPath = "libi windows/Error";
        case 4: windowPath = "libi windows/Unknown"; 
    }
    libiwindow.frames = Paths.getSparrowAtlas(windowPath);
    libiwindow.animation.addByPrefix('idle', 'PopupAnim', 24, false);
    libiwindow.animation.play('idle');
    libiwindow.antialiasing = true;
    libiwindow.scrollFactor.set();
    libiwindow.cameras = [camHUD];
    insert(members.indexOf(iconP2) + 1, libiwindow);
    // TODO: make this delete itself so it don't take up memory lol
    // goku goes super saiyan
    FlxTween.tween(libiwindow, {x: libiwindow.x + 500}, 5);
    new FlxTimer().start(3.4, function(tmr:FlxTimer)
    {
        remove(libiwindow);
    });
    
}
var anoteX:Int;
var bnoteX:Int;
var cnoteX:Int;
var dnoteX:Int;
// function onPlayerHit(e){
//     // anoteX =  FlxG.random.int(736 - 40, 736 + 40);
//     // bnoteX =  FlxG.random.int(736 - 40, 736 + 40);
//     // cnoteX =  FlxG.random.int(736 - 40, 736 + 40);
//     // dnoteX =  FlxG.random.int(736 - 40, 736 + 40);
//    switch(e.note.noteData){
//         case 0:
//             anoteX =  FlxG.random.int(736 - 30, 736 + 30);

//             for(i in [strumLines.members[2].members[0], strumLines.members[3].members[0]strumLines.members[4].members[0],]){

//                 i.x = anoteX;
//             }
//         case 1:
//             bnoteX =  FlxG.random.int(848 - 30, 848 + 30);

//             for(i in [strumLines.members[2].members[1], strumLines.members[3].members[1], strumLines.members[4].members[1]]){

//                 i.x = bnoteX;
//             }
//         case 2:
//             cnoteX =  FlxG.random.int(960 - 30, 960 + 30);

//             for(i in [strumLines.members[2].members[2], strumLines.members[3].members[2], strumLines.members[4].members[2]]){

//                 i.x = cnoteX;
//             }
//         case 3:
//             dnoteX =  FlxG.random.int(1072 - 30, 1072 + 30);

//             for(i in [strumLines.members[2].members[3], strumLines.members[3].members[3], strumLines.members[4].members[3]]){

//                 i.x = dnoteX;
//             }
//    }
// }
import funkin.game.HealthIcon;  
var kou:HealthIcon;
var shit:Float;
var koushit:Bool = false;

function create(){
    shit = iconP2.y;

}
function postCreate(){
    if (FlxG.random.bool(5))
		{
    koushit = true;
    kou = new HealthIcon('kou', false);
    kou.cameras = [camHUD];
    kou.y = healthBar.y - (kou.height / 1.5) + 20;
    kou.alpha = 1;
    insert(members.indexOf(healthBar) + 2, kou);
    FlxTween.tween(kou, {alpha: 1}, 0.2, {ease: FlxEase.cubeOut});		
    iconP2.alpha = 0;
    kou.x = 520;
    kou.y += 10;
       
    new FlxTimer().start(2.7, function(tmr:FlxTimer){
        FlxG.sound.play(Paths.sound('dramatic'));
    });
   
    new FlxTimer().start(3, function(tmr:FlxTimer){
        FlxTween.tween(iconP2,{alpha: 1}, 3, {ease: FlxEase.cubeOut });
        kou.alpha = 0;
        });
    }
}
    function postUpdate(){
    if(koushit == true){
    kou.scale.x = iconP2.scale.x + 0.2;
    kou.scale.y = iconP2.scale.y + 0.2;
    }
}


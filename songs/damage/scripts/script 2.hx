public var icoP1:HealthIcon;
public var icoP2:HealthIcon;

function postCreate() {
    icoP1 = new HealthIcon(boyfriend != null ? boyfriend.getIcon() : "face", true);
    icoP2 = new HealthIcon(dad != null ? dad.getIcon() : "face", false);
    for(ico in [icoP1, icoP2]) {
        ico.y = healthBar.y - (ico.height / 2);
        ico.cameras = [camHUD];
        insert(members.indexOf(healthBar) + 2, ico);
    }

    for (i in [iconP1, iconP2]) remove(i); // fuck you og icons
}

var __timer2:Float = 0;
var __timer3:Float = 0;
var ofst1:Float;
var ofst2:Float;
function postUpdate(elapsed:Float){
    // trace(elapsed);
    __timer2 += Conductor.crochet / 60000; 	
    __timer3 += Conductor.crochet / 50000; 	
    ofst1 = (10 + 10*Math.sin(__timer2));
    ofst2 = (20 + 10*Math.sin(-__timer2));
    // icoP1.y = (healthBar.y - (icoP1.height / 2) + 20*Math.cos(__timer2));
    // icoP2.y = (healthBar.y - (icoP1.height / 2) + 20*Math.cos(__timer2)) + 10;
    for(i in [icoP1, icoP2]){
        i.y = healthBar.y - i.height / 2;
    }
    healthBar.y = (630 + 10*Math.cos(__timer2));
    healthBarBG.y = (626 + 10*Math.cos(__timer2));


}

function update(elapsed:Float){
    icoP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0)) - 26 ) + ofst1 ;
	icoP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0))) - (icoP2.width - 26) + ofst2 - 30;

    icoP1.health = healthBar.percent / 100;
    icoP2.health = 1 - (healthBar.percent / 100);
}

function beatHit(){
    for (i in [icoP1, icoP2]){
        i.scale.set(1.1, 1.1);
        FlxTween.tween(i.scale, {x: 1, y: 1}, (0.5 * (1 / (Conductor.bpm / 60))), {ease: FlxEase.cubeOut});
    }
    icoP2.origin.set(150, 75);
}

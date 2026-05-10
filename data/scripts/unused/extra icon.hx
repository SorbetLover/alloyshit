import funkin.game.ExtraHealthIcon;

var extraHI:ExtraHealthIcon;

function postCreate(){
	extraHI = new ExtraHealthIcon("bf", false);
	add(extraHI);
	extraHI.cameras = [camHUD];
	// extraHI.offsetX = 200;
}
function postUpdate(){
    extraHI.losingOffsetY = -10;

	extraHI.healthValue = health;

    extraHI.y = icoP2.y + extraHI.height / 10;

	extraHI.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0))) - (icoP2.width - 26) - 100;
	// extraHI.offset.set(0,0);
	extraHI.scale.set(icoP2.scale.x + 0.04, icoP2.scale.y + 0.04);
}

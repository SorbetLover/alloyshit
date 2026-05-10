function postCreate(){
    dad.alpha = 1;
    sky.alpha = 0;
}
function update(){
    if(curStep < 2){
    defaultCamZoom = 1;	
    defaultHudZoom = 1;
}
}
function stepHit(curStep){
    switch(curStep){
        case 3120:
            dad.playAnim('lastShrug');
        case 3160:
            FlxTween.tween(dad, {"skew.x": 40, "skew.y": 40, "scale.x": 0.1, "scale.y": 0.1}, 0.2, {ease: FlxEase.cubeOut});

        
        case 3165:
            dad.alpha = 0;
        }
    }
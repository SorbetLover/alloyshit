var thumbsdown:FlxSprite;
function postCreate(){
    dad.x -= 100;
    dad.y -= 200;
    dad.alpha = 0;

    thumbsdown = new FlxSprite(0,0).loadGraphic(Paths.image("thumbsdown"));
    thumbsdown.cameras = [camHUD];
    // add(thumbsdown);
    insert(members.indexOf(iconP2)+1, thumbsdown);
    thumbsdown.setGraphicSize(80,80);

    for(i in [iconP2, dad, thumbsdown]){
        i.alpha = 0;
    }

}

function postUpdate(){
    thumbsdown.scale.x = FlxMath.lerp(thumbsdown.scale.x, 0.2, 0.04);
    thumbsdown.scale.y = FlxMath.lerp(thumbsdown.scale.x, 0.2, 0.04);
    thumbsdown.y = iconP2.y - 140;

    thumbsdown.x = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0) - 100;
    if(iconP2.animation.curAnim.curFrame == 1 && iconP2.alpha > 0.05){
        thumbsdown.alpha = iconP2.alpha;
    } else {
        thumbsdown.alpha = 0;
    }
}

function beatHit(curBeat){
    thumbsdown.scale.set(0.3,0.3);
}
function stepHit(curStep){
    switch(curStep){
        case 512:
            for(i in [iconP2, dad, thumbsdown]){
                FlxTween.tween(i, {alpha:1}, 5 / vocals.pitch);
            }
    }
}
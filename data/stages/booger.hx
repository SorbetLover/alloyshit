import funkin.game.HealthIcon;
import flixel.animation.FlxAnimationController;
import flixel.FlxSprite;
function create(){
    strumLines.members[0].characters[0].y -= 460;
    strumLines.members[0].characters[0].x -= 420;

    strumLines.members[1].characters[0].flipX = false;
    strumLines.members[1].characters[0].y -= 247.7;
    strumLines.members[1].characters[0].x -= 235;

    strumLines.members[2].characters[0].y -= 0;
    strumLines.members[2].characters[0].x += 700;

}
var screamboy:FlxSprite;
var screamgirl:FlxSprite;

function postCreate(){
    // iconP1.destroy();
    // iconP1 = new HealthIcon("boogiepersons", true);
    // iconP1.cameras = [camHUD];
    // add(iconP1);
    // iconP1.y += 580;
    iconP1.setIcon("boogiepersons", true);
    
    scream1.animation.pause();
    scream1.y = strumLines.members[0].characters[0].y + 251;
    scream1.x = strumLines.members[0].characters[0].x + 850;
    scream1.alpha = 0;

    scream2.animation.pause();
    scream2.y = strumLines.members[2].characters[0].y - 90;
    scream2.x = strumLines.members[2].characters[0].x - 130;
    scream2.alpha = 0;

}

function postUpdate(){
    camFollow.setPosition(700, 400);

}

function stepHit(curStep){
    switch(curStep){
        case 1312:
            strumLines.members[1].characters[0].alpha = 0;
            strumLines.members[2].characters[0].alpha = 0;
            scream1.alpha = 1;
            scream2.alpha = 1;
            // scream1.animation.play("screamboy", false, false, 24);
            // scream2.animation.play("screamgarl", false, false, 24);

            scream1.animation.resume();
            scream2.animation.resume();

        case 1345:
            strumLines.members[0].characters[0].animation.play("lemon surprised", true, false, false);

    }
}
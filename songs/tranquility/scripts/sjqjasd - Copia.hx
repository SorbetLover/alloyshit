var flipa:FunkinSprite;
function postCreate(){
    flipa = new FunkinSprite(70,200).loadGraphic(Paths.image("drawers"));
    add(flipa);
    flipa.cameras = [camHUD];
}

var posCima = 60;
var posDireita = 200;
var posBaixo = 400;

var tempoArrastaPraCima = 3;
var tempoDireita = 5;
var tempoFoideBase = 2.5
function stepHit(curStep){

    switch(curStep){
        case 328:
            FlxTween.tween(flipa, {x:flipa.x + posDireita}, tempoDireita, {});
            FlxTween.tween(flipa, {y:flipa.y + posCima}, tempoArrastaPraCima, { ease:FlxEase.cubeOut, onComplete: function(){
                FlxTween.tween(flipa, {y:flipa.y - posBaixo}, tempoFoideBase, {ease:FlxEase.cubeInOut});
                
            }});
            

    }
}
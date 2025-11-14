function onStrumCreation(e){
    e.cancelAnimation();
}
function postCreate(){
    for(i in playerStrums.members){
        i.y = (FlxG.height / 2) - (i.height /2);
    }
}
var delta = 0;
var stry = 0;
function update(elapsed){
    delta += elapsed;
    scrollSpeed = 0 + 2 * Math.sin(delta * 2);
    stry = (FlxG.height / 2 - 50) + 300 * Math.cos(delta * 2);
    for(i in playerStrums.members){
        i.y = stry;
    }
}